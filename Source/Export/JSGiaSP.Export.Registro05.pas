unit JSGiaSP.Export.Registro05;

interface

uses
  JSGiaSP.Export.Interfaces,
  JSGiaSP.Export.Base,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Format,
  JSGiaSP.Model.Types,
  System.SysUtils;

type
  TJSGiaSPExportRegistro05 = class(TJSGiaSPExportBase, IJSGiaSPExport)
  private
    FReg05: TJSGiaSPModelRegistro05;

  protected
    function linhaGiaSP(AModel: TJSGiaSPModelRegistro): string; override;
  end;

implementation

{ TJSGiaSPExportRegistro05 }

function TJSGiaSPExportRegistro05.linhaGiaSP(
  AModel: TJSGiaSPModelRegistro): string;
begin
  validateInstance<TJSGiaSPModelRegistro05>(AModel, FReg05);

  Result := FReg05.reg +
            JSGF.PadL(FReg05.ie,12,'0') +
            FReg05.cnpj +
            JSGF.PadL(FReg05.cnae,7,'0') +
            FReg05.regTrib.toString +
            FReg05.ref +
            FReg05.refInicial +
            FReg05.tipo.toString +
            FReg05.movimento.toString +
            FReg05.transmitida +
            JSGF.formatCurrency(FReg05.saldoCredPeriodoAnt) +
            JSGF.formatCurrency(FReg05.saldoCredPeriodoAntST) +
            FReg05.origemSoftware +
            FReg05.origemPreDig +
            JSGF.formatCurrency(FReg05.icmsFixPer) +
            JSGF.PadR(FReg05.chaveInterna,32,'0') +
            JSGF.PadL(FReg05.q07,4,'0') +
            JSGF.PadL(FReg05.q10,4,'0') +
            JSGF.PadL(FReg05.q20,4,'0') +
            JSGF.PadL(FReg05.q30,4,'0') +
            JSGF.PadL(FReg05.q31,4,'0');

end;

end.
