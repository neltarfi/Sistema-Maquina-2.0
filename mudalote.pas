unit MudaLote;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls, Grids, DBCtrls;

type

  { TfrmMudaLote }

  TfrmMudaLote = class(TForm)
    btSeleciona: TButton;
    btSalvar: TButton;
    btSair: TButton;
    dsLoteDestino: TDataSource;
    dsLoteOrigem: TDataSource;
    dsGridOrigem: TDataSource;
    DBGrid1: TDBGrid;
    dblOrigem: TDBLookupComboBox;
    dblDestino: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    qrDestinoCOD_ROMANEIO: TLongintField;
    qrDestinoLOTECOCO: TLongintField;
    qrGridOrigemCOD_ROMANEIO: TLongintField;
    qrGridOrigemDATA: TDateField;
    qrGridOrigemLOTECOCO: TLongintField;
    qrGridOrigemNOME: TStringField;
    qrLoteDestinoCOD_LOTE: TLongintField;
    qrLoteDestinoNOME: TStringField;
    qrLoteOrigem: TSQLQuery;
    qrLoteOrigemCOD_LOTE: TLongintField;
    qrLoteOrigemNOME: TStringField;
    qrGridOrigem: TSQLQuery;
    sgDestino: TStringGrid;
    qrLoteDestino: TSQLQuery;
    qrDestino: TSQLQuery;
    procedure btSairClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure btSelecionaClick(Sender: TObject);
    procedure dblDestinoSelect(Sender: TObject);
    procedure dblOrigemSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure LimpaGrid;
  private

  public

  end;

var
  frmMudaLote: TfrmMudaLote;
  Coluna, Linha:integer;

implementation
    uses Module1;
{$R *.lfm}

{ TfrmMudaLote }


procedure TfrmMudaLote.dblOrigemSelect(Sender: TObject);
begin
     qrGridOrigem.Close;
     qrGridOrigem.ParamByName('IDOrigem').Value:=dblOrigem.KeyValue;
     qrGridOrigem.Open;
     LimpaGrid;
end;

procedure TfrmMudaLote.btSelecionaClick(Sender: TObject);
var i:integer;
    SelecionaTrue:boolean;
begin
     SelecionaTrue:=True;
     for i:=1 to Linha do
        if qrGridOrigem.FieldByName('Cod_Romaneio').Text = sgDestino.Cells[2,i] then
           SelecionaTrue:=False;
     if (dblDestino.KeyValue < 1) or (dblOrigem.KeyValue = dblDestino.KeyValue) then
        SelecionaTrue:=False;
     if SelecionaTrue then
     Begin
          Linha:=Linha+1;
          sgDestino.Cells[1,Linha]:=qrGridOrigem.FieldByName('Data').Text;
          sgDestino.Cells[2,Linha]:=qrGridOrigem.FieldByName('Cod_Romaneio').Text;
          sgDestino.Cells[3,Linha]:=qrGridOrigem.FieldByName('Nome').Text;
     end;
end;

procedure TfrmMudaLote.btSairClick(Sender: TObject);
begin
     frmMudaLote.Close;
end;

procedure TfrmMudaLote.btSalvarClick(Sender: TObject);
var i:integer;
begin
     if linha > 0 then
     begin
         for i:=1 to Linha do
             begin
                  qrDestino.Close;
                  qrDestino.ParamByName('IDCodigo').Value:=strToint(sgDestino.Cells[2,i]);
                  qrDestino.Open;
                  qrDestino.Edit;
                  qrDestino.FieldByName('LoteCoco').Value:=dblDestino.KeyValue;
                  qrDestino.ApplyUpdates;
             end;
         DataModule1.SQLTMaquina.CommitRetaining;
         dblOrigem.KeyValue:=0;
         dblDestino.KeyValue:=0;
         LimpaGrid;
         qrGridOrigem.Close;
         qrGridOrigem.ParamByName('IDOrigem').Value:=0;
         qrGridOrigem.Open;
     end;
end;

procedure TfrmMudaLote.dblDestinoSelect(Sender: TObject);
begin
     LimpaGrid;
end;

procedure TfrmMudaLote.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
     qrLoteOrigem.Close;
     qrGridOrigem.Close;
     qrDestino.Close;
end;

procedure TfrmMudaLote.FormShow(Sender: TObject);
begin
     qrLoteOrigem.Open;
     qrGridOrigem.Open;
     LimpaGrid;
end;
procedure TfrmMudaLote.LimpaGrid;
var i,j:integer;
begin
     if Linha>0 then
     for i:=1 to Linha do
         for j:=1 to Coluna do
         sgDestino.Cells[j,i]:='';
     Coluna:=3;
     Linha:=0;
end;

end.

