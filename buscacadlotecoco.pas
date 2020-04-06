unit BuscaCadLoteCoco;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBGrids,
  StdCtrls;

type

  { TfrmBuscaCadLoteCoco }

  TfrmBuscaCadLoteCoco = class(TForm)
    btNovo: TButton;
    btEditar: TButton;
    btSair: TButton;
    dsLoteCoco: TDataSource;
    dbgLote: TDBGrid;
    qrLoteCoco: TSQLQuery;
    qrLoteCocoCOD_LOTE: TLongintField;
    qrLoteCocoNOME: TStringField;
    qrLoteCocoSTATUS: TStringField;
    procedure btEditarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
       var Opcao:string
  end;

var
  frmBuscaCadLoteCoco: TfrmBuscaCadLoteCoco;

implementation
  uses CadLoteCoco;
{$R *.lfm}

{ TfrmBuscaCadLoteCoco }

procedure TfrmBuscaCadLoteCoco.btSairClick(Sender: TObject);
begin
  frmBuscaCadLoteCoco.Close;
end;

procedure TfrmBuscaCadLoteCoco.FormClose(Sender: TObject;
  var CloseAction: TCloseAction);
begin
     qrLoteCoco.Close;
end;

procedure TfrmBuscaCadLoteCoco.FormShow(Sender: TObject);
begin
     qrLoteCoco.Open;
end;

procedure TfrmBuscaCadLoteCoco.btNovoClick(Sender: TObject);
begin
     Opcao:='Novo';
     frmCadLoteCoco:=TfrmCadLoteCoco.Create(Self);
     frmCadLoteCoco.ShowModal;
end;

procedure TfrmBuscaCadLoteCoco.btEditarClick(Sender: TObject);
begin
     Opcao:='Editar';
     frmCadLoteCoco:=TfrmCadLoteCoco.Create(Self);
     frmCadLoteCoco.ShowModal;
end;

end.

