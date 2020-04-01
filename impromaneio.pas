unit impRomaneio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TfrmImpRomaneio }

  TfrmImpRomaneio = class(TForm)
    dsImpRomaneio: TDataSource;
    qrImpRomaneio: TSQLQuery;
    qrImpRomaneioALIQUOTA: TFloatField;
    qrImpRomaneioBEBERCOCO: TLongintField;
    qrImpRomaneioBEBERLIMPO: TFloatField;
    qrImpRomaneioCANCELADO: TStringField;
    qrImpRomaneioCIDADE: TStringField;
    qrImpRomaneioCOD_CLI: TLongintField;
    qrImpRomaneioCOD_COMPRA: TLongintField;
    qrImpRomaneioCOD_COMPRA_1: TLongintField;
    qrImpRomaneioCOD_CONTACORRENTE: TLongintField;
    qrImpRomaneioCOD_DEPOSITADO: TLongintField;
    qrImpRomaneioCOD_DEPOSITADO_1: TLongintField;
    qrImpRomaneioCOD_PRO: TLongintField;
    qrImpRomaneioCOD_ROMANEIO: TLongintField;
    qrImpRomaneioDATA: TDateField;
    qrImpRomaneioDEPOSITADO: TLongintField;
    qrImpRomaneioDESCONTO1: TLongintField;
    qrImpRomaneioDESCONTO2: TLongintField;
    qrImpRomaneioIMPUREZA: TLongintField;
    qrImpRomaneioLEGENDA1: TStringField;
    qrImpRomaneioLEGENDA2: TStringField;
    qrImpRomaneioLOTECOCO: TLongintField;
    qrImpRomaneioNOMECLI: TStringField;
    qrImpRomaneioNOMEPRO: TStringField;
    qrImpRomaneioOBS: TStringField;
    qrImpRomaneioPESO: TLongintField;
    qrImpRomaneioPESOBRUTO: TLongintField;
    qrImpRomaneioPESOJUTA: TBCDField;
    qrImpRomaneioPESOPLASTICO: TBCDField;
    qrImpRomaneioPORCENTAGEM: TLongintField;
    qrImpRomaneioPORCFUNDORURAL: TLongintField;
    qrImpRomaneioQUANJUTA: TLongintField;
    qrImpRomaneioQUANPLASTICO: TLongintField;
    qrImpRomaneioRENDA: TLongintField;
    qrImpRomaneioSACOKG: TStringField;
    qrImpRomaneioTOTALROMANEIO: TLongintField;
    qrImpRomaneioVALOR: TFloatField;
    RLBand1: TRLBand;
    rlBeberCoco1: TRLDBText;
    rlBeberLimpo1: TRLDBText;
    rlCodRomaneio: TRLDBText;
    rlCodRomaneio1: TRLDBText;
    rlData1: TRLDBText;
    RLDBText1: TRLDBText;
    rlBeberLimpo: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    rlDepositado1: TRLDBText;
    rlDesconto3: TRLDBText;
    rlDescPorcentagem1: TRLDBText;
    rlFundoRural1: TRLDBText;
    rlImpureza1: TRLDBText;
    RLLabel36: TRLLabel;
    RLLabel43: TRLLabel;
    RLLabel44: TRLLabel;
    RLLabel45: TRLLabel;
    RLLabel46: TRLLabel;
    RLLabel47: TRLLabel;
    RLLabel48: TRLLabel;
    RLLabel49: TRLLabel;
    RLLabel50: TRLLabel;
    RLLabel51: TRLLabel;
    RLLabel52: TRLLabel;
    RLLabel53: TRLLabel;
    RLLabel54: TRLLabel;
    RLLabel55: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel57: TRLLabel;
    RLLabel58: TRLLabel;
    RLLabel59: TRLLabel;
    RLLabel60: TRLLabel;
    RLLabel61: TRLLabel;
    RLLabel62: TRLLabel;
    RLLabel63: TRLLabel;
    RLLabel64: TRLLabel;
    RLLabel65: TRLLabel;
    RLLabel66: TRLLabel;
    RLLabel67: TRLLabel;
    RLLabel68: TRLLabel;
    RLLabel69: TRLLabel;
    RLLabel70: TRLLabel;
    RLLabel71: TRLLabel;
    RLLabel72: TRLLabel;
    RLLabel73: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel75: TRLLabel;
    RLLabel76: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel78: TRLLabel;
    RLLabel79: TRLLabel;
    RLLabel80: TRLLabel;
    RLLabel81: TRLLabel;
    RLLabel82: TRLLabel;
    RLLabel83: TRLLabel;
    RLLabel84: TRLLabel;
    RLLabel85: TRLLabel;
    RLLabel86: TRLLabel;
    RLLabel87: TRLLabel;
    RLLabel88: TRLLabel;
    RLLabel89: TRLLabel;
    RLLabel90: TRLLabel;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    rlPesoBruto1: TRLDBText;
    rlPesoPlastico1: TRLDBText;
    rlQuanJuta1: TRLDBText;
    rlQuanPlastico1: TRLDBText;
    rlRenda1: TRLDBText;
    rlSaldoCoco1: TRLDBText;
    rlSaldoComprado1: TRLDBText;
    rlTotalJuta1: TRLDBText;
    rlTotalPlastico1: TRLDBText;
    rlUnidadePreco1: TRLLabel;
    rlValorBruto: TRLDBText;
    rlFundoRural: TRLDBText;
    rlValorBruto1: TRLDBText;
    rlValorLivre: TRLDBText;
    RLDBText15: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    rlDepositado: TRLDBText;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    rlSaldoComprado: TRLDBText;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    rlUnidadePreco: TRLLabel;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    rlSaldoCoco: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    rlTotalJuta: TRLDBText;
    RLDBText11: TRLDBText;
    rlDescPorcentagem: TRLDBText;
    rlBeberCoco: TRLDBText;
    rlDesconto2: TRLDBText;
    RLDBText16: TRLDBText;
    rlData: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    rlQuanPlastico: TRLDBText;
    rlPesoPlastico: TRLDBText;
    rlQuanJuta: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    rlRenda: TRLDBText;
    rlPesoBruto: TRLDBText;
    rlImpureza: TRLDBText;
    rlTotalPlastico: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel2: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel4: TRLPanel;
    RLReport1: TRLReport;
    rlValorLivre1: TRLDBText;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: boolean);
  private

  public

  end;

