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
    dsLoteDestino: TDataSource;
    dsLoteOrigem: TDataSource;
    dsGridOrigem: TDataSource;
    DBGrid1: TDBGrid;
    dblOrigem: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
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
    procedure btSelecionaClick(Sender: TObject);
    procedure DBLookupComboBox2Select(Sender: TObject);
    procedure dblOrigemSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmMudaLote: TfrmMudaLote;
  Coluna, Linha:integer;

implementation

{$R *.lfm}

{ TfrmMudaLote }


procedure TfrmMudaLote.dblOrigemSelect(Sender: TObject);
Var i,j:integer;
begin
     qrGridOrigem.Close;
     qrGridOrigem.ParamByName('IDOrigem').Value:=dblOrigem.KeyValue;
     qrGridOrigem.Open;
     if Linha>0 then
     for i:=Linha to 3 do
         for j:=Coluna to Linha do
         sgDestino.Cells[j,i]:='';
     Coluna:=1;
     Linha:=1;
end;

procedure TfrmMudaLote.btSelecionaClick(Sender: TObject);
begin
     sgDestino.Cells[1,Linha]:=qrGridOrigem.FieldByName('Data').Text;
     sgDestino.Cells[2,Linha]:=qrGridOrigem.FieldByName('Cod_Romaneio').Text;
     sgDestino.Cells[3,Linha]:=qrGridOrigem.FieldByName('Nome').Text;
     Linha:=Linha+1;
end;

procedure TfrmMudaLote.DBLookupComboBox2Select(Sender: TObject);
var i,j:integer;
begin
     if Linha>0 then
     for i:=Linha to 3 do
         for j:=Coluna to Linha do
         sgDestino.Cells[j,i]:='';
     Coluna:=1;
     Linha:=1;
end;

procedure TfrmMudaLote.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
     qrLoteOrigem.Close;
     qrGridOrigem.Close;
end;

procedure TfrmMudaLote.FormShow(Sender: TObject);
begin
     qrLoteOrigem.Open;
     qrGridOrigem.Open;
     Coluna:=0;
     Linha:=0;
end;

end.

