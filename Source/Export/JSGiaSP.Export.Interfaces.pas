unit JSGiaSP.Export.Interfaces;

interface

uses
  JSGiaSP.Service.Interfaces,
  JSGiaSP.Model.Classes;

type
  IJSGiaSPExport = interface
    ['{485CBAFC-D869-4B27-ADCB-6AB121D0371F}']
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string;
  end;

  IJSGiaSPExportFacade = interface
    ['{40D9C6D8-2D92-40D3-B680-FDA69E43B672}']
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string;
  end;

function FacadeExport(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>): IJSGiaSPExportFacade;

implementation

uses
  JSGiaSP.Export.Facade;

function FacadeExport(Emitente: IJSGiaSPEmitente; Config: IJSGiaSPConfig<IJSGiaSPService>): IJSGiaSPExportFacade;
begin
  result := TJSGiaSPExportFacade.New(Emitente, Config);
end;

end.
