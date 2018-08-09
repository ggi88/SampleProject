unit UItemList;

interface

uses
  UIteminfo,

  System.Generics.Collections, System.Classes, System.SysUtils;

type
  TMyInfoList = class
  private
    m_dictMyInfo: TDictionary<String,THostInfo>;

    procedure Init;

    function GetLocalAddress: string;
    constructor Create;
  public
    destructor Destroy; override;

    procedure Clear;
    procedure InsertOrUpdate(sIP, sID, sDESC: String);
    procedure Delete(sIP: String);

    procedure ImportConfig;
    procedure ExportConfig;

    function Keys: TArray<String>;
    function Count: Integer;
    function Item(sKey: String): THostInfo;

    class function GetObject: TMyInfoList;
  end;

type
  TSensorList = class
  private
    m_dictSensor: TDictionary<String,TSensorInfo>;

    function CommaText: String;

    constructor Create;
  public
    destructor Destroy; override;

    procedure Clear;
    procedure InsertOrUpdate(sIP, sID, sPW, sDesc: String);
    procedure Delete(sIP: String);

    procedure ImportConfig;
    procedure ExportConfig;

    function Keys(bSort: Boolean = False): TArray<String>;
    function Count: Integer;
    function Item(sKey: String): TSensorInfo;

    class function GetObject: TSensorList;
  end;

implementation

uses
  UCommonFunc, Winsock, System.AnsiStrings;

const
  CST_SENSOR_CONFIG = 'sensers.cfg';
  CST_HOST_CONFIG = 'host.cfg';

var
  m_MyInfoList: TMyInfoList = nil;
  m_Sensorlist: TSensorList = nil;

{ TSensorList }

procedure TSensorList.Clear;
var
  sKey: String;
begin
  for sKey in m_dictSensor.Keys do
    m_dictSensor.Items[sKey].Free;
  for sKey in m_dictSensor.Keys do
    m_dictSensor.Remove(sKey);
end;

function TSensorList.CommaText: String;
var
  sKey: String;
begin
  Result := '';
  for sKey in m_dictSensor.Keys do
    Result := Result + sKey + ',';
  Result := Copy(Result, 1, Length(Result) -1);
end;

function TSensorList.Count: Integer;
begin
  Result := m_dictSensor.Count;
end;

constructor TSensorList.Create;
begin
  inherited;

  m_dictSensor := TDictionary<String,TSensorInfo>.Create;

  ImportConfig;
end;

procedure TSensorList.Delete(sIP: String);
begin
  m_dictSensor.Items[sIP].Free;
  m_dictSensor.Remove(sIP);
end;

destructor TSensorList.Destroy;
begin
  ExportConfig;

  Clear;
  m_dictSensor.Free;

  inherited;
end;

procedure TSensorList.ExportConfig;
var
  sKey, sData, sTemp: String;
  info: TSensorInfo;
begin
  sData := 'ip'+#9+'id'+#9+'pw'+#9+'desc'+#13#10;
  for sKey in m_dictSensor.Keys do
  begin
    info := m_dictSensor.Items[sKey];
    sTemp := Trim(info.IP) + #9
           + Trim(info.ID) + #9
           + Trim(info.PW) + #9
           + Trim(info.Desc) + #13#10;

    if Trim(sTemp) = '' then Continue;

    sData := sData + sTemp;
  end;

  CustomFileWrite(CST_SENSOR_CONFIG, TEncoding.UTF8, sData);
end;

class function TSensorList.GetObject: TSensorList;
begin
  if m_Sensorlist = nil then
    m_Sensorlist := TSensorList.Create;
  Result := m_Sensorlist;
end;

procedure TSensorList.ImportConfig;
var
  sIP, sData: String;
  i: Integer;
  l1, l2: TStringList;
