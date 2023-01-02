unit JSGiaSP.DAO.Interfaces;

interface

uses
  System.Generics.Collections,
  JSGiaSP.Model.Classes;

type
  IJSGiaSPDAORegistro10 = interface
    ['{9FAA1D2F-F425-4B70-AB09-9B86E55853F8}']
    function listReg10(ADataUnicial, ADataFinal: TDateTime): TObjectList<TJSGiaSPModelRegistro10>;
  end;

  IJSGiaSPDAORegistro14 = interface
    ['{FE52FCD6-A1DD-49AA-97C0-340A3D9D5372}']
    function listReg14(ACfop: string): TObjectList<TJSGiaSPModelRegistro14>;
  end;

  IJSGiaSPDAORegistro20 = interface
    ['{B902446B-E41F-4B97-B8BF-5EC3152DC3CC}']
    function load: TJSGiaSPModelRegistro20;
  end;

  IJSGiaSPDAORegistro30 = interface
    ['{D7149AEB-3667-45C1-ACB9-A3238D6EA702}']
    function listReg30: TObjectList<TJSGiaSPModelRegistro30>;
  end;

implementation

end.
