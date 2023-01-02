unit JSGiaSP.Model.Registro30;

interface

uses
  JSGiaSP.Model.Registro,
  System.Generics.Defaults;

type
  TJSGiaSPModelRegistro30 = class(TJSGiaSPModelRegistro)
  private
    FcodDip: string;
    Fvalor: Currency;
    Fmunicipio: string;

  public
    property codDip     : string     read FcodDip     write FcodDip;
    property municipio  : string     read Fmunicipio  write Fmunicipio;
    property valor      : Currency   read Fvalor      write Fvalor;

    class function getComparer: IComparer<TJSGiaSPModelRegistro30>;

    constructor create; override;
  end;


implementation

{ TJSGiaSPModelRegistro30 }

constructor TJSGiaSPModelRegistro30.create;
begin
  inherited;
  reg := '30';
end;

class function TJSGiaSPModelRegistro30.getComparer: IComparer<TJSGiaSPModelRegistro30>;
begin
  result := TComparer<TJSGiaSPModelRegistro30>.Construct(
    function(const Left, Right: TJSGiaSPModelRegistro30): Integer
    var LChave, RChave: string;
    begin
      LChave := Left.codDip + Left.municipio;
      RChave := Right.codDip + Right.municipio;

      if LChave < RChave then
        Result := -1
      else if LChave > RChave then
        Result := 1
      else
        Result := 0;
    end);
end;

end.
