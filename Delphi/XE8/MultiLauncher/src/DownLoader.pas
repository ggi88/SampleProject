unit DownLoader;

interface

uses
  uMD5, System.Zip,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sGauge, WinHTTP_XE, Vcl.ComCtrls,
  cabfiles, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFDownLoader = class(TForm)
    gag: TProgressBar;
    btnRetry: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRetryClick(Sender: TObject);
  private
    { Private declarations }
    m_bStatus: Boolean;
    m_sIP: String;
    m_sDefaultPath: String;
    m_nFileCount: Integer;
    m_ListFiles: TList;

    procedure Init(sIP: String);

    procedure UnZip(sFile, sPath: String);
    procedure RemoveDirectoryAll(sPath: string);
    procedure ExecuteSniper(sPath: String);

    function DownloadListFile(sPath: String): Boolean;
    function LoadListFile(sPath: String): Boolean;
    function CompareListFiles(sPath1: String; sPath2: String): Boolean;
    function DownloadFiles(sPath: String; nIndex: Integer): Boolean;
    function DownloadUnzipFiles(sPath: String; nIndex: Integer): Boolean;

    function Download: Boolean;

    function GetFileNames(nIndex : Integer): String;
    function CabFileNames(nIndex : Integer): String;
    function GetFileNameExt(sFileName : String) : String;
  public
    { Public declarations }
    procedure Start;
    property Status: Boolean read m_bStatus;
  end;

//var
//  FDownLoader: TFDownLoader;

function ExecuteDownloader(sIP: String): TFDownLoader;

implementation

uses
  USender, UCommonFunc;

type
  TFileAttribute = record
    name : array[0..31] of AnsiChar;        // only file name. it is not includes path
    size : integer;
    v1,v2,v3,v4 : WORD;         // version
    filetime : TFileTime;       // created time
    md5digest : TMD5Digest;     // hash value
  end;
  pFileAttribute = ^TFileAttribute;


const
  CST_DIR_INSTALL = 'install\';
  CST_FILE_LIST_FILE_NAME = 'sniper.lst';
  CST_OLD_FILE_LIST_FILE_NAME = 'sniperold.lst';
  CST_FILE_SNIPER_EXE = 'Sniper.exe';

{$R *.dfm}

function ExecuteDownloader(sIP: String): TFDownLoader;
var
  dl: TFDownLoader;
begin
  dl := TFDownLoader.Create(Application);
  dl.Init(sIP);
  Result := dl;
end;

{ TFDownLoader }

procedure TFDownLoader.btnRetryClick(Sender: TObject);
begin
  btnRetry.Visible := False;
  Start;
end;

function TFDownLoader.CabFileNames(nIndex: Integer): String;
begin
  Result := GetFileNames(nIndex);
  Result := copy(Result,1,pos('.',Result)-1) + '.cab';
end;

function TFDownLoader.CompareListFiles(sPath1, sPath2: String): Boolean;
var
  sRst1, sRst2: String;
begin
  CustomFileRead(sPath1, TEncoding.Default, sRst1);
  CustomFileRead(sPath2, TEncoding.Default, sRst2);

  Result := CompareStr(sRst1, sRst2) = 0
end;

function TFDownLoader.Download: Boolean;
var
  sPathSniperListOld, sPathSniperList, sPathSniperExe: String;
  nIdx: Integer;
begin
  Result := False;

  sPathSniperListOld := m_sDefaultPath + CST_OLD_FILE_LIST_FILE_NAME;
  sPathSniperList := m_sDefaultPath + CST_FILE_LIST_FILE_NAME;
  sPathSniperExe := m_sDefaultPath + CST_FILE_SNIPER_EXE;

  gag.Position := 0;
  // 경로 초기화
  if not DirectoryExists(m_sDefaultPath) then
  begin
    if not ForceDirectories(m_sDefaultPath) then
      Exit;
  end;

  if FileExists(sPathSniperList) then
  begin
    DeleteFile(sPathSniperListOld);
    if not RenameFile(sPathSniperList, sPathSniperListOld) then Exit;

    gag.Position := 20;
    if not DownloadListFile(sPathSniperList) then Exit;

    gag.Position := 40;
    if not LoadListFile(sPathSniperList) then Exit;

    gag.Position := 60;
    if not CompareListFiles(sPathSniperList, sPathSniperListOld) then
    begin
      nIdx := 0;
      while nIdx <> m_ListFiles.Count do
      begin
        DownloadFiles(m_sDefaultPath, nIdx);
        DownloadUnzipFiles(m_sDefaultPath, nIdx);
        Inc(nIdx);
        gag.Position := gag.Position + 2;
      end;
    end;
  end
  else
  begin
    gag.Position := 20;
    RemoveDirectoryAll(m_sDefaultPath);
    if not ForceDirectories(m_sDefaultPath) then Exit;

    gag.Position := 40;
    if not DownloadListFile(sPathSniperList) then Exit;

    gag.Position := 60;
    if not LoadListFile(sPathSniperList) then Exit;

    nIdx := 0;
    while nIdx <> m_ListFiles.Count do
    begin
      DownloadFiles(m_sDefaultPath, nIdx);
      DownloadUnzipFiles(m_sDefaultPath, nIdx);
      Inc(nIdx);
      gag.Position := gag.Position + 2;
    end;
  end;

  gag.Position := 100;
  ExecuteSniper(sPathSniperExe);

  Delay(100);
  Result := True;
