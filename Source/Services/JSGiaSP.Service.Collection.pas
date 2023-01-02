unit JSGiaSP.Service.Collection;

interface

uses
  JSGiaSP.DAO.Interfaces,
  JSGiaSP.Service.Interfaces;

type
  TJSGiaSPServiceCollection = class(TInterfacedObject, IJSGiaSPDAOCollection)
  private
    [weak]
    FJSGiaSPService        : IJSGiaSPService;

    FDAORegistro10        : IJSGiaSPDAORegistro10;
    FDAORegistro14        : IJSGiaSPDAORegistro14;
    FDAORegistro20        : IJSGiaSPDAORegistro20;
    FDAORegistro30        : IJSGiaSPDAORegistro30;
  public
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

    constructor create(JSGiaSPService: IJSGiaSPService);
    class function New(JSGiaSPService: IJSGiaSPService): IJSGiaSPDAOCollection;
  end;

implementation

{ TJSGiaSPServiceCollection }

function TJSGiaSPServiceCollection.AddRegistro10(
  Value: IJSGiaSPDAORegistro10): IJSGiaSPDAOCollection;
begin
  result         := Self;
  FDAORegistro10 := Value;
end;

function TJSGiaSPServiceCollection.AddRegistro14(
  Value: IJSGiaSPDAORegistro14): IJSGiaSPDAOCollection;
begin
  result         := Self;
  FDAORegistro14 := Value;
end;

function TJSGiaSPServiceCollection.AddRegistro20(
  Value: IJSGiaSPDAORegistro20): IJSGiaSPDAOCollection;
begin
  result         := Self;
  FDAORegistro20 := Value;
end;

function TJSGiaSPServiceCollection.AddRegistro30(
  Value: IJSGiaSPDAORegistro30): IJSGiaSPDAOCollection;
begin
  result         := Self;
  FDAORegistro30 := Value;
end;

function TJSGiaSPServiceCollection.&Begin: IJSGiaSPDAOCollection;
begin
  result := Self;
end;

constructor TJSGiaSPServiceCollection.create(JSGiaSPService: IJSGiaSPService);
begin
  FJSGiaSPService := JSGiaSPService;
end;

function TJSGiaSPServiceCollection.DAORegistro10: IJSGiaSPDAORegistro10;
begin
  Result := FDAORegistro10;
end;

function TJSGiaSPServiceCollection.DAORegistro14: IJSGiaSPDAORegistro14;
begin
  Result := FDAORegistro14;
end;

function TJSGiaSPServiceCollection.DAORegistro20: IJSGiaSPDAORegistro20;
begin
  Result := FDAORegistro20;
end;

function TJSGiaSPServiceCollection.DAORegistro30: IJSGiaSPDAORegistro30;
begin
  Result := FDAORegistro30;
end;

function TJSGiaSPServiceCollection.&End: IJSGiaSPService;
begin
  result := FJSGiaSPService;
end;

class function TJSGiaSPServiceCollection.New(
  JSGiaSPService: IJSGiaSPService): IJSGiaSPDAOCollection;
begin
  result := Self.Create(JSGiaSPService);
end;

end.
