unit ImpRomaneio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLDB, DB, Forms, Controls, Graphics, Dialogs, RLReport;

type

  { TfrmImpRomaneio }

  TfrmImpRomaneio = class(TForm)
    dsImpRomaneio: TDataSource;
    qrImpRomaneio: TSQLQuery;
    qrImpRomaneioALIQUOTA: TFloatField;
    qrImpRomaneioBEBERCOCO: TLongintField;
    qrImpRomaneioBEBERLIMPO: TLongintField;
    qrImpRomaneioCANCELADO: TStringField;
    qrImpRomaneioCIDADE: TStringField;
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
    qrImpRomaneioVALOR: TBCDField;
    rlAliquota1: TRLDBText;
    RLBand1: TRLBand;
    rlBeberCoco1: TRLDBText;
    rlBeberLimpo1: TRLDBText;
    rlCodRomaneio: TRLDBText;
    rlCodRomaneio1: TRLDBText;
    rlData: TRLDBText;
    rlData1: TRLDBText;
    RLDBText1: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    rlBeberLimpo: TRLDBText;
    rlBeberCoco: TRLDBText;
    RLDBText6: TRLDBText;
    rlAliquota: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    rlDepositado1: TRLDBText;
    rlDesconto3: TRLDBText;
    rlDescPorcentagem1: TRLDBText;
    rlFundoRural1: TRLDBText;
    rlImpureza1: TRLDBText;
    RLLabel35: TRLLabel;
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
    rlLegenda3: TRLDBText;
    rlLegenda4: TRLDBText;
    rlNomePro1: TRLDBText;
    rlObs: TRLDBText;
    RLLabel43: TRLLabel;
    rlObs1: TRLDBText;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    rlPesoBruto1: TRLDBText;
    rlPesoJuta1: TRLDBText;
    rlPesoPlastico1: TRLDBText;
    rlQuanJuta1: TRLDBText;
    rlQuanPlastico1: TRLDBText;
    rlSaldoCoco1: TRLDBText;
    rlSaldoComprado1: TRLDBText;
    rlTotalJuta1: TRLDBText;
    rlTotalPlastico1: TRLDBText;
    rlUnidadePreco1: TRLLabel;
    rlValor1: TRLDBText;
    rlValorBruto1: TRLDBText;
    rlValorLivre: TRLDBText;
    rlFundoRural: TRLDBText;
    RLLabel37: TRLLabel;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLLabel40: TRLLabel;
    RLLabel41: TRLLabel;
    RLLabel42: TRLLabel;
    rlValorBruto: TRLDBText;
    RLLabel36: TRLLabel;
    rlValor: TRLDBText;
    rlDepositado: TRLDBText;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    rlUnidadePreco: TRLLabel;
    rlSaldoComprado: TRLDBText;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    rlSaldoCoco: TRLDBText;
    rlDesconto2: TRLDBText;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    rlLegenda2: TRLDBText;
    rlDescPorcentagem: TRLDBText;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    rlLegenda1: TRLDBText;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    rlTotalJuta: TRLDBText;
    rlPesoJuta: TRLDBText;
    rlQuanJuta: TRLDBText;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    rlTotalPlastico: TRLDBText;
    rlPesoPlastico: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    rlQuanPlastico: TRLDBText;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    rlPesoBruto: TRLDBText;
    rlImpureza: TRLDBText;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    rlNomePro: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel2: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel4: TRLPanel;
    RLReport1: TRLReport;
    rlValorLivre1: TRLDBText;
    procedure dsImpRomaneioDataChange(Sender: TObject; Field: TField);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private

  public

  end;

var
  frmImpRomaneio: TfrmImpRomaneio;

implementation
uses Romaneio;
{$R *.lfm}

{ TfrmImpRomaneio }


procedure TfrmImpRomaneio.dsImpRomaneioDataChange(Sender: TObject; Field: TField);
begin

end;

procedure TfrmImpRomaneio.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
  qrImpRomaneio.Close;
end;

procedure TfrmImpRomaneio.RLReport1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var Aux:integer;AuxPorc, AuxRestoDiv,AuxDiv:double; AuxBeberLimpo:string;
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

end.

