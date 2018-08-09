program MultiLauncher;

uses
  Vcl.Forms,
  Main in 'src\Main.pas' {FMain},
  SenserEditor in 'src\SenserEditor.pas' {FSenserEditor},
  UCommonFunc in 'include\UCommonFunc.pas',
  UItemInfo in 'include\UItemInfo.pas',
  UImage in 'include\UImage.pas' {DataModule1: TDataModule},
  Vcl.Themes,
  Vcl.Styles,
  MyInfoEditor in 'src\MyInfoEditor.pas' {FMyInfoEditor},
  UItemList in 'include\UItemList.pas',
  DownLoader in 'src\DownLoader.pas' {FDownLoader},
  uMD5 in 'include\uMD5.pas',
  USender in 'include\USender.pas',
  Debuger in 'src\Debuger.pas' {FDebuger};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Light');
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFDebuger, FDebuger);
  Application.Run;
end.
