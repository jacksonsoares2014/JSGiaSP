unit JSGiaSP.Export.Facade;

interface

uses
  System.SysUtils,
  JSGiaSP.Model.Classes,
  JSGiaSP.Service.Interfaces,
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Classes,
  System.Generics.Collections;

type
  TJSGiaSPExportFacade = class(TInterfacedObject, IJSGiaSPExportFacade)
  private
    [Weak]
    FEmitente: IJSGiaSPEmitente;

    [Weak]
    FConfig: IJSGiaSPConfig<IJSGiaSPService>;

    FExports: TDictionary<String, IJSGiaSPExport>;
    FCodUF : TDictionary<String, String>;

    procedure createExports;

    function GetExport(AModel: TJSGiaSPModelRegistro): IJSGiaSPExport;
  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string;

  public
    constructor create(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>);
    class function New(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>): IJSGiaSPExportFacade;
    destructor Destroy; override;

end;

implementation

{ TJSGiaSPExportFacade }

constructor TJSGiaSPExportFacade.create(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>);
begin
  FEmitente := Emitente;
  FConfig   := Config;

  createExports;
end;

procedure TJSGiaSPExportFacade.createExports;
begin
  FExports := TDictionary<String, IJSGiaSPExport>.Create;

  FExports.Add('01', TJSGiaSPExportRegistro01.New(FEmitente, FConfig));
  FExports.Add('05', TJSGiaSPExportRegistro05.New(FEmitente, FConfig));
  FExports.Add('10', TJSGiaSPExportRegistro10.New(FEmitente, FConfig));
  FExports.Add('14', TJSGiaSPExportRegistro14.New(FEmitente, FConfig));
  FExports.Add('20', TJSGiaSPExportRegistro20.New(FEmitente, FConfig));
  FExports.Add('30', TJSGiaSPExportRegistro30.New(FEmitente, FConfig));
end;

destructor TJSGiaSPExportFacade.Destroy;
begin
  FExports.Free;
  inherited;
end;

function TJSGiaSPExportFacade.GetExport(
  AModel: TJSGiaSPModelRegistro): IJSGiaSPExport;
begin
  if not FExports.TryGetValue(AModel.reg, Result) then
    result := nil;
end;

function TJSGiaSPExportFacade.linhaGiaSP(AModel: TJSGiaSPModelRegistro): string;
var
  &Export: IJSGiaSPExport;
begin
  &Export := GetExport(AModel);

  if not Assigned(&Export) then
    raise ENotImplemented.CreateFmt('Not implemented Export for Reg %s', [AModel.reg]);

  result := &Export.linhaGiaSP(AModel);
end;

class function TJSGiaSPExportFacade.New(Emitente: IJSGiaSPEmitente;
  Config: IJSGiaSPConfig<IJSGiaSPService>): IJSGiaSPExportFacade;
begin
  result := Self.create(Emitente, Config);
end;

end.
