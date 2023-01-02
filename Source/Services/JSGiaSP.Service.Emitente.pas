unit JSGiaSP.Service.Emitente;

interface

uses
  JSGiaSP.Service.Interfaces,
  System.SysUtils;

type
  TJSGiaSPEmitente = class(TInterfacedObject, IJSGiaSPEmitente)
  private
    [Weak]
    FParent : IJSGiaSPService;

    FCNPJ             : string;
    FIncricaoEstadual : string;
    FNome             : string;
    FCNAE             : string;

  protected
    function CNPJ             (Value: String): IJSGiaSPEmitente; overload;
    function IncricaoEstadual (Value: String): IJSGiaSPEmitente; overload;
    function Nome             (Value: string): IJSGiaSPEmitente; overload;
    function CNAE             (Value: string): IJSGiaSPEmitente; overload;

    function CNPJ             : string; overload;
    function IncricaoEstadual : string; overload;
    function Nome             : string; overload;
    function CNAE             : string; overload;

    function &End: IJSGiaSPService;

  public
    constructor create(Parent: IJSGiaSPService);
    class function New(Parent: IJSGiaSPService): IJSGiaSPEmitente;
end;

implementation

{ TJSGiaSPEmitente }

function TJSGiaSPEmitente.CNPJ(Value: String): IJSGiaSPEmitente;
begin
  Result := Self;
  FCNPJ  := Value;
end;

function TJSGiaSPEmitente.CNAE(Value: string): IJSGiaSPEmitente;
begin
  Result := Self;
  FCNAE  := Value;
end;

function TJSGiaSPEmitente.CNAE: string;
begin
  Result := CNAE;
end;

function TJSGiaSPEmitente.CNPJ: string;
begin
  Result := FCNPJ;
end;

constructor TJSGiaSPEmitente.create(Parent: IJSGiaSPService);
begin
  FParent := Parent;
end;

function TJSGiaSPEmitente.&End: IJSGiaSPService;
begin
  result := FParent;
end;

function TJSGiaSPEmitente.IncricaoEstadual: string;
begin
  Result := FIncricaoEstadual;
end;

function TJSGiaSPEmitente.IncricaoEstadual(Value: String): IJSGiaSPEmitente;
begin
  Result := Self;
  FIncricaoEstadual := Value;
end;

class function TJSGiaSPEmitente.New(Parent: IJSGiaSPService): IJSGiaSPEmitente;
begin
  result := Self.create(Parent);
end;

function TJSGiaSPEmitente.Nome(Value: string): IJSGiaSPEmitente;
begin
  Result := Self;
  FNome  := Value;
end;

function TJSGiaSPEmitente.Nome: string;
begin
  Result := FNome;
end;

end.
