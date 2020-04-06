unit CadLoteCoco;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DBCtrls;

type

  { TfrmCadLoteCoco }

  TfrmCadLoteCoco = class(TForm)
    dsLoteCoco: TDataSource;
    dbeNome: TDBEdit;
    dbeSafra: TDBEdit;
    dbeComplemento: TDBEdit;
    dbeObs: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    qrLoteCoco: TSQLQuery;
    qrLoteCocoCOD_LOTE: TLongintField;
    qrLoteCocoCOMPLEMENTO: TStringField;
    qrLoteCocoNOME: TStringField;
    qrLoteCocoOBS: TStringField;
    qrLoteCocoSAFRA: TStringField;
    qrLoteCocoSTATUS: TStringField;
  private

  public

  end;

var
  frmCadLoteCoco: TfrmCadLoteCoco;

implementation

{$R *.lfm}

{ TfrmCadLoteCoco }


end.

