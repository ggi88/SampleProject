unit SenserEditor;

interface

uses
  UItemList,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFSenserEditor = class(TForm)
    edtIP: TLabeledEdit;
    edtID: TLabeledEdit;
    edtPW: TLabeledEdit;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    edtDesc: TLabeledEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    m_List: TSensorList;
  public
    { Public declarations }
  end;

//var
//  FSenserEditor: TFSenserEditor;

implementation

uses
  UCommonFunc;

{$R *.dfm}

procedure TFSenserEditor.btnOKClick(Sender: TObject);
begin
  if not IsValidIPv4(edtIP.Text) then
  begin
    ShowMessage('ip err');
    Exit;
  end;

  m_List.InsertOrUpdate(edtIP.Text, edtID.Text, edtPW.Text, edtDesc.Text);

  ModalResult := mrOk;
end;

procedure TFSenserEditor.FormCreate(Sender: TObject);
begin
  m_List := TSensorList.GetObject;
end;

end.
