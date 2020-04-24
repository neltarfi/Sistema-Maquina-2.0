unit Acerto;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqldb, db, Forms, Controls, Graphics, Dialogs, DBCtrls,
  ExtCtrls, StdCtrls, DBGrids, DBExtCtrls;

type

  { TfrmAcerto }

  TfrmAcerto = class(TForm)
    btCancelaLan: TButton;
    btSalvaLan: TButton;
    btNovoLan: TButton;
    btEditaLan: TButton;
    btExcluiLan: TButton;
    btNovoAcerto: TButton;
    btFechaAcerto: TButton;
    btSair: TButton;
    btExcluiAcerto: TButton;
    btImprimir: TButton;
    dsFiltroAcerto: TDataSource;
    dbdData: TDBDateEdit;
    dbeDebito: TDBEdit;
    dbeCredito: TDBEdit;
    dbeCodAcerto: TDBEdit;
    dbeNomeCli: TDBEdit;
    dbeHistorico: TDBEdit;
    dsSaldo: TDataSource;
    dbeSaldo: TDBEdit;
    dsAcerto: TDataSource;
    DBNavigator1: TDBNavigator;
    dsGrid: TDataSource;
    DBGrid1: TDBGrid;
    dblCliente: TDBLookupComboBox;
    dsCliente: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    lCancelado: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pLansamento: TPanel;
    qrAcertoCANCELADO: TStringField;
    qrAcertoCOD_ACERTO: TLongintField;
    qrAcertoFECHADO: TStringField;
    qrAuxClienteCOD_CLIENTE: TLongintField;
    qrCliente: TSQLQuery;
    qrClienteCOD_CLIENTE: TLongintField;
    qrClienteNOME: TStringField;
    qrFiltroAcertoCOD_ACERTO: TLongintField;
    qrFiltroAcertoCOD_CLI: TLongintField;
    qrFiltroAcertoNOME: TStringField;
    qrGrid: TSQLQuery;
    qrGridCANCELADO: TStringField;
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
    qrAuxCliente: TSQLQuery;
    qrFiltroAcerto: TSQLQuery;
    Status: TRadioGroup;
    procedure btCancelaLanClick(Sender: TObject);
    procedure btEditaLanClick(Sender: TObject);
    procedure btExcluiAcertoClick(Sender: TObject);
    procedure btExcluiLanClick(Sender: TObject);
    procedure btFechaAcertoClick(Sender: TObject);
    procedure btImprimirClick(Sender: TObject);
    procedure btNovoAcertoClick(Sender: TObject);
    procedure btNovoLanClick(Sender: TObject);
    procedure btSairClick(Sender: TObject);
    procedure btSalvaLanClick(Sender: TObject);
    procedure dbeCreditoExit(Sender: TObject);
    procedure dbeDebitoExit(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure dblClienteSelect(Sender: TObject);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure StatusClick(Sender: TObject);
    procedure QuerySaldoAberto;
    procedure QuerySaldoFechado;
    procedure QueryClienteAberto;
    function SalvarTrue:boolean;
    procedure AtualizaGrid;
    procedure DesabilitaControles;
    procedure AbilitaControles;
  private

  public

  end;

var
  frmAcerto: TfrmAcerto;
  Erro:string;

implementation
  uses Module1, ImpAcerto;
{$R *.lfm}

{ TfrmAcerto }

procedure TfrmAcerto.FormShow(Sender: TObject);
begin
     qrCliente.Open;
     qrGrid.Open;
     qrAcerto.Open;
     qrAuxCliente.Open;
     qrFiltroAcerto.Open;
end;


procedure TfrmAcerto.StatusClick(Sender: TObject);
begin
    dblCliente.Clear;
    lCancelado.Caption:='';
    if Status.ItemIndex=0 then
     begin
          QuerySaldoAberto;
          QueryClienteAberto;
          btNovoAcerto.Enabled:=True;
          btExcluiAcerto.Enabled:=False;
          btImprimir.Enabled:=False;
          if qrCliente.RecordCount>0 then btFechaAcerto.Enabled:=True;
          qrFiltroAcerto.Close;

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
          pLansamento.Enabled:=False;
          btNovoAcerto.Enabled:=False;
          btFechaAcerto.Enabled:=False;
          if qrCliente.RecordCount>0 then btExcluiAcerto.Enabled:=True;
          dblCliente.KeyValue:=0;
          qrCliente.Close;
          qrCliente.SQL.Clear;
          qrCliente.SQL.Add('Select ');
          qrCliente.SQL.Add('c.Nome,');
          qrCliente.SQL.Add('c.Cod_Cliente,');
          qrCliente.SQL.Add('a.Fechado');
          qrCliente.SQL.Add('from DetAcerto da');
          qrCliente.SQL.Add('inner join Clientes c on c.Cod_Cliente=da.Cod_Cli');
          qrCliente.SQL.Add('inner join Acerto a on a.Cod_Acerto = da.Cod_Acerto');
          qrCliente.SQL.Add('Group by c.Nome, c.Cod_Cliente, a.Fechado');
          qrCliente.SQL.Add('having (a.Fechado =''True'')' );
          qrCliente.Open;

          qrFiltroAcerto.Close;
          qrFiltroAcerto.ParamByName('IDCliente1').Value:=1;
          qrFiltroAcerto.ParamByName('IDCliente2').Value:=qrAuxCliente.RecordCount;
          qrFiltroAcerto.Open;
          qrFiltroAcerto.Last;

          AtualizaGrid;
          qrAcerto.Filtered:=False;
          qrAcerto.Filter:='Cod_Acerto='+dbeCodAcerto.Text;
          qrAcerto.Filtered:=True;
          if (qrAcerto.FieldByName('Cancelado').AsString = 'True') then
          Begin
               lCancelado.Caption:='Cancelado';
               btExcluiAcerto.Enabled:=False;
               btImprimir.Enabled:=False;
          end
         else
         begin
              lCancelado.Caption:='';
              btExcluiAcerto.Enabled:=True;
              btImprimir.Enabled:=True;
         end;
         qrAcerto.Filtered:=False;
     end;

end;

procedure TfrmAcerto.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
     qrCliente.Close;
     qrGrid.Close;
     qrAcerto.Close;
     qrAuxCliente.Close;
     qrFiltroAcerto.Close;
end;

procedure TfrmAcerto.dblClienteSelect(Sender: TObject);
begin
     if Status.ItemIndex=0 then
     begin
          QuerySaldoAberto;
          pLansamento.Enabled:=true;
          btFechaAcerto.Enabled:=True;
          pLansamento.Enabled:=True;
          DesabilitaControles;

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
          pLansamento.Enabled:=False;

          qrFiltroAcerto.Close;
          qrFiltroAcerto.ParamByName('IDCliente1').Value:=dblCliente.KeyValue;
          qrFiltroAcerto.ParamByName('IDCliente2').Value:=dblCliente.KeyValue;
          qrFiltroAcerto.Open;

          AtualizaGrid;
     end;
end;

procedure TfrmAcerto.DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType
  );
