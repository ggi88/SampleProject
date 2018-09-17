program Updater;



uses
  Vcl.Forms,
  Update in 'src\Update.pas' {FUpdate},
  UCommonFunc in 'include\UCommonFunc.pas',
  USender in 'include\USender.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFUpdate, FUpdate);
  Application.Run;
end.
