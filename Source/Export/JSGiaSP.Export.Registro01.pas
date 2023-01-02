unit JSGiaSP.Export.Registro01;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Base,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Format,
  System.SysUtils;

type
  TJSGiaSPExportRegistro01 = class(TJSGiaSPExportBase, IJSGiaSPExport)
  private
    FReg01: TJSGiaSPModelRegistro01;

  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; override;
  end;

implementation

{ TJSGiaSPExportRegistro01 }

function TJSGiaSPExportRegistro01.linhaGiaSP(
  AModel: TJSGiaSPModelRegistro): string;
begin
  validateInstance<TJSGiaSPModelRegistro01>(AModel, FReg01);

  Result := FReg01.reg +
            FReg01.tipoDocto +
            JSGF.formatData(FReg01.dataGeracao) +
            JSGF.formatHora(FReg01.horaGeracao) +
            JSGF.PadR(FReg01.versaoFrontEnd,4,'0') +
            FReg01.versaoPref +
            JSGF.PadL(FReg01.q05,4,'0');
end;

end.