begin
    AtualizaGrid;
    qrAcerto.Filtered:=False;
    qrAcerto.Filter:='Cod_Acerto='+dbeCodAcerto.Text;
    qrAcerto.Filtered:=True;
    if (qrAcerto.FieldByName('Cancelado').AsString = 'True') then
    begin
         lCancelado.Caption:='Cancelado';
         btExcluiAcerto.Enabled:=False;
         btImprimir.Enabled:=False;
    end
    else
    begin
         lCancelado.Caption:='';
         btExcluiAcerto.Enabled:=True;
         btImprimir.Enabled:=True;
    end;
    qrAcerto.Filtered:=False;

end;

procedure TfrmAcerto.DBGrid1DblClick(Sender: TObject);
begin
     if Status.ItemIndex = 0 then
     begin
          qrGrid.Edit;
          if qrGrid.FieldByName('Selecionado').AsString ='' then
             qrGrid.FieldByName('Selecionado').AsString:='XX'
          else
              qrGrid.FieldByName('Selecionado').AsString:='';
          qrGrid.ApplyUpdates;
          DataModule1.SQLTMaquina.CommitRetaining;
          qrSaldo.Close;
          qrSaldo.Open;
     end;
end;

procedure TfrmAcerto.btCancelaLanClick(Sender: TObject);
begin
    qrGrid.Close;
    qrGrid.Open;
    qrSaldo.Close;
    qrSaldo.Open;
    btNovoLan.Enabled:=True;
    if btNovoAcerto.Enabled=True then
    begin
         btEditalan.Enabled:=True;
         btExcluiLan.Enabled:=True;
    end;
    btSalvaLan.Enabled:=False;
    DesabilitaControles;
end;

