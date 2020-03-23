unit BuscaPro;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  StdCtrls, DBGrids;

type

  { TfrmBuscaPro }

  TfrmBuscaPro = class(TForm)
    BtNovo: TButton;
    BtEditar: TButton;
    BtSair: TButton;
    DbeNomeCli: TDBEdit;
    DbgBuscaPro: TDBGrid;
    DsBuscaPro: TDataSource;
    Label1: TLabel;
    QrBuscaPro: TSQLQuery;
    QrBuscaProCIDADE: TStringField;
    QrBuscaProCOD_CLI: TLongintField;
    QrBuscaProCOD_PRO: TLongintField;
    QrBuscaProNOME: TStringField;
    procedure BtEditarClick(Sender: TObject);
    procedure BtNovoClick(Sender: TObject);
    procedure BtSairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public
     var Opcao: string;
  end;

var
  frmBuscaPro: TfrmBuscaPro;

implementation
  uses BuscaCliente, CadPro;
{$R *.lfm}

{ TfrmBuscaPro }

procedure TfrmBuscaPro.FormShow(Sender: TObject);
begin
  frmBuscaPro.QrBuscaPro.Close;
  QrBuscaPro.ParamByName('IDCliente').Value:= frmBuscaCli.QrBuscaCli.FieldByName('Cod_Cliente').Value;
  frmBuscaPro.QrBuscaPro.Open;
end;

procedure TfrmBuscaPro.BtNovoClick(Sender: TObject);
begin
  Opcao:='Novo';
   frmCadPro:= TfrmCadPro.Create(Application);
  frmCadPro.ShowModal;
end;

procedure TfrmBuscaPro.BtSairClick(Sender: TObject);
begin
  frmBuscaPro.Close;
end;

procedure TfrmBuscaPro.BtEditarClick(Sender: TObject);
begin
  Opcao:='Editar';
  frmCadPro:= TfrmCadPro.Create(Application);
  frmCadPro.ShowModal;
end;

end.

