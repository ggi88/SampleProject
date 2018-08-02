unit Main;

interface

uses
  UItemInfo, UItemList, USender, UCommonFunc, UImage,

  System.Threading, System.Generics.Collections, System.Types,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, System.AnsiStrings,
  AdvObj, BaseGrid, AdvGrid, AdvCGrid, System.Actions, Vcl.ActnList, WinHTTP_XE,
  Vcl.Menus, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList;

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
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    GroupBox3: TGroupBox;
    lblTotalCount: TLabel;
    lblCurrentCount: TLabel;
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
    procedure actAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actBackupExecute(Sender: TObject);
    procedure actRestoreExecute(Sender: TObject);
    procedure actSensorInfoExecute(Sender: TObject);
    procedure actLoginExecute(Sender: TObject);
    procedure grdEditCellDone(Sender: TObject; ACol, ARow: Integer);
    procedure cbbFindChange(Sender: TObject);
    procedure TmrRefreshTimer(Sender: TObject);
    procedure grdEditChange(Sender: TObject; ACol, ARow: Integer;
      Value: string);
    procedure grdClickCell(Sender: TObject; ARow, ACol: Integer);
    procedure cbbFindKeyPress(Sender: TObject; var Key: Char);
    procedure actSettingExecute(Sender: TObject);
    procedure actInterlockingExecute(Sender: TObject);
    procedure actExecuteExecute(Sender: TObject);
    procedure btnWorksClick(Sender: TObject);
    procedure btnSettingClick(Sender: TObject);
  private
    { Private declarations }
    m_listMyInfo: TMyInfoList;
    m_listSensor: TSensorList;
    m_procInt: TProc<Integer>;
    m_bLoad : Boolean;
    procedure DisplayMyInfo;
    procedure DisplaySensor(sFilter: String = '');
    procedure DisplaySensorRow(sKey: String; nRow: Integer);
    procedure UpdateItemRow(ARow: Integer);
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

uses
  SenserEditor, MyInfoEditor, Downloader;

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

procedure TFMain.actExecuteExecute(Sender: TObject);
var
  dl: TFDownLoader;
  arRows: TArray<Integer>;
  i: Integer;
