unit uItem;

interface

type
  TItem = class
  private
    FID_Produto: Integer;
    FQuantidade: Integer;
    FVlrUnitario: Currency;
    FVlrTotal: Currency;
    function getID_Produto: Integer;
    procedure setID_Produto(Value: Integer);
    function getQuantidade: Integer;
    procedure setQuantidade(Value: Integer);
    function getVlrUnitario: Currency;
    procedure setVlrUnitario(Value: Currency);
    function getVlrTotal: Currency;
    procedure setVlrTotal(Value: Currency);

  public
    constructor Create;
    property ID_Produto: Integer read getID_Produto write setID_Produto;
    property Quantidade: Integer read getQuantidade write setQuantidade;
    property VlrUnitario: Currency read getVlrUnitario write setVlrUnitario;
    property VlrTotal: Currency read getVlrTotal write setVlrTotal;
  end;

implementation

{ TItem }

constructor TItem.Create;
begin
  FID_Produto := 0 ;
  FQuantidade := 0;
  FVlrUnitario := 0;
  FVlrTotal := 0;
end;

function TItem.getID_Produto: Integer;
begin
  Result := FID_Produto;
end;

function TItem.getQuantidade: Integer;
begin
  Result := FQuantidade;
end;

function TItem.getVlrUnitario: Currency;
begin
  Result := FVlrUnitario;
end;

function TItem.getVlrTotal: Currency;
begin
  Result := FVlrTotal;
end;

procedure TItem.setID_Produto(Value: Integer);
begin
  FID_Produto := Value;
end;

procedure TItem.setQuantidade(Value: Integer);
begin
  FQuantidade := Value;
end;

procedure TItem.setVlrUnitario(Value: Currency);
begin
  FVlrUnitario := Value;
end;

procedure TItem.setVlrTotal(Value: Currency);
begin
  FVlrTotal := Value;
end;

end.
