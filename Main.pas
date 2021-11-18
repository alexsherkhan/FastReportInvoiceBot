unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, frxClass,
  System.Generics.Collections,
  fastTelega.AvailableTypes,
  fastTelega.Bot,
  fastTelega.EventBroadcaster,
  fastTelega.LongPoll,
  InvoiceUnit, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxDBSet,
  frxExportBaseDialog, frxExportPDF, FireDAC.Stan.StorageBin;

type
  TFormFastReportInvoiceBot = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    TableInvoice: TFDMemTable;
    TableItems: TFDMemTable;
    TableInvoiceID_Invoice: TIntegerField;
    TableInvoiceLogo: TGraphicField;
    TableInvoiceInvoiceFrom: TStringField;
    TableInvoiceDate: TStringField;
    TableInvoicePayment_Terms: TStringField;
    TableInvoiceDue_Date: TStringField;
    TableInvoicePO_Number: TStringField;
    TableInvoiceBill_To: TStringField;
    TableInvoiceShip_To: TStringField;
    TableInvoiceNotes: TStringField;
    TableInvoiceTerms: TStringField;
    TableInvoiceSubtotal: TFloatField;
    TableInvoiceDiscount: TFloatField;
    TableInvoiceTax: TFloatField;
    TableInvoiceShipping: TFloatField;
    TableInvoiceTotal: TFloatField;
    TableInvoiceAmount_Paid: TFloatField;
    TableInvoiceBalance_Due: TFloatField;
    TableItemsID_Invoice: TIntegerField;
    TableItemsDescription: TStringField;
    TableItemsQuantity: TIntegerField;
    TableItemsRate: TFloatField;
    DataSource1: TDataSource;
    frxReport1: TfrxReport;
    frxPDFExport1: TfrxPDFExport;
    frxDBDataset1: TfrxDBDataset;
    frxDBDataset2: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    FAsyncHttp: TThread;
  public
    { Public declarations }
  end;

  TFuncHandlerStep = reference to procedure(const obj: TObject; Data: PVariant;
    AVarType: TVarType);

  TStateBot = (sbStart, sbMenu, sbHelp, sbNewInvoice, sbAddInvoiceItem,
    sbCreateInvoce);

  TStepHandler = class
  private
    FDiscription: string;
    FFuncHandler: TFuncHandlerStep;
    FButtonLayout: TArray<TArray<String>>;
    FFieldClass: PVariant;
    FVarType: TVarType;
  public
    constructor Create(ADiscription: string; AFuncHandler: TFuncHandlerStep;
      AButtonLayout: TArray < TArray < String >> = nil;
      AFieldClass: PVariant = nil; AVarType: TVarType = 0);
    destructor Destroy; override;
    property Discription: string read FDiscription write FDiscription;
    property FuncHandler: TFuncHandlerStep read FFuncHandler
      write FFuncHandler;
    property ButtonLayout: TArray < TArray < String >> read FButtonLayout
      write FButtonLayout;
    property FieldClass: PVariant read FFieldClass write FFieldClass;
  end;

var
  FormFastReportInvoiceBot: TFormFastReportInvoiceBot;
  Bot: TftBot;
  Response: String;
  Keyboard: TftReplyKeyboardMarkup;

  CurrentStNI, CurrentAddIItem: Integer;
  StateBot: TStateBot;
  NewInvoiceSteps, AddInvoiceItemSteps: TList<TStepHandler>;

  InvoiceData: TInvoiceData;
  InvoiceItem: TInvoiceItem;

implementation

{$R *.dfm}

procedure ReplyKeyboardCreate(ButtonLayout: TArray<TArray<String>>;
  var Kb: TftReplyKeyboardMarkup);
var
  I, J: Integer;
  Row: TList<TftKeyboardButton>;
  Button: TftKeyboardButton;
begin
  FreeAndNil(Kb);
  Kb := TftReplyKeyboardMarkup.Create;
  for I := 0 to Length(ButtonLayout) - 1 do
  begin
    Row := TList<TftKeyboardButton>.Create;
    for J := 0 to Length(ButtonLayout[I]) - 1 do
    begin
      Button := TftKeyboardButton.Create(ButtonLayout[I][J]);
      Row.Add(Button);
    end;
    Kb.Keyboard.Add(Row);
  end;
