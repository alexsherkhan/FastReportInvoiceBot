unit InvoiceUnit;

interface

uses
  System.SysUtils, System.Classes, Graphics;

type

  TInvoiceItem = class
  private
    FID_Invoice: Integer;
    FDescription: String;
    FQuantity: Integer;
    FRate: Double;
    FAmount: Double;
  public
    constructor Create;
    procedure Assign(Source: TInvoiceItem);
    property ID_Invoice: Integer read FID_Invoice write FID_Invoice;
    property Description: String read FDescription write FDescription;
    property Quantity: Integer read FQuantity write FQuantity;
    property Rate: Double read FRate write FRate;
    property Amount: Double read FAmount write FAmount;
  end;

  TInvoiceData = class
  private
    FID_Invoice: Integer;
    FLogo: TBitmap;
    FInvoiceFrom: String;
    FDate: String;
    FPayment_Terms: String;
    FDue_Date: String;
    FPO_Number: String;
    FBill_To: String;
    FShip_To: String;
    FInvoiceItems: TList;
    FNotes: String;
    FTerms: String;
    FSubtotal: Double;
    FDiscount: Double;
    FTax: Double;
    FShipping: Double;
    FTotal: Double;
    FAmount_Paid: Double;
    FBalance_Due: Double;
  public
    constructor Create;
    destructor Destroy; override;
    procedure AddInvoiceItem(InvoiceItem: TInvoiceItem);
    property ID_Invoice: Integer read FID_Invoice write FID_Invoice;
    property Logo: TBitmap read FLogo write FLogo;
    property InvoiceFrom: String read FInvoiceFrom write FInvoiceFrom;
    property Date: String read FDate write FDate;
    property Payment_Terms: String read FPayment_Terms write FPayment_Terms;
    property Due_Date: String read FDue_Date write FDue_Date;
    property PO_Number: String read FPO_Number write FPO_Number;
    property Bill_To: String read FBill_To write FBill_To;
    property Ship_To: String read FShip_To write FShip_To;
    property InvoiceItems: TList read FInvoiceItems write FInvoiceItems;
    property Notes: String read FNotes write FNotes;
    property Terms: String read FTerms write FTerms;
    property Subtotal: Double read FSubtotal write FSubtotal;
    property Discount: Double read FDiscount write FDiscount;
    property Tax: Double read FTax write FTax;
    property Shipping: Double read FShipping write FShipping;
    property Total: Double read FTotal write FTotal;
    property Amount_Paid: Double read FAmount_Paid write FAmount_Paid;
    property Balance_Due: Double read FBalance_Due write FBalance_Due;
  end;

implementation

{ TInvoiceItem }

procedure TInvoiceItem.Assign(Source: TInvoiceItem);
begin
  if Source <> nil then
  begin
    FID_Invoice := Source.FID_Invoice;
    FDescription := Source.FDescription;
    FQuantity := Source.FQuantity;
    FRate := Source.FRate;
    FAmount := Source.FAmount;
  end;
end;

constructor TInvoiceItem.Create;
begin
  FQuantity := 1;
  FRate := 0.0;
  FAmount := 0.0;
end;

{ TInvoiceData }

procedure TInvoiceData.AddInvoiceItem(InvoiceItem: TInvoiceItem);
begin
  if Assigned(InvoiceItem) then
    FInvoiceItems.Add(InvoiceItem);
end;

constructor TInvoiceData.Create;
begin
  FID_Invoice := 0;
  FLogo := TBitmap.Create;
  FInvoiceItems := TList.Create;
  FSubtotal := 0.0;
  FDiscount := 0.0;
  FTax := 0.0;
  FShipping := 0.0;
  FTotal := 0.0;
  FAmount_Paid := 0.0;
  FBalance_Due := 0.0;
end;

destructor TInvoiceData.Destroy;
begin
  FreeAndNil(FLogo);
  FreeAndNil(FInvoiceItems);
  inherited;
end;

end.
