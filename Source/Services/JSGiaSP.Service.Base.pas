unit JSGiaSP.Service.Base;

interface

uses
  JSGiaSP.Service.Interfaces,
  JSGiaSP.Service.Config,
  JSGiaSP.Service.Collection,
  JSGiaSP.Service.Emitente,
  System.SysUtils,
  System.Threading,
  System.Classes,
  System.Generics.Collections;


type
  TJSGiaSPService = class(TInterfacedObject, IJSGiaSPService)
  private
    FRegistros      : IJSGiaSPServiceRegistros;

    FJSDAOCollection: IJSGiaSPDAOCollection;
    FEmitente       : IJSGiaSPEmitente;
    FConfig         : IJSGiaSPConfig<IJSGiaSPService>;

    FArquivoGiaSP: TStrings;

    function gerarRegistros: TStrings;
    procedure SaveToFile;
  public
    function Emitente: IJSGiaSPEmitente;
    function DAO     : IJSGiaSPDAOCollection;
    function Config  : IJSGiaSPConfig<IJSGiaSPService>;

    function Execute: IJSGiaSPService;

    constructor create;
    destructor  Destroy; override;
    class function New: IJSGiaSPService;

  end;

implementation

uses
  JSGiaSP.Service.Registros;

{ TJSGiaSPService }

function TJSGiaSPService.Config: IJSGiaSPConfig<IJSGiaSPService>;
begin
  if not Assigned(FConfig) then
    FConfig := TJSGiaSPServiceConfig<IJSGiaSPService>.New(Self);
  result := FConfig;
end;

constructor TJSGiaSPService.create;
begin
  FArquivoGiaSP := TStringList.Create;
  FRegistros   := TJSGiaSPServiceRegistros.New(Self);
end;

function TJSGiaSPService.DAO: IJSGiaSPDAOCollection;
begin
  if not Assigned(FJSDAOCollection) then
    FJSDAOCollection := TJSGiaSPServiceCollection.New(Self);
  result := FJSDAOCollection;
end;

destructor TJSGiaSPService.Destroy;
begin
  FArquivoGiaSP.Free;
  inherited;
end;

function TJSGiaSPService.Emitente: IJSGiaSPEmitente;
begin
  if not Assigned(FEmitente) then
    FEmitente := TJSGiaSPEmitente.New(Self);
  result := FEmitente;
end;

function TJSGiaSPService.Execute: IJSGiaSPService;
var
  Registros: TStrings;

  procedure addGiaSP(s: TStrings);
  var
    j : Integer;
  begin
    if (not Assigned(s)) or (s.Count = 0) then
      Exit;

    for j := 0 to Pred(s.Count) do
      FArquivoGiaSP.Add(s[j]);
  end;

begin
  Result := self;
  Registros := nil;

  try
    Registros := gerarRegistros;
    addGiaSP(Registros);
  finally
    Registros.Free;
  end;

  SaveToFile;
end;

function TJSGiaSPService.gerarRegistros: TStrings;
begin
  Result := FRegistros.Execute;
end;

class function TJSGiaSPService.New: IJSGiaSPService;
begin
  result := Self.create;
end;

procedure TJSGiaSPService.SaveToFile;
begin
  if not FConfig.GerarRelatorio then
    FArquivoGiaSP.SaveToFile(FConfig.NomeArquivo);
end;

end.