end;

procedure MessageTextToVariant(const FTMessage: TObject; AValue: Pointer;
  AVarType: TVarType);
var
  basicType: Integer;
begin
  try
    basicType := AVarType and VarTypeMask;
    case basicType of
      varInteger:
        Integer(AValue^) := StrToInt(TftMessage(FTMessage).Text);
      varDouble:
        Double(AValue^) := StrToFloat(TftMessage(FTMessage).Text);
      varString:
        begin
          String(AValue^) := TftMessage(FTMessage).Text;
        end;
      varUString:
        begin
          String(AValue^) := TftMessage(FTMessage).Text;
        end;
    end;
  except
    Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, 'Invalid enter', false,
      0, Keyboard, 'Markdown');
  end;
  if StateBot = sbNewInvoice then
  begin
    CurrentStNI := CurrentStNI + 1;
    ReplyKeyboardCreate(TStepHandler(NewInvoiceSteps[CurrentStNI])
      .ButtonLayout, Keyboard);
    Response := '"Create a New invoice"' + #13#10#13#10 +
      TStepHandler(NewInvoiceSteps[CurrentStNI]).Discription;
  end
  else if StateBot = sbAddInvoiceItem then
  begin
    CurrentAddIItem := CurrentAddIItem + 1;
    ReplyKeyboardCreate(TStepHandler(AddInvoiceItemSteps[CurrentAddIItem])
      .ButtonLayout, Keyboard);
    Response := '"Add a invoice item"' + #13#10#13#10 +
      TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).Discription;
  end;
  Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
    Keyboard, 'Markdown');
end;

procedure FunStateHandler(const ATMessage: TObject; AData: PVariant;
  AVarType: TVarType);
begin
  MessageTextToVariant(ATMessage, AData, AVarType);
end;

procedure TFormFastReportInvoiceBot.Button1Click(Sender: TObject);
begin
  if not Assigned(FAsyncHttp) then
  begin
    FAsyncHttp := TThread.CreateAnonymousThread(
      procedure
      var
        LongPoll: TftLongPoll;
      begin
        try
          Memo1.Lines.Add('Bot username: ' + Bot.API.getMe.UserName);
          Bot.API.deleteWebhook();

          LongPoll := TftLongPoll.Create(Bot);
          while (True) do
          begin
            Memo1.Lines.Add('Long poll started\n');
            LongPoll.start();
          end
        except
          on E: Exception do
            Memo1.Lines.Add(E.ClassName + ': ' + E.Message);
        end;
      end);
    FAsyncHttp.start();
  end;
end;

