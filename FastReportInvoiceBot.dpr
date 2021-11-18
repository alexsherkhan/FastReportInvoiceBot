program FastReportInvoiceBot;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormFastReportInvoiceBot},
  InvoiceUnit in 'InvoiceUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormFastReportInvoiceBot, FormFastReportInvoiceBot);
  Application.Run;
end.
