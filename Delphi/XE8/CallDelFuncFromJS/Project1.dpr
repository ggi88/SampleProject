program Project1;

uses
  Vcl.Forms,
  Main in 'src\Main.pas' {FMain},
  UCallFunc in 'src\UCallFunc.pas',
  UCommon in 'src\UCommon.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
