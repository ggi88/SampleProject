unit Update;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TFUpdate = class(TForm)
    pgb: TProgressBar;
    mem: TMemo;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure AddMemo(sText: string);

    function CompareVersion: Boolean;
  public
    { Public declarations }
  end;

var
  FUpdate: TFUpdate;

implementation

{$R *.dfm}

uses
  UCommonFunc, USender, Winapi.ShellAPI;

const
  CST_VERSION_FILE = 'version.cfg';

procedure TFUpdate.AddMemo(sText: string);
begin
  mem.Lines.Add(sText);
end;

function TFUpdate.CompareVersion: Boolean;
var
  sOutput: String;
  sOutputA: AnsiString;
  sOnlineVersion, sOfflineVersion: String;
  l: TStringList;
begin
  DoSmartPointer(TObject(l), TStringList.Create);

  // 버전 비교
  CustomFileRead(CST_VERSION_FILE, TEncoding.ANSI, sOutput);
  l.Text := sOutput;
  sOfflineVersion := l.Values['version'];

  HTTPSender.SendA('https://raw.githubusercontent.com/ggi88/SampleProject/master/Delphi/XE8/MultiLauncher/output/version.cfg', '', sOutputA);
  l.Text := String(sOutputA);
  sOnlineVersion := l.Values['version'];

  Result := sOfflineVersion = sOnlineVersion;
end;

procedure TFUpdate.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFUpdate.FormCreate(Sender: TObject);
begin
  AddMemo('업데이트 확인');
end;

procedure TFUpdate.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  // 버전 비교
  if CompareVersion then
  begin
    // 버전 같을 시 그냥 실행
    AddMemo('최신 업데이트 확인');
  end
  else
  begin
    // 버전 다를 시 다운로드 후 실행
    AddMemo('업데이트 실행');
    HTTPSender.Download('https://raw.githubusercontent.com/ggi88/SampleProject/master/Delphi/XE8/MultiLauncher/output/version.cfg', '', CST_VERSION_FILE);
    HTTPSender.Download('https://github.com/ggi88/SampleProject/raw/master/Delphi/XE8/MultiLauncher/output/MultiLauncher.exe', '', 'MultiLauncher.exe');
    AddMemo('업데이트 완료');
  end;

  Delay(1000);
  AddMemo('프로그램 실행');
  ShellExecute(Handle, 'open', 'MultiLauncher.exe', '1', nil, SW_SHOWNORMAL);
  Delay(1000);
  Close;
end;

end.
