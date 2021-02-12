unit ImpAcerto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TfrmImpAcerto }

  TfrmImpAcerto = class(TForm)
    dsImpAcerto: TDataSource;
    qrImpAcertoCOD_ACERTO: TLongintField;
    qrImpAcertoCREDITO: TBCDField;
    qrImpAcertoDATA: TDateField;
    qrImpAcertoDEBITO: TBCDField;
    qrImpAcertoHISTORICO: TStringField;
    qrImpAcertoNOME: TStringField;
    qrImpAcerto: TSQLQuery;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLDBResult1: TRLDBResult;
    RLDBResult2: TRLDBResult;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLGroup1: TRLGroup;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLReport1: TRLReport;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

var
  frmImpAcerto: TfrmImpAcerto;

implementation

uses Acerto;

{$R *.lfm}

{ TfrmImpAcerto }

procedure TfrmImpAcerto.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
     qrImpAcerto.ParamByName('IDAcerto').Value:=frmAcerto.CodImprimir;
     qrImpAcerto.Open;
end;

procedure TfrmImpAcerto.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
     qrImpAcerto.Close;
end;

end.

