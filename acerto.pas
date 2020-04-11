unit Acerto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  ExtCtrls, StdCtrls, DBGrids;

type

  { TfrmAcerto }

  TfrmAcerto = class(TForm)
    DBNavigator1: TDBNavigator;
    dsGrid: TDataSource;
    DBGrid1: TDBGrid;
    dblCliente: TDBLookupComboBox;
    dsCliente: TDataSource;
    Edit1: TEdit;
    edtCodAcerto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qrCliente: TSQLQuery;
    qrClienteCOD_CLIENTE: TLongintField;
    qrClienteNOME: TStringField;
    qrClienteSTATUS: TStringField;
    qrGrid: TSQLQuery;
    qrGridCOD_ACERTO: TLongintField;
    qrGridCOD_CLI: TLongintField;
    qrGridCOD_DETACERTO: TLongintField;
    qrGridCREDITO: TFloatField;
    qrGridDATA: TDateField;
    qrGridDEBITO: TFloatField;
    qrGridHISTORICO: TStringField;
    qrGridSELECIONADO: TStringField;
    qrGridSTATUS: TStringField;
    Aberto: TRadioButton;
    Fechado: TRadioButton;
    Status: TRadioGroup;
    procedure dblClienteSelect(Sender: TObject);
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

procedure TfrmAcerto.dblClienteSelect(Sender: TObject);
begin
     qrGrid.Close;
     qrGrid.ParamByName('IDAcerto').Value:=0;
     qrGrid.ParamByName('IDCliente').Value:=dblCliente.KeyValue;
     qrGrid.Open;
end;

end.

