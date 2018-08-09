unit Debuger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sScrollBox, Vcl.ComCtrls, sListView,
  Vcl.StdCtrls, sRichEdit, sLabel, sComboBox, sButton, sEdit, Vcl.ExtCtrls,
  sPanel, sPageControl;

type
  TFDebuger = class(TForm)
    pclView: TsPageControl;
    tabSendQuery: TsTabSheet;
    pnlSend: TsPanel;
    edtURL: TsEdit;
    btnSend: TsButton;
    cbbReqType: TsComboBox;
    btnParams: TsButton;
    pnlPostdataOption: TsPanel;
    btnFmtData: TsButton;
    btnFind: TsButton;
    btnCopy: TsButton;
    pnlReqTip: TsPanel;
    lblTitleSize: TsLabel;
    lblSize: TsLabel;
    sLabel1: TsLabel;
    memPostData: TsRichEdit;
    lvwParams: TsListView;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    sRichEdit1: TsRichEdit;
    sTabSheet2: TsTabSheet;
    sScrollBox1: TsScrollBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDebuger: TFDebuger;

implementation

{$R *.dfm}

end.
