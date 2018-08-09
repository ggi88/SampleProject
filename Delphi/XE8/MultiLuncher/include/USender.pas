unit USender;

interface

uses
  WinHTTP_XE, UCommonFunc,

  Winapi.Windows, Vcl.Forms, System.Classes, System.SysUtils;

type
  TSender = class(TObject)
  private
    bLoad: Boolean;
    m_sRst: String;
    m_sRstAnsi: Ansistring;
    m_sPath: AnsiString;
    procedure OnSenderDone(Sender: TObject; const ContentType: string; FileSize: Integer; Stream: TStream);
    procedure OnSenderDoneA(Sender: TObject; const ContentType: string; FileSize: Integer; Stream: TStream);
    procedure OnSenderDoneDownload(Sender: TObject; const ContentType: string; FileSize: Integer; Stream: TStream);
    procedure OnSenderWaitTimeoutExpired(Sender: TObject; var TerminateThread: Boolean);
    procedure OnSenderHTTPError(Sender: TObject; ErrorCode: Integer; Stream: TStream);
    procedure OnSenderConnLost(Sender: TObject; const ContentType: string; FileSize, BytesRead: Integer;
      Stream: TStream);
    procedure OnSenderAnyError(Sender: TObject);
  public
    function Send(sUrl: String; sPost: String; var sRst: String): Boolean;
    function SendA(sUrl: String; sPost: AnsiString; var sRst: AnsiString): Boolean;
    function Download(sUrl: String; sPost: AnsiString; sPath: String): Boolean;
  end;

function HTTPSender: TSender;

implementation

var
  m_Sender: TSender;

function HTTPSender: TSender;
begin
  Result := m_Sender;
end;

{ TSender }

procedure TSender.OnSenderConnLost(Sender: TObject; const ContentType: string; FileSize, BytesRead: Integer; Stream: TStream);
begin
  bLoad := False;
  OutputDebugString(PChar('ConnLost = ' + TWinHTTP(Sender).URL));
end;

procedure TSender.OnSenderHTTPError(Sender: TObject; ErrorCode: Integer; Stream: TStream);
begin
  bLoad := False;
  OutputDebugString(PChar('HttpErr = ' + TWinHTTP(Sender).URL));
end;

procedure TSender.OnSenderDone(Sender: TObject; const ContentType: string;
  FileSize: Integer; Stream: TStream);
var
  sRst: String;
begin
  try
    if Stream = nil then
      Exit;

    with Stream as TMemoryStream do
    begin
      SetLength(sRst, Size);
      Stream.Read(sRst[1], Size); // or Move(Memory^, Str[1], Size);
    end;
  finally
    m_sRst := sRst;
    bLoad := False;
  end;
end;

procedure TSender.OnSenderDoneA(Sender: TObject; const ContentType: string; FileSize: Integer; Stream: TStream);
var
  sRstAnsi: AnsiString;
begin
  try
    if Stream = nil then
      Exit;

    with Stream as TMemoryStream do
    begin
      SetLength(sRstAnsi, Size);
      Stream.Read(sRstAnsi[1], Size); // or Move(Memory^, Str[1], Size);
    end;
  finally
    m_sRstAnsi := sRstAnsi;
    bLoad := False;
  end;
end;

procedure TSender.OnSenderDoneDownload(Sender: TObject;
  const ContentType: string; FileSize: Integer; Stream: TStream);
begin
  try
    if Stream = nil then
      Exit;

    with Stream as TMemoryStream do
    begin
      SaveToFile(String(m_sPath));
    end;
  finally
    bLoad := False;
  end;
end;

procedure TSender.OnSenderWaitTimeoutExpired(Sender: TObject; var TerminateThread: Boolean);
begin
  bLoad := False;
  OutputDebugString(PChar('Timeout'));
end;

function TSender.Send(sUrl, sPost: String; var sRst: String): Boolean;
var
  http: TWinHTTP;
