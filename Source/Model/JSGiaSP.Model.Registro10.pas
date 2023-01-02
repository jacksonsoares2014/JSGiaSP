unit JSGiaSP.Model.Registro10;

interface

uses
  JSGiaSP.Model.Registro,
  System.Generics.Defaults;

type
  TJSGiaSPModelRegistro10 = class(TJSGiaSPModelRegistro)
  private
    FimpostoRetSubstituido: Currency;
    FimpostoRetSubstitutoST: Currency;
    FoutrosImpostos: Currency;
    FimpostoRetidoST: Currency;
    FvalorContabil: Currency;
    Fcfop: string;
    Fq14: Integer;
    Foutras: Currency;
    FisentasNaoTrib: Currency;
    FbaseCalculo: Currency;
    Fimposto: Currency;

  public
    property cfop                    : string     read Fcfop                   write Fcfop;
    property valorContabil           : Currency   read FvalorContabil          write FvalorContabil;
    property baseCalculo             : Currency   read FbaseCalculo            write FbaseCalculo;
    property imposto                 : Currency   read Fimposto                write Fimposto;
    property isentasNaoTrib          : Currency   read FisentasNaoTrib         write FisentasNaoTrib;
    property outras                  : Currency   read Foutras                 write Foutras;
    property impostoRetidoST         : Currency   read FimpostoRetidoST        write FimpostoRetidoST;
    property impostoRetSubstitutoST  : Currency   read FimpostoRetSubstitutoST write FimpostoRetSubstitutoST;
    property impostoRetSubstituido   : Currency   read FimpostoRetSubstituido  write FimpostoRetSubstituido;
    property outrosImpostos          : Currency   read FoutrosImpostos         write FoutrosImpostos;
    property q14                     : Integer    read Fq14                      write Fq14;

    class function getComparer: IComparer<TJSGiaSPModelRegistro10>;

    constructor create; override;
  end;


implementation

{ TJSGiaSPModelRegistro10 }

constructor TJSGiaSPModelRegistro10.create;
begin
  inherited;
  reg := '10';
end;

class function TJSGiaSPModelRegistro10.getComparer: IComparer<TJSGiaSPModelRegistro10>;
begin
  result := TComparer<TJSGiaSPModelRegistro10>.Construct(
    function(const Left, Right: TJSGiaSPModelRegistro10): Integer
    begin
      if Left.cfop < Right.cfop then
        Result := -1
      else if Left.cfop > Right.cfop then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
