unit UCommonFunc;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections,
  System.RegularExpressions, Vcl.Forms;

{** Thread를 이용한 비동기 콜백
* UI동기 없이 지연가능한 함수 활용을 위해 작성
* 기존 타이머를 이용한 부분 대체
* proc: TProc 프로시저 함수 / nInterval 시간 (1000 = 1초)
}
procedure SetTimeOut(proc: TProc; nInterval: Integer = 1);

procedure InitTasks;
procedure AddTask(proc: TProc);
procedure RunTasks;
procedure WaitTask;


{******************************************************************************}
{                                                                              }
{  자동 객체 해제 클래스 테스트                                                }
{  https://msdn.microsoft.com/ko-kr/library/hh279674.aspx                      }
{  - 함수 안에서 제한적 사용                                                   }
{  - 개선 필요                                                                 }
{                                                                              }
{  ex)                                                                         }
{      procedure GetData;                                                      }
{      var l: TList;                                                           }
{      begin                                                                   }
{        DoSmartPointer( TObject( l ), TList.Create )                                     }
{      end;                                                                    }
{                                                                              }
{******************************************************************************}
function DoSmartPointer( out Reference: TObject; Instance: TObject ): IUnknown;

function CustomFileRead(sPath: String; Encoding: TEncoding; var Output: String): Boolean;
function CustomFileWrite(sPath: String; Encoding: TEncoding; Input: String): Boolean;

//  Validation IPv4 with Port
function IsValidIPv4(ip: String): Boolean;

// sql String
function ToQuotes(text: String = ''): String;

// async delay
procedure Delay(dwMilliseconds: Cardinal);

implementation

uses
  System.Threading;

type
  TMyTask = class
 private
    _proc: TProc;
    procedure Execute;
  public
    constructor Create(proc: TProc);
    function Start: ITask;
  end;

var
  m_Objectlist: TObjectList<TMyTask>;
  m_Tasks: TArray<ITask>;

procedure SetTimeOut(proc: TProc; nInterval: Integer);
begin
  TThread.CreateAnonymousThread( procedure
    begin
      Sleep(nInterval);

      TThread.Synchronize( TThread.CurrentThread, procedure
        begin
          proc
        end);
    end).Start;
end;

procedure InitTasks;
begin
  m_Objectlist.Clear;
end;

procedure AddTask(proc: TProc);
begin
  m_Objectlist.Add(TMyTask.Create(proc));
end;

procedure RunTasks;
var
  i: Integer;
begin
  SetLength(m_Tasks, m_Objectlist.Count);
  for i := 0 to m_Objectlist.Count -1 do
  begin
    m_Tasks[i] := m_Objectlist[i].Start;
  end;
end;

procedure WaitTask;
begin
  TTask.WaitForAll(m_Tasks);
end;

type
  TSmartPointer = class( TInterfacedObject )
  private
    FInstance: TObject;
  public
    constructor Create( AInstance: TObject );
    destructor Destroy; override;
  end;

{ TSmartPointer }

function DoSmartPointer( out Reference: TObject; Instance: TObject ): IUnknown;
begin
  Result := TSmartPointer.Create( Instance );
  TObject(Reference) := Instance;
end;

constructor TSmartPointer.Create(AInstance: TObject);
begin
  FInstance := AInstance;
end;

destructor TSmartPointer.Destroy;
begin
  FInstance.Free;

  inherited;
end;

function CustomFileRead(sPath: String; Encoding: TEncoding; var Output: String): Boolean;
var
  SR: TStreamReader;
begin
  Result := False;

  if not FileExists(sPath) then Exit;

  SR := TStreamReader.Create(sPath, Encoding);
  try
    Output := SR.ReadToEnd;
    Result := True;
  finally
    SR.Free;
  end;
end;

function CustomFileWrite(sPath: String; Encoding: TEncoding; Input: String): Boolean;
var
  SW: TStreamWriter;
begin
  SW := TStreamWriter.Create(sPath, False, Encoding);
  try
    Result := False;
    SW.Write(Input);
    Result := True;
  finally
    SW.Free;
  end;
end;

function IsValidIPv4(ip: String): Boolean;
begin
  Result := TRegEx.IsMatch(ip, '((?:\d+\.){3}(?:\d+)(?::\d*)?)')
end;

function ToQuotes(text: String): String;
begin
  Result := '''' + text + '''';
end;

procedure Delay(dwMilliseconds: Cardinal);
var
  iStart, iStop: Cardinal;
begin
  iStart := TThread.GetTickCount;
  repeat
    iStop := TThread.GetTickCount;
    Application.ProcessMessages;
  until (iStop - iStart) >= dwMilliseconds;
end;


{ TMyTask }

constructor TMyTask.Create(proc: TProc);
begin
  _proc := proc;
end;

procedure TMyTask.Execute;
begin
  _proc;
end;

function TMyTask.Start: ITask;
begin
  Result := TTask.Run(Execute);
end;

initialization
  m_Objectlist := TObjectList<TMyTask>.Create;

finalization
  m_Objectlist.Free;

end.
