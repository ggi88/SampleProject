object FMyInfoEditor: TFMyInfoEditor
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'FMyInfoEditor'
  ClientHeight = 137
  ClientWidth = 242
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object edtIP: TLabeledEdit
    Left = 40
    Top = 39
    Width = 170
    Height = 21
    BiDiMode = bdLeftToRight
    EditLabel.Width = 10
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'IP'
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    ParentBiDiMode = False
    TabOrder = 1
  end
  object edtDesc: TLabeledEdit
    Left = 40
    Top = 70
    Width = 170
    Height = 21
    BiDiMode = bdLeftToRight
    EditLabel.Width = 22
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = #49444#47749
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    ParentBiDiMode = False
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 102
    Width = 242
    Height = 35
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 3
    object btnOK: TButton
      AlignWithMargins = True
      Left = 82
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      AlignWithMargins = True
      Left = 163
      Top = 4
      Width = 75
      Height = 27
      Align = alRight
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object edtID: TLabeledEdit
    Left = 40
    Top = 8
    Width = 170
    Height = 21
    BiDiMode = bdLeftToRight
    EditLabel.Width = 11
    EditLabel.Height = 13
    EditLabel.BiDiMode = bdLeftToRight
    EditLabel.Caption = 'ID'
    EditLabel.ParentBiDiMode = False
    LabelPosition = lpLeft
    ParentBiDiMode = False
    TabOrder = 0
  end
end
