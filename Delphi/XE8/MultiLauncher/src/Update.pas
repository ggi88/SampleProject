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
  UCommonFunc, USender;

const
  CST_VERSION_FILE = 'version.cfg';

procedure TFUpdate.AddMemo(sText: string);
begin
  mem.Lines.Add(sText);
end;

function TFUpdate.CompareVersion: Boolean;
var
  sUrl, sOutput: String;
  sOnlineVersion, sOfflineVersion: String;
  l: TStringList;
begin
  DoSmartPointer(TObject(l), TStringList.Create);

  // 버전 비교
  CustomFileRead(CST_VERSION_FILE, TEncoding.UTF8, sOutput);
  l.Text := sOutput;
  sOfflineVersion := l.Values['version'];

  HTTPSender.Send(sUrl, '', sOutput);
  l.Text := sOutput;
  sOnlineVersion := l.Values['version'];
  sOnlineVersion := '1.0.0.8';

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
var
  sUrl: String;
begin
  Timer1.Enabled := False;
  // 버전 비교
  if CompareVersion then
  begin
    // 버전 같을 시 그냥 실행
    AddMemo('최신 확인');
    ModalResult := mrOk;
  end
  else
  begin
    // 버전 다를 시 다운로드
    AddMemo('업데이트 실행');
    HTTPSender.Download(sUrl, '', 'MultiLauncher.exe');
    AddMemo('업데이트 완료');
    AddMemo('종료 후 다시 시작해 주십시오');
    ModalResult := mrCancel;
  end;

  Delay(1000);
end;

end.
