unit JSGiaSP.Export.Registro20;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Base,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Format,
  System.Generics.Collections,
  System.SysUtils;

type TJSGiaSPExportRegistro20 = class(TJSGiaSPExportBase, IJSGiaSPExport)

  private
    FReg20: TJSGiaSPModelRegistro20;

  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; override;

end;

implementation

{ TJSGiaSPExportRegistro20 }

function TJSGiaSPExportRegistro20.linhaGiaSP(AModel: TJSGiaSPModelRegistro): string;
begin
  validateInstance<TJSGiaSPModelRegistro20>(AModel, FReg20);

  Result := FReg20.reg +
            JSGF.PadL(FReg20.codSubItem,5,'0') +
            JSGF.formatCurrency(FReg20.valor) +
            FReg20.propriaOuST +
            JSGF.PadR(FReg20.legal,100,' ') +
            JSGF.PadR(FReg20.ocorrencia,300,' ') +
            JSGF.PadL(FReg20.q25,4,'0') +
            JSGF.PadL(FReg20.q26,4,'0') +
            JSGF.PadL(FReg20.q27,4,'0') +
            JSGF.PadL(FReg20.q28,4,'0');

end;

end.
