unit Acerto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  ExtCtrls, StdCtrls, DBGrids, DBExtCtrls;

type

  { TfrmAcerto }

  TfrmAcerto = class(TForm)
    Button1: TButton;
    dbdData: TDBDateEdit;
    dsSaldo: TDataSource;
    dbeSaldo: TDBEdit;
    dsAcerto: TDataSource;
    DBNavigator1: TDBNavigator;
    dsGrid: TDataSource;
    DBGrid1: TDBGrid;
    dblCliente: TDBLookupComboBox;
    dsCliente: TDataSource;
    Edit1: TEdit;
    edtCredito: TEdit;
    edtDebito: TEdit;
    edtHistorico: TEdit;
    edtCodAcerto: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    qrAcertoCOD_ACERTO: TLongintField;
    qrAcertoSTATUS: TStringField;
    qrCliente: TSQLQuery;
    qrClienteCOD_CLIENTE: TLongintField;
    qrClienteNOME: TStringField;
    qrClienteSTATUS: TStringField;
    qrGrid: TSQLQuery;
    qrGridCOD_ACERTO: TLongintField;
    qrGridCOD_CLI: TLongintField;
    qrGridCOD_DETACERTO: TLongintField;
    qrGridCREDITO: TBCDField;
    qrGridDATA: TDateField;
    qrGridDEBITO: TBCDField;
    qrGridHISTORICO: TStringField;
    qrGridSELECIONADO: TStringField;
    qrGridSTATUS: TStringField;
    qrAcerto: TSQLQuery;
    qrSaldo: TSQLQuery;
    Status: TRadioGroup;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dblClienteSelect(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure StatusClick(Sender: TObject);
    procedure QuerySaldoAberto;
    procedure QuerySaldoFechado;
  private

  public

  end;

var
  frmAcerto: TfrmAcerto;

implementation
  uses Module1;
{$R *.lfm}

{ TfrmAcerto }

procedure TfrmAcerto.FormShow(Sender: TObject);
begin
     qrCliente.Open;
end;

procedure TfrmAcerto.Panel4Click(Sender: TObject);
begin

end;

procedure TfrmAcerto.StatusClick(Sender: TObject);
begin
     if Status.ItemIndex=0 then
     begin
          QuerySaldoAberto;

          qrGrid.Close;
          qrGrid.ParamByName('IDAcerto1').Value:=0;
          qrGrid.ParamByName('IDAcerto2').Value:=0;
          qrGrid.ParamByName('IDCliente1').Value:=dblCliente.KeyValue;
          qrGrid.ParamByName('IDCliente2').Value:=dblCliente.KeyValue;
          qrGrid.Open;
     end
     else
     begin
          QuerySaldoFechado;

          dblCliente.KeyValue:=0;
          qrGrid.Close;
          qrGrid.ParamByName('IDAcerto1').Value:=qrAcerto.FieldByName('Cod_Acerto').value;
          qrGrid.ParamByName('IDAcerto2').Value:=qrAcerto.FieldByName('Cod_Acerto').value;
          qrGrid.ParamByName('IDCliente1').Value:=1;
          qrGrid.ParamByName('IDCliente2').Value:=qrAcerto.RecordCount;
          qrGrid.Open;
     end;

end;

procedure TfrmAcerto.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     qrCliente.Close;
end;

procedure TfrmAcerto.dblClienteSelect(Sender: TObject);
begin
     if Status.ItemIndex=0 then
     begin
          QuerySaldoAberto;

          qrGrid.Close;
          qrGrid.ParamByName('IDAcerto1').Value:=0;
          qrGrid.ParamByName('IDAcerto2').Value:=0;
          qrGrid.ParamByName('IDCliente1').Value:=dblCliente.KeyValue;
          qrGrid.ParamByName('IDCliente2').Value:=dblCliente.KeyValue;
          qrGrid.Open;
     end
     else
     begin
          QuerySaldoFechado;

          dblCliente.KeyValue:=0;
          qrGrid.Close;
          qrGrid.ParamByName('IDAcerto1').Value:=qrAcerto.FieldByName('Cod_Acerto').value;
          qrGrid.ParamByName('IDAcerto2').Value:=qrAcerto.FieldByName('Cod_Acerto').value;
          qrGrid.ParamByName('IDCliente1').Value:=1;
          qrGrid.ParamByName('IDCliente2').Value:=qrAcerto.RecordCount;
          qrGrid.Open;
     end;
end;

procedure TfrmAcerto.DBGrid1DblClick(Sender: TObject);
begin
     if Status.ItemIndex = 0 then
     begin
          qrGrid.Edit;
          if qrGrid.FieldByName('Selecionado').AsString ='' then
             qrGrid.FieldByName('Selecionado').AsString:='X'
          else
              qrGrid.FieldByName('Selecionado').AsString:='';
          qrGrid.ApplyUpdates;
          DataModule1.SQLTMaquina.CommitRetaining;
          qrSaldo.Close;
          qrSaldo.Open;
     end;
end;

procedure TfrmAcerto.QuerySaldoAberto;
begin
    qrSaldo.Close;
    qrSaldo.SQL.Clear;
    qrSaldo.SQL.Add('select (sum(da.Credito) - sum(da.Debito)) as Saldo,');
    qrSaldo.SQL.Add('da.Cod_Acerto,');
    qrSaldo.SQL.Add('da.Cod_Cli,');
    qrSaldo.SQL.Add('da.Status,');
    qrSaldo.SQL.Add('da.Selecionado');
    qrSaldo.SQL.Add('from DetAcerto da');
    qrSaldo.SQL.Add('group by da.Cod_Cli, da.Cod_Acerto, da.Selecionado, da.Status');
    qrSaldo.SQL.Add('having  (da.Cod_Acerto = :IDAcerto) and (da.Cod_Cli = :IDCliente) and (da.Selecionado=''X'') and (da.Status <> ''Cancelado'')');
    qrSaldo.ParamByName('IDACerto').Value:=0;
    qrSaldo.ParamByName('IDCliente').Value:=dblCliente.KeyValue;
    qrSaldo.Open;
end;

procedure TfrmAcerto.QuerySaldoFechado;
begin
    qrSaldo.Close;
    qrSaldo.SQL.Clear;
    qrSaldo.SQL.Add('select (sum(da.Credito) - sum(da.Debito)) as Saldo,');
    qrSaldo.SQL.Add('da.Cod_Acerto,');
    qrSaldo.SQL.Add('da.Selecionado,');
    qrSaldo.SQL.Add('da.Status');
    qrSaldo.SQL.Add('from DetAcerto da');
    qrSaldo.SQL.Add('group by da.Cod_Acerto, da.Selecionado,da.Status');
    qrSaldo.SQL.Add('having  (da.Cod_Acerto = :IDAcerto) and (da.Selecionado=''X'') and (da.Status <> ''Cancelado'')');
    qrSaldo.ParamByName('IDACerto').Value:=qrAcerto.FieldByName('Cod_Acerto').Value;
    qrSaldo.Open;
end;

end.

