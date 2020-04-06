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
    smnRomaneio: TMenuItem;
    mnLacamento: TMenuItem;
    mnuLoteCoco: TMenuItem;
    mnSair: TMenuItem;
    procedure ClientesClick(Sender: TObject);
    procedure mnuLoteCocoClick(Sender: TObject);
    procedure smnRomaneioClick(Sender: TObject);
    procedure mnSairClick(Sender: TObject);
  private

  public

  end;

var
  frmPrincipal: TfrmPrincipal; Erro:string;

implementation

uses
  BuscaCliente, Romaneio, BuscaCadLoteCoco;
{$R *.lfm}

{ TfrmPrincipal }


procedure TfrmPrincipal.ClientesClick(Sender: TObject);
begin
  frmBuscaCli:= TfrmBuscaCli.Create(Application);
  frmBuscaCli.ShowModal;
end;

procedure TfrmPrincipal.mnuLoteCocoClick(Sender: TObject);
begin
    frmBuscaCadLoteCoco:=TfrmBuscaCadLoteCoco.Create(Application);
    frmBuscaCadLoteCoco.ShowModal;
end;

procedure TfrmPrincipal.smnRomaneioClick(Sender: TObject);
begin
    frmRomaneio:= TfrmRomaneio.Create(Application);
   frmRomaneio.ShowModal;
end;

procedure TfrmPrincipal.mnSairClick(Sender: TObject);
begin
  Close;
end;

end.

