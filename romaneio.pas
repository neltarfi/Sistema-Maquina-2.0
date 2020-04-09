unit Romaneio;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  DBCtrls, StdCtrls, DBExtCtrls;

type

  { TfrmRomaneio }

  TfrmRomaneio = class(TForm)
    btNovo: TButton;
    btSalvar: TButton;
    btSair: TButton;
    btImprimir: TButton;
    btFiltro: TButton;
    dsLoteCoco: TDataSource;
    dbeTotalRomaneio: TDBEdit;
    dbePorcFundoRural: TDBEdit;
    dbeAliquota: TDBEdit;
    dsDepositado: TDataSource;
    dbeDepositado: TDBEdit;
    dbeComprado: TDBEdit;
    dbeValor: TDBEdit;
    dsCompra: TDataSource;
    dbeData: TDBDateEdit;
    dbeCodRomaneio: TDBEdit;
    dbeObs: TDBEdit;
    dbeLegenda2: TDBEdit;
    dbeDesconto2: TDBEdit;
    dblLoteCoco: TDBLookupComboBox;
    dsRomaneio: TDataSource;
    edtSaldoCoco: TEdit;
    edtValorBruto: TEdit;
    edtFunRural: TEdit;
    edtValorLivre: TEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    qrAcertoHISTORICO: TStringField;
    qrAuxCompraCOD_COMPRA: TLongintField;
    qrAuxDepositadoCOD_DEPOSITADO: TLongintField;
    qrCompraALIQUOTA: TFloatField;
    qrCompraCANCELADO: TStringField;
    qrCompraCOD_COMPRA: TLongintField;
    qrCompraCOD_DETACERTO: TLongintField;
    qrCompraCOD_ROMANEIO: TLongintField;
    qrCompraDATA: TDateField;
    qrCompraOBS: TStringField;
    qrCompraPESO: TLongintField;
    qrCompraPORCFUNDORURAL: TLongintField;
    qrCompraSACOKG: TStringField;
    qrCompraVALOR: TFloatField;
    qrDepositadoCANCELADO: TStringField;
    qrDepositadoCOD_DEPOSITADO: TLongintField;
    qrDepositadoCOD_ROMANEIO: TLongintField;
    qrDepositadoCOMPRADO: TLongintField;
    qrDepositadoDEPOSITADO: TLongintField;
    qrDepositadoSALDO: TLongintField;
    qrLoteCocoCOD_LOTE: TLongintField;
    qrLoteCocoNOME: TStringField;
    qrRomaneioBEBERCOCO: TLongintField;
    qrRomaneioBEBERLIMPO: TFloatField;
    qrRomaneioCANCELADO: TStringField;
    qrRomaneioCOD_CLI: TLongintField;
    qrRomaneioCOD_COMPRA: TLongintField;
    qrRomaneioCOD_DEPOSITADO: TLongintField;
    qrRomaneioCOD_PRO: TLongintField;
    qrRomaneioCOD_ROMANEIO: TLongintField;
    qrRomaneioDATA: TDateField;
    qrRomaneioDESCONTO1: TLongintField;
    qrRomaneioDESCONTO2: TLongintField;
    qrRomaneioIMPUREZA: TLongintField;
    qrRomaneioLEGENDA1: TStringField;
    qrRomaneioLEGENDA2: TStringField;
    qrRomaneioLOTECOCO: TLongintField;
    qrRomaneioOBS: TStringField;
    qrRomaneioPESOBRUTO: TLongintField;
    qrRomaneioPESOJUTA: TBCDField;
    qrRomaneioPESOPLASTICO: TBCDField;
    qrRomaneioPORCENTAGEM: TLongintField;
    qrRomaneioQUANJUTA: TLongintField;
    qrRomaneioQUANPLASTICO: TLongintField;
    qrRomaneioRENDA: TLongintField;
    qrRomaneioTOTALROMANEIO: TLongintField;
    rgOpcao: TDBRadioGroup;
    edtDesconto: TEdit;
    dbeBeberCoco: TDBEdit;
    dbeBeberLimpo: TDBEdit;
    dbePorcentagem: TDBEdit;
    dbeLegenda1: TDBEdit;
    dbeDesconto1: TDBEdit;
    dbePesoBruto: TDBEdit;
    dbeImpureza: TDBEdit;
    dbeQuanPlastico: TDBEdit;
    dbePesoPlastico: TDBEdit;
    dbePesoJuta: TDBEdit;
    dbeQuanJuta: TDBEdit;
    dbeRenda: TDBEdit;
    DBNavigator1: TDBNavigator;
    dsListNomePro: TDataSource;
    dbNomePro: TDBLookupComboBox;
    dsListNomeCli: TDataSource;
    dbNomeCli: TDBLookupComboBox;
    edtAuxCoco: TEdit;
    edtDescPorcentagem: TEdit;
    edtTotalPlastico: TEdit;
    edtTotalJuta: TEdit;
    edtCidade: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qrListNomeProCIDADE: TStringField;
    qrListNomeProCOD_CLI: TLongintField;
    qrListNomeProCOD_PRO: TLongintField;
    qrListNomeProNOME: TStringField;
    qrListNomeCli: TSQLQuery;
    qrListNomeCliCOD_CLIENTE: TLongintField;
    qrListNomeCliNOME: TStringField;
    qrListNomePro: TSQLQuery;
    qrCompra: TSQLQuery;
    qrDepositado: TSQLQuery;
    qrRomaneio: TSQLQuery;
    qrAuxCompra: TSQLQuery;
    qrAuxDepositado: TSQLQuery;
    qrLoteCoco: TSQLQuery;
    qrAcerto: TSQLQuery;
    qrAcertoCOD_ACERTO: TLongintField;
    qrAcertoCOD_CLI: TLongintField;
    qrAcertoCOD_DETACERTO: TLongintField;
    qrAcertoCREDITO: TFloatField;
    qrAcertoDATA: TDateField;
    qrAcertoDEBITO: TFloatField;
    qrAcertoSELECIONADO: TStringField;
    qrAcertoSTATUS: TStringField;
    procedure btNovoClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btFiltroClick(Sender: TObject);
    procedure dbeBeberCocoExit(Sender: TObject);
    procedure dbeBeberLimpoExit(Sender: TObject);
    procedure dbeCompradoEnter(Sender: TObject);
    procedure dbeCompradoExit(Sender: TObject);
    procedure dbeDesconto1Exit(Sender: TObject);
    procedure dbeDesconto2Exit(Sender: TObject);
    procedure dbeImpurezaExit(Sender: TObject);
    procedure dbePesoBrutoExit(Sender: TObject);
    procedure dbePesoJutaExit(Sender: TObject);
    procedure dbePesoPlasticoExit(Sender: TObject);
    procedure dbePorcentagemExit(Sender: TObject);
    procedure dbePorcFundoRuralExit(Sender: TObject);
    procedure dbeQuanJutaExit(Sender: TObject);
    procedure dbeQuanPlasticoExit(Sender: TObject);
    procedure dbeRendaExit(Sender: TObject);
    procedure dbeValorExit(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure dbNomeCliSelect(Sender: TObject);
    procedure dbNomeProSelect(Sender: TObject);
    procedure edtAuxCocoExit(Sender: TObject);
    procedure edtDescontoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure AbilitaControles;
    procedure DesabilitaControles;
    procedure AbilitaCompra;
    procedure DesabilitaCompra;
    procedure CalcRomaneio;
    procedure CalcCompra;
    procedure rgOpcaoChange(Sender: TObject);
    function SalvarTrue():boolean;
    procedure PopulaCampos;
  private

  public

  end;

var
  frmRomaneio: TfrmRomaneio; Novo:boolean; //usado na função CalcRomaneio
                             NovaCompra:boolean;//usado no prcedimento rgOpcaoChange
                             Erro:string;
implementation
 uses Module1, ImpRomaneio;
{$R *.lfm}

{ TfrmRomaneio }

procedure TfrmRomaneio.FormShow(Sender: TObject);
begin
  DesabilitaControles;
  DesabilitaCompra;
  qrListNomeCli.Open;
  qrRomaneio.Open;
  qrRomaneio.Last;
  dbNomeCli.KeyValue:=qrRomaneio.FieldByName('Cod_Cli').Value;
  qrListNomePro.Close;
  qrListNomePro.ParamByName('IDCliente').Value:=dbNomeCli.KeyValue;
  qrListNomePro.Open;
  qrLoteCoco.Close;
  qrLoteCoco.ParamByName('IDstatus1').AsString:='Aberto';
  qrLoteCoco.ParamByName('IDstatus2').AsString:='Fechado';
  qrLoteCoco.Open;
  if qrRomaneio.RecordCount > 0 then
  begin
    qrDepositado.Close;
    qrDepositado.ParamByName('IDDepositado').Value:=qrRomaneio.FieldByName('Cod_Depositado').Value;

    qrCompra.Close;
    qrCompra.ParamByName('IDCompra').Value:=qrRomaneio.FieldByName('Cod_Compra').Value;
    qrDepositado.Open;
    qrCompra.Open;
    CalcRomaneio;
    calcCompra;
  end
  else
  begin
    qrDepositado.Close;
    qrDepositado.ParamByName('IDDepositado').Value:=0;

    qrCompra.Close;
    qrCompra.ParamByName('IDCompra').Value:=0;
    qrDepositado.Open;
    qrCompra.Open;
  end;
  edtCidade.Text:=qrListNomePro.FieldByName('Cidade').AsString;
  dbeData.Text:= datetostr(Date);
  btSalvar.Enabled:=false;
  Novo:=False;
  NovaCompra:=False ;
end;

procedure TfrmRomaneio.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
    Novo:=False ;
  NovaCompra:=False;
  qrListNomeCli.Close;
  qrListNomePro.Close;
  qrRomaneio.Close;
  qrCompra.Close;
  qrDepositado.Close;
  qrAuxDepositado.Close;
  qrAuxCompra.Close;
  qrLoteCoco.Close;


end;

procedure TfrmRomaneio.dbNomeCliSelect(Sender: TObject);
begin
     dbNomePro.Clear;
     edtCidade.Clear;
     if btFiltro.Caption='Filtro on' then
     begin
          qrRomaneio.Close;
          qrRomaneio.ParamByName('IDCliente').Value:= dbNomeCli.KeyValue;
          qrRomaneio.Open;
          qrRomaneio.Last;
     end;
     qrListNomePro.Close;
     qrListNomePro.ParamByName('IDCliente').Value:=dbNomeCli.KeyValue;
     qrListNomePro.Open;
     if Novo then dbNomePro.KeyValue:=0
     else edtCidade.Text:=qrListNomePro.FieldByName('Cidade').Text;
end;

procedure TfrmRomaneio.btNovoClick(Sender: TObject);
begin
  Novo:=true;
  qrLoteCoco.Close;
  qrLoteCoco.ParamByName('IDstatus1').AsString:='Aberto';
  qrLoteCoco.ParamByName('IDstatus2').AsString:='Aberto';
  qrLoteCoco.Open;
  btFiltro.Enabled:=False;
  qrRomaneio.Insert;
  qrCompra.Insert;
  qrDepositado.Insert;
  qrAuxCompra.Open;
  qrRomaneio.FieldByName('Cod_Romaneio').Value:=-1;
  dbNomeCli.KeyValue:=0;
  qrAuxDepositado.Open;
  dbeData.Text:= datetostr(Date);
  dbeData.ReadOnly:=False;
  btSalvar.Enabled:=true;
  btNovo.Enabled:=false;
  btimprimir.Enabled:=False;
  AbilitaControles;
  CalcRomaneio;
end;

procedure TfrmRomaneio.btSairClick(Sender: TObject);
begin
  frmRomaneio.Close;
end;

procedure TfrmRomaneio.btSalvarClick(Sender: TObject);
begin
     if MessageDLG('Deseja realmente salvar' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
     begin
          if SalvarTrue then
          begin

           if dbeDepositado.Text > '0' then
           begin
             qrRomaneio.FieldByName('Cod_Depositado').Value:=qrAuxDepositado.RecordCount;
             qrDepositado.FieldByName('Cod_Depositado').Value:= -1;
             qrDepositado.FieldByName('Cod_Romaneio').Value:= qrRomaneio.RecordCount+1;
             qrDepositado.FieldByName('Comprado').Value:=0;
             qrDepositado.FieldByName('Saldo').Value:=qrDepositado.FieldByName('Depositado').Value;
             qrDepositado.FieldByName('Cancelado').Text:='False';
             qrDepositado.ApplyUpdates;
           end
           else
           begin
                qrRomaneio.FieldByName('Cod_Depositado').Value:= 0;
                qrDepositado.Close;
                qrDepositado.Open;
           end;
           if dbeComprado.Text > '0' then
           begin
                qrRomaneio.FieldByName('Cod_Compra').Value:=qrAuxCompra.RecordCount;
                qrCompra.FieldByName('Cod_Compra').Value:= -1;
                qrCompra.FieldByName('Cod_Romaneio').Value:=qrRomaneio.RecordCount+1;
                qrCompra.FieldByName('Data').Value:=strToDate(dbeData.Text);
                qrAcerto.Open;
                qrCompra.FieldByName('Cod_DetAcerto').Value:=qrAcerto.RecordCount;
                qrCompra.FieldByName('Cancelado').Text:='False';
                qrCompra.ApplyUpdates;
                qrAcerto.Append;
                qrAcerto.FieldByName('Cod_DetAcerto').Value:=-1;
                qrAcerto.FieldByName('Cod_Cli').Value:= dbNomeCli.KeyValue;
                qrAcerto.FieldByName('Data').Value:=strToDate(dbeData.Text);
                qrAcerto.FieldByName('Historico').AsString:='Romaneio '+intTostr(qrRomaneio.RecordCount+1)+' Compra '+intTostr(qrAuxCompra.RecordCount);
                qrAcerto.FieldByName('Debito').Value:=strtoFloat(FormatFloat('0.00',strToFloat(edtValorLivre.Text)));
                qrAcerto.FieldByName('Credito').Value:=0.0;
                qrAcerto.FieldByName('Status').Text:='Ativo';
                qrAcerto.ApplyUpdates;
           end
           else
           begin
                qrRomaneio.FieldByName('Cod_Compra').Value:= 0;
                qrCompra.Close;
                qrCompra.Open;
           end;

           qrRomaneio.FieldByName('Cod_Cli').Value:=dbNomeCli.KeyValue;
           qrRomaneio.FieldByName('Cancelado').Text:='False';

           qrRomaneio.ApplyUpdates;
           DataModule1.SQLTMaquina.CommitRetaining;
           qrLoteCoco.Close;
           qrLoteCoco.ParamByName('IDstatus1').AsString:='Aberto';
           qrLoteCoco.ParamByName('IDstatus2').AsString:='Fechado';
           qrLoteCoco.Open;
           qrRomaneio.Close;
           qrRomaneio.Open;
           qrRomaneio.Last;
           qrAuxDepositado.Close;
           qrAuxCompra.Close;
           Novo:=False;
           PopulaCampos;
           desabilitaControles;
           btSalvar.Enabled:=False;
           btImprimir.Enabled:=True;
           btNovo.Enabled:=True;
           btFiltro.Enabled:=True;

        end
        else MessageDLG(Erro, mtError,[mbOK],0);
     end;
end;

procedure TfrmRomaneio.btImprimirClick(Sender: TObject);
begin
   frmImpRomaneio:=TfrmImpRomaneio.Create(self);
   frmImpRomaneio.RLReport1.Preview();
end;

procedure TfrmRomaneio.btFiltroClick(Sender: TObject);
begin
     if btFiltro.Caption='Filtro off' then
     begin
          qrRomaneio.Close;
          qrRomaneio.SQL.Clear;
          qrRomaneio.SQL.Add('Select * from Romaneio where Cod_Cli = :IDCliente');
          qrRomaneio.SQL.Add('order by Cod_Romaneio');
          qrRomaneio.ParamByName('IDCliente').Value:= dbNomeCli.KeyValue;
          qrRomaneio.Open;
          qrRomaneio.Last;
          dbNomeCli.KeyValue:=qrRomaneio.FieldByName('Cod_Cli').Value;
          btFiltro.Caption:='Filtro on';
          btNovo.Enabled:=false;
          dbNomeCli.Enabled:=True;
     end
     else
     begin
          qrRomaneio.Close;
          qrRomaneio.SQL.Clear;
          qrRomaneio.SQL.Add('Select * from Romaneio order by Cod_Romaneio');
          qrRomaneio.Open;
          qrRomaneio.Last;
          dbNomeCli.KeyValue:=qrRomaneio.FieldByName('Cod_Cli').Value;
          btFiltro.Caption:='Filtro off';
          btNovo.Enabled:=True;
          dbNomeCli.Enabled:=False;
     end;
     PopulaCampos;
end;

procedure TfrmRomaneio.dbeBeberCocoExit(Sender: TObject);
begin
  if dbeBeberCoco.Text='' then
     dbeBeberCoco.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbeBeberLimpoExit(Sender: TObject);
var Aux,Renda:integer;
begin
  if not (dbeBeberLimpo.Text='') then
  begin
       Renda :=qrRomaneio.FieldByName('Renda').Value;
       Aux:=Round(100-strtoint(edtDesconto.Text));
       dbeBeberCoco.Text:=inttostr(Round(((strToFloat(dbeBeberLimpo.Text)*40000*100)/Aux)/Renda));
       CalcRomaneio;
  end
  else qrRomaneio.FieldByName('BeberLimpo').Text:='0';
end;

procedure TfrmRomaneio.dbeCompradoEnter(Sender: TObject);
begin
     if Novo then AbilitaCompra;
end;

procedure TfrmRomaneio.dbeCompradoExit(Sender: TObject);
begin
  if Novo then
  begin
     if (strToInt(edtSaldoCoco.Text)-strToint(dbeComprado.Text)) >= 0 then
        qrDepositado.FieldByName('Depositado').Value:=strToInt(edtSaldoCoco.Text)-strToint(dbeComprado.Text)
     else
     begin
          qrDepositado.FieldByName('Depositado').Value:=strToint(edtSaldoCoco.Text);
          qrCompra.FieldByName('Peso').Value:=0;
     end;
  end;
  CalcCompra;
end;

procedure TfrmRomaneio.dbeDesconto1Exit(Sender: TObject);
Begin
  if dbeDesconto1.Text='' then
     dbeDesconto1.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbeDesconto2Exit(Sender: TObject);
begin
  if dbeDesconto2.Text='' then
     dbeDesconto2.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbeImpurezaExit(Sender: TObject);
begin
  if dbeIMpureza.Text='' then
     dbeImpureza.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbePesoBrutoExit(Sender: TObject);
begin
  if dbePesoBruto.Text='' then
     dbePesoBruto.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbePesoJutaExit(Sender: TObject);
begin
  if dbePesoJuta.Text='' then
     dbePesoJuta.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbePesoPlasticoExit(Sender: TObject);
begin
  if dbePesoPlastico.Text='' then
     dbePesoPlastico.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbePorcentagemExit(Sender: TObject);
begin
  if dbePorcentagem.Text='' then
     dbePorcentagem.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbePorcFundoRuralExit(Sender: TObject);
begin
  CalcCompra;
end;

procedure TfrmRomaneio.dbeQuanJutaExit(Sender: TObject);
begin
  if dbeQuanJuta.Text='' then
     dbeQuanJuta.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbeQuanPlasticoExit(Sender: TObject);
begin
  if dbeQuanPlastico.Text='' then
     dbeQuanPlastico.Text:='0';
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbeRendaExit(Sender: TObject);
begin
  CalcRomaneio;
end;

procedure TfrmRomaneio.dbeValorExit(Sender: TObject);
begin
  CalcCompra;
end;

procedure TfrmRomaneio.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
begin
     PopulaCampos;
end;

procedure TfrmRomaneio.dbNomeProSelect(Sender: TObject);
begin
  edtCidade.Text:=qrListNomePro.FieldByName('Cidade').AsString;
end;

procedure TfrmRomaneio.edtAuxCocoExit(Sender: TObject);
var Aux:double; Renda:integer;
begin
  if not (edtAuxCoco.Text = '') then
  begin
     Aux:=(100-strtoint(edtDesconto.Text))/100;
     Renda:= qrRomaneio.FieldByName('Renda').Value;
     qrRomaneio.FieldByName('BeberLimpo').Value:=floatTostr(((strToint(edtAuxCoco.Text)*Renda)/40000)*Aux);
     CalcRomaneio;
  end
  else
     edtAuxCoco.Text:='0';
end;

procedure TfrmRomaneio.edtDescontoExit(Sender: TObject);
var Aux,Renda:integer;
begin
  if  not(edtDesconto.Text='') then
  begin
       Renda :=qrRomaneio.FieldByName('Renda').Value;
       Aux:=Round(100-strtoint(edtDesconto.Text));
       qrRomaneio.FieldByName('BeberCoco').Value:=Round(((strTofloat(dbeBeberLimpo.Text)*40000*100)/Renda)/Aux);
       CalcRomaneio;
  end
  else
      edtDesconto.Text:='0';
end;

procedure TfrmRomaneio.AbilitaControles;
begin
     qrRomaneio.FieldByName('Renda').Value:=0;
     qrRomaneio.FieldByName('PesoPlastico').Value:=0.1;
     qrRomaneio.FieldByName('QuanPlastico').Value:=0;
     qrRomaneio.FieldByName('QuanJuta').Value:=0;
     qrRomaneio.FieldByName('PesoJuta').Value:=0.5;
     qrRomaneio.FieldByName('PesoBruto').Value:=0;
     qrRomaneio.FieldByName('Impureza').Value:=0;
     qrRomaneio.FieldByName('Desconto1').Value:=0;
     qrRomaneio.FieldByName('Porcentagem').Value:=0;
     qrRomaneio.FieldByName('BeberLimpo').Value:=0;
     qrRomaneio.FieldByName('BeberCoco').Value:=0;
     qrRomaneio.FieldByName('Desconto2').Value:=0;
     qrRomaneio.FieldByName('TotalRomaneio').Value:=0;
     dbNomeCli.Enabled:=True;
     dbNomePro.Enabled:=True;
     edtCidade.Text:='';
     dbeRenda.ReadOnly:=False;

     dbePesoBruto.ReadOnly:=False;
     dbeImpureza.ReadOnly:=False;
     dbeQuanPlastico.ReadOnly:=False;
     dbePesoPlastico.ReadOnly:=False;
     dbeQuanJuta.ReadOnly:=False;
     dbePesoJuta.ReadOnly:=False;
     dbeLegenda1.ReadOnly:=False;
     qrRomaneio.FieldByName('Legenda1').Text:='Outros descontos';
     dbeDesconto1.ReadOnly:=False;
     dbePorcentagem.ReadOnly:=False;
     edtDescPorcentagem.Text:='0';
     edtAuxCoco.ReadOnly:=False;
     edtAuxCoco.Text:='0';
     dbeBeberLimpo.ReadOnly:=False;
     edtDesconto.ReadOnly:=False;
     edtDesconto.Text:='20';
     dbeBeberCoco.ReadOnly:=False;
     dbeLegenda2.ReadOnly:=False;
     dbeDesconto2.ReadOnly:=False;
     qrRomaneio.FieldByName('Legenda2').Text:='Outros descontos';
     dblLoteCoco.Enabled:=True;
     dbeObs.Clear;
     dbeDepositado.Text:='0';
     dbeComprado.ReadOnly:=False;
     qrCompra.FieldByName('Peso').Value:=0;
     dbeValor.ReadOnly:=False;
     qrCompra.FieldByName('Valor').Value:=0;
     edtValorBruto.Text:='0';
     edtFunRural.Text:='0';
     edtValorLivre.Text:='0';
     qrCompra.FieldByName('SacoKg').Text:='Saco';
     qrCompra.FieldByName('PorcFundoRural').Value:=100;
     qrCompra.FieldByName('Aliquota').Value:=1.5;
     dbeData.ReadOnly:=False;
     dbNavigator1.Enabled:=False;
end;

procedure TfrmRomaneio.DesabilitaControles;
Begin
     dbNomeCli.Enabled:=False;
     dbNomePro.Enabled:=False;
     dbeRenda.ReadOnly:=True;
     dbePesoBruto.ReadOnly:=True;
     dbeImpureza.ReadOnly:=True;
     dbeQuanPlastico.ReadOnly:=True;
     dbePesoPlastico.ReadOnly:=True;
     dbeQuanJuta.ReadOnly:=True;
     dbePesoJuta.ReadOnly:=True;
     dbeLegenda1.ReadOnly:=True;
     dbeDesconto1.ReadOnly:=True;
     dbePorcentagem.ReadOnly:=True;
     edtAuxCoco.ReadOnly:=True;
     dbeBeberLimpo.ReadOnly:=True;
     edtDesconto.ReadOnly:=True;
     dbeBeberCoco.ReadOnly:=True;
     dbeLegenda2.ReadOnly:=True;
     dbeDesconto2.ReadOnly:=True;
     dblLoteCoco.Enabled:=False;
     dbeComprado.ReadOnly:=True;
     dbeValor.ReadOnly:=True;
     dbeData.ReadOnly:=True;
     dbNavigator1.Enabled:=True;
end;

procedure TfrmRomaneio.CalcRomaneio;
var
 Aux,Renda:integer;AuxRestoDiv, AuxDiv, AuxPorc:double;
begin
     if qrRomaneio.FieldByName('Renda').Text='' then
        qrRomaneio.FieldByName('Renda').Text:='0';
     if qrRomaneio.FieldByName('PesoPlastico').Text='' then
        qrRomaneio.FieldByName('PesoPlastico').Text:='0';
     if qrRomaneio.FieldByName('QuanPlastico').Text='' then
        qrRomaneio.FieldByName('QuanPlastico').Text:='0';
      if qrRomaneio.FieldByName('PesoJuta').Text='' then
        qrRomaneio.FieldByName('PesoJuta').Text:='0';
     if qrRomaneio.FieldByName('QuanJuta').Text='' then
        qrRomaneio.FieldByName('QuanJuta').Text:='0';
     if qrRomaneio.FieldByName('PesoBruto').Text='' then
        qrRomaneio.FieldByName('PesoBruto').Text:='0';
     if qrRomaneio.FieldByName('Impureza').Text='' then
        qrRomaneio.FieldByName('Impureza').Text:='0';
     if qrRomaneio.FieldByName('Porcentagem').Text='' then
        qrRomaneio.FieldByName('Porcentagem').Text:='0';
     if qrRomaneio.FieldByName('Desconto1').Text='' then
        qrRomaneio.FieldByName('Desconto1').Text:='0';
     if qrRomaneio.FieldByName('Desconto2').Text='' then
        qrRomaneio.FieldByName('Desconto2').Text:='0';
     edtTotalPlastico.Text:=inttostr(Round(qrRomaneio.FieldByName('PesoPlastico').Value*qrRomaneio.FieldByName('QuanPlastico').Value));
     edtTotalJuta.Text:=intTostr(Round(qrRomaneio.FieldByName('QuanJuta').Value*qrRomaneio.FieldByName('PesoJuta').Value));
     Aux:=qrRomaneio.FieldByName('PesoBruto').Value-qrRomaneio.FieldByName('Impureza').Value-strToInt(edtTotalPlastico.Text);
     Aux:=Aux-strToint(edtTotalJuta.Text)-qrRomaneio.FieldByName('Desconto1').Value;
     if qrRomaneio.FieldByName('Porcentagem').Value >0 then
     begin
          AuxPorc:= (100- qrRomaneio.FieldByName('Porcentagem').Value)/100;
          AuxRestoDiv:=(Aux*AuxPorc);
          AuxDiv:= Round(Aux*AuxPorc);
          if AuxRestoDiv<>AuxDiv then
             edtDescPorcentagem.Text:=floatTostr(AuxDiv+1)
          else edtDescPorcentagem.Text:=floatTostr(AuxDiv);
     end
     else edtDescPorcentagem.Text:='0';
     if Novo then
        edtSaldoCoco.Text:=intTostr(Aux-strToint(edtDescPorcentagem.Text)-strToint(dbeBeberCoco.Text)-strToint(dbeDesconto2.Text))
     else edtSaldoCoco.Text:=intTostr(Aux-strToint(edtDescPorcentagem.Text)-strToint(dbeBeberCoco.Text)-strToint(dbeDesconto2.Text));
     if strToint(edtSaldoCoco.Text)>0 then
        begin
             if novo then qrDepositado.FieldByName('Depositado').Value:=strToint(edtSaldoCoco.Text);
        end
     else
     begin
          DesabilitaCompra;
          if novo then qrDepositado.FieldByName('Depositado').Value:=0;
     end;
     dbeTotalRomaneio.Text:=intTostr(strToint(dbeBeberCoco.Text)+strToint(edtSaldoCoco.Text));
end;

procedure TfrmRomaneio.AbilitaCompra;
begin
     dbeComprado.ReadOnly:=False;
     dbeComprado.Text:='0';
     dbeValor.ReadOnly:=False;
     dbeValor.Text:='0';
     rgOpcao.Enabled:=True;
     rgOpcao.Value:='Saco';
     dbePorcFundoRural.ReadOnly:=False;
     dbePorcFundoRural.Text:='100';
     NovaCompra:=True
end;

procedure TfrmRomaneio.DesabilitaCompra;
begin
  dbeComprado.ReadOnly:=True ;
  dbeValor.ReadOnly:=True;
  rgOpcao.Enabled:=False;
  dbePorcFundoRural.ReadOnly:=True;
end;

procedure TfrmRomaneio.CalcCompra;
var Aux:double;
begin
     if (dbeComprado.Text>'0') and (strTofloat(dbeValor.Text)>0.00) then
     begin
        if rgOpcao.Value='Saco' then
           edtValorBruto.Text:=FormatFloat('0.00',(qrCompra.FieldByName('Valor').Value*qrCompra.FieldByName('Peso').Value/40))
        else
        begin
             Aux:=qrCompra.FieldByName('Valor').Value*qrCompra.FieldByName('Peso').Value*qrRomaneio.FieldByName('Renda').Value/40000;
             edtValorBruto.Text:=FormatFloat('0.00',Aux);
        end;
        edtFunRural.Text:=FormatFloat('0.00',(strTofloat(edtValorBruto.Text)*qrCompra.FieldByName('Aliquota').Value*qrCompra.FieldByName('PorcFundoRural').Value/10000));
        edtValorLivre.Text:=FormatFloat('0.00',(strtofloat(edtValorBruto.Text)-strToFloat(edtFunRural.Text)));
     end
     else
     begin
          edtValorBruto.Text:='0.00';
          edtFunRural.Text:='0.00';
          edtValorLivre.Text:='0.00';
     end;

end;

procedure TfrmRomaneio.rgOpcaoChange(Sender: TObject);
begin
  if NovaCompra then CalcCompra;
end;

function TfrmRomaneio.SalvarTrue():boolean;
begin
     Erro:='';
     if dbNomeCli.KeyValue < 1 then Erro:='-O Nome do Cliente não pode ficar vazio'+chr(13);
     if dbNomePro.KeyValue < 1 then Erro:=Erro+'-O Nome da Propriedade não pode ficar vazio'+chr(13);
     if strToint(dbeRenda.Text) <= 0 then Erro:=Erro+'-A renda tem que ser maior que zero'+chr(13);
     if strToint(dbePesoBruto.Text) <= 0 then Erro:=Erro+'-O peso bruto tem que ser maior que zero'+chr(13);
     if (strToint(dbeComprado.Text) > 0) and (strTofloat(dbeValor.Text) = 0) then
        Erro:=Erro+'-O Valor unitário não pode ser zero quando o valor comprado é maior que zero'+chr(13);
     if length(dbeObs.Text) > 100 then Erro:=Erro+'-O Campo Obs não pode utrapaçar 100 caracteres'+chr(13);
     if dblLoteCoco.KeyValue < 1 then Erro:= Erro+'-O Campo Lote Coco não pode ficar vazio'+chr(13);
     if Erro = '' then
        SalvarTrue := True
     else
         SalvarTrue := False;
end;

procedure TfrmRomaneio.PopulaCampos;
begin
     dbNomeCli.KeyValue:=qrRomaneio.FieldByName('Cod_Cli').Value;
     qrListNomePro.Close;
     qrListNomePro.ParamByName('IDCliente').Value:=dbNomeCli.KeyValue;
     qrListNomePro.Open;


     edtCidade.Text:=qrListNomePro.FieldByName('Cidade').AsString;

     qrDepositado.Close;
     qrDepositado.ParamByName('IDDepositado').Value:=qrRomaneio.FieldByName('Cod_Depositado').Value;
     qrDepositado.Open;

     qrCompra.Close;
     qrCompra.ParamByName('IDCompra').Value:=qrRomaneio.FieldByName('Cod_Compra').Value;
     qrCompra.Open;
     CalcRomaneio;
     CalcCompra;
end;

end.

