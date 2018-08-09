unit USender2;

interface

uses
  WinHTTP_XE;

type
  THttpSender = class
    public
      class function NewInstance: TObject; override;
      procedure FreeInstance; override;
      class function RefCount: Integer;
    public
      function Send(sUrl: String; sPostData: string; var sResultString: String): Boolean;
      function SendA(sUrl: String; sPostData: Ansistring; var sResultString: AnsiString): Boolean;
  end;

function HTTPSender: THttpSender;

implementation

uses
  System.SysUtils, Winapi.Windows;

var
  instance: THttpSender = nil;
  nRef_Count: Integer = 0;


function HTTPSender: THttpSender;
begin
  Result := instance;
end;

{ THttpSender }

procedure THttpSender.FreeInstance;
begin
  Dec(nRef_Count);
  if (nRef_Count = 0) then
  begin
    instance := nil;
    Inherited FreeInstance;
  end;
end;

class function THttpSender.NewInstance: TObject;
begin
  if not Assigned(instance) then
    instance := THttpSender(inherited NewInstance);

  Result := instance;
  Inc(nRef_Count);
end;

class function THttpSender.RefCount: Integer;
begin
  Result := nRef_Count;
end;

function THttpSender.Send(sUrl, sPostData: string; var sResultString: String): Boolean;
var
  http: TWinHTTP;
begin
  http := TWinHTTP.Create(nil);
  http.AnsiMode := False;
  Http.Timeouts.ConnectTimeout := 500;
  Http.Timeouts.ReceiveTimeout := 500;
  Http.Timeouts.SendTimeout := 500;
  http.URL := sUrl;
  http.POSTData := sPostData;
  Result := http.Read(True);
  sResultString := String(http.ResultString);
  http.Free;
end;

function THttpSender.SendA(sUrl: String; sPostData: Ansistring;
  var sResultString: AnsiString): Boolean;
var
  http: TWinHTTP;
begin
  http := TWinHTTP.Create(nil);
  http.AnsiMode := True;
  Http.Timeouts.ConnectTimeout := 500;
  Http.Timeouts.ReceiveTimeout := 500;
  Http.Timeouts.SendTimeout := 500;
  http.URL := sUrl;
  http.POSTDataA := sPostData;
  Result := http.Read(True);
  sResultString := AnsiString(http.ResultString);
  http.Free;
end;

initialization
  instance := THttpSender.Create;
finalization
  FreeAndNil(instance);


end.
