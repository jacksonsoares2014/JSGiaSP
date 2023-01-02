unit JSGiaSP.Export.Registro14;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Base,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Format,
  System.SysUtils;

type
  TJSGiaSPExportRegistro14 = class(TJSGiaSPExportBase, IJSGiaSPExport)
  private
    FReg14: TJSGiaSPModelRegistro14;

  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; override;
  end;

implementation

{ TJSGiaSPExportRegistro14 }

function TJSGiaSPExportRegistro14.linhaGiaSP(
  AModel: TJSGiaSPModelRegistro): string;
begin
  validateInstance<TJSGiaSPModelRegistro14>(AModel, FReg14);

  Result := FReg14.reg +
            FReg14.uf +
            JSGF.formatCurrency(FReg14.valorContabil1) +
            JSGF.formatCurrency(FReg14.baseCalculo1) +
            JSGF.formatCurrency(FReg14.valorContabil2) +
            JSGF.formatCurrency(FReg14.baseCalculo2) +
            JSGF.formatCurrency(FReg14.imposto) +
            JSGF.formatCurrency(FReg14.outras) +
            JSGF.formatCurrency(FReg14.icmsCobradoST) +
            JSGF.formatCurrency(FReg14.petroleoEnergia) +
            JSGF.formatCurrency(FReg14.outrosProdutos) +
            FReg14.benef +
            JSGF.PadL(FReg14.q18,4,'0');

end;

end.
