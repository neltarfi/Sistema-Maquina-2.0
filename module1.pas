unit Module1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb, db;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    IBCMaquina: TIBConnection;
    qrImpRomaneioBEBERCOCO: TLongintField;
    qrImpRomaneioBEBERLIMPO: TFloatField;
    qrImpRomaneioCANCELADO: TStringField;
    qrImpRomaneioCOD_CLI: TLongintField;
    qrImpRomaneioCOD_COMPRA: TLongintField;
    qrImpRomaneioCOD_DEPOSITADO: TLongintField;
    qrImpRomaneioCOD_PRO: TLongintField;
    qrImpRomaneioCOD_ROMANEIO: TLongintField;
    qrImpRomaneioDATA: TDateField;
    qrImpRomaneioDESCONTO1: TLongintField;
    qrImpRomaneioDESCONTO2: TLongintField;
    qrImpRomaneioIMPUREZA: TLongintField;
    qrImpRomaneioLEGENDA1: TStringField;
    qrImpRomaneioLEGENDA2: TStringField;
    qrImpRomaneioLOTECOCO: TLongintField;
    qrImpRomaneioOBS: TStringField;
    qrImpRomaneioPESOBRUTO: TLongintField;
    qrImpRomaneioPESOJUTA: TBCDField;
    qrImpRomaneioPESOPLASTICO: TBCDField;
    qrImpRomaneioPORCENTAGEM: TLongintField;
    qrImpRomaneioQUANJUTA: TLongintField;
    qrImpRomaneioQUANPLASTICO: TLongintField;
    qrImpRomaneioRENDA: TLongintField;
    qrImpRomaneioTOTALROMANEIO: TLongintField;
    SQLTMaquina: TSQLTransaction;
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

