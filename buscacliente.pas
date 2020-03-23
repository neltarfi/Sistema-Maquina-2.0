unit BuscaCliente;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, IBConnection, db, Forms, Controls, Graphics,
  Dialogs, DBGrids, StdCtrls;

type

  { TfrmBuscaCli }

  TfrmBuscaCli = class(TForm)
    btNovo: TButton;
    btEditar: TButton;
    btPropriedade: TButton;
    btSair: TButton;
    DSBuscaCli: TDataSource;
    DBGBuscaCli: TDBGrid;
    edtBuscaCli: TEdit;
    Label1: TLabel;
    QrBuscaCli: TSQLQuery;
    QrBuscaCliCIDADE: TStringField;
    QrBuscaCliCOD_CLIENTE: TLongintField;
    QrBuscaCliNOME: TStringField;
    procedure btEditarClick(Sender: TObject);
    procedure btNovoClick(Sender: TObject);
    procedure btPropriedadeClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure edtBuscaCliChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public
    var Opcao: string;
  end;

var
  frmBuscaCli: TfrmBuscaCli;

implementation
uses
  CadCli, BuscaPro;

{$R *.lfm}

{ TfrmBuscaCli }

procedure TfrmBuscaCli.FormShow(Sender: TObject);
begin
   QrBuscaCli.Close;
   QrBuscaCli.ParamByName('idCliente').AsString:='%';
   QrBuscaCli.Active:= true;
end;

procedure TfrmBuscaCli.edtBuscaCliChange(Sender: TObject);
begin
     QrBuscaCli.Active:=False;
     QrBuscaCli.ParamByName('IDCliente').AsString := '%' + edtBuscaCli.Text + '%';
     QrBuscaCli.Active:= True;
end;

procedure TfrmBuscaCli.FormClose(Sender: TObject; var CloseAction: TCloseAction
  );
begin
  QrBuscaCli.Close;
end;

procedure TfrmBuscaCli.btSairClick(Sender: TObject);
begin
  frmBuscaCli.Close;
end;

procedure TfrmBuscaCli.btNovoClick(Sender: TObject);
begin
  Opcao := 'Novo';
  frmCadCli:= TfrmCadCli.Create(Application);
  frmCadCli.ShowModal;
end;

procedure TfrmBuscaCli.btPropriedadeClick(Sender: TObject);
begin
    frmBuscaPro:= TfrmBuscaPro.Create(Application);
   frmBuscaPro.ShowModal;
end;

procedure TfrmBuscaCli.btEditarClick(Sender: TObject);
begin
   Opcao := 'Editar';
    frmCadCli:= TfrmCadCli.Create(Application);
   frmCadCli.ShowModal;
end;

end.