end;

function TFDownLoader.DownloadFiles(sPath: String; nIndex: Integer): Boolean;
var
  sUrl, sFile: string;
begin
  sUrl := Format('https://%s/activex/%s', [m_sIP, CabFileNames(nIndex)]);
  sFile := sPath + CabFileNames(nIndex);
  Result := HttpSender.Download(sUrl, '', sFile);
end;

function TFDownLoader.DownloadListFile(sPath: String): Boolean;
var
  sUrl: String;
begin
  sUrl := Format('https://%s/activex/%s', [m_sIP, CST_FILE_LIST_FILE_NAME]);
  Result := HttpSender.Download(sUrl, '', sPath);
end;

function TFDownLoader.DownloadUnzipFiles(sPath: String; nIndex: Integer): Boolean;
var
  sFile: string;
begin
  sFile := sPath + GetFileNameExt(CabFileNames(nIndex));

  Result := FileExists(sFile);
  if not FileExists(sFile) then Exit;

  UnZip(sFile, sPath);
end;

procedure TFDownLoader.ExecuteSniper(sPath: String);
begin
  if FileExists(sPath) then
    WinExec(PAnsiChar(AnsiString(Format('%s %s %s %s', [sPath, m_sIP, 'ss', 'sn_manager']))), SW_NORMAL);
end;

procedure TFDownLoader.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFDownLoader.FormCreate(Sender: TObject);
begin
  m_bStatus := True;
  m_ListFiles := TList.Create;
end;

procedure TFDownLoader.FormDestroy(Sender: TObject);
begin
  m_ListFiles.Free;
end;

function TFDownLoader.GetFileNameExt(sFileName: String): String;
  function LastDelim(sFileName : String) : Integer;
  begin
    Result := Length(sFileName);
    while Result > 0 do
    begin
      if (sFileName[Result] = '\') or
         (sFileName[Result] = '/') then
        exit;
      Dec(Result);
    end;
  end;
var
  idx : integer;
begin
  idx := LastDelim(sFileName);
  Result := Copy(sFileName,idx+1,Length(sFileName));
end;

function TFDownLoader.GetFileNames(nIndex: Integer): String;
begin
//exception
  if m_nFileCount = 0 then Result := '';
  if m_nFileCount - 1 < nIndex then exit;

  Result := String(pFileAttribute(m_ListFiles.Items[nIndex]).name);
end;

procedure TFDownLoader.Init(sIP: String);
var
  sPathIP: String;
begin
  m_sIP := sIP;
  sPathIP := Copy(m_sIP, 1, Pos(':', m_sIP) -1);
  m_sDefaultPath := ExtractFilePath(Application.ExeName) + CST_DIR_INSTALL + sPathIP + '\';

  Self.Caption := m_sIP;
end;

function TFDownLoader.LoadListFile(sPath: String): Boolean;
var
  fs : TMemoryStream;
  FileAttr : TFileAttribute;
  pFileAttr : pFileAttribute;
begin
  Result := FileExists(sPath);
  if not Result then Exit;

  fs := TMemoryStream.Create;
  fs.LoadFromFile(sPath);
  try
    fs.Read(m_nFileCount, SizeOf(Integer));
    m_ListFiles.Clear;

    while fs.Position < fs.Size do
    begin
      fs.Read(FileAttr, SizeOf(FileAttr));
      New(pFileAttr);
      pFileAttr^ := FileAttr;
      m_ListFiles.Add(pFileAttr);
    end;
  finally
    fs.Free;
  end;
end;

procedure TFDownLoader.RemoveDirectoryAll(sPath: string);
var
  SR : TSearchRec;
begin
   if FindFirst(sPath + '\*', faAnyFile, SR) = 0 then
   begin
      repeat
         if ((SR.attr and faDirectory) = faDirectory) and not (SR.Name = '.') and not (SR.Name = '..') then
         begin
            if DirectoryExists(sPath + '\' + SR.Name) then
            begin
               RemoveDirectoryAll(sPath + '\' + SR.Name);
            end;
         end
         else
         begin
            if FileExists(sPath + '\' + SR.Name) then
            begin
               DeleteFile(sPath + '\' + SR.Name);
            end;
         end;
      until FindNext(SR) <> 0;
   end;

   if DirectoryExists(sPath) then
      RemoveDir(sPath);

   FindClose(SR);
end;

procedure TFDownLoader.Start;
begin
  m_bStatus := Download;
  btnRetry.Visible := not m_bStatus;
  if m_bStatus then Close;
end;

procedure TFDownLoader.UnZip(sFile, sPath: String);
var
  cab: TCabFile;
begin
  cab := TCABFile.Create(nil);
  cab.CABFile := sFile;
  cab.GetContents;
  cab.TargetPath := sPath;
  cab.ExtractAll;
  cab.Free;
end;

end.