procedure TfrmAcerto.btEditaLanClick(Sender: TObject);
begin
     qrGrid.Edit;
     btNovoLan.Enabled:=False;
     btSalvaLan.Enabled:=True;
     btExcluiLan.Enabled:=False;
     AbilitaControles;
end;

procedure TfrmAcerto.btExcluiAcertoClick(Sender: TObject);
begin
    if MessageDLG('Deseja realmente Excluir esse Acerto?' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
    begin
         qrAcerto.Filtered:=False;
         qrAcerto.Filter:='Cod_Acerto='+dbeCodAcerto.Text;
         qrAcerto.Filtered:=True;
         if not((qrAcerto.FieldByName('Cancelado').AsString)='True') then
         begin
              qrGrid.Filtered:=False;
              qrGrid.Filter:='Cod_Acerto='+dbeCodAcerto.Text;
              qrGrid.Filtered:=True;
              qrGrid.FindFirst;
              while not qrGrid.EOF do
              begin
                   qrGrid.Edit;
                   qrGrid.FieldByName('Cod_Acerto').Value:=0;
                   qrGrid.ApplyUpdates;
                   qrGrid.FindNext;
              end;

              qrAcerto.Edit;
              qrAcerto.FieldByName('Cancelado').AsString:='True';
              qrAcerto.ApplyUpdates;
              DataModule1.SQLTMaquina.CommitRetaining;
              lCancelado.Caption:='Cancelado';
              qrGrid.Append;
              qrGrid.FieldByName('Cod_DetAcerto').Value:=-1;
              qrGrid.FieldByName('Cod_Acerto').Value:=strToint(dbeCodAcerto.text);
              qrGrid.FieldByName('Cod_Cli').Value:=qrFiltroAcerto.FieldByName('Cod_Cli').Value;
              qrGrid.FieldByName('Historico').AsString:='Cancelado';
              qrGrid.FieldByName('Credito').Value:=0;
              qrGrid.FieldByName('Debito').Value:=0;
              qrGrid.FieldByName('Status').AsString:='Excluido';
              qrGrid.FieldByName('Cancelado').AsString:='False';
              qrGrid.ApplyUpdates;
              DataModule1.SQLTMaquina.CommitRetaining;
              qrGrid.Filtered:=False;
              qrAcerto.Filtered:=False;
              qrGrid.Close;
              qrGrid.Open;
              qrAcerto.Close;
              qrAcerto.Open;
              btExcluiAcerto.Enabled:=False;
              btImprimir.Enabled:=False;
         end
         else MessageDLG('Esse Acerto ja está Excluido', mtError,[mbOK],0);

    end;
end;

procedure TfrmAcerto.btExcluiLanClick(Sender: TObject);
begin
     if MessageDLG('Deseja realmente Excluir esse registro?' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
     begin
          if qrGrid.FieldByName('Status').AsString='Bloqueado' then
             MessageDLG('Esse registro está bloqueado', mtError,[mbOK],0)
          else
          begin
               qrGrid.Edit;
               qrGrid.FieldByName('Cancelado').AsString:='True';
               qrGrid.ApplyUpdates;
               DataModule1.SQLTMaquina.CommitRetaining;
               qrGrid.Close;
               qrGrid.Open;
          end;
     end;
end;

procedure TfrmAcerto.btFechaAcertoClick(Sender: TObject);
begin
    if MessageDLG('Deseja realmente Fechar esse Acerto?' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then

    begin
          if qrSaldo.FieldByName('Saldo').Value=0 then
          begin
               qrAcerto.Append;
               qrAcerto.FieldByName('Cod_Acerto').Value:=-1;
               qrAcerto.FieldByName('Fechado').AsString:='True';
               qrAcerto.FieldByName('Cancelado').AsString:='False';
               qrAcerto.ApplyUpdates;
               DataModule1.SQLTMaquina.CommitRetaining;
               qrAcerto.Close;
               qrAcerto.Open;
               qrGrid.Filter:='(Cod_Acerto=0) and (Selecionado=''XX'') and (Cancelado=''False'') and (Cod_Cli='+intTostr(dblCliente.KeyValue)+')';
               qrGrid.Filtered:=True;
               qrGrid.FindFirst;
               while not qrGrid.EOF do
               begin
                    qrGrid.Edit;
                    qrGrid.FieldByName('Cod_Acerto').Value:=qrAcerto.RecordCount;
                    qrGrid.ApplyUpdates;
                    qrGrid.FindNext;
               end;
               DataModule1.SQLTMaquina.CommitRetaining;
               qrGrid.Filtered:=False;
               QueryClienteAberto;
               if qrCliente.RecordCount=0 then
               begin
                    pLansamento.Enabled:=False;
                    btNovoAcerto.Enabled:=True;
                    btFechaAcerto.Enabled:=False;
                    dblCliente.Clear;
               end;
               AtualizaGrid;
          end
          else MessageDLG('O Saldo do acerto não é zero', mtError,[mbOK],0);
    end;
end;

procedure TfrmAcerto.btImprimirClick(Sender: TObject);
begin
     frmImpAcerto:=TfrmImpAcerto.Create(Self);
     frmImpAcerto.RLReport1.Preview();
end;

procedure TfrmAcerto.btNovoAcertoClick(Sender: TObject);
begin
     qrCliente.Close;
     qrCliente.SQL.Clear;
     qrCliente.SQL.Add('Select ');
     qrCliente.SQL.Add('c.Nome,');
     qrCliente.SQL.Add('c.Cod_Cliente');
     qrCliente.SQL.Add('from Clientes c');
     qrCliente.Open;
     dblCliente.SetFocus;
     btNovoAcerto.Enabled:=False;
     btEditaLan.Enabled:=False;
     btExcluiLan.Enabled:=False;

end;

procedure TfrmAcerto.btNovoLanClick(Sender: TObject);
begin
     qrGrid.Append;
     qrGrid.FieldByName('Cod_DetAcerto').Value:=-1;
     qrGrid.FieldByName('Cod_Acerto').Value:=0;
     qrGrid.FieldByName('Selecionado').AsString:='XX';
     qrGrid.FieldByName('Data').Value:=Date;
     qrGrid.FieldByName('Credito').Value:=0;
     qrGrid.FieldByName('Debito').Value:=0;
     qrGrid.FieldByName('Status').AsString:='Ativo';
     qrGrid.FieldByName('Cancelado').AsString:='False';
     btEditaLan.Enabled:=False;
     btSalvaLan.Enabled:=True;
     btExcluiLan.Enabled:=False;
     btCancelaLan.SetFocus;
     btNovoLan.Enabled:=False;
     AbilitaControles;
end;

procedure TfrmAcerto.btSairClick(Sender: TObject);
begin
     frmAcerto.Close;
end;

procedure TfrmAcerto.btSalvaLanClick(Sender: TObject);
var AuxCod_Cli:integer;
begin
    if MessageDLG('Deseja realmente salvar' ,mtconfirmation,[mbYes,mbNo],0)=mrYes  then
     begin
          if SalvarTrue then
          begin
               qrGrid.FieldByName('Cod_Cli').Value:=dblCliente.KeyValue;
               AuxCod_Cli:=dblCliente.KeyValue;
               qrGrid.ApplyUpdates;
              DataModule1.SQLTMaquina.CommitRetaining;
              qrGrid.Close;
              qrGrid.Open;
              qrSaldo.Close;
              qrSaldo.Open;
              qrGrid.Last;
              btCancelaLan.SetFocus;
              btSalvaLan.Enabled:=False;
              btNovoLan.Enabled:=True;
              btEditalan.Enabled:=True;
              btExcluiLan.Enabled:=True;
              if btNovoAcerto.Enabled=False then
              begin
                   QueryClienteAberto;
                   dblCliente.KeyValue:=AuxCod_Cli;
              end;
              btNovoAcerto.Enabled:=True;
              btFechaAcerto.Enabled:=True;
              DesabilitaControles;
          end
          else MessageDLG(Erro, mtError,[mbOK],0);
     end;
end;

procedure TfrmAcerto.dbeCreditoExit(Sender: TObject);
begin
     if dbeCredito.Text = '' then dbeCredito.Text :='0';
end;

procedure TfrmAcerto.dbeDebitoExit(Sender: TObject);
begin
     if dbeDebito.Text = '' then dbeDebito.Text :='0';
end;

procedure TfrmAcerto.QuerySaldoAberto;
begin
    qrSaldo.Close;
    qrSaldo.SQL.Clear;
    qrSaldo.SQL.Add('select (sum(da.Credito) - sum(da.Debito)) as Saldo,');
    qrSaldo.SQL.Add('da.Cod_Acerto,');
    qrSaldo.SQL.Add('da.Cod_Cli,');
    qrSaldo.SQL.Add('da.Cancelado,');
    qrSaldo.SQL.Add('da.Selecionado');
    qrSaldo.SQL.Add('from DetAcerto da');
    qrSaldo.SQL.Add('group by da.Cod_Cli, da.Cod_Acerto,da.Cancelado, da.Selecionado');
    qrSaldo.SQL.Add('having  (da.Cod_Acerto = :IDAcerto) and (da.Cod_Cli = :IDCliente) and (da.Selecionado=''XX'') and (da.Cancelado=''False'')');
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
    qrSaldo.SQL.Add('da.Cancelado');
    qrSaldo.SQL.Add('from DetAcerto da');
    qrSaldo.SQL.Add('group by da.Cod_Acerto, da.Selecionado,da.Cancelado');
    qrSaldo.SQL.Add('having  (da.Cod_Acerto = :IDAcerto) and (da.Selecionado=''XX'') and (da.Cancelado = ''False'')');
    qrSaldo.ParamByName('IDACerto').Value:=qrAcerto.FieldByName('Cod_Acerto').Value;
    qrSaldo.Open;
end;
procedure TfrmAcerto.QueryClienteAberto;
begin
    qrCliente.Close;
    qrCliente.SQL.Clear;
    qrCliente.SQL.Add('select da.Cancelado,');
    qrCliente.SQL.Add('c.Nome,');
    qrCliente.SQL.Add('c.Cod_Cliente,');
    qrCliente.SQL.Add('da.Cod_Acerto');
    qrCliente.SQL.Add('from DetAcerto da');
    qrCliente.SQL.Add('inner join Clientes c on c.Cod_Cliente = da.Cod_Cli');
    qrCliente.SQL.Add('group by c.Nome, c.Cod_Cliente, da.Cancelado, da.Cod_Acerto');
    qrCliente.SQL.Add('having  (da.Cod_Acerto=0) and (da.Cancelado = ''False'')');
    qrCliente.Open;
end;

function tfrmAcerto.SalvarTrue:boolean;
begin
    Erro:='';
    if dbdData.Text='' then Erro:=Erro+'- O campo Data não Pode Ficar Vazio'+chr(13);
    if dbeHistorico.Text='' then Erro:=Erro+'-O campo Históricao não pode ficar vazio'+chr(13);
    if (dbeCredito.Text='0') and (dbeDebito.Text='0') then Erro:=Erro+'-Os campos Débito e Crédito não podem ficar zerados simultaneamente'+Chr(13) ;
    if ((strTofloat(dbeCredito.Text)>0) or (strToFloat(dbeCredito.Text)<0)) and ((strTofloat(dbeDebito.Text)>0) or (strToFloat(dbeDebito.Text)<0)) then
       Erro:=Erro+'-Os campos Débito e Crédito não podem ter Saldo maior ou menor que zero simultaneamente'+Chr(13) ;
    if strtoFloat(dbeCredito.Text)>99999.99 then Erro:=Erro+'-O campo Crédito não pode ultrapassar 99999.99'+chr(13);
    if strtoFloat(dbeDebito.Text)>99999.99 then Erro:=Erro+'-O campo Débito não pode ultrapassar 99999.99'+chr(13);
    if qrGrid.FieldByName('Status').AsString = 'Bloqueado' then Erro:=Erro+'-Este registro está bloqueado'+chr(13);
    if Erro='' then SalvarTrue:=True
    else SalvarTrue:=False;
end;

procedure TfrmAcerto.AtualizaGrid;
begin
    qrGrid.Close;
    qrGrid.ParamByName('IDAcerto1').Value:=qrFiltroAcerto.FieldByName('Cod_Acerto').value;
    qrGrid.ParamByName('IDAcerto2').Value:=qrFiltroAcerto.FieldByName('Cod_Acerto').value;
    qrGrid.ParamByName('IDCliente1').Value:=1;
    qrGrid.ParamByName('IDCliente2').Value:=qrAuxCliente.RecordCount;
    qrGrid.Open;
end;

procedure TfrmAcerto.DesabilitaControles;
begin
    dbdData.ReadOnly:=True;
    dbeHistorico.ReadOnly:=True;
    dbeCredito.ReadOnly:=True;
    dbeDebito.ReadOnly:=True;
end;

procedure TfrmAcerto.AbilitaControles;
Begin
    dbdData.ReadOnly:=False;
    dbeHistorico.ReadOnly:=False;
    dbeCredito.ReadOnly:=False;
    dbeDebito.ReadOnly:=False;
end;

end.

