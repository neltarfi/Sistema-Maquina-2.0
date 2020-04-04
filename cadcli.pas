unit CadCli;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  DBExtCtrls, StdCtrls;

type

  { TfrmCadCli }

  TfrmCadCli = class(TForm)
    BtSalvar: TButton;
    BtSair: TButton;
    CbTipoDoc: TDBComboBox;
    DbeCidade: TDBEdit;
    DbeObs: TDBEdit;
    DbeInscEstadual: TDBEdit;
    DbeEstado: TDBEdit;
    DsCadCli: TDataSource;
    DbdData: TDBDateEdit;
    DbeNome: TDBEdit;
    DbeTelefone: TDBEdit;
    DbeCelular: TDBEdit;
    DbeEndereco: TDBEdit;
    DbeBairro: TDBEdit;
    DbeDoc: TDBEdit;
    EdtCodigo: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    QrCadCli: TSQLQuery;
    QrCadCliBAIRRO: TStringField;
    QrCadCliCELULAR: TStringField;
    QrCadCliCIDADE: TStringField;
    QrCadCliCOD_CLIENTE: TLongintField;
    QrCadCliDATE_REG: TDateField;
    QrCadCliDOC: TStringField;
    QrCadCliENDERECO: TStringField;
    QrCadCliESTADO: TStringField;
    QrCadCliINSCESTADUAL: TStringField;
    QrCadCliNOME: TStringField;
    QrCadCliOBS: TStringField;
    QrCadCliTELEFONE: TStringField;
    QrCadCliTIPODOC: TStringField;
    procedure BtSairClick(Sender: TObject);
    procedure BtSalvarClick(Sender: TObject);
    procedure CbTipoDocChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;
      function SalvarTrue: boolean;
var
  frmCadCli: TfrmCadCli;Erro:string;

implementation
   uses BuscaCliente, Module1, Funcoes;
{$R *.lfm}

{ TfrmCadCli }



function SalvarTrue: boolean;
begin
  Erro:='';
  if frmCadCli.DbeNome.Text='' then
     Erro:=Erro + '-O campo Nome não pode ficar vazio'+ chr(13);
  if frmCadCli.CbTipoDoc.Text='CPF'  then
     if not Funcoes.cpf(frmCadCli.DbeDoc.Text) then
          Erro:=Erro + '-CPF inválido'+ chr(13);
  if frmCadCli.CbTipoDoc.Text='CNPJ' then
      if not Funcoes.cnpj(frmCadCli.DbeDoc.Text) then
         Erro :=Erro+'-CNPJ inválido'+Chr(13);
  if Erro='' then
     SalvarTrue:=True
  else
      SalvarTrue:=False;
end;

procedure TfrmCadCli.BtSairClick(Sender: TObject);
begin
  frmCadCli.Close;
end;

procedure TfrmCadCli.BtSalvarClick(Sender: TObject);
begin
  try
     if MessageDLG('Deseja realmente salvar' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
     begin
       if SalvarTrue then
       begin
            QrCadCli.ApplyUpdates;
            DataModule1.SQLTMaquina.CommitRetaining;
       end
       else
           MessageDLG(Erro, mtError,[mbOK],0);
     end;
  except

  end;
end;

procedure TfrmCadCli.CbTipoDocChange(Sender: TObject);
begin
    if frmCadCli.CbTipoDoc.Text='CPF' then
     frmCadCli.DbeDoc.EditMask:='999.999.999-99;0;_';
  if frmCadCli.CbTipoDoc.Text='CNPJ' then
     frmCadCli.DbeDoc.EditMask:='99.999.999/9999-99;0;_';
  frmCadCli.DbeDoc.Text:=QrCadCli.FieldByName('DOC').AsString;
end;

procedure TfrmCadCli.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  QrCadCli.Close;
  frmBuscaCli.QrBuscaCli.Close;
  frmBuscaCli.QrBuscaCli.Open;
end;

procedure TfrmCadCli.FormShow(Sender: TObject);
begin
  QrCadCli.ParamByName('IDCliente').Value := frmBuscaCli.QrBuscaCli.FieldByName('Cod_Cliente').Value;
  QrCadCli.Active := true;
  if frmBuscaCli.Opcao = 'Novo' then
  begin
       QrCadCli.Append;
       QrCadCli.FieldByName('Cod_Cliente').Value:= -1;
       EdtCodigo.Text := '';
       qrCadCli.FieldByName('Date_Reg').Value:=Date;
  end
  else
  begin
      QrCadCli.Edit;
      EdtCodigo.Text:= intTostr(QrCadCli.FieldByName('Cod_Cliente').Value);
  end;
   if frmCadCli.CbTipoDoc.Text='CPF' then
     frmCadCli.DbeDoc.EditMask:='999.999.999-99;0;_';
  if frmCadCli.CbTipoDoc.Text='CNPJ' then
     frmCadCli.DbeDoc.EditMask:='99.999.999/9999-99;0;_';
     frmCadCli.DbeDoc.Text:=QrCadCli.FieldByName('DOC').AsString;
end;



end.

