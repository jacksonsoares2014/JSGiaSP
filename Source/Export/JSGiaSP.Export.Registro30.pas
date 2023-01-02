unit JSGiaSP.Export.Registro30;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Base,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSGiaSPExportRegistro30 = class(TJSGiaSPExportBase, IJSGiaSPExport)

  private
    FReg30: TJSGiaSPModelRegistro30;

  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; override;

end;

implementation

{ TJSGiaSPExportRegistro30 }

function TJSGiaSPExportRegistro30.linhaGiaSP(AModel: TJSGiaSPModelRegistro): string;
begin
  validateInstance<TJSGiaSPModelRegistro30>(AModel, FReg30);

  Result := FReg30.reg +
            JSGF.PadL(FReg30.codDip,2,'0') +
            JSGF.PadL(FReg30.municipio,5,'0') +
            JSGF.formatCurrency(FReg30.valor);
end;

end.
