unit JSGiaSP.Model.Registro14;

interface

uses
  JSGiaSP.Model.Registro,
  System.Generics.Defaults;

type
  TJSGiaSPModelRegistro14 = class(TJSGiaSPModelRegistro)
  private
    FoutrosProdutos: Currency;
    Fbenef: string;
    FicmsCobradoST: Currency;
    FvalorContabil1: Currency;
    FvalorContabil2: Currency;
    Fuf: string;
    Fq18: Integer;
    Foutras: Currency;
    FpetroleoEnergia: Currency;
    FbaseCalculo1: Currency;
    FbaseCalculo2: Currency;
    Fimposto: Currency;

  public
    property uf                      : string     read Fuf                write Fuf;
    property valorContabil1          : Currency   read FvalorContabil1    write FvalorContabil1;
    property baseCalculo1            : Currency   read FbaseCalculo1      write FbaseCalculo1;
    property valorContabil2          : Currency   read FvalorContabil2    write FvalorContabil2;
    property baseCalculo2            : Currency   read FbaseCalculo2      write FbaseCalculo2;
    property imposto                 : Currency   read Fimposto           write Fimposto;
    property outras                  : Currency   read Foutras            write Foutras;
    property icmsCobradoST           : Currency   read FicmsCobradoST     write FicmsCobradoST;
    property petroleoEnergia         : Currency   read FpetroleoEnergia   write FpetroleoEnergia;
    property outrosProdutos          : Currency   read FoutrosProdutos    write FoutrosProdutos;
    property benef                   : string     read Fbenef             write Fbenef;
    property q18                     : Integer    read Fq18               write Fq18;

    class function getComparer: IComparer<TJSGiaSPModelRegistro14>;

    constructor create; override;
  end;


implementation

{ TJSGiaSPModelRegistro14 }

constructor TJSGiaSPModelRegistro14.create;
begin
  inherited;
  reg := '14';
end;

class function TJSGiaSPModelRegistro14.getComparer: IComparer<TJSGiaSPModelRegistro14>;
begin
  result := TComparer<TJSGiaSPModelRegistro14>.Construct(
    function(const Left, Right: TJSGiaSPModelRegistro14): Integer
    begin
      if Left.uf < Right.uf then
        Result := -1
      else if Left.uf > Right.uf then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
