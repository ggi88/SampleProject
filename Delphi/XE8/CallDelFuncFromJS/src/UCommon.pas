unit UCommon;

interface

uses
  System.SysUtils, System.Classes, System.Threading, System.Rtti;

procedure SetTimeOut(proc: TProc; nInterval: Integer = 100);

// �Լ� �̸����� �Լ� ȣ��
// ����� ���
procedure CallMethod(obj: TObject; AMethodName: string); overload;
function CallMethod(obj: TObject; AMethodName: string; AParameters: TArray<TValue>): TValue; overload;


implementation

procedure SetTimeOut(proc: TProc; nInterval: Integer = 100);
begin
  TThread.CreateAnonymousThread( procedure
    begin
    Sleep(nInterval);
  	// ���� �ڵ�
    TThread.Synchronize( TThread.CurrentThread, procedure
      begin
    		// GUI �ڵ�
        proc
      end);
    end).Start;
end;

procedure CallMethod(obj: TObject; AMethodName: string);
type
  TExecute = procedure of object;
var
  e: TExecute;
begin
  TMethod(e).Data := obj;
  TMethod(e).Code := obj.MethodAddress(AMethodName);
  if Assigned(e) then e;
end;

function CallMethod(obj: TObject; AMethodName: string; AParameters: TArray<TValue>): TValue;
{
// IF���� ����ϴ� ���
begin
  if AMethodName = 'callDelphiMethodFromJS' then
    callDelphiMethodFromJS
  else if AMethodName = 'callDelphiMethodFromJSWithParam' then
    callDelphiMethodFromJSWithParam(AParameters[0].AsString, AParameters[1].AsString);
end;
}
// RTTI�� �޼ҵ��̸����� �޼ҵ� ȣ���ϴ� ���(published, public ���� �޼ҵ尡 ����Ǿ���)
var
  RttiCtx: TRttiContext;
  RttiTyp: TRttiType;
  RttiMtd: TRttiMethod;
begin
  RttiCtx := TRttiContext.Create;
  RttiTyp := RttiCtx.GetType(obj.ClassInfo);
  RttiMtd := nil;
  if Assigned(RttiTyp) then
  begin
    RttiMtd := RttiTyp.GetMethod(AMethodName);
    if Assigned(RttiMtd) then
      Result := RttiMtd.Invoke(obj, AParameters);
  end;
  RttiMtd.Free;
  RttiTyp.Free;
  RttiCtx.Free;
end;

end.
