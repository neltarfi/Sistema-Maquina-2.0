unit Principal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastro: TMenuItem;
    Clientes: TMenuItem;
    mnuLoteCoco: TMenuItem;
    mnSair: TMenuItem;
    procedure ClientesClick(Sender: TObject);
    procedure mnSairClick(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal; Erro:string;

implementation

uses
  BuscaCliente;
{$R *.lfm}

{ TfrmPrincipal }


procedure TfrmPrincipal.ClientesClick(Sender: TObject);
begin
     frmBuscaCli.ShowModal;
end;

procedure TfrmPrincipal.mnSairClick(Sender: TObject);
begin
  Close;
end;

end.