begin
  bLoad := True;
  m_sRst := '';

  DoSmartPointer(TObject(Http), TWinHTTP.Create(nil));
  Http.AnsiMode := False;
  Http.Timeouts.ConnectTimeout := 500;
  Http.Timeouts.ReceiveTimeout := 500;
  Http.Timeouts.SendTimeout := 500;
  Http.OnDone := OnSenderDone;
  Http.OnWaitTimeoutExpired := OnSenderWaitTimeoutExpired;
  Http.OnHTTPError := OnSenderHTTPError;
  Http.OnConnLost := OnSenderConnLost;
  Http.OnAnyError := OnSenderAnyError;
  Http.URL := sUrl;
  Http.POSTData := UTF8String(sPost);
  Http.Read(False);
  while True do
  begin
    if (not bLoad) and (not http.Busy) then
      Break;

    Application.ProcessMessages;
    Sleep(1);
  end;

  Result := Http.HTTPErrorCode = 200;
  sRst := m_sRst;
end;

function TSender.SendA(sUrl:String; sPost: AnsiString; var sRst: AnsiString): Boolean;
var
  http: TWinHTTP;
begin
  bLoad := True;
  m_sRstAnsi := '';

  DoSmartPointer(TObject(Http), TWinHTTP.Create(nil));
  Http.AnsiMode := True;
  Http.Timeouts.ConnectTimeout := 500;
  Http.Timeouts.ReceiveTimeout := 500;
  Http.Timeouts.SendTimeout := 500;
  Http.OnDone := OnSenderDoneA;
  Http.OnWaitTimeoutExpired := OnSenderWaitTimeoutExpired;
  Http.OnHTTPError := OnSenderHTTPError;
  Http.OnConnLost := OnSenderConnLost;
  Http.OnAnyError := OnSenderAnyError;
  Http.URL := sUrl;
  Http.POSTDataA := sPost;
  Http.Read(False);
  while True do
  begin
    if (not bLoad) and (not http.Busy) then
      Break;

    Application.ProcessMessages;
    Sleep(1);
  end;

  Result := Http.HTTPErrorCode = 200;
  sRst := m_sRstAnsi;
end;

function TSender.Download(sUrl: String; sPost: AnsiString;
  sPath: String): Boolean;
var
  http: TWinHTTP;
begin
  bLoad := True;
  m_sPath := AnsiString(sPath);
  DoSmartPointer(TObject(Http), TWinHTTP.Create(nil));
  Http.AnsiMode := True;
//  Http.CacheOptions := Http.CacheOptions + [coAlwaysReload, coPragmaNoCache, coNoCacheWrite];
  Http.Timeouts.ConnectTimeout := 1000 * 10;
  Http.Timeouts.ReceiveTimeout := 1000 * 10;
  Http.Timeouts.SendTimeout := 1000 * 10;
  Http.WaitTimeout := 1000 * 10;
  Http.OnDone := OnSenderDoneDownload;
  Http.OnWaitTimeoutExpired := OnSenderWaitTimeoutExpired;
  Http.OnHTTPError := OnSenderHTTPError;
  Http.OnConnLost := OnSenderConnLost;
  Http.OnAnyError := OnSenderAnyError;
  Http.URL := sUrl;
  Http.POSTDataA := sPost;
  Http.Read(True);
//  Http.Read(False);
//  while True do
//  begin
//    if (not bLoad) and (not http.Busy) then
//      Break;
//
//    Application.ProcessMessages;
//    Sleep(1);
//  end;

  Result := Http.HTTPErrorCode = 200;
end;

procedure TSender.OnSenderAnyError(Sender: TObject);
begin
  bLoad := False;
  OutputDebugString(PChar('AnyErr = ' + TWinHTTP(Sender).URL));
end;

initialization
  m_Sender := TSender.Create;

Finalization
  m_Sender.Free;

end.
