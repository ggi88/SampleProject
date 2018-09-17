object FUpdate: TFUpdate
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'FUpdate'
  ClientHeight = 208
  ClientWidth = 318
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pgb: TProgressBar
    Left = 0
    Top = 188
    Width = 318
    Height = 20
    Align = alBottom
    Smooth = True
    Style = pbstMarquee
    TabOrder = 0
  end
  object mem: TMemo
    Left = 0
    Top = 0
    Width = 318
    Height = 188
    Align = alClient
    ReadOnly = True
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 1500
    OnTimer = Timer1Timer
    Left = 136
    Top = 80
  end
end