procedure TFormFastReportInvoiceBot.FormCreate(Sender: TObject);
begin
  try
    Bot := TftBot.Create('BOT_TOKEN',
      'https://api.telegram.org');

    CurrentStNI := 0;
    CurrentAddIItem := 0;
    InvoiceData := TInvoiceData.Create;
    InvoiceItem := TInvoiceItem.Create;

    NewInvoiceSteps := TList<TStepHandler>.Create;

    NewInvoiceSteps.Add(TStepHandler.Create('Change the invoice number',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.ID_Invoice),
      varInteger));
    NewInvoiceSteps.Add(TStepHandler.Create('Add a logo', FunStateHandler,
      [['<< Back', 'Next >>']], @(InvoiceData.Logo),vtObject));
    NewInvoiceSteps.Add
      (TStepHandler.Create('Who is this invoice from? (required)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.InvoiceFrom),
      varUString));
    NewInvoiceSteps.Add
      (TStepHandler.Create('Bill To (Who is this invoice to? (required))',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Bill_To),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Ship To (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Ship_To),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Date (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Date),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Payment Terms (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Payment_Terms),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Due Date (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Due_Date),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('PO Number (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.PO_Number),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Add invoice items', FunStateHandler,
      [['Add a new item +']]));
    NewInvoiceSteps.Add(TStepHandler.Create('Notes (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Notes),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Terms (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Terms),
      varUString));
    NewInvoiceSteps.Add(TStepHandler.Create('Discount % (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Discount),
      varDouble));
    NewInvoiceSteps.Add(TStepHandler.Create('Tax % (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Tax),
      varDouble));
    NewInvoiceSteps.Add(TStepHandler.Create('Shipping $ (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Shipping),
      varDouble));
    NewInvoiceSteps.Add(TStepHandler.Create('Amount Paid (optional)',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceData.Amount_Paid),
      varDouble));
    NewInvoiceSteps.Add(TStepHandler.Create('Create an invoice?',
      FunStateHandler, [['Yes, Create Invoice', 'No']]));

    AddInvoiceItemSteps := TList<TStepHandler>.Create;
    AddInvoiceItemSteps.Add(TStepHandler.Create('Description',
      FunStateHandler, [['<< Back', 'Next >>']], @(InvoiceItem.Description),
      varUString));
    AddInvoiceItemSteps.Add(TStepHandler.Create('Quantity', FunStateHandler,
      [['<< Back', 'Next >>']], @(InvoiceItem.Quantity), varInteger));
    AddInvoiceItemSteps.Add(TStepHandler.Create('Rate', FunStateHandler,
      [['<< Back', 'Next >>']], @(InvoiceItem.Rate), varDouble));
    AddInvoiceItemSteps.Add(TStepHandler.Create('Add new Item?',
      FunStateHandler, [['/yes', '/no']]));

    Bot.Events.OnCommand('start',
      procedure(const FTMessage: TObject)
      begin
        StateBot := sbStart;
        Response := 'Hello, ' + TftMessage(FTMessage).From.UserName;
        CurrentStNI := 0;
        Keyboard := TftReplyKeyboardMarkup.Create;
        ReplyKeyboardCreate([['Menu']], Keyboard);
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnCommand('menu',
      procedure(const FTMessage: TObject)
      begin
        StateBot := sbMenu;
        Response := 'Menu';
        CurrentStNI := 0;
        ReplyKeyboardCreate([['New Invoice +++']], Keyboard);
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnCommand('new_invoice',
      procedure(const FTMessage: TObject)
      begin
        StateBot := sbNewInvoice;
        CurrentStNI := 0;
        ReplyKeyboardCreate(TStepHandler(AddInvoiceItemSteps[CurrentAddIItem])
          .ButtonLayout, Keyboard);

        Response := '"Create a New invoice"' + #13#10#13#10 +
          TStepHandler(NewInvoiceSteps[CurrentStNI]).Discription;

        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnCommand('add_invoice_item',
      procedure(const FTMessage: TObject)
      begin
        StateBot := sbAddInvoiceItem;
        CurrentAddIItem := 0;
        ReplyKeyboardCreate(TStepHandler(AddInvoiceItemSteps[CurrentAddIItem])
          .ButtonLayout, Keyboard);

        Response := '"Add a invoice item"' + #13#10#13#10 +
          TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).Discription;

        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnCommand('create_invoice',
      procedure(const FTMessage: TObject)
      var
        filePath: String;
        I: Integer;
      begin
        StateBot := sbCreateInvoce;
        TableInvoice.Open;
        TableInvoice.EmptyDataSet;
        TableInvoice.AppendRecord([InvoiceData.ID_Invoice, InvoiceData.Logo,
          InvoiceData.InvoiceFrom, InvoiceData.Date, InvoiceData.Payment_Terms,
          InvoiceData.Due_Date, InvoiceData.PO_Number, InvoiceData.Bill_To,
          InvoiceData.Ship_To, InvoiceData.Notes, InvoiceData.Terms,
          InvoiceData.Subtotal, InvoiceData.Discount, InvoiceData.Tax,
          InvoiceData.Shipping, InvoiceData.Total, InvoiceData.Amount_Paid,
          InvoiceData.Balance_Due]);

        TableItems.Open;
        TableItems.EmptyDataSet;
        for I := 0 to InvoiceData.InvoiceItems.Count - 1 do
        begin
          TInvoiceItem(InvoiceData.InvoiceItems[I]).ID_Invoice :=
            InvoiceData.ID_Invoice;
          TableItems.AppendRecord([TInvoiceItem(InvoiceData.InvoiceItems[I])
            .ID_Invoice, TInvoiceItem(InvoiceData.InvoiceItems[I]).Description,
            TInvoiceItem(InvoiceData.InvoiceItems[I]).Quantity,
            TInvoiceItem(InvoiceData.InvoiceItems[I]).Rate]);
        end;
        try
          if frxReport1.PrepareReport then
          begin
            frxPDFExport1.ShowProgress := false;
            frxPDFExport1.ShowDialog := false;
            filePath := ExtractFilePath(Application.ExeName) + 'Invoices\' +
              'Invoce_' + IntToStr(InvoiceData.ID_Invoice) + '_' +
              DateToStr(Date) + '.pdf';
            frxPDFExport1.FileName := filePath;
            if not DirectoryExists(ExtractFilePath(Application.ExeName) +
              'Invoices\') then
              CreateDir(ExtractFilePath(Application.ExeName) + 'Invoices\');
            frxReport1.Export(frxPDFExport1);
          end;
        except
        end;

        ReplyKeyboardCreate([['New Invoice +++']], Keyboard);

        Response := 'Your invoce';

        Bot.API.sendDocument(TftMessage(FTMessage).Chat.id,
          TftInputFile.fromFile(filePath, 'pdf'), nil, Response, 0, Keyboard,
          'Markdown', false);
        DeleteFile(filePath);
      end);

    Bot.Events.OnCommand('next',
      procedure(const FTMessage: TObject)
      begin
        if StateBot = sbNewInvoice then
        begin
          if (CurrentStNI < NewInvoiceSteps.Count - 1) then
            CurrentStNI := CurrentStNI + 1;
          ReplyKeyboardCreate(TStepHandler(NewInvoiceSteps[CurrentStNI])
            .ButtonLayout, Keyboard);

          Response := '"Create a New invoice"' + #13#10#13#10 +
            TStepHandler(NewInvoiceSteps[CurrentStNI]).Discription;
        end;

        if StateBot = sbAddInvoiceItem then
        begin
          if (CurrentAddIItem < AddInvoiceItemSteps.Count - 1) then
            CurrentAddIItem := CurrentAddIItem + 1;
          ReplyKeyboardCreate(TStepHandler(AddInvoiceItemSteps
            [CurrentAddIItem]).ButtonLayout, Keyboard);

          Response := '"Add a invoice item"' + #13#10#13#10 +
            TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).Discription;
        end;

        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnCommand('back',
      procedure(const FTMessage: TObject)
      begin
        if StateBot = sbNewInvoice then
        begin
          if (CurrentStNI >= 1) then
            CurrentStNI := CurrentStNI - 1;
          ReplyKeyboardCreate(TStepHandler(NewInvoiceSteps[CurrentStNI])
            .ButtonLayout, Keyboard);

          Response := '"Create a New invoice"' + #13#10#13#10 +
            TStepHandler(NewInvoiceSteps[CurrentStNI]).Discription;;
        end;
        if StateBot = sbAddInvoiceItem then
        begin
          if (CurrentAddIItem >= 1) then
            CurrentAddIItem := CurrentAddIItem - 1;
          ReplyKeyboardCreate(TStepHandler(AddInvoiceItemSteps
            [CurrentAddIItem]).ButtonLayout, Keyboard);

          Response := '"Add a invoice item"' + #13#10#13#10 +
            TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).Discription;
        end;
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown')
      end);

    Bot.Events.OnCommand('yes',
      procedure(const FTMessage: TObject)
      var
        Item: TInvoiceItem;
      begin
        if StateBot = sbAddInvoiceItem then
        begin
          Item := TInvoiceItem(TInvoiceItem.NewInstance);
          Item.Assign(InvoiceItem);
          InvoiceData.AddInvoiceItem(Item);

          CurrentAddIItem := 0;
          ReplyKeyboardCreate(TStepHandler(AddInvoiceItemSteps
            [CurrentAddIItem]).ButtonLayout, Keyboard);

          Response := '"Add a invoice item"' + #13#10#13#10 +
            TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).Discription;
        end;
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnCommand('no',
      procedure(const FTMessage: TObject)
      var
        Item: TInvoiceItem;
      begin
        if StateBot = sbAddInvoiceItem then
        begin
          Item := TInvoiceItem(TInvoiceItem.NewInstance);
          Item.Assign(InvoiceItem);
          InvoiceData.AddInvoiceItem(Item);

          CurrentAddIItem := 0;
          StateBot := sbNewInvoice;
          CurrentStNI := CurrentStNI + 1;

          ReplyKeyboardCreate(TStepHandler(NewInvoiceSteps[CurrentStNI])
            .ButtonLayout, Keyboard);

          Response := '"Create a New invoice"' + #13#10#13#10 +
            TStepHandler(NewInvoiceSteps[CurrentStNI]).Discription;
        end;
        Bot.API.sendMessage(TftMessage(FTMessage).Chat.id, Response, false, 0,
          Keyboard, 'Markdown');
      end);

    Bot.Events.OnAnyMessage(
      procedure(const FTMessage: TObject)
      begin
        if (Pos('/yes', TftMessage(FTMessage).Text) > 0) then
        begin
          Exit;
        end;
        if (Pos('/no', TftMessage(FTMessage).Text) > 0) then
        begin
          Exit;
        end;
        if (Pos('New Invoice +++', TftMessage(FTMessage).Text) > 0) then
        begin
          TftMessage(FTMessage).Text := '/new_invoice';
        end;
        if (Pos('Menu', TftMessage(FTMessage).Text) > 0) then
        begin
          TftMessage(FTMessage).Text := '/menu';;
        end;
        if (Pos('Next >>', TftMessage(FTMessage).Text) > 0) then
        begin
          TftMessage(FTMessage).Text := '/next';;
        end;
        if (Pos('<< Back', TftMessage(FTMessage).Text) > 0) then
        begin
          TftMessage(FTMessage).Text := '/back';;
        end;
        if (Pos('Yes, Create Invoice', TftMessage(FTMessage).Text) > 0) and
          (StateBot = sbNewInvoice) then
        begin
          TftMessage(FTMessage).Text := '/create_invoice';
          StateBot := sbCreateInvoce;
        end;

        if (Pos('Add a new item +', TftMessage(FTMessage).Text) > 0) and
          (StateBot = sbNewInvoice) then
        begin
          TftMessage(FTMessage).Text := '/add_invoice_item';
        end
        else
        begin
          if (Pos('/start', TftMessage(FTMessage).Text) > 0) or
            (Pos('/next', TftMessage(FTMessage).Text) > 0) then
            Exit;
          if StateBot = sbNewInvoice then
          begin
            if Assigned(TStepHandler(NewInvoiceSteps[CurrentStNI]).FuncHandler)
            then
              TStepHandler(NewInvoiceSteps[CurrentStNI])
                .FuncHandler(FTMessage,
                TStepHandler(NewInvoiceSteps[CurrentStNI]).FieldClass,
                TStepHandler(NewInvoiceSteps[CurrentStNI]).FVarType);
          end;

          if StateBot = sbAddInvoiceItem then
          begin
            if Assigned(TStepHandler(AddInvoiceItemSteps[CurrentAddIItem])
              .FuncHandler) then
              TStepHandler(AddInvoiceItemSteps[CurrentAddIItem])
                .FuncHandler(FTMessage,
                TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).FieldClass,
                TStepHandler(AddInvoiceItemSteps[CurrentAddIItem]).FVarType);
          end;
        end;
      end);
  except
    on E: Exception do
      Memo1.Lines.Add(E.ClassName + ': ' + E.Message);
  end;
end;

{ TStepHandler }

constructor TStepHandler.Create(ADiscription: string;
AFuncHandler: TFuncHandlerStep; AButtonLayout: TArray<TArray<String>>;
AFieldClass: PVariant; AVarType: TVarType);
begin
  FDiscription := ADiscription;
  FFuncHandler := AFuncHandler;
  FButtonLayout := AButtonLayout;
  FFieldClass := AFieldClass;
  FVarType := AVarType;
end;

destructor TStepHandler.Destroy;
begin
  inherited;
end;

end.
