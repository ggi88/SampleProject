unit DownloadList;

interface

uses
  Downloader, UCommonFunc,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.Generics.Collections;

type
  TFDownLoadList = class(TForm)
    Timer1: TTimer;
    slb: TScrollBox;
    pnlCount: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    m_nIndex: Integer;
    m_Dict: TDictionary<String,TFDownLoader>;
  public
    { Public declarations }
    procedure Add(sIP: String);
  end;

procedure ExecuteDownloadList(sIP: String);

implementation

var
  FDownLoadList: TFDownLoadList = nil;

{$R *.dfm}

procedure ExecuteDownloadList(sIP: String);
begin
  if not Assigned(FDownLoadList) then
    FDownLoadList := TFDownLoadList.Create(Application);
  FDownLoadList.Add(sIP);

  if not FDownLoadList.Visible then
    FDownLoadList.Show;
end;

procedure TFDownLoadList.Add(sIP: String);
var
  dl: TFDownLoader;
begin
  dl := ExecuteDownloader(sIP);
  dl.Parent := slb;
  dl.Visible := True;

  m_Dict.AddOrSetValue(sIP, dl);
end;

procedure TFDownLoadList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFDownLoadList.FormCreate(Sender: TObject);
begin
  m_nIndex := 0;
  m_Dict := TDictionary<String,TFDownLoader>.Create;
end;

procedure TFDownLoadList.FormDestroy(Sender: TObject);
var
  sKey: String;
begin
  for sKey in m_Dict.Keys do
    m_Dict.Items[sKey].Close;
  m_Dict.Clear;
  m_Dict.Free;
  FDownLoadList := nil;
end;

procedure TFDownLoadList.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  pnlCount.Caption := Format('รั: %d ', [slb.ControlCount]);

  if slb.ControlCount = 0 then
  begin
    Delay(100);
    Close;
  end;

  if m_Dict.Count <= m_nIndex then
  begin
    Exit;
  end;

  try
    m_Dict.Items[m_Dict.Keys.ToArray[m_nIndex]].Start;
    if m_Dict.Items[m_Dict.Keys.ToArray[m_nIndex]].Status then
    begin
      m_Dict.Remove(m_Dict.Keys.ToArray[m_nIndex]);
    //    m_nIndex := 0;
    end
    else
    begin
      Inc(m_nIndex);
    end;
  except
    //
  end;

  Timer1.Enabled := True;
end;

end.
