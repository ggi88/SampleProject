program MultiLauncher;

uses
  Vcl.Forms,
  Vcl.Controls,
  Main in 'src\Main.pas' {FMain},
  SenserEditor in 'src\SenserEditor.pas' {FSenserEditor},
  UCommonFunc in 'include\UCommonFunc.pas',
  UItemInfo in 'include\UItemInfo.pas',
  UImage in 'include\UImage.pas' {mdImage: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  MyInfoEditor in 'src\MyInfoEditor.pas' {FMyInfoEditor},
  UItemList in 'include\UItemList.pas',
  DownLoader in 'src\DownLoader.pas' {FDownLoader},
  uMD5 in 'include\uMD5.pas',
  USender in 'include\USender.pas',
  Debuger in 'src\Debuger.pas' {FDebuger},
  DownloadList in 'src\DownloadList.pas' {FDownLoadList},
  Update in 'src\Update.pas' {FUpdate};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
//  Application.CreateForm(TFUpdate, FUpdate);
  FUpdate := TFUpdate.Create(nil);
  if FUpdate.ShowModal = mrOk then
  begin
    Application.CreateForm(TmdImage, mdImage);
    Application.CreateForm(TFMain, FMain);
    Application.Run;
  end;
end.
