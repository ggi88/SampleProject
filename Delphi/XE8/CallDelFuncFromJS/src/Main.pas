unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFMain = class(TForm)
    pnl: TPanel;
    btnMsg: TButton;
    btnForm: TButton;
    mmoLog: TMemo;
    Splitter1: TSplitter;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    wbs: TWebBrowser;
    procedure FormCreate(Sender: TObject);
    procedure wbsStatusTextChange(ASender: TObject; const Text: WideString);
    procedure btnFormClick(Sender: TObject);
    procedure btnMsgClick(Sender: TObject);
  private
    { Private declarations }
    procedure AddLog(s: String);
  public
    { Public declarations }
  published
    procedure delFunc_MainMessage;
    procedure delFunc_MainForm;
  end;

var
  FMain: TFMain;

implementation

uses
  UCommon, UCallFunc;

{$R *.dfm}

procedure TFMain.AddLog(s: String);
begin
  mmoLog.Lines.Add(s);
end;

procedure TFMain.btnFormClick(Sender: TObject);
var
  f: TForm;
begin
  f := TForm.Create(nil);
  f.Caption := '메인 폼';
  f.ShowModal;
  f.Free;
end;

procedure TFMain.btnMsgClick(Sender: TObject);
begin
  ShowMessage('메인 메시지');
end;

procedure TFMain.delFunc_MainForm;
begin
  btnForm.Click;
end;

procedure TFMain.delFunc_MainMessage;
begin
  btnMsg.Click;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  wbs.Navigate2(ExtractFilePath(Application.ExeName) + 'index.html');
end;

procedure TFMain.wbsStatusTextChange(ASender: TObject; const Text: WideString);
const
  CST_DEL_FUNC = 'delFunc_';
var
  sFuncName: String;
begin
  sFuncName := Text;
  if Pos(CST_DEL_FUNC, sFuncName) = 0 then Exit;

  AddLog('Web Status: ' + String(Text));
  SetTimeOut( procedure
    begin
      // 사용할 함수가 있는 클래스를 넘겨줘야한다.
      CallMethod(g_CallFunc, sFuncName)
//      CallMethod(Self, sFuncName)
    end, 1);
end;

end.
