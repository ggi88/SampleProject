unit Main;

interface

uses
  UItemInfo, UItemList, USender, UCommonFunc, UImage, System.Threading, System.Generics.Collections,
  System.Types, Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.ToolWin, Vcl.Grids, System.AnsiStrings, AdvObj, BaseGrid, AdvGrid,
  AdvCGrid, System.Actions, Vcl.ActnList, WinHTTP_XE, Vcl.Menus, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, System.UITypes;

type
  TFMain = class(TForm)
    grd: TAdvColumnGrid;
    ActionList: TActionList;
    actAdd: TAction;
    actSetting: TAction;
    actLogin: TAction;
    actDectecting: TAction;
    actDel: TAction;
    actBackup: TAction;
    actRestore: TAction;
    actSensorInfo: TAction;
    pnlMenu: TPanel;
    cbbFind: TComboBox;
    popSetting: TPopupMenu;
    TmrRefresh: TTimer;
    actSetting1: TMenuItem;
    actBackup1: TMenuItem;
    actRestore1: TMenuItem;
    N01: TMenuItem;
    pnlInfo: TPanel;
    lblDesc: TLabel;
    lblIP: TLabel;
    lblID: TLabel;
    GroupBox1: TGroupBox;
    popGrid: TPopupMenu;
    mt1: TMenuItem;
    N1: TMenuItem;
    actInterlocking: TAction;
    N2: TMenuItem;
    actExecute: TAction;
    N3: TMenuItem;
    pnlMenubar: TPanel;
    popWorks: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    btnSetting: TButton;
    btnWorks: TButton;
    btnConnectionSensor: TButton;
    btnAddSensor: TButton;
    actLogout: TAction;
    N7: TMenuItem;
    N8: TMenuItem;
    grbModule: TGroupBox;
    lvwModule: TListView;
    grbLicense: TGroupBox;
    lvwLicense: TListView;
    grbSensor: TGroupBox;
    lblSerial: TLabel;
    N02: TMenuItem;
    miDelete: TMenuItem;
    pnlStatusBar: TPanel;
    lblCount: TLabel;
    btnInfo: TSpeedButton;
    Panel1: TPanel;
    btnInfoClose: TSpeedButton;
    procedure actAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actRestoreExecute(Sender: TObject);
    procedure actSensorInfoExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure grdEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure cbbFindChange(Sender: TObject);
    procedure TmrRefreshTimer(Sender: TObject);
    procedure grdEditChange(Sender: TObject; ACol, ARow: Integer; Value: string);
    procedure grdClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cbbFindKeyPress(Sender: TObject; var Key: Char);
    procedure actSettingExecute(Sender: TObject);
    procedure actInterlockingExecute(Sender: TObject);
    procedure actExecuteExecute(Sender: TObject);
    procedure btnWorksClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
    procedure actLogoutExecute(Sender: TObject);
    procedure grdSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
    procedure grdDblClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure actDelExecute(Sender: TObject);
    procedure btnInfoClick(Sender: TObject);
  private
    { Private declarations }
    m_listMyInfo: TMyInfoList;
    m_listSensor: TSensorList;
    m_procStr: TProc<String>;
    m_bLoad: Boolean;

    procedure DisplayMyInfo;
    procedure DisplaySensor(sFilter: string = '');
    procedure DisplaySensorRow(sKey: string; nRow: Integer);
    procedure UpdateItemRow(ARow: Integer);

    function CheckParams: Boolean;
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  SenserEditor, MyInfoEditor, DownloadList, Winapi.ShellApi;

{$R *.dfm}

procedure TFMain.actAddExecute(Sender: TObject);
var
  dlg: TFSenserEditor;
begin
  dlg := TFSenserEditor.Create(Self);
  dlg.ShowModal;

  DisplaySensor(cbbFind.Text);
end;

procedure TFMain.actBackupExecute(Sender: TObject);
begin
  m_listSensor.ExportConfig;
  DisplaySensor(cbbFind.Text);