begin
  grd.Enabled := False;
  arRows := nil;
  for i := 0 to grd.SelectedRowCount -1 do
    Insert(grd.SelectedRow[i], arRows, 0);

  for i := 0 to Length(arRows) -1 do
  begin
    m_procInt := procedure (nRow: Integer)
      begin
        SetTimeOut(procedure
          begin
            dl := TFDownLoader.Create(Self);
            dl.Init(grd.Cells[grd.ColumnByName['ip'].Index, nRow]);
            dl.Show;
          end);
      end;
    m_procInt(arRows[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actInterlockingExecute(Sender: TObject);
var
  arRows: TArray<Integer>;
  i: Integer;
  sKey: String;
begin
  grd.Enabled := False;
  arRows := nil;
  for i := 0 to grd.SelectedRowCount -1 do
    Insert(grd.SelectedRow[i], arRows, 0);

  for i := 0 to Length(arRows) -1 do
  begin
    m_procInt := procedure (nRow: Integer)
      begin
        SetTimeOut(procedure
          begin
            sKey := grd.Cells[grd.ColumnByName['ip'].Index, nRow];
            m_listSensor.Item(sKey).InterLockingSensor(m_listMyInfo.Item(m_listMyInfo.Keys[0]).IP,
                                                       m_listMyInfo.Item(m_listMyInfo.Keys[0]).ID,
                                                       m_listMyInfo.Item(m_listMyInfo.Keys[0]).DESC);
          end);
      end;
    m_procInt(arRows[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actLoginExecute(Sender: TObject);
var
  arRows: TArray<Integer>;
  i: Integer;
  sKey: String;
begin
  grd.Enabled := False;
  arRows := nil;
  for i := 0 to grd.SelectedRowCount -1 do
    Insert(grd.SelectedRow[i], arRows, 0);

  for i := 0 to Length(arRows) -1 do
  begin
    m_procInt := procedure (nRow: Integer)
      begin
        SetTimeOut(procedure
          begin
            sKey := grd.Cells[grd.ColumnByName['ip'].Index, nRow];
            m_listSensor.Item(sKey).LoadLogin;
          end);
      end;
    m_procInt(arRows[i]);
  end;

  grd.Enabled := True;
end;

procedure TFMain.actSensorInfoExecute(Sender: TObject);
var
  arRows: TArray<Integer>;
  i: Integer;
  sKey: String;
begin
  grd.Enabled := False;
  arRows := nil;
  for i := 0 to grd.SelectedRowCount -1 do
    Insert(grd.SelectedRow[i], arRows, 0);

  for i := 0 to Length(arRows) -1 do
  begin
    m_procInt := procedure (nRow: Integer)
      begin
        SetTimeOut(procedure
          begin
            sKey := grd.Cells[grd.ColumnByName['ip'].Index, nRow];
            m_listSensor.Item(sKey).LoadSensor;
          end);
      end;
    m_procInt(arRows[i]);
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

procedure TFMain.DisplaySensorRow(sKey: String; nRow: Integer);
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
  grd.Cells[grd.ColumnByName['healthcheck'].Index, nRow] := info.SniperInfo;
  grd.Cells[grd.ColumnByName['login'].Index, nRow] := info.LoginInfo;
  grd.Cells[grd.ColumnByName['interlocking'].Index, nRow] := info.InterLocking;
  grd.AddImageIdx(grd.ColumnByName['delete'].Index, nRow, 0, haCenter, vaCenter);
end;

procedure TFMain.DisplaySensor(sFilter: String);
var
  sKey: String;
  nRow: Integer;
begin
  if m_bLoad then Exit;
  m_bLoad := True;

  grd.BeginUpdate;
  grd.UnHideRowsAll;
  grd.RowCount := m_listSensor.Count +1;

  nRow := 0;
  for sKey in m_listSensor.Keys do
  begin
    Inc(nRow);
    DisplaySensorRow(sKey, nRow);
  end;

  if sFilter <> '' then
  begin
    for nRow := grd.RowCount -1 downto 1 do
    begin
      if not ContainsText(AnsiString(grd.Rows[nRow].Text), AnsiString(sFilter)) then
        grd.HideRow(nRow);
    end;
  end;
  grd.EndUpdate;

  lblCurrentCount.Caption := '현재:' + #9 + IntToStr(grd.RowCount -1);
  lblTotalCount.Caption := '전체:' + #9 + IntToStr(m_listSensor.Count);

  m_bLoad := False;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  Self.Caption := 'MultiLauncher';
  m_listMyInfo := TMyInfoList.GetObject;
  m_listSensor := TSensorList.GetObject;
  m_bLoad := False;

  DisplaySensor(cbbFind.Text);
  DisplayMyInfo;
end;

procedure TFMain.grdClickCell(Sender: TObject; ARow, ACol: Integer);
var
  sKey: String;
begin
  if ACol = grd.ColumnByName['delete'].Index then
  begin
    sKey := grd.Cells[grd.ColumnByName['ip'].Index, ARow];
    m_listSensor.Delete(sKey);
    DisplaySensor(cbbFind.Text);
  end;
end;

procedure TFMain.grdEditCellDone(Sender: TObject; ACol, ARow: Integer);
begin
  UpdateItemRow(ARow);
  TmrRefresh.Enabled := True;
end;

procedure TFMain.grdEditChange(Sender: TObject; ACol, ARow: Integer;
  Value: string);
begin
  TmrRefresh.Enabled := False;
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
  sKey: String;
  Info: TSensorInfo;
begin
  sKey := grd.Cells[grd.ColumnByName['ip'].Index, ARow];
  info := m_listSensor.Item(sKey);
  info.IP := sKey;
  info.ID := grd.Cells[grd.ColumnByName['id'].Index, ARow];
  info.PW := grd.Cells[grd.ColumnByName['pw'].Index, ARow];
  info.Desc := grd.Cells[grd.ColumnByName['desc'].Index, ARow];
end;

end.
