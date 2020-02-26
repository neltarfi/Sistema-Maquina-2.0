unit CadPro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls, DBExtCtrls;

type

  { TfrmCadPro }

  TfrmCadPro = class(TForm)
    BtSalvar: TButton;
    BtSair: TButton;
    cbTipoDoc: TDBComboBox;
    dedDataReg: TDBDateEdit;
    dbeDoc: TDBEdit;
    dbeNomeCli: TDBEdit;
    dbeNomePro: TDBEdit;
    dbeEndereco: TDBEdit;
    dbeBairro: TDBEdit;
    dbeCidade: TDBEdit;
    dbeEstado: TDBEdit;
    dbeInscEstadual: TDBEdit;
    dbeObs: TDBEdit;
    dsCadPro: TDataSource;
    edtCodPro: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    QrCadPro: TSQLQuery;
    QrCadProBAIRRO: TStringField;
    QrCadProCIDADE: TStringField;
    QrCadProCOD_CLI: TLongintField;
    QrCadProCOD_PRO: TLongintField;
    QrCadProDATA_REG: TDateField;
    QrCadProDOC: TStringField;
    QrCadProENDEDRECO: TStringField;
    QrCadProESTADO: TStringField;
    QrCadProINSCESTADUAL: TStringField;
    QrCadProNOME: TStringField;
    QrCadProOBS: TStringField;
    QrCadProTIPODOC: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure cbTipoDocChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;
   function SalvarTrue: boolean;
var
  frmCadPro: TfrmCadPro; Erro:String;

implementation
   uses Funcoes, Module1, BuscaPro, BuscaCliente;
{$R *.lfm}

{ TfrmCadPro }
function SalvarTrue: boolean;
begin
  Erro:='';
  if frmCadPro.dbeNomePro.Text='' then
     Erro:=Erro + '-O campo Nome não pode ficar vazio';
  if frmCadPro.CbTipoDoc.Text='CPF'  then
     if not Funcoes.cpf(frmCadPro.DbeDoc.Text) then
          Erro:=Erro + '-CPF inválido'+ chr(13);
  if frmCadPro.CbTipoDoc.Text='CNPJ' then
      if not Funcoes.cnpj(frmCadPro.DbeDoc.Text) then
         Erro :=Erro+'-CNPJ inválido'+Chr(13);
  if Erro='' then
     SalvarTrue:=True
  else
      SalvarTrue:=False;
end;

procedure TfrmCadPro.BtSairClick(Sender: TObject);
begin
  frmCadPro.Close;
end;

procedure TfrmCadPro.BtSalvarClick(Sender: TObject);
begin

     if MessageDLG('Deseja realmente salvar' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
     begin
       if SalvarTrue then
       begin
            QrCadPro.ApplyUpdates;
            DataModule1.SQLTMaquina.CommitRetaining;
       end
       else
           MessageDLG(Erro, mtError,[mbOK],0);
     end;

end;

procedure TfrmCadPro.cbTipoDocChange(Sender: TObject);
begin
  if frmCadPro.CbTipoDoc.Text='CPF' then
     frmCadPro.DbeDoc.EditMask:='999.999.999-99;0;_';
  if frmCadPro.CbTipoDoc.Text='CNPJ' then
     frmCadPro.DbeDoc.EditMask:='99.999.999/9999-99;0;_';
  frmCadPro.DbeDoc.Text:=QrCadPro.FieldByName('DOC').AsString;
end;

procedure TfrmCadPro.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  QrCadPro.Close;
  frmBuscaPro.QrBuscaPro.Close;
  frmBuscaPro.QrBuscaPro.Open;
end;

procedure TfrmCadPro.FormShow(Sender: TObject);
begin
  QrCadPro.ParamByName('IDCli').Value := frmBuscaCli.QrBuscaCli.FieldByName('Cod_Cliente').Value;
  QrCadPro.ParamByName('IDPro').Value := frmBuscaPro.QrBuscaPro.FieldByName('Cod_Pro').Value;
  QrCadPro.Active := true;
  if frmBuscaPro.Opcao = 'Novo' then
  begin
       QrCadPro.Append;
       QrCadPro.FieldByName('Cod_Cli').Value:= frmBuscaCli.QrBuscaCli.FieldByName('Cod_Cliente').Value;
       QrCadPro.FieldByName('Cod_Pro').Value:= frmCadPro.QrCadPro.RecordCount + 1;
       EdtCodPro.Text := '';
  end
  else
  begin
      QrCadPro.Edit;
      EdtCodPro.Text:= intTostr(QrCadPro.FieldByName('Cod_Pro').Value);
  end;
   if frmCadPro.CbTipoDoc.Text='CPF' then
     frmCadPro.DbeDoc.EditMask:='999.999.999-99;0;_';
  if frmCadPro.CbTipoDoc.Text='CNPJ' then
     frmCadPro.DbeDoc.EditMask:='99.999.999/9999-99;0;_';
     frmCadPro.DbeDoc.Text:=QrCadPro.FieldByName('DOC').AsString;
end;

end.