begin
  Clear;

  DoSmartPointer(TObject(l1), TStringList.Create);
  l1.StrictDelimiter := True;
  l1.Delimiter := #10;

  DoSmartPointer(TObject(l2), TStringList.Create);
  l2.StrictDelimiter := True;
  l2.Delimiter := #9;


  CustomFileRead(CST_SENSOR_CONFIG, TEncoding.UTF8, sData);

  l1.DelimitedText := StringReplace(sData, #13, '', [rfReplaceAll]);
  for i := 1 to l1.Count -1 do
  begin
    if Trim(l1[i]) = '' then Continue;

    l2.DelimitedText := l1[i];

    sIP := l2[0];
    sIP := Copy(sIP, 1, Pos(':', sIP)-1);
    if Pos(sIP, CommaText) > 0 then Continue;

    InsertOrUpdate(l2[0], l2[1], l2[2], l2[3]);
  end;
end;

procedure TSensorList.InsertOrUpdate(sIP, sID, sPW, sDesc: String);
var
  Info: TSensorInfo;
begin
  if m_dictSensor.TryGetValue(sIP, Info) then
  begin
    Info := m_dictSensor.Items[sIP];
    Info.ip := sIP;
    Info.id := sID;
    Info.pw := sPW;
    Info.Desc := sDesc;
  end
  else
  begin
    Info := TSensorInfo.Create;
    Info.ip := sIP;
    Info.id := sID;
    Info.pw := sPW;
    Info.Desc := sDesc;
    m_dictSensor.AddOrSetValue(sIP, Info);
  end;
end;

function TSensorList.Item(sKey: String): TSensorInfo;
begin
  Result := m_dictSensor.Items[sKey];
end;

function TSensorList.Keys(bSort: Boolean): TArray<String>;
var
  SortKeys: TList<String>;
  sKey: String;
begin
  Result := nil;
  if bSort then
  begin
    SortKeys := TList<String>.Create(m_dictSensor.Keys);
    SortKeys.Sort; // deault ascending
    for sKey in SortKeys do
      Insert(sKey, Result, Length(Result));
    SortKeys.Free;
  end
  else
  begin
    for sKey in m_dictSensor.Keys do
      Insert(sKey, Result, Length(Result));
  end;
end;

{ TMyInfoList }

procedure TMyInfoList.Clear;
var
  sKey: String;
begin
  for sKey in m_dictMyInfo.Keys do
    m_dictMyInfo.Items[sKey].Free;
  for sKey in m_dictMyInfo.Keys do
    m_dictMyInfo.Remove(sKey);
end;

function TMyInfoList.Count: Integer;
begin
  Result := m_dictMyInfo.Count;
end;

constructor TMyInfoList.Create;
begin
  inherited;

  m_dictMyInfo := TDictionary<String,THostInfo>.Create;

  ImportConfig;
end;

procedure TMyInfoList.Delete(sIP: String);
begin
  m_dictMyInfo.Items[sIP].Free;
  m_dictMyInfo.Remove(Keys[0]);
end;

destructor TMyInfoList.Destroy;
begin
  ExportConfig;

  Clear;
  m_dictMyInfo.Free;

  inherited;
end;

procedure TMyInfoList.ExportConfig;
var
  sKey, sData, sTemp: String;
  info: THostInfo;
begin
  sData := 'ip'+#9+'id'+#9+'desc'+#13#10;
  for sKey in m_dictMyInfo.Keys do
  begin
    info := m_dictMyInfo.Items[sKey];
    sTemp := Trim(info.ip) + #9
           + Trim(info.id) + #9
           + Trim(info.desc) + #13#10;

    if Trim(sTemp) = '' then Continue;

    sData := sData + sTemp;
  end;

  CustomFileWrite(CST_HOST_CONFIG, TEncoding.UTF8, sData);
end;

function TMyInfoList.GetLocalAddress: string;
  function MakeWord(const BLow, BHigh: byte): word;
  begin
    result := BLow or (BHigh shl 8);
  end;
var
  WSAData: TWSAData;
  HostName, IPAddress: String;
  HostEnt: PHostEnt;
begin
  WSAStartup(2, WSAData);
  SetLength(HostName, 255);
  GetHostname(PAnsiChar(AnsiString(HostName)), 255);
  SetLength(HostName, System.Ansistrings.StrLen(PAnsiChar(AnsiString(HostName))));
  HostEnt := GetHostByName(PAnsiChar(AnsiString(HostName)));

  with HostEnt^ do
    IPAddress := Format('%d.%d.%d.%d',[Byte(h_addr^[0]), Byte(h_addr^[1]),
  Byte(h_addr^[2]), Byte(h_addr^[3])]);
  WSACleanup;
  Result := IPAddress;
end;

class function TMyInfoList.GetObject: TMyInfoList;
begin
  if m_MyInfoList = nil then
    m_MyInfoList := TMyInfoList.Create;
  Result := m_MyInfoList;
end;

procedure TMyInfoList.ImportConfig;
var
  sData: String;
  i: Integer;
  l1, l2: TStringList;
begin
  Clear;

  DoSmartPointer(TObject(l1), TStringList.Create);
  l1.StrictDelimiter := True;
  l1.Delimiter := #10;

  DoSmartPointer(TObject(l2), TStringList.Create);
  l2.StrictDelimiter := True;
  l2.Delimiter := #9;

  if not CustomFileRead(CST_HOST_CONFIG, TEncoding.UTF8, sData) then
  begin
    Init;
    Exit;
  end;

  l1.DelimitedText := Trim(sData);
  for i := 1 to l1.Count -1 do
  begin
    if Trim(l1[i]) = '' then Continue;

    l2.DelimitedText := l1[i];

    InsertOrUpdate(Trim(l2[0]), Trim(l2[1]), Trim(l2[2]));
  end;
end;

procedure TMyInfoList.Init;
var
  sIP, sID, sDesc: String;
begin
  sIP := GetLocalAddress;
  sID := IntToStr(Random(9999) + 1); // 1~9999
  sDesc := '통합개발';
  InsertOrUpdate(sIP, sID, sDesc);
end;

procedure TMyInfoList.InsertOrUpdate(sIP, sID, sDESC: String);
var
  Info: THostInfo;
begin
  if Count > 0 then
    Delete(Keys[0]);

  if m_dictMyInfo.TryGetValue(sIP, Info) then
  begin
    Info := m_dictMyInfo.Items[sIP];
    Info.ip := sIP;
    Info.id := sID;
    Info.DESC := sDESC;
  end
  else
  begin
    Info := THostInfo.Create;
    Info.ip := sIP;
    Info.id := sID;
    Info.DESC := sDESC;
    m_dictMyInfo.AddOrSetValue(sIP, Info);
  end;
end;

function TMyInfoList.Item(sKey: String): THostInfo;
begin
  Result := m_dictMyInfo.Items[sKey];
end;

function TMyInfoList.Keys: TArray<String>;
var
  sKey: String;
begin
  Result := nil;
  for sKey in m_dictMyInfo.Keys do
    Insert(sKey, Result, 0);
end;

initialization

finalization
  if m_MyInfoList <> nil then
    m_MyInfoList.Free;

  if m_Sensorlist <> nil then
    m_Sensorlist.Free;

end.

