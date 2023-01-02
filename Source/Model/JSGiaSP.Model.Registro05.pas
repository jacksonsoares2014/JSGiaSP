unit JSGiaSP.Model.Registro05;

interface

uses
  JSGiaSP.Model.Types,
  JSGiaSP.Model.Registro;

type
  TJSGiaSPModelRegistro05 = class(TJSGiaSPModelRegistro)
  private
    Fcnae: string;
    Fcnpj: string;
    FicmsFixPer: Currency;
    FsaldoCredPeriodoAntST: Currency;
    Fq20: Integer;
    Fq30: Integer;
    Fq31: Integer;
    ForigemSoftware: string;
    Fq10: Integer;
    FregTrib: TJSGiaSPRegimeTributario;
    Fq07: Integer;
    FchaveInterna: string;
    FrefInicial: string;
    Fref: string;
    Fie: string;
    FsaldoCredPeriodoAnt: Currency;
    ForigemPreDig: string;
    Ftransmitida: string;
    Ftipo: TJSGiaSPTipoGia;
    Fmovimento: TJSGiaSPMovimento;

  public
    property ie                    : string                   read Fie                    write Fie;
    property cnpj                  : string                   read Fcnpj                  write Fcnpj;
    property cnae                  : string                   read Fcnae                  write Fcnae;
    property regTrib               : TJSGiaSPRegimeTributario read FregTrib               write FregTrib;
    property ref                   : string                   read Fref                   write Fref;
    property refInicial            : string                   read FrefInicial            write FrefInicial;
    property tipo                  : TJSGiaSPTipoGia          read Ftipo                  write Ftipo;
    property movimento             : TJSGiaSPMovimento        read Fmovimento             write Fmovimento;
    property transmitida           : string                   read Ftransmitida           write Ftransmitida;
    property saldoCredPeriodoAnt   : Currency                 read FsaldoCredPeriodoAnt   write FsaldoCredPeriodoAnt;
    property saldoCredPeriodoAntST : Currency                 read FsaldoCredPeriodoAntST write FsaldoCredPeriodoAntST;
    property origemSoftware        : string                   read ForigemSoftware        write ForigemSoftware;
    property origemPreDig          : string                   read ForigemPreDig          write ForigemPreDig;
    property icmsFixPer            : Currency                 read FicmsFixPer            write FicmsFixPer;
    property chaveInterna          : string                   read FchaveInterna          write FchaveInterna;
    property q07                   : Integer                  read Fq07                   write Fq07;
    property q10                   : Integer                  read Fq10                   write Fq10;
    property q20                   : Integer                  read Fq20                   write Fq20;
    property q30                   : Integer                  read Fq30                   write Fq30;
    property q31                   : Integer                  read Fq31                   write Fq31;

    constructor create; override;
  end;


implementation

{ TJSGiaSPModelRegistro05 }

constructor TJSGiaSPModelRegistro05.create;
begin
  inherited;
  reg := '05';
end;

end.
