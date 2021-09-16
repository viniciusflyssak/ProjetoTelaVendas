unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Buttons, FireDac.Comp.Client, FireDAC.DApt, FireDAC.Stan.Param , uDM, uPedido, uItem,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.Comp.DataSet;

type
  TfrmPrincipal = class(TForm)
    pnlFundo: TPanel;
    pnlTitulo: TPanel;
    edtNomeProduto: TEdit;
    lblProduto: TLabel;
    lblQuantidade: TLabel;
    edtQuantidade: TEdit;
    edtValor: TEdit;
    lblValor: TLabel;
    dbgPedido: TDBGrid;
    btnGravar: TSpeedButton;
    lblPedido: TLabel;
    btnPesquisaProduto: TSpeedButton;
    edtTotal: TEdit;
    lblTotal: TLabel;
    dtsPedidos: TDataSource;
    edtCodProduto: TEdit;
    lblCliente: TLabel;
    edtCodCliente: TEdit;
    edtNomeCliente: TEdit;
    btnPesquisaCliente: TSpeedButton;
    BtnAdicionar: TSpeedButton;
    btnCancelarPedido: TSpeedButton;
    btnEditarPedido: TSpeedButton;
    pnlPedidoEditarCancelar: TPanel;
    lblPedidoEditarCancelar: TLabel;
    edtNumeroPedido: TEdit;
    pnlPesquisa: TPanel;
    lblPesquisa: TLabel;
    btnSelecionar: TSpeedButton;
    btnCancelar: TSpeedButton;
    dbgPesquisaProduto: TDBGrid;
    dbgPesquisaCliente: TDBGrid;
    QryPesquisa: TFDQuery;
    dtsPesquisa: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure AtualizaGrid;
    procedure btnPesquisaProdutoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure edtCodProdutoExit(Sender: TObject);
    procedure edtCodClienteExit(Sender: TObject);
    procedure btnPesquisaClienteClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    function RetornaIDPedido: Integer;
    procedure btnEditarPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtNumeroPedidoExit(Sender: TObject);
    procedure edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure CancelarPedido;
    procedure CarregarPedido;
    procedure dbgPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CriaShape;
  private
    Pedido : TPedido;
    QryGrid : TFDQuery;
    bCarregar: Boolean;
    bCancelar: Boolean;
    FShapePedido: TFDMemTable;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AtualizaGrid;
var
  i: integer;
begin
  for i:= 0 to dbgPedido.Columns.Count - 1 do
  begin
    case i of
      0 : dbgPedido.Columns.Items[i].Width:= 50;
      1 : dbgPedido.Columns.Items[i].Width:= 140;
      2 : dbgPedido.Columns.Items[i].Width:= 50;
      3 : dbgPedido.Columns.Items[i].Width:= 80;
      4 : dbgPedido.Columns.Items[i].Width:= 80;
      5 : dbgPedido.Columns.Items[i].Width:= -1;
    end;
  end;
  edtTotal.Text := CurrToStr(Pedido.ValorTotal);
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
var
  i: Integer;
  confereValor: Single;
