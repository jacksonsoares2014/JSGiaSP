unit JSGiaSP.Model.Format;

interface

uses
  System.SysUtils;

type
  TJSGiaSPFormat = class
  public
    class function formatData    (AValue: TDateTime): String;
    class function formatHora    (AValue: TDateTime): String;
    class function formatCurrency(AValue: Double; ATam: Integer = 15): String;
    class function PadL(AValue: Integer; ATam: Integer; ACaracter: Char): String; overload;
    class function PadL(AValue: String; ATam: Integer; ACaracter: Char): String; overload;
    class function PadR(AValue: Integer; ATam: Integer; ACaracter: Char): String; overload;
    class function PadR(AValue: String; ATam: Integer; ACaracter: Char): String; overload;

//    class function formatNumber  (AValue: Double): string;
  end;

  JSGF = class(TJSGiaSPFormat);


implementation

{ TJSGiaSPFormat }

class function TJSGiaSPFormat.formatCurrency(AValue: Double; ATam: Integer): String;
begin
  Result := StringReplace( StringReplace( FormatFloat('########0.00', AValue) ,'.','',[rfReplaceAll]),',','',[rfReplaceAll]);
  Result := PadL(Result,Atam,'0');
end;

class function TJSGiaSPFormat.formatData(AValue: TDateTime): String;
begin
  Result := EmptyStr;
  if AValue > 0 then
    result := FormatDateTime('yyyyMMdd', AValue);
end;

class function TJSGiaSPFormat.formatHora(AValue: TDateTime): String;
begin
  Result := EmptyStr;
  if AValue > 0 then
    result := FormatDateTime('hhmmss', AValue);
end;

class function TJSGiaSPFormat.PadL(AValue: String; ATam: Integer; ACaracter: Char): String;
begin
  Result := Copy(AValue,1,ATam);
  Result := StringOfChar(ACaracter, (Atam - Length(Result))) + Result;
end;

class function TJSGiaSPFormat.PadR(AValue: String; ATam: Integer;  ACaracter: Char): String;
begin
  Result := Copy(AValue,1,ATam);
  Result := Result + StringOfChar(ACaracter, (Atam - Length(Result)));
end;

class function TJSGiaSPFormat.PadR(AValue, ATam: Integer; ACaracter: Char): String;
begin
  Result := PadR(IntToStr(AValue), ATam, ACaracter);
end;

class function TJSGiaSPFormat.PadL(AValue, ATam: Integer; ACaracter: Char): String;
begin
  Result := PadL(IntToStr(AValue), ATam, ACaracter);
end;

end.
