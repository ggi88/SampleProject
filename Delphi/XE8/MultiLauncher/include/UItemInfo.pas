unit UItemInfo;

interface

uses
  System.Classes, System.Generics.Collections, System.SysUtils,
  System.AnsiStrings, WinApi.windows, System.Win.Registry, System.Math;

type
  THostInfo = class
  private
    m_sIP: string;
    m_sID: string;
    m_sDesc: string;

    procedure SetID(const Value: String);
    procedure SetIP(const Value: String);
    procedure SetDesc(const Value: String);

    function GetIP: String;
  public
    property IP: String read GetIP write SetIP;
    property ID: String read m_sID write SetID;
    property DESC: String read m_sDesc write SetDesc;
  end;

type
  TSensorInfo = class
  private
    m_sIP: string;
    m_sID: string;
    m_sPW: string;
    m_sDesc: String;
    m_sSerial: String;
    m_dtLast: TDateTime;
    m_sSniperInfo, m_sLoginInfo, m_sInterLocking: string;

    m_dictJS: TDictionary<String,String>;
    m_listLicense: TStringList;
    m_listModule: TStringList;
    m_sGUIVerion: String;

    procedure ParserJS(sRst: AnsiString);

    procedure SetIP(const Value: String);
    procedure SetID(const Value: String);
    procedure SetPW(const Value: String);
    procedure SetDesc(const Value: String);

    function GetToken(var sSrc: string; sDelim: string): String;

    function ToValueDef(sKey: String; sDef: String = ''): String;
    function ToUrl(sUri: String): String;
    function ToEncode(s:String): String;

    function LoadGUIOptionJS: Boolean;
    function LoadSniperInfoJS: Boolean;
    function LoadSniperVersionJS: Boolean;
    function LoadSniperCFG: Boolean;
    function LoadVersionHTML: Boolean;

    function FindInterlockingIPS(sHostIP: String): Boolean;
    function FindInterlockingONE(sHostIP: String): Boolean;
    function AddInterlockingIPS(sHostIP: String; sHostID: String; sHostDesc: string): Boolean;
    function AddInterlockingONE(sHostIP: String; sHostID: String; sHostDesc: string): Boolean;

    function GetLastResult: String;
    function GetLanguage: String;
    function GetDeviceType: String;
    function GetDeviceVersion: String;
    function GetVersion: String;

    function GetIP: String;
    function GetCommaText: string;

    function GetSerial: Boolean;
    function GetLicense: Boolean;
    function GetSensor: Boolean;
    function GetLogin: Boolean;
    function GetLogout: Boolean;
    function GetLastTime: String;

  public
    constructor Create;
    destructor Destroy; override;

    procedure LoadSensor;
    procedure LoadLogin;
    procedure LoadLogout;
    procedure InterLockingSensor(sHostIP: String; sHostID: String; sHostDesc: string);

    property IP: String read GetIP write SetIP;
    property ID: String read m_sID write SetID;
    property PW: String read m_sPW write SetPW;
    property Desc: String read m_sDesc write SetDesc;
    property LastTime: String read GetLastTime;
    property SniperInfo: String read m_sSniperInfo;
    property LoginInfo: String read m_sLoginInfo;
    property InterLocking: String read m_sInterLocking;
    property CommaText: string read GetCommaText;
    property ModuleList: TStringList read m_listModule;
    property LicenseList: TStringList read m_listLicense;
    property Serial: String read m_sSerial;
  end;

implementation

uses
  USender, UCommonFunc,

  System.DateUtils;

{ TSensorInfo }

function TSensorInfo.AddInterlockingIPS(sHostIP, sHostID, sHostDesc: string): Boolean;
var
  sUrl: String;
  sRst: AnsiString;
begin
  Result := False;

  sUrl := Format('https://%s/sniper.atx?ocx=config?mode=4001?param=ipaddr=%s&sport=8080&idsid=%s&useflag=0&etc=%s&comm=p&community=&snmpversion=1&uname=&upass=&ulevel=000', [m_sIP, sHostIP, sHostID, sHostDesc]);
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  Result := Pos('ERROR', String(sRst)) = 0;
end;

