unit uPedido;

interface

uses Classes, Dialogs, uItem;

type
  TPedido = class
  private
    FID_Pedido: Integer;
    FID_Cliente: Integer;
    FValorTotal: Currency;
    function getID_Pedido: Integer;
    procedure setID_Pedido(Value: Integer);
    function getID_Cliente: Integer;
    procedure setID_Cliente(Value: Integer);
    function getValorTotal: Currency;
    procedure setValorTotal(Value: Currency);

  public
    Item: Array of TItem;
    constructor Create;
    property ID_Pedido: Integer read getID_Pedido write setID_Pedido;
    property ID_Cliente: Integer read getID_Cliente write setID_Cliente;
    property ValorTotal: Currency read getValorTotal write setValorTotal;
  end;

implementation

{ TPedido }

constructor TPedido.Create;
begin
  FID_Pedido :=  0;
  FID_Cliente := 0;
  FValorTotal := 0;
end;

function TPedido.getID_Pedido: Integer;
begin
  Result := FID_Pedido;
end;

function TPedido.getID_Cliente: Integer;
begin
  Result := FID_Cliente;
end;

function TPedido.getValorTotal: Currency;
begin
  Result := FValorTotal;
end;

procedure TPedido.setID_Pedido(Value: Integer);
begin
  FID_Pedido := Value;
end;

procedure TPedido.setID_Cliente(Value: Integer);
begin
  FID_Cliente := Value;
end;

procedure TPedido.setValorTotal(Value: Currency);
begin
  FValorTotal := Value;
end;

end.
