program Maquina;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Principal, BuscaCliente, Module1, CadCli, Funcoes, BuscaPro, CadPro,
  Romaneio, ImpRomaneio, CadLoteCoco, BuscaCadLoteCoco,
  MudaLote, Acerto, Compra, impAcerto;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmCompra, frmCompra);
  Application.CreateForm(TfrmImpAcerto, frmImpAcerto);
  Application.Run;
end.