function TSensorInfo.AddInterlockingONE(sHostIP, sHostID, sHostDesc: string): Boolean;
var
  sUrl: String;
  sPost, sRst: AnsiString;
begin
  Result := False;

  sPost := AnsiString('INSERT INTO iapconf( '
         + '  comm,'
         + '  ipaddr,'
         + '  ipver,'
         + '  sport,'
         + '  idsid,'
         + '  useflag,'
         + '  etc,'
         + '  community,'
         + '  snmpversion,'
         + '  ucode,'
         + '  uname,'
         + '  upass,'
         + '  ulevel) '
         + 'VALUES( '
         + '  112'            + ','
         +    ToQuotes(sHostIP)   + ','
         +    '4'             + ','
         +    '8080'          + ','
         +    sHostID             + ','
         +    '0'             + ','
         +    ToQuotes(sHostDesc) + ','
         +    ToQuotes()      + ','
         +    '0'             + ','
         +    ToQuotes()      + ','
         +    ToQuotes()      + ','
         +    ToQuotes()      + ','
         +    ToQuotes()      + ' )');

  sUrl := Format('https://%s/sniper.atx?cmd=config&order=config_iap_handle&path=../config&dbname=iapConf&sqlsize=%d&numIpv4=1&jobname=config', [m_sIP, Length(sPost)]);

  if not HttpSender.SendA(sUrl, sPost, sRst) then
    Exit;

  Result := Pos('SUCCESS', String(sRst)) > 0;
end;

constructor TSensorInfo.Create;
begin
  inherited;
  m_dictJS := TDictionary<String,String>.Create;
  m_listLicense := TStringList.Create;
  m_listLicense.StrictDelimiter := True;
  m_listLicense.Delimiter := #$A;

  m_listModule := TStringList.Create;
  m_listModule.StrictDelimiter := True;
  m_listModule.Delimiter := ';';

  m_dtLast := 0;
end;

destructor TSensorInfo.Destroy;
begin
  m_dictJS.Free;
  m_listLicense.Free;
  m_listModule.Free;

  inherited;
end;

function TSensorInfo.FindInterlockingIPS(sHostIP: string): Boolean;
var
  sUrl: String;
  sRst: AnsiString;
begin
  Result := False;

  sUrl := Format('https://%s/sniper.atx?ocx=config?mode=4000', [m_sIP]);
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  Result := Pos(sHostIP, String(sRst)) > 0;
end;

function TSensorInfo.FindInterlockingONE(sHostIP: string): Boolean;
var
  sUrl: String;
  sPost, sRst: AnsiString;
begin
  Result := False;

  sPost := AnsiString('SELECT'
         + '   comm'
         + ' , ipaddr'
         + ' , ipver'
         + ' , sport'
         + ' , idsid'
         + ' , useflag'
         + ' , etc'
         + ' , community'
         + ' , snmpversion'
         + ' , ucode'
         + ' , uname'
         + ' , upass'
         + ' , ulevel'
         + ' FROM iapconf'
         + ' WHERE 1'
         + ' AND ipaddr = ' + ToQuotes(sHostIP));

  sUrl := Format('https://%s/sniper.atx?cmd=config&order=config_sql_select&path=../config&dbname=iapConf&col_del=TAB&sqlsize=%d', [m_sIP, Length(sPost)]);

  if not HttpSender.SendA(sUrl, sPost, sRst) then
    Exit;

  Result := Pos(sHostIP, string(sRst)) > 0;
end;

function TSensorInfo.GetCommaText: string;
begin
  Result := IP + ',' + ID + ',' + PW + ',' + Desc;
end;

