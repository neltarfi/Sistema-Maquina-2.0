unit Compra;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, DBGrids, DBCtrls;

type

  { TfrmCompra }

  TfrmCompra = class(TForm)
    DBGrid1: TDBGrid;
    DBLookupComboBox1: TDBLookupComboBox;
  private

  public

  end;

var
  frmCompra: TfrmCompra;

implementation

{$R *.lfm}

end.

