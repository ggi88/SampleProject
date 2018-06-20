unit UCallFunc;

interface

uses
  Vcl.Dialogs, Vcl.Forms;

{$M+}
type
  TCallFunc = class
  private
  public
  published
    procedure delFunc_Message;
    procedure delFunc_Form;
  end;
{$M-}

var
  g_CallFunc: TCallFunc;

implementation

{ TCallFunc }

procedure TCallFunc.delFunc_Form;
var
  f: TForm;
begin
  f := TForm.Create(nil);
  f.Caption := 'TCallFunc 폼';
  f.ShowModal;
  f.Free;
end;

procedure TCallFunc.delFunc_Message;
begin
  ShowMessage('TCallFunc 메시지 테스트');
end;

initialization
  g_CallFunc := TCallFunc.Create;

finalization
  g_CallFunc.Free;

end.