function TSensorInfo.GetDeviceType: String;
begin
  //제품명 검사
  if ToValueDef('SNIPER_CFG_PRODUCT_NAME') <> '' then
  begin
    if (Pos('ONE-i', ToValueDef('SNIPER_CFG_PRODUCT_NAME')) > 0) then
      Result := 'ONE-i'
    else if (Pos('ONE-d', ToValueDef('SNIPER_CFG_PRODUCT_NAME')) > 0) then
      Result := 'ONE-d'
    else
      Result := 'ONE';
  end
  //gui_option.js 모듈 검사
  else if ToValueDef('LoginTitle') <> '' then
  begin
    if (Pos('DDX', ToValueDef('LoginTitle')) > 0) then
      Result := 'DDX'
    else if (Pos('IPS', ToValueDef('LoginTitle')) > 0) then
      Result := 'IPS'
    else if (Pos('IDS', ToValueDef('LoginTitle')) > 0) then
      Result := 'IDS';
  end
  else
  begin
    //module 검사. one/ips/ddx

    // 18-05-14 MIS 식별방법 추가 됨
    if (Pos('MONS', ToValueDef('SNIPER_MODULE')) > 0) and (Pos('JPN', ToValueDef('LANGUAGE')) > 0) then
      Result := 'MONS'
    else if (Pos('AMS', ToValueDef('SNIPER_MODULE')) > 0) then
      Result := 'AMS'
    else if (Pos('ONE', ToValueDef('SNIPER_MODULE')) > 0) then   //one은 전체 버전 지원
      Result := 'ONE'
    else if (Pos('IPS', ToValueDef('SNIPER_MODULE')) > 0) and
      (StrToFloatDef(ToValueDef('SNIPER_VER_IPS'), 0) >= 8.0) then //ips는 8.5이상만 지원 -> 8.0으로 수정(2015.08.13 HTW)
      Result := 'IPS'
    else if (Pos('DDX', ToValueDef('SNIPER_MODULE')) > 0) and
      (StrToFloatDef(ToValueDef('SNIPER_VER_DDX'), 0) >= 6.0) then //ddx는 6.5이상만 지원 -> 6.0으로 수정(2015.08.13 HTW)
      Result := 'DDX'
    else if (Pos('DDX_SENSOR', ToValueDef('SNIPER_MODULE')) > 0) and
      (StrToFloatDef(ToValueDef('SNIPER_VER_DDX'), 0) >= 6.5) then //ddx sensor는 6.5이상만 지원
      Result := 'DDX_SENSOR'
    else if (Pos('IDS', ToValueDef('SNIPER_MODULE')) > 0) or
      (Pos('global_ids_flag=1', ToValueDef('SNIPER_OPT_IPS')) > 0) then //ids는 global_ids_flag=1만 지원
      Result := 'IDS';
  end;
end;

function TSensorInfo.GetDeviceVersion: String;
begin
  Result := ToValueDef('LoginVersion', ToValueDef('SNIPER_CFG_VER', ''));
end;

function TSensorInfo.GetIP: String;
begin
  if Pos(':', m_sIP) = 0 then
    Result := m_sIP + ':443'
  else
    Result := m_sIP;
end;

function TSensorInfo.GetLanguage: String;
begin
  Result := ToValueDef('LANGUAGE');
end;

function TSensorInfo.GetLastResult: String;
begin
  Result := ToValueDef('LAST_RESULT');
end;

function TSensorInfo.GetLastTime: String;
var
  nMin: Integer;
begin
  Result := '';
  if m_dtLast = 0 then
      Exit;

  nMin := MinutesBetween(Now, m_dtLast);
  if nMin = 0 then
    Result := '최근'
  else if nMin < 60 then
    Result := IntToStr( nMin ) + ' 분전'
  else
    Result := IntToStr( nMin div 60 ) + ' 시간전';
end;

function TSensorInfo.GetLicense: Boolean;
var
  sUrl: String;
  sPost, sRst: AnsiString;
