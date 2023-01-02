unit JSGiaSP.Service.Config;

interface

uses
  JSGiaSP.Model.Types,
  JSGiaSP.Service.Interfaces,
  System.SysUtils;

type
  TJSGiaSPServiceConfig<I: IInterface> = class(TInterfacedObject, IJSGiaSPConfig<I>)
  private
    [Weak]
    FParent: I;

    FDataInicial            : TDateTime;
    FDataFinal              : TDateTime;
    FNomeArquivo            : string;
    FTipoGia                : TJSGiaSPTipoGia;
    FMovimento              : TJSGiaSPMovimento;
    FRegimeTributario       : TJSGiaSPRegimeTributario;
    FGerarRelatorio         : Boolean;

    FOnAddRegistro          : TOnGiaSPAddRegistro;
    FOnLogErro              : TOnLogErro;

  public
    function DataInicial            (Value: TDateTime)                                         : IJSGiaSPConfig<I>; overload;
    function DataFinal              (Value: TDateTime)                                         : IJSGiaSPConfig<I>; overload;
    function Movimento              (Value: TJSGiaSPMovimento)                                 : IJSGiaSPConfig<I>; overload;
    function TipoGia                (Value: TJSGiaSPTipoGia)                                   : IJSGiaSPConfig<I>; overload;
    function RegimeTributario       (Value: TJSGiaSPRegimeTributario)                          : IJSGiaSPConfig<I>; overload;
    function GerarRelatorio         (Value: Boolean)                                           : IJSGiaSPConfig<I>; overload;
    function NomeArquivo            (Value: string)                                            : IJSGiaSPConfig<I>; overload;

    function DataInicial            : TDateTime;                                        overload;
    function DataFinal              : TDateTime;                                        overload;
    function Movimento              : TJSGiaSPMovimento;                                overload;
    function TipoGia                : TJSGiaSPTipoGia;                                  overload;
    function RegimeTributario       : TJSGiaSPRegimeTributario;                         overload;
    function GerarRelatorio         : Boolean                                           overload;
    function NomeArquivo            : string                                            overload;

    function OnAddRegistro(Value: TOnGiaSPAddRegistro): IJSGiaSPConfig<I>; overload;
    function OnAddRegistro: TOnGiaSPAddRegistro; overload;

    function OnLogErro(Value: TOnLogErro): IJSGiaSPConfig<I>; overload;
    function OnLogErro: TOnLogErro; overload;

    function &Begin: IJSGiaSPConfig<I>;
    function &End: I;

    class function New(Parent: I): IJSGiaSPConfig<I>;
    constructor create(Parent: I);
    destructor  Destroy; override;
  end;

implementation

{ TJSGiaSPServiceConfig<I> }

function TJSGiaSPServiceConfig<I>.&Begin: IJSGiaSPConfig<I>;
begin
  result := Self;
end;

constructor TJSGiaSPServiceConfig<I>.create(Parent: I);
begin
  FParent := Parent;
end;

function TJSGiaSPServiceConfig<I>.DataFinal(Value: TDateTime): IJSGiaSPConfig<I>;
begin
  result := Self;
  FDataFinal := Value;
end;

function TJSGiaSPServiceConfig<I>.DataFinal: TDateTime;
begin
  result := FDataFinal;
end;

function TJSGiaSPServiceConfig<I>.DataInicial: TDateTime;
begin
  result := FDataInicial;
end;

function TJSGiaSPServiceConfig<I>.DataInicial(
  Value: TDateTime): IJSGiaSPConfig<I>;
begin
  result := Self;
  FDataInicial := Value;
end;

destructor TJSGiaSPServiceConfig<I>.Destroy;
begin

  inherited;
end;

function TJSGiaSPServiceConfig<I>.&End: I;
begin
  result := FParent;
end;

function TJSGiaSPServiceConfig<I>.GerarRelatorio: Boolean;
begin
  result := FGerarRelatorio;
end;

function TJSGiaSPServiceConfig<I>.Movimento(
  Value: TJSGiaSPMovimento): IJSGiaSPConfig<I>;
begin
  result := Self;
  FMovimento := Value;
end;

function TJSGiaSPServiceConfig<I>.Movimento: TJSGiaSPMovimento;
begin
  Result := FMovimento;
end;

function TJSGiaSPServiceConfig<I>.GerarRelatorio(
  Value: Boolean): IJSGiaSPConfig<I>;
begin
  result := Self;
  FGerarRelatorio := Value;
end;

class function TJSGiaSPServiceConfig<I>.New(Parent: I): IJSGiaSPConfig<I>;
begin
  result := Self.create(Parent);
end;

function TJSGiaSPServiceConfig<I>.NomeArquivo: string;
begin
  result := FNomeArquivo;
end;

function TJSGiaSPServiceConfig<I>.NomeArquivo(Value: string): IJSGiaSPConfig<I>;
begin
  result := Self;
  FNomeArquivo := Value;
end;

function TJSGiaSPServiceConfig<I>.OnAddRegistro: TOnGiaSPAddRegistro;
begin
  Result := FOnAddRegistro;
end;

function TJSGiaSPServiceConfig<I>.OnLogErro: TOnLogErro;
begin
  Result := FOnLogErro;
end;

function TJSGiaSPServiceConfig<I>.OnLogErro(
  Value: TOnLogErro): IJSGiaSPConfig<I>;
begin
  result := Self;
  FOnLogErro := Value;
end;

function TJSGiaSPServiceConfig<I>.RegimeTributario: TJSGiaSPRegimeTributario;
begin
  Result := FRegimeTributario;
end;

function TJSGiaSPServiceConfig<I>.TipoGia(
  Value: TJSGiaSPTipoGia): IJSGiaSPConfig<I>;
begin
  result := Self;
  FTipoGia := Value;
end;

function TJSGiaSPServiceConfig<I>.TipoGia: TJSGiaSPTipoGia;
begin
  Result := FTipoGia;
end;

function TJSGiaSPServiceConfig<I>.RegimeTributario(
  Value: TJSGiaSPRegimeTributario): IJSGiaSPConfig<I>;
begin
  result := Self;
  FRegimeTributario := Value;
end;

function TJSGiaSPServiceConfig<I>.OnAddRegistro(
  Value: TOnGiaSPAddRegistro): IJSGiaSPConfig<I>;
begin
  result := Self;
  FOnAddRegistro := Value;
end;

end.
