unit JSGiaSP.Service.Interfaces;

interface

uses
  JSGiaSP.DAO.Interfaces,
  JSGiaSP.Model.Classes,
  JSGiaSP.Model.Types,
  System.Classes,
  System.Generics.Collections;

type
  TOnGiaSPAddRegistro = reference to procedure (Registro: TJSGiaSPModelRegistro);
  TOnLogErro = reference to procedure (ALogErro: String);

  IJSGiaSPEmitente = interface;
  IJSGiaSPConfig<I: IInterface> = interface;
  IJSGiaSPDAOCollection = interface;

  IJSGiaSPService = interface
    ['{242F5051-17BA-44A8-9475-09680E723429}']
    function Emitente: IJSGiaSPEmitente;
    function Config  : IJSGiaSPConfig<IJSGiaSPService>;
    function DAO     : IJSGiaSPDAOCollection;

    function Execute: IJSGiaSPService;
  end;

  IJSGiaSPServiceRegistros = interface
    ['{9ADBE702-8FAD-46B7-A09C-189A8B5A0251}']
    function Execute: TStrings;

    function &End: IJSGiaSPService;
  end;

  IJSGiaSPConfig<I: IInterface> = interface
    ['{22110DF1-92F4-407C-8E97-9693CEA27BFB}']
    function DataInicial            (Value: TDateTime)                                         : IJSGiaSPConfig<I>; overload;
    function DataFinal              (Value: TDateTime)                                         : IJSGiaSPConfig<I>; overload;
    function NomeArquivo            (Value: string)                                            : IJSGiaSPConfig<I>; overload;
    function Movimento              (Value: TJSGiaSPMovimento)                                 : IJSGiaSPConfig<I>; overload;
    function TipoGia                (Value: TJSGiaSPTipoGia)                                   : IJSGiaSPConfig<I>; overload;
    function RegimeTributario       (Value: TJSGiaSPRegimeTributario)                          : IJSGiaSPConfig<I>; overload;
    function GerarRelatorio         (Value: Boolean)                                           : IJSGiaSPConfig<I>; overload;

    function DataInicial            : TDateTime;                                        overload;
    function DataFinal              : TDateTime;                                        overload;
    function NomeArquivo            : string;                                           overload;
    function Movimento              : TJSGiaSPMovimento;                                overload;
    function TipoGia                : TJSGiaSPTipoGia;                                  overload;
    function RegimeTributario       : TJSGiaSPRegimeTributario;                         overload;
    function GerarRelatorio         : Boolean;                                          overload;

    function OnAddRegistro(Value: TOnGiaSPAddRegistro): IJSGiaSPConfig<I>; overload;
    function OnAddRegistro: TOnGiaSPAddRegistro; overload;

    function OnLogErro(Value: TOnLogErro): IJSGiaSPConfig<I>; overload;
    function OnLogErro: TOnLogErro; overload;

    function &Begin: IJSGiaSPConfig<I>;
    function &End: I;
  end;

  IJSGiaSPEmitente = interface
    ['{C1F24FA2-5DA1-4048-88AA-E41AAB086C10}']
    function CNPJ             (Value: String): IJSGiaSPEmitente; overload;
    function IncricaoEstadual (Value: String): IJSGiaSPEmitente; overload;
    function Nome             (Value: String): IJSGiaSPEmitente; overload;
    function CNAE             (Value: String): IJSGiaSPEmitente; overload;

    function CNPJ              : string; overload;
    function IncricaoEstadual  : string; overload;
    function Nome              : string; overload;
    function CNAE              : string; overload;

    function &End: IJSGiaSPService;
  end;

  IJSGiaSPServiceFactory = interface
    ['{D8E1B641-EF9A-4D75-983F-7A0116A920C2}']
    function createService: IJSGiaSPService;
  end;

  IJSGiaSPDAOCollection = interface
    ['{A81AFCE2-9194-487C-AE46-2698ED59EFD7}']
    function AddRegistro10        (Value: IJSGiaSPDAORegistro10)        : IJSGiaSPDAOCollection;
    function AddRegistro14        (Value: IJSGiaSPDAORegistro14)        : IJSGiaSPDAOCollection;
    function AddRegistro20        (Value: IJSGiaSPDAORegistro20)        : IJSGiaSPDAOCollection;
    function AddRegistro30        (Value: IJSGiaSPDAORegistro30)        : IJSGiaSPDAOCollection;

    function DAORegistro10        : IJSGiaSPDAORegistro10;
    function DAORegistro14        : IJSGiaSPDAORegistro14;
    function DAORegistro20        : IJSGiaSPDAORegistro20;
    function DAORegistro30        : IJSGiaSPDAORegistro30;

    function &Begin: IJSGiaSPDAOCollection;
    function &End: IJSGiaSPService;
  end;

function GiaSPServiceFactory: IJSGiaSPServiceFactory;
function GiaSPService: IJSGiaSPService;

implementation

uses
  JSGiaSP.Service.Factory;

function GiaSPService: IJSGiaSPService;
begin
  result := GiaSPServiceFactory.createService;
end;

function GiaSPServiceFactory: IJSGiaSPServiceFactory;
begin
  Result := TJSGiaSPServiceFactory.New;
end;

end.