end;

procedure TFMain.actDelExecute(Sender: TObject);
var
  arRows: TArray<Integer>;
  sKey: String;
  i: Integer;
begin
  grd.Enabled := False;
  arRows := nil;
  for i := 0 to grd.SelectedRowCount - 1 do
    Insert(grd.SelectedRow[i], arRows, 0);

  if Length(arRows) > 1 then
  begin
    if MessageDlg('여러 개 삭제 ㄱㄱ?', mtWarning, [mbOK, mbCancel], 0) = mrCancel then
    begin
      grd.Enabled := True;
      Exit;
    end;
  end;

  for i := 0 to Length(arRows) - 1 do
  begin
    sKey := grd.Cells[grd.ColumnByName['ip'].Index, arRows[i]];
    m_listSensor.Delete(sKey);
  end;
  DisplaySensor(cbbFind.Text);
  grd.Enabled := True;
end;

procedure TFMain.actExecuteExecute(Sender: TObject);
var
//  dl: TFDownLoader;
  sKeys: TArray<String>;
  i: Integer;
begin
  grd.Enabled := False;
  sKeys := nil;
  for i := 0 to grd.SelectedRowCount - 1 do
    Insert(grd.Cells[grd.ColumnByName['ip'].Index, grd.SelectedRow[i]], sKeys, 0);

  for i := 0 to Length(sKeys) - 1 do
  begin
    m_procStr :=
      procedure(sKey: String)
      begin
        SetTimeOut(procedure begin ExecuteDownloadList(sKey); end);
      end;
    m_procStr(sKeys[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actInterlockingExecute(Sender: TObject);
var
  sKeys: TArray<String>;
  i: Integer;
begin
  grd.Enabled := False;
  sKeys := nil;
  for i := 0 to grd.SelectedRowCount - 1 do
    Insert(grd.Cells[grd.ColumnByName['ip'].Index, grd.SelectedRow[i]], sKeys, 0);

  for i := 0 to Length(sKeys) - 1 do
  begin
    m_procStr :=
      procedure(sKey: String)
      begin
        SetTimeOut(procedure begin m_listSensor.Item(sKey).InterLockingSensor(m_listMyInfo.Item(m_listMyInfo.Keys[0]).IP,
                                                                              m_listMyInfo.Item(m_listMyInfo.Keys[0]).ID,
                                                                              m_listMyInfo.Item(m_listMyInfo.Keys[0]).DESC); end);
      end;
    m_procStr(sKeys[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actLoginExecute(Sender: TObject);
var
  sKeys: TArray<String>;
  i: Integer;
begin
  grd.Enabled := False;
  sKeys := nil;
  for i := 0 to grd.SelectedRowCount - 1 do
    Insert(grd.Cells[grd.ColumnByName['ip'].Index, grd.SelectedRow[i]], sKeys, 0);

  for i := 0 to Length(sKeys) - 1 do
  begin
    m_procStr :=
      procedure(sKey: String)
      begin
        SetTimeOut(procedure begin m_listSensor.Item(sKey).LoadLogin; end);
      end;
    m_procStr(sKeys[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actLogoutExecute(Sender: TObject);
var
  sKeys: TArray<String>;
  i: Integer;
begin
  grd.Enabled := False;
  sKeys := nil;
  for i := 0 to grd.SelectedRowCount - 1 do
    Insert(grd.Cells[grd.ColumnByName['ip'].Index, grd.SelectedRow[i]], sKeys, 0);

  for i := 0 to Length(sKeys) - 1 do
  begin
    m_procStr :=
      procedure(sKey: String)
      begin
        SetTimeOut(procedure begin m_listSensor.Item(sKey).LoadLogout; end);
      end;
    m_procStr(sKeys[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actSensorInfoExecute(Sender: TObject);
var
  sKeys: TArray<String>;
  i: Integer;
begin
  grd.Enabled := False;
  sKeys := nil;
  for i := 0 to grd.SelectedRowCount - 1 do
    Insert(grd.Cells[grd.ColumnByName['ip'].Index, grd.SelectedRow[i]], sKeys, 0);

  for i := 0 to Length(sKeys) - 1 do
  begin
    m_procStr :=
      procedure(sKey: String)
      begin
        SetTimeOut(procedure begin m_listSensor.Item(sKey).LoadSensor; end);
      end;
    m_procStr(sKeys[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actSettingExecute(Sender: TObject);
var
  dlg: TFMyInfoEditor;
begin
  dlg := TFMyInfoEditor.Create(Self);
  dlg.ShowModal;
  dlg.Free;

  DisplayMyInfo;
end;

procedure TFMain.cbbFindChange(Sender: TObject);
begin
  DisplaySensor(cbbFind.Text)
end;

procedure TFMain.cbbFindKeyPress(Sender: TObject; var Key: Char);
begin
  if CharInSet(Key, [Char(13)]) then
    cbbFind.Items.Add(cbbFind.Text);
end;

function TFMain.CheckParams: Boolean;
begin
  Result := ParamStr(1) = '1';
  if not Result then
    ShellExecute(Handle, 'open', 'Updater.exe', '', nil, SW_SHOWNORMAL);
end;

procedure TFMain.actRestoreExecute(Sender: TObject);
begin
  m_listSensor.ImportConfig;
  DisplaySensor(cbbFind.Text);
end;

procedure TFMain.DisplayMyInfo;
var
  item: THostInfo;
begin
  item := m_listMyInfo.Item(m_listMyInfo.Keys[0]);
  lblIP.Caption := 'IP:' + #9 + item.IP;
  lblID.Caption := 'ID:' + #9 + item.ID;
  lblDesc.Caption := '설명:' + #9 + item.DESC;
end;

procedure TFMain.DisplaySensorRow(sKey: string; nRow: Integer);
var
  Info: TSensorInfo;
begin
  Info := m_listSensor.Item(sKey);
  grd.Cells[grd.ColumnByName['no'].Index, nRow] := IntToStr(nRow);
  grd.Cells[grd.ColumnByName['desc'].Index, nRow] := Info.Desc;
  grd.Cells[grd.ColumnByName['ip'].Index, nRow] := Info.ip;
  grd.Cells[grd.ColumnByName['id'].Index, nRow] := Info.id;
  grd.Cells[grd.ColumnByName['pw'].Index, nRow] := Info.pw;
  grd.Cells[grd.ColumnByName['lasttime'].Index, nRow] := Info.LastTime;
  grd.Cells[grd.ColumnByName['healthcheck'].Index, nRow] := Info.SniperInfo;
  grd.Cells[grd.ColumnByName['login'].Index, nRow] := Info.LoginInfo;
  grd.Cells[grd.ColumnByName['interlocking'].Index, nRow] := Info.InterLocking;
  grd.AddImageIdx(grd.ColumnByName['delete'].Index, nRow, 0, haCenter, vaCenter);
end;

procedure TFMain.DisplaySensor(sFilter: string);
var
  sKey: string;
  nRow: Integer;
begin
  if m_bLoad then
    Exit;
  m_bLoad := True;

  grd.BeginUpdate;
  grd.UnHideRowsAll;
  grd.RowCount := m_listSensor.Count + 1;

  nRow := 0;
  for sKey in m_listSensor.Keys(True) do
  begin
    Inc(nRow);
    DisplaySensorRow(sKey, nRow);
  end;

  if sFilter <> '' then
  begin
    for nRow := grd.RowCount - 1 downto 1 do
    begin
      if not ContainsText(AnsiString(grd.Rows[nRow].Text), AnsiString(sFilter)) then
        grd.HideRow(nRow);
    end;
  end;
  grd.EndUpdate;

  lblCount.Caption := Format('%d / %d ', [grd.RowCount - 1, m_listSensor.Count]);

  m_bLoad := False;
end;

procedure TFMain.FormCreate(Sender: TObject);
var
  sKey: String;
begin
  if not CheckParams then
    Application.Terminate;

  Self.Caption := 'MultiLauncher';
  m_listMyInfo := TMyInfoList.GetObject;
  m_listSensor := TSensorList.GetObject;
  m_bLoad := False;

  DisplaySensor(cbbFind.Text);
  DisplayMyInfo;
end;

procedure TFMain.grdClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sKey: string;
begin
  if ACol = grd.ColumnByName['delete'].Index then
  begin
    sKey := grd.Cells[grd.ColumnByName['ip'].Index, ARow];
    m_listSensor.Delete(sKey);
    DisplaySensor(cbbFind.Text);
  end
end;

procedure TFMain.grdDblClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sKey: string;
begin
  if ACol = grd.ColumnByName['ip'].Index then
  begin
    sKey := grd.Cells[grd.ColumnByName['ip'].Index, ARow];
    ShellExecute(0, 'open', PChar('https://' + sKey), '', '', SW_SHOWNORMAL);
  end
end;

procedure TFMain.grdEditCellDone(Sender: TObject; ACol, ARow: Integer);
begin
  UpdateItemRow(ARow);
  TmrRefresh.Enabled := True;
end;

procedure TFMain.grdEditChange(Sender: TObject; ACol, ARow: Integer; Value: string);
begin
  TmrRefresh.Enabled := False;
end;

procedure TFMain.grdSelectCell(Sender: TObject; ACol, ARow: Integer; var CanSelect: Boolean);
var
  i: Integer;
  sKey: string;
  l: TStringList;
begin
  if not pnlInfo.Visible then Exit;

  sKey := grd.Cells[grd.ColumnByName['ip'].Index, ARow];
  l := m_listSensor.Item(sKey).ModuleList;

  lvwModule.Items.BeginUpdate;
  lvwModule.Clear;
  for i := 0 to l.Count - 1 do
    lvwModule.Items.Add.Caption := l[i];
  lvwModule.Items.EndUpdate;

  l := m_listSensor.Item(sKey).LicenseList;
  lvwLicense.Items.BeginUpdate;
  lvwLicense.Clear;
  for i := 0 to l.Count - 1 do
    lvwLicense.AddItem(l.Names[i], TObject(StrToIntDef(l.Values[l.Names[i]], 0)));
  lvwLicense.Items.EndUpdate;

  lblSerial.Caption := '시리얼:' + #9 + m_listSensor.Item(sKey).Serial;
end;

procedure TFMain.btnInfoClick(Sender: TObject);
begin
  pnlInfo.Visible := not pnlInfo.Visible;
  if pnlInfo.Visible then
  begin
    pnlStatusBar.Top := Self.Height;
  end;
end;

procedure TFMain.btnSettingClick(Sender: TObject);
var
  pt: TPoint;
begin
  pt := btnSetting.ClientToScreen(Point(0, 0));
  popSetting.Popup(pt.X + btnSetting.Width, pt.Y + btnSetting.Height);
end;

procedure TFMain.btnWorksClick(Sender: TObject);
var
  pt: TPoint;
begin
  pt := btnWorks.ClientToScreen(Point(0, 0));
  popWorks.Popup(pt.X, pt.Y + btnWorks.Height);
end;

procedure TFMain.TmrRefreshTimer(Sender: TObject);
begin
  TmrRefresh.Enabled := False;
  DisplaySensor(cbbFind.Text);
  TmrRefresh.Enabled := True;
end;

procedure TFMain.UpdateItemRow(ARow: Integer);
var
  sKey: string;
  Info: TSensorInfo;
begin
  sKey := grd.Cells[grd.ColumnByName['ip'].Index, ARow];
  Info := m_listSensor.Item(sKey);
  Info.IP := sKey;
  Info.ID := grd.Cells[grd.ColumnByName['id'].Index, ARow];
  Info.PW := grd.Cells[grd.ColumnByName['pw'].Index, ARow];
  Info.Desc := grd.Cells[grd.ColumnByName['desc'].Index, ARow];
end;

end.