begin
  SetLength(Pedido.Item, length(pedido.item) + 1);
  if edtCodProduto.text = '' then
    raise Exception.Create('Informe o código do produto!');
  if edtQuantidade.Text = '' then
    raise Exception.Create('Informe a quantidade do produto!');
  if edtValor.Text = '' then
    raise Exception.Create('Informe o valor do produto!');
  if not(TryStrToFloat(edtValor.Text, confereValor)) then
  begin
    edtValor.SetFocus;
    raise Exception.Create('Caracteres inválidos! digite apenas números!' + #13 + 'Obs: Para separar números decimais, utilize '','' ao invés de ''.''');
  end;
  i := Length(Pedido.Item);
  edtCodProdutoExit(nil);
  Pedido.Item[i] := TItem.Create;
  Pedido.Item[i].ID_Produto := StrToInt(edtCodProduto.Text);
  Pedido.Item[i].Quantidade := StrToInt(edtQuantidade.Text);
  Pedido.Item[i].VlrUnitario := StrToCurr(edtValor.Text);
  Pedido.Item[i].VlrTotal := Pedido.Item[i].VlrUnitario * Pedido.Item[i].Quantidade;
  Pedido.ValorTotal := Pedido.ValorTotal + Pedido.Item[i].VlrTotal;
  FShapePedido.Append;
  FShapePedido.FieldByName('ID_ITENS_PEDIDO').AsInteger := i;
  FShapePedido.FieldByName('ID_PRODUTO').AsInteger := Pedido.Item[i].ID_Produto;
  FShapePedido.FieldByName('DESCRICAO').AsString := edtNomeProduto.Text;
  FShapePedido.FieldByName('QUANTIDADE').AsInteger := Pedido.Item[i].Quantidade;
  FShapePedido.FieldByName('VALOR_TOTAL').AsFloat := Pedido.Item[i].VlrTotal;
  FShapePedido.FieldByName('VALOR_UNITARIO').AsFloat := Pedido.Item[i].VlrUnitario;
  FShapePedido.Post;
  edtCodProduto.Text := '';
  edtCodProdutoExit(nil);
  edtCodProduto.SetFocus;
  AtualizaGrid;
end;

procedure TfrmPrincipal.btnCancelarClick(Sender: TObject);
begin
  pnlPesquisa.Visible := False;
end;

procedure TfrmPrincipal.btnCancelarPedidoClick(Sender: TObject);
begin
  bCarregar := False;
  bCancelar := True;
  pnlPedidoEditarCancelar.BringToFront;
  pnlPedidoEditarCancelar.Visible := True;
  edtNumeroPedido.SetFocus;
end;

procedure TfrmPrincipal.btnEditarPedidoClick(Sender: TObject);
begin
  bCarregar := True;
  bCancelar := False;
  pnlPedidoEditarCancelar.BringToFront;
  pnlPedidoEditarCancelar.Visible := True;
  edtNumeroPedido.SetFocus;
end;

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
var
  qry: TFDQuery;
  i: integer;
begin
  qry := TFDQuery.Create(nil);
  try
    try
      qry.Connection := DM.Connection;
      DM.Connection.StartTransaction;
      qry.SQL.Add('INSERT INTO PEDIDOS (DATA_EMISSAO, ID_CLIENTE, VALOR_TOTAL) VALUES (:pData, NULLIF(:pID_Cliente, 0), :pValor)');
      qry.ParamByName('pData').Value := Date;
      qry.ParamByName('pID_Cliente').Value := Pedido.ID_Cliente;
      qry.ParamByName('pValor').Value := Pedido.ValorTotal;
      qry.ExecSQL;
      DM.Connection.Commit;
    except
      DM.Connection.Rollback;
      raise Exception.Create('Erro ao salvar o pedido. Tente Novamente.');
    end;
    qry.SQL.Clear;
    try
      FShapePedido.First;
      for i := 0 to FShapePedido.RecordCount - 1 do
      begin
        DM.Connection.StartTransaction;
        qry.SQL.Add(' INSERT INTO ITENS_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, VALOR_UNITARIO, VALOR_TOTAL) ');
        qry.SQL.Add(' VALUES (:pID_Pedido, :pID_Produto, :pQuantidade, :pValorUnitario, :pValorTotal) ');
        qry.ParamByName('pID_Pedido').Value := Pedido.ID_Pedido;
        qry.ParamByName('pID_Produto').Value := FShapePedido.FieldByName('ID_PRODUTO').AsInteger;
        qry.ParamByName('pQuantidade').Value := FShapePedido.FieldByName('QUANTIDADE').AsInteger;
        qry.ParamByName('pValorUnitario').Value := FShapePedido.FieldByName('VALOR_UNITARIO').AsFloat;
        qry.ParamByName('pValorTotal').Value := FShapePedido.FieldByName('VALOR_TOTAL').AsFloat;
        qry.ExecSQL;
        DM.Connection.Commit;
        FShapePedido.Next;
      end;
    except
      DM.Connection.Rollback;
      AtualizaGrid;
      raise Exception.Create('Erro ao salvar o pedido. Tente Novamente.');
    end;
  finally
    AtualizaGrid;
    FreeAndNil(qry);
  end;
end;

procedure TfrmPrincipal.btnPesquisaClienteClick(Sender: TObject);
var
  i: integer;
begin
  dbgPesquisaProduto.Visible := False;
  dbgPesquisaCliente.Visible := True;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add(' SELECT * FROM CLIENTES ');
  lblPesquisa.Caption := 'Clientes encontrados:';
  qryPesquisa.Open;
  for i:= 0 to dbgPesquisaCliente.Columns.Count - 1 do
  begin
    case i of
      0 : dbgPesquisaCliente.Columns.Items[i].Width:= 70;
      1 : dbgPesquisaCliente.Columns.Items[i].Width:= 140;
      2 : dbgPesquisaCliente.Columns.Items[i].Width:= 100;
      3 : dbgPesquisaCliente.Columns.Items[i].Width:= 60;
    end;
  end;
  pnlPesquisa.BringToFront;
  pnlPesquisa.Visible := True;
end;

procedure TfrmPrincipal.btnPesquisaProdutoClick(Sender: TObject);
var
  i: integer;
begin
  dbgPesquisaProduto.Visible := True;
  dbgPesquisaCliente.Visible := False;
  qryPesquisa.SQL.Clear;
  qryPesquisa.SQL.Add(' SELECT * FROM PRODUTOS ');
  lblPesquisa.Caption := 'Produtos encontrados:';
  qryPesquisa.Open;
  for i:= 0 to dbgPesquisaProduto.Columns.Count - 1 do
  begin
    case i of
      0 : dbgPesquisaProduto.Columns.Items[i].Width:= 70;
      1 : dbgPesquisaProduto.Columns.Items[i].Width:= 200;
      2 : dbgPesquisaProduto.Columns.Items[i].Width:= 100;
    end;
  end;
  pnlPesquisa.BringToFront;
  pnlPesquisa.Visible := True;
end;

procedure TfrmPrincipal.btnSelecionarClick(Sender: TObject);
begin
  if dbgPesquisaProduto.Visible then
  begin
    edtCodProduto.Text := qryPesquisa.FieldByName('ID_PRODUTO').AsString;
    edtCodProdutoExit(nil);
  end
  else
  begin
    edtCodCliente.Text := qryPesquisa.FieldByName('ID_CLIENTE').AsString;
    edtCodClienteExit(nil);
  end;
  pnlPesquisa.Visible := False;
end;

procedure TfrmPrincipal.CancelarPedido;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    try
      qry.Connection := DM.Connection;
      DM.Connection.StartTransaction;
      qry.SQL.Add(' DELETE FROM ITENS_PEDIDO WHERE ID_PEDIDO = :pID_Pedido');
      qry.ParamByName('pID_Pedido').Value := StrToInt(edtNumeroPedido.Text);
      qry.ExecSQL;
      if qry.RowsAffected = 0 then
        raise Exception.Create('Pedido não encontrado!'); 
      DM.Connection.Commit;
    except
      DM.Connection.Rollback;      
    end;
    qry.SQL.Clear;
    try
      qry.Connection := DM.Connection;
      DM.Connection.StartTransaction;
      qry.SQL.Add(' DELETE FROM PEDIDOS WHERE ID_PEDIDO = :pID_Pedido');
      qry.ParamByName('pID_Pedido').Value := StrToInt(edtNumeroPedido.Text);
      qry.ExecSQL;
      if qry.RowsAffected = 0 then
        raise Exception.Create('Pedido não encontrado!');      
      DM.Connection.Commit;
    except
      DM.Connection.Rollback;     
    end;
  finally
    ShowMessage('Pedido cancelado com sucesso!');
    FreeAndNil(qry);
    pnlPedidoEditarCancelar.Visible := false;
    AtualizaGrid;
    edtCodProduto.Text := '';
    edtCodProdutoExit(nil);
  end;
end;

procedure TfrmPrincipal.CarregarPedido;
var
  qry: TFDquery;
  i: integer;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.Connection;
    qry.SQL.Add(' SELECT ID_PEDIDO, ID_CLIENTE FROM PEDIDOS ');
    qry.SQL.Add(' WHERE ID_PEDIDO = :pID_Pedido');
    qry.ParamByName('pID_Pedido').Value := StrToInt(edtNumeroPedido.Text);
    qry.Open;
    if qry.RecordCount > 0 then
    begin
      Pedido.ID_Pedido := qry.FieldByName('ID_PEDIDO').AsInteger;
      edtCodCliente.Text := qry.FieldByName('ID_CLIENTE').AsString;
      edtCodClienteExit(nil);
      QryGrid := TFDQuery.Create(nil);
      try
        QryGrid.Connection := DM.Connection;
        QryGrid.SQL.Add(' SELECT ITENS_PEDIDO.ID_PRODUTO, PRODUTOS.DESCRICAO, ITENS_PEDIDO.ID_ITENS_PEDIDO, ITENS_PEDIDO.QUANTIDADE, ITENS_PEDIDO.VALOR_UNITARIO, ');
        QryGrid.SQL.Add(' ITENS_PEDIDO.VALOR_TOTAL, PEDIDOS.VALOR_TOTAL AS VALOR_PEDIDO ');
        QryGrid.SQL.Add(' FROM PEDIDOS ');
        QryGrid.SQL.Add(' INNER JOIN ITENS_PEDIDO ON ITENS_PEDIDO.ID_PEDIDO = PEDIDOS.ID_PEDIDO ');
        QryGrid.SQL.Add(' INNER JOIN PRODUTOS ON PRODUTOS.ID_PRODUTO = ITENS_PEDIDO.ID_PRODUTO ');
        QryGrid.SQL.Add(' WHERE PEDIDOS.ID_PEDIDO = :pID_Pedido ');
        QryGrid.ParamByName('pID_Pedido').Value := Pedido.ID_Pedido;
        QryGrid.open;
        QryGrid.First;
        FShapePedido.EmptyDataSet;
        Pedido.ValorTotal := 0;
        for i := 0 to QryGrid.RecordCount - 1 do
        begin
          FShapePedido.Append;
          FShapePedido.FieldByName('ID_ITENS_PEDIDO').AsInteger := QryGrid.FieldByName('ID_ITENS_PEDIDO').AsInteger;
          FShapePedido.FieldByName('ID_PRODUTO').AsInteger := QryGrid.FieldByName('ID_PRODUTO').AsInteger;
          FShapePedido.FieldByName('DESCRICAO').AsString := QryGrid.FieldByName('DESCRICAO').AsString ;
          FShapePedido.FieldByName('QUANTIDADE').AsInteger := QryGrid.FieldByName('QUANTIDADE').AsInteger;
          FShapePedido.FieldByName('VALOR_TOTAL').AsCurrency := QryGrid.FieldByName('VALOR_TOTAL').AsCurrency;
          FShapePedido.FieldByName('VALOR_UNITARIO').AsCurrency := QryGrid.FieldByName('VALOR_UNITARIO').AsCurrency;
          Pedido.ValorTotal := Pedido.ValorTotal + FShapePedido.FieldByName('VALOR_TOTAL').AsCurrency;
          FShapePedido.Post;
          QryGrid.Next;
        end;
      finally
        FreeAndNil(QryGrid);
      end;
      pnlPedidoEditarCancelar.Visible := False;
      edtTotal.Text := CurrToStr(Pedido.ValorTotal);
    end
    else
      ShowMessage('Nenhum pedido com esse número foi encontrado, verifique!');
  finally
    FreeAndNil(qry);
  end;
end;

procedure TfrmPrincipal.CriaShape;
begin
  FShapePedido := TFDMemTable.Create(nil);
  FShapePedido.FieldDefs.Add('ID_ITENS_PEDIDO', ftInteger);
  FShapePedido.FieldDefs.Add('ID_PRODUTO', ftInteger);
  FShapePedido.FieldDefs.Add('QUANTIDADE', ftInteger);
  FShapePedido.FieldDefs.Add('DESCRICAO', ftString, 100);
  FShapePedido.FieldDefs.Add('VALOR_UNITARIO', ftFloat);
  FShapePedido.FieldDefs.Add('VALOR_TOTAL', ftFloat);
  FShapePedido.CreateDataSet;
  FShapePedido.Open;
end;

procedure TfrmPrincipal.dbgPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 46 then
  begin
    if Application.MessageBox('Tem certeza que deseja excluir o item selecionado?',
    'Confirmação', MB_YESNO + MB_ICONQUESTION + MB_DEFBUTTON2) = IDYES then
    begin
      Pedido.ValorTotal := Pedido.ValorTotal - FShapePedido.FieldByName('VALOR_TOTAL').AsCurrency;
      edtTotal.Text := CurrToStr(Pedido.ValorTotal);
      FShapePedido.Delete;
    end;
  end;
end;

procedure TfrmPrincipal.edtCodClienteExit(Sender: TObject);
var
  qry: TFDQuery;
begin
  if edtCodCliente.Text = '' then
  begin
    edtNomeCliente.Text := '';
    btnCancelarPedido.Visible := true;
    btnEditarPedido.Visible := true;
    exit;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.Connection;
    qry.SQL.Add('SELECT ID_CLIENTE, NOME_CLIENTE FROM CLIENTES');
    qry.SQL.Add('WHERE ID_CLIENTE = :pID_Cliente');
    qry.ParamByName('pID_Cliente').Value := edtCodCliente.Text;
    qry.Open;
    if qry.RecordCount > 0 then
    begin
      edtCodCliente.Text := qry.FieldByName('ID_CLIENTE').AsString;
      edtNomeCliente.Text := qry.FieldByName('NOME_CLIENTE').AsString;
      Pedido.ID_Cliente := qry.FieldByName('ID_CLIENTE').AsInteger;
      btnCancelarPedido.Visible := false;
      btnEditarPedido.Visible := false;
    end
    else
    begin
      edtCodCliente.Text := '';
      edtNomeCliente.Text := '';
      ShowMessage('Nenhum cliente encontrado para o código informado.');
    end;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TfrmPrincipal.edtCodProdutoExit(Sender: TObject);
var
  qry: TFDQuery;
begin
  if edtCodProduto.Text = '' then
  begin
    edtNomeProduto.Text := '';
    edtValor.Text := '';
    edtQuantidade.Text := '';
    exit;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.Connection;
    qry.SQL.Add('SELECT * FROM PRODUTOS');
    qry.SQL.Add('WHERE ID_PRODUTO = :pID_Produto');
    qry.ParamByName('pID_Produto').Value := edtCodProduto.Text;
    qry.Open;
    if qry.RecordCount > 0 then
    begin
      edtCodProduto.Text := qry.FieldByName('ID_PRODUTO').AsString;
      edtNomeProduto.Text := qry.FieldByName('DESCRICAO').AsString;
      edtValor.Text := qry.FieldByName('PRECO').AsString;
    end
    else
    begin
      edtCodProduto.Text := '';
      edtNomeProduto.Text := '';
      edtValor.Text := '';
      edtQuantidade.Text := '';
      ShowMessage('Nenhum produto encontrado para o código informado.');
    end;
  finally
    FreeAndNil(qry);
  end;
end;

procedure TfrmPrincipal.edtNumeroPedidoExit(Sender: TObject);
begin
  if edtNumeroPedido.Text = '' then
    pnlPedidoEditarCancelar.Visible := False;
end;

procedure TfrmPrincipal.edtNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) and not(edtNumeroPedido.Text = '') then
  begin
    if bCarregar then
      CarregarPedido;
    if bCancelar then
      CancelarPedido;
  end;
  if (edtNumeroPedido.Text = '') and (Key = #13) then
    pnlPedidoEditarCancelar.Visible := False;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(Pedido);
  FreeAndNil(QryGrid);
  FreeAndNil(QryPesquisa);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  i: integer;
begin
  Pedido := TPedido.Create;
  SetLength(Pedido.Item, 1);
  pnlPesquisa.Visible := False;
  for i:= 0 to dbgPedido.Columns.Count - 1 do
  begin
    case i of
      0 : dbgPedido.Columns.Items[i].Width:= 50;
      1 : dbgPedido.Columns.Items[i].Width:= 150;
      2 : dbgPedido.Columns.Items[i].Width:= 50;
      3 : dbgPedido.Columns.Items[i].Width:= 70;
      4 : dbgPedido.Columns.Items[i].Width:= 80;
      5 : dbgPedido.Columns.Items[i].Width:= -1;
    end;
  end;
  pnlPedidoEditarCancelar.Visible := False;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  Pedido.ID_Pedido :=  RetornaIDPedido;
  CriaShape;
  dtsPedidos.DataSet := FShapePedido;
end;

function TfrmPrincipal.RetornaIDPedido: Integer;
var
  qry : TFDQuery;
begin
  qry := TFDQuery.Create(nil);
  try
    qry.Connection := DM.Connection;
    qry.SQL.Add(' SELECT ID_PEDIDO FROM PEDIDOS ORDER BY ID_PEDIDO DESC LIMIT 1 ');
    qry.Open;
    Result := qry.FieldByName('ID_PEDIDO').AsInteger + 1;
  finally
    FreeAndNil(qry);
  end;
end;

end.