var
  frmImpRomaneio: TfrmImpRomaneio;

implementation
  uses Romaneio;
{$R *.lfm}

  { TfrmImpRomaneio }


procedure TfrmImpRomaneio.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: boolean);
var Aux:integer;AuxPorc, AuxRestoDiv,AuxDiv:double;
begin
    qrImpRomaneio.Close;
    qrImpRomaneio.ParamByName('IDCodigoRomaneio').Value:=frmRomaneio.qrRomaneio.FieldByName('Cod_Romaneio').Value;
    qrImpRomaneio.Open;
    rlBeberLimpo.Text:=FormatFloat('0.0',(qrImpRomaneio.FieldByName('BeberLimpo').Value));
    rlBeberLimpo1.Text:=rlBeberLimpo.Text;
    rlTotalPlastico.Text:= intTostr(qrimpRomaneio.FieldByName('QuanPlastico').Value*qrImpRomaneio.FieldByName('PesoPlastico').Value);
    rlTotalPlastico1.Text:=rlTotalPlastico.Text;
    rlTotalJuta.Text:=intTostr(qrimpRomaneio.FieldByName('QuanJuta').Value*qrImpRomaneio.FieldByName('PesoJuta').Value);
    rlTotalJuta1.Text:=rlTotalJuta.Text;
    Aux:=qrImpRomaneio.FieldByName('PesoBruto').Value-qrImpRomaneio.FieldByName('Impureza').Value-strToInt(rlTotalPlastico.Text);
     Aux:=Aux-strToint(rlTotalJuta.Text)-qrimpRomaneio.FieldByName('Desconto1').Value;
     if qrImpRomaneio.FieldByName('Porcentagem').Value >0 then
     begin
          AuxPorc:= (100- qrImpRomaneio.FieldByName('Porcentagem').Value)/100;
          AuxRestoDiv:=(Aux*AuxPorc);
          AuxDiv:= Round(Aux*AuxPorc);

          if AuxRestoDiv<>AuxDiv then AuxDiv:=AuxDiv+1;
          rlDescPorcentagem.Text:=floatTostr(AuxDiv);
          rlDescPorcentagem1.Text:=rlDescPorcentagem.Text;
     end
     else
     begin
          rlDescPorcentagem.Text:='0';
          rlDescPorcentagem1.Text:='0';
     end;
     rlSaldoCoco.Text:=floatTostr(Aux-strToint(rlDescPorcentagem.Text)-qrImpRomaneio.FieldByName('BeberCoco').Value-qrImpRomaneio.FieldByName('Desconto2').Value);
     rlSaldoCoco1.Text:=rlSaldoCoco.Text;
     if frmRomaneio.qrRomaneio.FieldByName('Cod_Compra').Value>0 then
     begin
        if qrImpRomaneio.FieldByName('SacoKg').Value='Saco' then
        begin
             rlValorBruto.Text:=FormatFloat('0.00',(qrimpRomaneio.FieldByName('Valor').Value*qrImpRomaneio.FieldByName('Peso').Value/40));
             rlValorBruto1.Text:=rlValorBruto.Text;
             rlUnidadePreco.Caption:='R$/Saco';
        end
        else
        begin
             Aux:=qrImpRomaneio.FieldByName('Valor').Value*qrImpRomaneio.FieldByName('Peso').Value*qrImpRomaneio.FieldByName('Renda').Value/40000;
             rlValorBruto.Text:=FormatFloat('0.00',Aux);
             rlValorBruto1.Text:=rlValorBruto.Text;
             rlUnidadePreco.Caption:='R$/Kg';
        end;
        rlFundoRural.Text:=FormatFloat('0.00',(strTofloat(rlValorBruto.Text)*qrImpRomaneio.FieldByName('Aliquota').Value*qrImpRomaneio.FieldByName('PorcFundoRural').Value/10000));
        rlFundoRural1.Text:=rlFundoRural.Text;
        rlValorLivre.Text:=FormatFloat('0.00',(strtofloat(rlValorBruto.Text)-strToFloat(rlFundoRural.Text)));
        rlValorLivre1.Text:=rlValorLivre.Text;
     end
     else
     begin
          rlValorBruto.Text:='0.00';
          rlValorBruto1.Text:='0.00';
          rlFundoRural.Text:='0.00';
          rlFundoRural1.Text:='0.00';
          rlValorLivre.Text:='0.00';
          rlValorLivre1.Text:='0.00';
     end;

end;

procedure TfrmImpRomaneio.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qrImpRomaneio.Close;
end;



end.

