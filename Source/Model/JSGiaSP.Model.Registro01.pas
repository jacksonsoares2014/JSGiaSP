unit JSGiaSP.Model.Registro01;

interface

uses
  JSGiaSP.Model.Registro;

type
  TJSGiaSPModelRegistro01 = class(TJSGiaSPModelRegistro)
  private
    FversaoFrontEnd: string;
    FversaoPref: string;
    FdataGeracao: TDateTime;
    Fq05: Integer;
    FtipoDocto: string;
    FhoraGeracao: TDateTime;

  public
    property tipoDocto         : string     read FtipoDocto      write FtipoDocto;
    property dataGeracao       : TDateTime  read FdataGeracao    write FdataGeracao;
    property horaGeracao       : TDateTime  read FhoraGeracao    write FhoraGeracao;
    property versaoFrontEnd    : string     read FversaoFrontEnd write FversaoFrontEnd;
    property versaoPref        : string     read FversaoPref     write FversaoPref;
    property q05               : Integer    read Fq05            write Fq05;

    constructor create; override;
  end;


implementation

{ TJSGiaSPModelRegistro01 }

constructor TJSGiaSPModelRegistro01.create;
begin
  inherited;
  reg := '01';
end;

end.
