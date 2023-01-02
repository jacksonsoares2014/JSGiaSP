unit JSGiaSP.Export.Registro10;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Base,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Format,
  System.SysUtils;

type
  TJSGiaSPExportRegistro10 = class(TJSGiaSPExportBase, IJSGiaSPExport)
  private
    FReg10: TJSGiaSPModelRegistro10;

  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; override;
  end;

implementation

{ TJSGiaSPExportRegistro10 }

function TJSGiaSPExportRegistro10.linhaGiaSP(
  AModel: TJSGiaSPModelRegistro): string;
begin
  validateInstance<TJSGiaSPModelRegistro10>(AModel, FReg10);

  Result := FReg10.reg +
            JSGF.PadR(FReg10.cfop,6,'0') +
            JSGF.formatCurrency(FReg10.valorContabil) +
            JSGF.formatCurrency(FReg10.baseCalculo) +
            JSGF.formatCurrency(FReg10.imposto) +
            JSGF.formatCurrency(FReg10.isentasNaoTrib) +
            JSGF.formatCurrency(FReg10.outras) +
            JSGF.formatCurrency(FReg10.impostoRetidoST) +
            JSGF.formatCurrency(FReg10.impostoRetSubstitutoST) +
            JSGF.formatCurrency(FReg10.impostoRetSubstituido) +
            JSGF.formatCurrency(FReg10.outrosImpostos) +
            JSGF.PadL(FReg10.q14,4,'0');
end;

end.
