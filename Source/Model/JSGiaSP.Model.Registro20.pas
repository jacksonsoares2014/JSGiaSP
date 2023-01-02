unit JSGiaSP.Model.Registro20;

interface

uses
  JSGiaSP.Model.Registro;

type
  TJSGiaSPModelRegistro20 = class(TJSGiaSPModelRegistro)
  private
    Fq28: Integer;
    Focorrencia: string;
    Fvalor: Currency;
    FpropriaOuST: string;
    FcodSubItem: string;
    Fq26: Integer;
    Fq27: Integer;
    Flegal: string;
    Fq25: Integer;

  public
    property codSubItem         : string     read FcodSubItem     write FcodSubItem;
    property valor              : Currency   read Fvalor          write Fvalor;
    property propriaOuST        : string     read FpropriaOuST    write FpropriaOuST;
    property legal              : string     read Flegal          write Flegal;
    property ocorrencia         : string     read Focorrencia     write Focorrencia;
    property q25                : Integer    read Fq25            write Fq25;
    property q26                : Integer    read Fq26            write Fq26;
    property q27                : Integer    read Fq27            write Fq27;
    property q28                : Integer    read Fq28            write Fq28;

    constructor create; override;
  end;


implementation

{ TJSGiaSPModelRegistro20 }

constructor TJSGiaSPModelRegistro20.create;
begin
  inherited;
  reg := '20';
end;

end.
