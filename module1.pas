unit Module1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, IBConnection, sqldb;

type

  { TDataModule1 }

  TDataModule1 = class(TDataModule)
    IBCMaquina: TIBConnection;
    SQLTMaquina: TSQLTransaction;
  private

  public

  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.lfm}

end.

