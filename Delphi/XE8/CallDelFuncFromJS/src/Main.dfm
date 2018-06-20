object FMain: TFMain
  Left = 0
  Top = 0
  Caption = 'FMain'
  ClientHeight = 450
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 358
    Width = 635
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ExplicitTop = 49
    ExplicitWidth = 312
  end
  object pnl: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 49
    Align = alTop
    TabOrder = 0
    object btnMsg: TButton
      Left = 13
      Top = 10
      Width = 120
      Height = 25
      Caption = #45208#50752#46972' '#47700#51064' '#47700#49884#51648
      TabOrder = 0
      OnClick = btnMsgClick
    end
    object btnForm: TButton
      Left = 139
      Top = 10
      Width = 120
      Height = 25
      Caption = #45208#50752#46972' '#47700#51064' '#54268
      TabOrder = 1
      OnClick = btnFormClick
    end
  end
  object mmoLog: TMemo
    Left = 0
    Top = 361
    Width = 635
    Height = 89
    Align = alBottom
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 49
    Width = 635
    Height = 309
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 1
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object wbs: TWebBrowser
        Left = 0
        Top = 0
        Width = 627
        Height = 281
        Align = alClient
        TabOrder = 0
        OnStatusTextChange = wbsStatusTextChange
        ExplicitLeft = 304
        ExplicitTop = 160
        ExplicitWidth = 300
        ExplicitHeight = 150
        ControlData = {
          4C000000CD4000000B1D00000000000000000000000000000000000000000000
          000000004C000000000000000000000001000000E0D057007335CF11AE690800
          2B2E126208000000000000004C0000000114020000000000C000000000000046
          8000000000000000000000000000000000000000000000000000000000000000
          00000000000000000100000000000000000000000000000000000000}
      end
    end
  end
end
