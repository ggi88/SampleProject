unit MyInfoEditor;

interface

uses
  UItemList,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFMyInfoEditor = class(TForm)
    edtIP: TLabeledEdit;
    edtDesc: TLabeledEdit;
    Panel1: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    edtID: TLabeledEdit;
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    m_List: TMyInfoList;
  public
    { Public declarations }
  end;

//var
//  FMyInfoEditor: TFMyInfoEditor;

implementation

uses
  UItemInfo;

{$R *.dfm}

procedure TFMyInfoEditor.btnOKClick(Sender: TObject);
begin
  m_List.InsertOrUpdate(edtIP.Text, edtID.Text, edtDesc.Text);
end;

procedure TFMyInfoEditor.FormCreate(Sender: TObject);
var
  item: THostInfo;
begin
  m_List := TMyInfoList.GetObject;
  item := m_List.Item(m_List.Keys[0]);
  edtID.Text := item.ID;
  edtIP.Text := item.IP;
  edtDesc.Text := item.DESC;
end;

end.
