unit CadLoteCoco;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls;

type

  { TfrmCadLoteCoco }

  TfrmCadLoteCoco = class(TForm)
    btSalvar: TButton;
    btSair: TButton;
    dsLoteCoco: TDataSource;
    dbeNome: TDBEdit;
    dbeSafra: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeObs: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qrAuxLoteCocoCOD_LOTE: TLongintField;
    qrLoteCoco: TSQLQuery;
    qrLoteCocoCOD_LOTE: TLongintField;
    qrLoteCocoCOMPLEMENTO: TStringField;
    qrLoteCocoNOME: TStringField;
    qrLoteCocoOBS: TStringField;
    qrLoteCocoSAFRA: TStringField;
    qrLoteCocoSTATUS: TStringField;
    qrAuxLoteCoco: TSQLQuery;
    procedure btSairClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    function SalvarTrue:boolean;
  private

  public

  end;

var
  frmCadLoteCoco: TfrmCadLoteCoco;
  Erro:string;

implementation
 uses BuscaCadLoteCoco, Module1;
{$R *.lfm}

 { TfrmCadLoteCoco }

 procedure TfrmCadLoteCoco.FormShow(Sender: TObject);
 begin
   qrLoteCoco.Open;
   qrAuxLoteCoco.Open;
   btSalvar.Enabled:=True;
   if frmBuscaCadLoteCoco.Opcao = 'Novo' then
   begin
        qrLoteCoco.Append;
        qrLoteCoco.FieldByName('Cod_Lote').Value:=-1;
        qrLoteCoco.FieldByName('status').Text:='Aberto';
        qrLoteCoco.FieldByName('Nome').Text:= inttostr(qrAuxLoteCoco.RecordCount+1);
   end
   else
   begin
        qrLoteCoco.Close;
        qrLoteCoco.ParamByName('IDCodigo').Value:= frmBuscaCadLoteCoco.qrLoteCoco.FieldByName('Cod_Lote').Value;
        qrLoteCoco.Open;
        qrLoteCoco.Edit;

   end;
 end;

procedure TfrmCadLoteCoco.btSairClick(Sender: TObject);
begin
  frmCadLoteCoco.Close;
end;

procedure TfrmCadLoteCoco.btSalvarClick(Sender: TObject);
begin
     if MessageDLG('Deseja realmente salvar' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
     begin
       if SalvarTrue then
       begin
            if frmBuscaCadLoteCoco.Opcao='Novo' then
               qrLoteCoco.FieldByName('Nome').Text:= inttostr(qrAuxLoteCoco.RecordCount+1)+' '+ qrLoteCoco.FieldByName('Safra').Text +' '+ dbeComplemento.Text
            else
               qrLoteCoco.FieldByName('Nome').Text:= qrLoteCoco.FieldByName('Cod_Lote').Text+' '+ qrLoteCoco.FieldByName('Safra').Text +' '+ dbeComplemento.Text ;
            qrLoteCoco.ApplyUpdates;
            DataModule1.SQLTMaquina.CommitRetaining;

       end
       else
           MessageDLG(Erro, mtError,[mbOK],0);
     end;
     frmBuscaCadLoteCoco.qrLoteCoco.Close;
     frmBuscaCadLoteCoco.qrLoteCoco.Open;
     frmBuscaCadLoteCoco.qrLoteCoco.Last;
     btSalvar.Enabled:=False;
end;

procedure TfrmCadLoteCoco.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     qrLoteCoco.Close;
     qrAuxLoteCoco.Close;
end;

function TfrmCadLoteCoco.SalvarTrue:boolean;
begin
     Erro:='';
     if dbeSafra.Text = '' then Erro:=Erro+'-O Campo Safra Não pode ficar vazio'+chr(13);
     if (dbeComplemento.Text = '') or (length(dbeComplemento.Text)>20) then
        Erro:=Erro+'-O Campo Complemento não pode ficar vazio e nem passar de 20 caracteres'+chr(13);
     if length(dbeOBS.Text)>100 then Erro:=Erro+'O Campo Obs não pode ultrapassar 100 caracteres'+chr(13);
     if Erro = '' then SalvarTrue:= True
     else SalvarTrue:=False
end;

end.