begin
//2,13
//name|use
//Default IPS|1
//DNS License|0
//VoIP License|1
//HTTPS License|1
//RegEx License|0
//RateLimit License|1
//DDoS License|1
//DHCP License|1
//AR License|1
//UR License|1
//MR License|1
//IPS Pattern License|1
//Reputation License|1

  Result := False;

  sPost := 'PRAGMA empty_result_callbacks=1; Select name, use from license_list where reg=1 order by code;';
  sUrl := ToUrl('sniper.atx?cmd=config&order=config_sql_select&path=../config&dbname=sn_licenses&sqlsize=' + IntToStr(Length(sPost)));

  if not HTTPSender.SendA(sUrl, sPost, sRst) then
    Exit;

  Delete(sRst, 1, Pos(#10, String(sRst)));
  Delete(sRst, 1, Pos(#10, String(sRst)));
  sRst := AnsiString(StringReplace(String(sRst), '|', '=', [rfReplaceAll]));
  m_listLicense.DelimitedText := String(sRst);

  Result := True;
end;

function TSensorInfo.GetToken(var sSrc: string; sDelim: string): String;
var
	nPos : Integer;
begin
	nPos := Pos(sDelim, sSrc);

	if (nPos > 0) then
  begin
        Dec(nPos);
		Result := copy(sSrc, 1, nPos);
		Delete(sSrc, 1, nPos + Length(sDelim));
	end
  else
  begin
		Result := sSrc;
    sSrc := '';
	end;
end;

function TSensorInfo.GetVersion: String;
begin
  if ToValueDef('SNIPER_VER_ONE') <> '' then
    Result := ToValueDef('SNIPER_VER_ONE')
  else if ToValueDef('SNIPER_VER_DDX') <> '' then
    Result := ToValueDef('SNIPER_VER_DDX')
  else if ToValueDef('SNIPER_VER_IPS') <> '' then
    Result := ToValueDef('SNIPER_VER_IPS')
  else
    Result := '';
end;

procedure TSensorInfo.InterLockingSensor(sHostIP, sHostID, sHostDesc: string);
begin
  m_sInterLocking := 'ㄱㄱ';
  if GetDeviceType = 'IPS' then
  begin
    if FindInterlockingIPS(sHostIP) then
    begin
      m_sInterLocking := '존재'
    end
    else
    begin
      if AddInterlockingIPS(sHostIP, sHostID, sHostDesc) then
        m_sInterLocking := 'ㅇㅋ'
      else
        m_sInterLocking := 'ㄴㄴ'
    end;
  end
  else if GetDeviceType = 'ONE' then
  begin
    if FindInterlockingONE(sHostIP) then
    begin
      m_sInterLocking := '존재'
    end
    else
    begin
      if AddInterlockingONE(sHostIP, sHostID, sHostDesc) then
        m_sInterLocking := 'ㅇㅋ'
      else
        m_sInterLocking := 'ㄴㄴ'
    end;
  end;
end;

function TSensorInfo.LoadGUIOptionJS: Boolean;
var
  sUrl: String;
  sRst: AnsiString;
begin
  Result := False;

  //gui_option.js는 우선순위가 가장 높으며, 있을 수도 없을 수도 있음으로 제일 먼저 수행
  //gui_option.js 서버에 없는 경우 error, ondone 등 행위 메소드를 타지 않음으로 동기식으로
  sUrl := Format('https://%s/activex/login/gui_option.js', [m_sIP]);
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  ParserJS(sRst);

  Result := True;
end;

procedure TSensorInfo.LoadLogin;
begin
  m_sLoginInfo := 'ㄱㄱ';
  if GetLogin then
    m_sLoginInfo := '로그인ㅇㅋ'
  else
    m_sLoginInfo := 'ㄴㄴ';

  GetSerial;
  GetLicense;

  m_dtLast := Now;
end;

procedure TSensorInfo.LoadLogout;
begin
  m_sLoginInfo := 'ㄱㄱ';
  if GetLogout then
    m_sLoginInfo := '로그아웃ㅇㅋ'
  else
    m_sLoginInfo := 'ㄴㄴ';
  m_dtLast := Now;
end;

function TSensorInfo.GetSensor: Boolean;
var
  sUrl: String;
  sRst: AnsiString;
  nIndex: Integer;
begin
  Result := False;

  sUrl := ToUrl('');

  if not HTTPSender.SendA(sUrl, '', sRst) then
    Exit;

  //리다이렉트 페이지 (login_fail2.html)의 화면 이미지 notice2.gif로
  //실행 페이지 구분 (login_fail2.html 이면 result := True)
  nIndex := Pos('/activex/login/images/notice2.gif', String(sRst));

  if (nIndex <> 0) then
  begin
    //접속 제한 IP임으로 화면에 표시
    m_dictJS.AddOrSetValue('LAST_RESULT', '접속제한 IP');
  end
  else
  begin
    //접속 제한 IP가 아님으로 장비 정보 load
    LoadGUIOptionJS;
    LoadSniperInfoJS;
    LoadSniperVersionJS;
    LoadSniperCFG;
    LoadVersionHTML;
    m_dictJS.AddOrSetValue('LAST_RESULT', 'ㅇㅋ');
  end;

  Result := True;
end;

function TSensorInfo.GetSerial: Boolean;
var
  sUrl: String;
  sPost, sRst: AnsiString;
begin
//1,1
//subj_cn
//SKRO4CWIT218796

  Result := False;

  sPost := 'PRAGMA empty_result_callbacks=1; Select subj_cn from cert_list;';
  sUrl := ToUrl('sniper.atx?cmd=config&order=config_sql_select&path=../config&dbname=sn_licenses&sqlsize=' + IntToStr(Length(sPost)));

  if not HTTPSender.SendA(sUrl, sPost, sRst) then
    Exit;

  Delete(sRst, 1, Pos(#10, String(sRst)));
  Delete(sRst, 1, Pos(#10, String(sRst)));
  m_sSerial := String(sRst);
  Result := True;
end;

procedure TSensorInfo.LoadSensor;
begin
  m_sSniperInfo := 'ㄱㄱ';
  if GetSensor then
  begin
    m_sSniperInfo := GetDeviceType + ' / '
                   + GetVersion + ' / '
                   + GetDeviceVersion + ' / '
                   + GetLanguage + ' / '
                   + GetLastResult;
  end
  else
  begin
    m_sSniperInfo := 'ㄴㄴ';
  end;
  m_dtLast := Now;
end;

function TSensorInfo.LoadSniperCFG: Boolean;
var
  sUrl: String;
  sRst: AnsiString;
begin
  Result := False;

  sUrl := Format('https://%s/activex/login/sniper_cfg.js', [m_sIP]);
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  ParserJS(sRst);

  Result := True;
end;

function TSensorInfo.LoadSniperInfoJS: Boolean;
var
  sUrl: String;
  sRst: AnsiString;
begin
  Result := False;

  sUrl := Format('https://%s/activex/login/sniper_info.js', [m_sIP]);
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  ParserJS(sRst);

  Result := True;
end;

function TSensorInfo.LoadSniperVersionJS: Boolean;
var
  sUrl: String;
  sRst: AnsiString;
begin
  Result := False;

  sUrl := Format('https://%s/activex/login/sniper_version.js', [m_sIP]);
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  ParserJS(sRst);

  m_listModule.Clear;
  m_listModule.DelimitedText := ToValueDef('SNIPER_MODULE');

  Result := True;
end;

function TSensorInfo.LoadVersionHTML: Boolean;
var
  sRst, sLine : string;
  listHtml : TStringList;
  i : Integer;
begin
  Result := False;
  if not HttpSender.Send(Format('https://%s/activex/version.html', [m_sIP]), '', sRst) then
    Exit;


  listHtml := TStringList.Create;
  listHtml.Text := sRst;
  for i := 0 to listHtml.Count - 1 do
  begin
    sLine := Trim(listHtml[i]);
    if Trim(sLine) = 'Compatible Version' then break;

    if Pos('<tr><td colspan = 4 >', sLine) = 1 then // PKG Version
    begin
      GetToken(sLine,'<tr><td colspan = 4 >');
      m_sGUIVerion := GetToken(sLine, '</td></tr>');
      continue;
    end;
  end;
  listHtml.Free;

  //  SniperONE_v3.0.0-1117-g57ce41e
  if GetDeviceType = 'ONE-i' then
  begin
    m_sGUIVerion := StringReplace(m_sGUIVerion, '-', '_', [rfReplaceAll]);
    m_sGUIVerion := StringReplace(m_sGUIVerion, 'SniperONE', 'SNIPERONE-i', [rfReplaceAll]);
    m_sGUIVerion := StringReplace(m_sGUIVerion, 'v3.0.0', 'v3.0', [rfReplaceAll]);
  end
  else if GetDeviceType = 'ONE-d' then
  begin
    m_sGUIVerion := StringReplace(m_sGUIVerion, '-', '_', [rfReplaceAll]);
    m_sGUIVerion := StringReplace(m_sGUIVerion, 'SniperONE', 'SNIPERONE-d', [rfReplaceAll]);
    m_sGUIVerion := StringReplace(m_sGUIVerion, 'v3.0.0', 'v3.0', [rfReplaceAll]);
  end
  else
  begin

  end;

  Result := True;
end;

function TSensorInfo.GetLogin: Boolean;
var
  sUrl: String;
  sRst: AnsiString;
  sID, sPW : String;
begin
  Result := False;

  sID := ToEncode(m_sID);
  sPW := ToEncode(m_sPW);

  sUrl := ToUrl(Format('sniper.atx?ocx=%s?mode=%s?param=id=%s&password=%s', ['login', '0000', sID, sPW]));
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  if not ContainsText(sRst, 'success') then
    Exit;

  Result := True;
end;

function TSensorInfo.GetLogout: Boolean;
var
  sUrl: String;
  sRst: Ansistring;
begin
  Result := False;

  sUrl := ToURL(Format('Sniper.atx?ocx=%s?mode=%s?param=', ['logout', '1111']));
  if not HttpSender.SendA(sUrl, '', sRst) then
    Exit;

  if not ContainsText(sRst, 'success') then
    Exit;

  Result := True;
end;

procedure TSensorInfo.ParserJS(sRst: AnsiString);
var
  i: Integer;
  l: TStringList;
begin
  sRst := System.AnsiStrings.StringReplace(sRst, ' ', '', [rfReplaceAll]);
  sRst := System.AnsiStrings.StringReplace(sRst, '";', '"', [rfReplaceAll]);
  sRst := System.AnsiStrings.StringReplace(sRst, 'var', '', [rfReplaceAll]);
  sRst := System.AnsiStrings.StringReplace(sRst, '"', '', [rfReplaceAll]);

  DoSmartPointer(TObject(l), TStringList.Create);
  l.StrictDelimiter := True;
  l.Delimiter := #$A;
  l.DelimitedText := String(sRst);

  for i := 0 to l.Count -1 do
  begin
    if m_dictJS.ContainsKey(l.Names[i]) then Continue;
    m_dictJS.AddOrSetValue(l.Names[i], l.Values[l.Names[i]]);
  end;
end;

procedure TSensorInfo.SetDesc(const Value: String);
begin
  m_sDesc := Value;
end;

procedure TSensorInfo.SetID(const Value: String);
begin
  m_sID := Value;
end;

procedure TSensorInfo.SetIP(const Value: String);
begin
  if Pos(':', Value) = 0 then
    m_sIP := Value + ':443'
  else
    m_sIP := Value;
end;

procedure TSensorInfo.SetPW(const Value: String);
begin
  m_sPW := Value;
end;

function TSensorInfo.ToEncode(s: String): String;
begin
  s := StringReplace(s, '%','%25', [rfReplaceAll]);
  s := StringReplace(s, ' ','%20', [rfReplaceAll]);
  s := StringReplace(s, '?','%3F', [rfReplaceAll]);
  s := StringReplace(s, '=','%3D', [rfReplaceAll]);
  s := StringReplace(s, '#','%23', [rfReplaceAll]);
  s := StringReplace(s, '\','%5C', [rfReplaceAll]);
  s := StringReplace(s, '&','%26%26', [rfReplaceAll]);
  Result := s;
end;

function TSensorInfo.ToUrl(sUri: String): String;
begin
  Result := 'https://' + m_sIP + '/' + sUri;
end;

function TSensorInfo.ToValueDef(sKey, sDef: String): String;
begin
  if m_dictJS.ContainsKey(sKey) then
    Result := m_dictJS.Items[sKey]
  else
    Result := sDef;
end;

{ TMyInfo }

function THostInfo.GetIP: String;
begin
  Result := m_sIP;
end;

procedure THostInfo.SetID(const Value: String);
begin
  m_sID := Value;
end;

procedure THostInfo.SetIP(const Value: String);
begin
  m_sIP := Value;
end;

procedure THostInfo.SetDesc(const Value: String);
begin
  m_sDesc := Value;
end;

end.
