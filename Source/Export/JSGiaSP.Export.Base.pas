unit JSGiaSP.Export.Base;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Service.Interfaces,
  JSGiaSP.Model.Classes,
  System.SysUtils,
  System.Generics.Collections;

type
  TJSGiaSPExportBase = class(TInterfacedObject, IJSGiaSPExport)
  protected
    [Weak]
    FEmitente: IJSGiaSPEmitente;

    [Weak]
    FConfig: IJSGiaSPConfig<IJSGiaSPService>;

    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; virtual; abstract;
    procedure validateInstance<T: TJSGiaSPModelRegistro, constructor>(AModel: TJSGiaSPModelRegistro; var Reference: T);
  public
    constructor create(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>);
    class function New(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>): IJSGiaSPExport;
end;

implementation

{ TJSGiaSPExportBase }

constructor TJSGiaSPExportBase.create(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>);
begin
  FEmitente := Emitente;
  FConfig   := Config;
end;

class function TJSGiaSPExportBase.New(Emitente: IJSGiaSPEmitente;
  Config: IJSGiaSPConfig<IJSGiaSPService>): IJSGiaSPExport;
begin
  result := Self.create(Emitente, Config);
end;

procedure TJSGiaSPExportBase.validateInstance<T>(AModel: TJSGiaSPModelRegistro;
  var Reference: T);
var
  model: T;
begin
  model := T.create;
  try
    if not (AModel is T) then
      raise Exception.CreateFmt('Invalid Instance %s, expected is %s', [AModel.reg, model.reg]);

    Reference := T(AModel);
  finally
    model.free;
  end;
end;

end.
