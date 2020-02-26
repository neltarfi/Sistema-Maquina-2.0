program Maquina;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Principal, BuscaCliente, Module1, CadCli, Funcoes, BuscaPro, CadPro;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmBuscaCli, frmBuscaCli);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmCadCli, frmCadCli);
  Application.CreateForm(TfrmBuscaPro, frmBuscaPro);
  Application.CreateForm(TfrmCadPro, frmCadPro);
  Application.Run;
end.

