object FDownLoadList: TFDownLoadList
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'FDownLoadList'
  ClientHeight = 371
  ClientWidth = 244
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object slb: TScrollBox
    Left = 0
    Top = 0
    Width = 244
    Height = 351
    Align = alClient
    TabOrder = 0
  end
  object pnlCount: TPanel
    Left = 0
    Top = 351
    Width = 244
    Height = 20
    Align = alBottom
    Alignment = taRightJustify
    BevelOuter = bvNone
    Caption = '0'
    TabOrder = 1
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 16
    Top = 24
  end
end
