unit UCommon;

interface

uses
  System.SysUtils, System.Classes, System.Threading, System.Rtti;

procedure SetTimeOut(proc: TProc; nInterval: Integer = 100);

// 함수 이름으로 함수 호출
// 취향것 사용
procedure CallMethod(obj: TObject; AMethodName: string); overload;
function CallMethod(obj: TObject; AMethodName: string; AParameters: TArray<TValue>): TValue; overload;


implementation

procedure SetTimeOut(proc: TProc; nInterval: Integer = 100);
begin
  TThread.CreateAnonymousThread( procedure
    begin
    Sleep(nInterval);
  	// 내부 코드
    TThread.Synchronize( TThread.CurrentThread, procedure
      begin
    		// GUI 코드
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
// IF문을 사용하는 방식
begin
  if AMethodName = 'callDelphiMethodFromJS' then
    callDelphiMethodFromJS
  else if AMethodName = 'callDelphiMethodFromJSWithParam' then
    callDelphiMethodFromJSWithParam(AParameters[0].AsString, AParameters[1].AsString);
end;
}
// RTTI로 메소드이름으로 메소드 호출하는 방식(published, public 으로 메소드가 선언되야함)
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
