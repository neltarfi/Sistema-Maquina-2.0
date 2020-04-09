unit Acerto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls;

type

  { TfrmAcerto }

  TfrmAcerto = class(TForm)
    dblCliente: TDBLookupComboBox;
    dsCliente: TDataSource;
    qrCliente: TSQLQuery;
    qrClienteCOD_CLIENTE: TLongintField;
    qrClienteNOME: TStringField;
    qrClienteSTATUS: TStringField;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmAcerto: TfrmAcerto;

implementation

{$R *.lfm}

{ TfrmAcerto }

procedure TfrmAcerto.FormShow(Sender: TObject);
begin
     qrCliente.Open;
end;

procedure TfrmAcerto.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     qrCliente.Close;
end;

end.

