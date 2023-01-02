unit JSGiaSP.Service.Factory;

interface

uses
  JSGiaSP.Service.Interfaces,
  JSGiaSP.Service.Base;

type
  TJSGiaSPServiceFactory = class(TInterfacedObject, IJSGiaSPServiceFactory)
  public
    function createService: IJSGiaSPService;

    class function New: IJSGiaSPServiceFactory;
  end;

implementation

{ TJSGiaSPServiceFactory }

function TJSGiaSPServiceFactory.createService: IJSGiaSPService;
begin
  result := TJSGiaSPService.New;
end;

class function TJSGiaSPServiceFactory.New: IJSGiaSPServiceFactory;
begin
  result := Self.Create;
end;

end.
