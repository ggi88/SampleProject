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

  // ���� ��
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
  AddMemo('������Ʈ Ȯ��');
end;

procedure TFUpdate.Timer1Timer(Sender: TObject);
var
  sUrl: String;
begin
  Timer1.Enabled := False;
  // ���� ��
  if CompareVersion then
  begin
    // ���� ���� �� �׳� ����
    AddMemo('�ֽ� Ȯ��');
    ModalResult := mrOk;
  end
  else
  begin
    // ���� �ٸ� �� �ٿ�ε�
    AddMemo('������Ʈ ����');
    HTTPSender.Download(sUrl, '', 'MultiLauncher.exe');
    AddMemo('������Ʈ �Ϸ�');
    AddMemo('���� �� �ٽ� ������ �ֽʽÿ�');
    ModalResult := mrCancel;
  end;

  Delay(1000);
end;

end.
