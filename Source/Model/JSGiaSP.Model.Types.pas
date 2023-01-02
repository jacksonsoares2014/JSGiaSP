unit JSGiaSP.Model.Types;

interface

type
  TJSGiaSPRegimeTributario = (rtRPA, rtRES, rtRPADispensado, rtSimplesST);
  TJSGiaSPTipoGia = (tgNormal, tgSubstitutiva, tgColigida);
  TJSGiaSPMovimento = (tmNao, tmSim);

  TJSGiaSPRegimeTributarioHelper = record helper for TJSGiaSPRegimeTributario
  public
    function toString: string;
  end;

  TJSGiaSPTipoGiaHelper = record helper for TJSGiaSPTipoGia
  public
    function toString: string;
  end;

  TJSGiaSPMovimentoHelper = record helper for TJSGiaSPMovimento
  public
    function toString: string;
  end;

implementation

{ TJSGiaSPRegimeTributarioHelper }

function TJSGiaSPRegimeTributarioHelper.toString: string;
begin
  case self of
    rtRPA           : Result := '01';
    rtRES           : Result := '02';
    rtRPADispensado : Result := '03';
    rtSimplesST     : Result := '04';
  end;
end;

{ TJSGiaSPTipoGiaHelper }

function TJSGiaSPTipoGiaHelper.toString: string;
begin
  case self of
    tgNormal       : Result := '01';
    tgSubstitutiva : Result := '02';
    tgColigida     : Result := '03';
  end;
end;

{ TJSGiaSPMovimentoHelper }

function TJSGiaSPMovimentoHelper.toString: string;
begin
  case self of
    tmNao : Result := '0';
    tmSim : Result := '1';
  end;
end;

end.
