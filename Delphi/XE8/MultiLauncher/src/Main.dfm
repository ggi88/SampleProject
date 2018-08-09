object FMain: TFMain
  Left = 0
  Top = 0
  ActiveControl = cbbFind
  Caption = 'FMain'
  ClientHeight = 664
  ClientWidth = 965
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
  object grd: TAdvColumnGrid
    Left = 0
    Top = 70
    Width = 965
    Height = 506
    Cursor = crDefault
    Align = alClient
    ColCount = 10
    DoubleBuffered = False
    DrawingStyle = gdsClassic
    FixedCols = 0
    RowCount = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
    ParentDoubleBuffered = False
    ParentFont = False
    PopupMenu = popGrid
    ScrollBars = ssBoth
    TabOrder = 1
    OnSelectCell = grdSelectCell
    HoverRowCells = [hcNormal, hcSelected]
    OnClickCell = grdClickCell
    OnDblClickCell = grdDblClickCell
    OnEditCellDone = grdEditCellDone
    OnEditChange = grdEditChange
    ActiveCellFont.Charset = DEFAULT_CHARSET
    ActiveCellFont.Color = clWindowText
    ActiveCellFont.Height = -11
    ActiveCellFont.Name = 'Tahoma'
    ActiveCellFont.Style = [fsBold]
    ActiveCellColor = 15387318
    Bands.Active = True
    Bands.PrimaryColor = clSilver
    ColumnHeaders.Strings = (
      'No'
      #48708#44256
      'IP:Port'
      'ID'
      #48708#48128#48264#54840
      #51025#45813#49884#44036
      #50672#44208
      #47196#44536#51064
      #50672#46041#49444#51221
      #49325#51228)
    ControlLook.FixedGradientFrom = clWhite
    ControlLook.FixedGradientTo = clBtnFace
    ControlLook.FixedGradientHoverFrom = 13619409
    ControlLook.FixedGradientHoverTo = 12502728
    ControlLook.FixedGradientHoverMirrorFrom = 12502728
    ControlLook.FixedGradientHoverMirrorTo = 11254975
    ControlLook.FixedGradientDownFrom = 8816520
    ControlLook.FixedGradientDownTo = 7568510
    ControlLook.FixedGradientDownMirrorFrom = 7568510
    ControlLook.FixedGradientDownMirrorTo = 6452086
    ControlLook.FixedGradientDownBorder = 14007466
    ControlLook.CheckAlwaysActive = True
    ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownHeader.Font.Color = clWindowText
    ControlLook.DropDownHeader.Font.Height = -11
    ControlLook.DropDownHeader.Font.Name = 'Tahoma'
    ControlLook.DropDownHeader.Font.Style = []
    ControlLook.DropDownHeader.Visible = True
    ControlLook.DropDownHeader.Buttons = <>
    ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
    ControlLook.DropDownFooter.Font.Color = clWindowText
    ControlLook.DropDownFooter.Font.Height = -11
    ControlLook.DropDownFooter.Font.Name = 'Tahoma'
    ControlLook.DropDownFooter.Font.Style = []
    ControlLook.DropDownFooter.Visible = True
    ControlLook.DropDownFooter.Buttons = <>
    DefaultEditor = edNone
    Filter = <>
    FilterDropDown.Font.Charset = DEFAULT_CHARSET
    FilterDropDown.Font.Color = clWindowText
    FilterDropDown.Font.Height = -11
    FilterDropDown.Font.Name = 'Tahoma'
    FilterDropDown.Font.Style = []
    FilterDropDown.TextChecked = 'Checked'
    FilterDropDown.TextUnChecked = 'Unchecked'
    FilterDropDownClear = '(All)'
    FilterEdit.TypeNames.Strings = (
      'Starts with'
      'Ends with'
      'Contains'
      'Not contains'
      'Equal'
      'Not equal'
      'Larger than'
      'Smaller than'
      'Clear')
    FixedColWidth = 40
    FixedRowHeight = 22
    FixedRowAlways = True
    FixedFont.Charset = DEFAULT_CHARSET
    FixedFont.Color = clWindowText
    FixedFont.Height = -11
    FixedFont.Name = 'Tahoma'
    FixedFont.Style = [fsBold]
    FloatFormat = '%.2f'
    GridImages = DataModule1.imgGrid
    HoverButtons.Buttons = <>
    HoverButtons.Position = hbLeftFromColumnLeft
    MouseActions.CheckAllCheck = True
    MouseActions.DisjunctRowSelect = True
    MouseActions.EditOnDblClickOnly = True
    MouseActions.RangeSelectAndEdit = True
    Multilinecells = True
    Navigation.AllowClipboardColGrow = False
    Navigation.CopyHTMLTagsToClipboard = False
    PrintSettings.DateFormat = 'dd/mm/yyyy'
    PrintSettings.Font.Charset = DEFAULT_CHARSET
    PrintSettings.Font.Color = clWindowText
    PrintSettings.Font.Height = -11
    PrintSettings.Font.Name = 'Tahoma'
    PrintSettings.Font.Style = []
    PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
    PrintSettings.FixedFont.Color = clWindowText
    PrintSettings.FixedFont.Height = -11
    PrintSettings.FixedFont.Name = 'Tahoma'
    PrintSettings.FixedFont.Style = []
    PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
    PrintSettings.HeaderFont.Color = clWindowText
    PrintSettings.HeaderFont.Height = -11
    PrintSettings.HeaderFont.Name = 'Tahoma'
    PrintSettings.HeaderFont.Style = []
    PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
    PrintSettings.FooterFont.Color = clWindowText
    PrintSettings.FooterFont.Height = -11
    PrintSettings.FooterFont.Name = 'Tahoma'
    PrintSettings.FooterFont.Style = []
    PrintSettings.PageNumSep = '/'
    SearchFooter.ColorTo = 15790320
    SearchFooter.FindNextCaption = 'Find &next'
    SearchFooter.FindPrevCaption = 'Find &previous'
    SearchFooter.Font.Charset = DEFAULT_CHARSET
    SearchFooter.Font.Color = clWindowText
    SearchFooter.Font.Height = -11
    SearchFooter.Font.Name = 'Tahoma'
    SearchFooter.Font.Style = []
    SearchFooter.HighLightCaption = 'Highlight'
    SearchFooter.HintClose = 'Close'
    SearchFooter.HintFindNext = 'Find next occurrence'
    SearchFooter.HintFindPrev = 'Find previous occurrence'
    SearchFooter.HintHighlight = 'Highlight occurrences'
    SearchFooter.MatchCaseCaption = 'Match case'
    SelectionColorMixer = True
    ShowModified.Enabled = True
    SortSettings.DefaultFormat = ssAutomatic
    SortSettings.HeaderColorTo = 16579058
    SortSettings.HeaderMirrorColor = 16380385
    SortSettings.HeaderMirrorColorTo = 16182488
    VAlignment = vtaCenter
    Version = '3.1.3.9'
    Columns = <
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'No'
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'no'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = True
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 40
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #48708#44256
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'desc'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 100
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        Header = 'IP:Port'
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'ip'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 100
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = 'ID'
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'id'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 80
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNormal
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #48708#48128#48264#54840
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'pw'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 100
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #51025#45813#49884#44036
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'lasttime'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 60
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #50672#44208
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'healthcheck'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 200
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #47196#44536#51064
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'login'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #50672#46041#49444#51221
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'interlocking'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 64
      end
      item
        AutoMinSize = 0
        AutoMaxSize = 0
        Alignment = taLeftJustify
        Borders = []
        BorderPen.Color = clSilver
        CheckFalse = 'N'
        CheckTrue = 'Y'
        Color = clWindow
        ColumnPopupType = cpFixedCellsRClick
        DropDownCount = 8
        EditLength = 0
        Editor = edNone
        FilterCaseSensitive = False
        Fixed = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Header = #49325#51228
        HeaderAlignment = taCenter
        HeaderFont.Charset = DEFAULT_CHARSET
        HeaderFont.Color = clWindowText
        HeaderFont.Height = -11
        HeaderFont.Name = 'Tahoma'
        HeaderFont.Style = []
        MinSize = 0
        MaxSize = 0
        Name = 'delete'
        Password = False
        PrintBorders = [cbTop, cbLeft, cbRight, cbBottom]
        PrintColor = clWhite
        PrintFont.Charset = DEFAULT_CHARSET
        PrintFont.Color = clWindowText
        PrintFont.Height = -11
        PrintFont.Name = 'Tahoma'
        PrintFont.Style = []
        ReadOnly = False
        ShowBands = False
        SortStyle = ssAutomatic
        SpinMax = 0
        SpinMin = 0
        SpinStep = 1
        Tag = 0
        Width = 30
      end>
    ColWidths = (
      40
      100
      100
      80
      100
      60
      200
      64
      64
      30)
  end
  object pnlMenu: TPanel
    Left = 0
    Top = 41
    Width = 965
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object cbbFind: TComboBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 959
      Height = 24
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnChange = cbbFindChange
      OnKeyPress = cbbFindKeyPress
    end
  end
  object pnlInfo: TPanel
    Left = 0
    Top = 576
    Width = 965
    Height = 88
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 150
      Height = 82
      Align = alLeft
      Caption = #45236' '#51221#48372
      TabOrder = 0
      object lblDesc: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 56
        Width = 140
        Height = 13
        Align = alTop
        Caption = #49444#47749': '
        Layout = tlCenter
        ExplicitWidth = 29
      end
      object lblID: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'ID:'
        Layout = tlCenter
        ExplicitWidth = 15
      end
      object lblIP: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 140
        Height = 13
        Align = alTop
        Caption = 'IP: '
        Layout = tlCenter
        ExplicitWidth = 17
      end
    end
    object GroupBox3: TGroupBox
      AlignWithMargins = True
      Left = 159
      Top = 3
      Width = 150
      Height = 82
      Align = alLeft
      Caption = #49468#49436' '#47785#47197
      TabOrder = 1
      object lblTotalCount: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 37
        Width = 140
        Height = 13
        Align = alTop
        Caption = #51204#52404': 0'
        Layout = tlCenter
        ExplicitWidth = 35
      end
      object lblCurrentCount: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 140
        Height = 13
        Align = alTop
        Caption = #54788#51116': 0'
        Layout = tlCenter
        ExplicitWidth = 35
      end
    end
    object grbModule: TGroupBox
      AlignWithMargins = True
      Left = 471
      Top = 3
      Width = 220
      Height = 82
      Align = alLeft
      Caption = #47784#46280' '#51221#48372
      TabOrder = 2
      object lvwModule: TListView
        Left = 2
        Top = 15
        Width = 216
        Height = 65
        Align = alClient
        Columns = <>
        ColumnClick = False
        FlatScrollBars = True
        TabOrder = 0
        ViewStyle = vsList
      end
    end
    object grbLicense: TGroupBox
      AlignWithMargins = True
      Left = 697
      Top = 3
      Width = 220
      Height = 82
      Align = alLeft
      Caption = #46972#51060#49468#49828' '#51221#48372
      TabOrder = 3
      object lvwLicense: TListView
        Left = 2
        Top = 15
        Width = 216
        Height = 65
        Align = alClient
        Columns = <>
        ColumnClick = False
        FlatScrollBars = True
        TabOrder = 0
        ViewStyle = vsList
      end
    end
    object grbSensor: TGroupBox
      AlignWithMargins = True
      Left = 315
      Top = 3
      Width = 150
      Height = 82
      Align = alLeft
      Caption = #49468#49436' '#51221#48372
      TabOrder = 4
      object lblSerial: TLabel
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 140
        Height = 13
        Align = alTop
        Caption = #49884#47532#50620':'
        Layout = tlCenter
        ExplicitWidth = 37
      end
    end
  end
  object pnlMenubar: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object btnSetting: TButton
      AlignWithMargins = True
      Left = 887
      Top = 3
      Width = 75
      Height = 35
      Align = alRight
      Caption = #49444#51221
      Style = bsSplitButton
      TabOrder = 0
      OnClick = btnSettingClick
    end
    object btnWorks: TButton
      AlignWithMargins = True
      Left = 165
      Top = 3
      Width = 75
      Height = 35
      Align = alLeft
      Caption = #51089#50629
      Style = bsSplitButton
      TabOrder = 1
      OnClick = btnWorksClick
    end
    object btnConnectionSensor: TButton
      AlignWithMargins = True
      Left = 84
      Top = 3
      Width = 75
      Height = 35
      Action = actSensorInfo
      Align = alLeft
      TabOrder = 2
    end
    object btnAddSensor: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 35
      Action = actAdd
      Align = alLeft
      TabOrder = 3
    end
  end
  object ActionList: TActionList
    Left = 312
    Top = 152
    object actAdd: TAction
      Caption = #49468#49436' '#52628#44032
      ImageIndex = 0
      OnExecute = actAddExecute
    end
    object actDel: TAction
      Caption = #49468#49436' '#49325#51228
      ImageIndex = 1
    end
    object actSetting: TAction
      Caption = #45236' '#51221#48372' '#49444#51221
      OnExecute = actSettingExecute
    end
    object actLogin: TAction
      Caption = #47196#44536#51064
      ImageIndex = 3
      OnExecute = actLoginExecute
    end
    object actSensorInfo: TAction
      Caption = #50672#44208
      ImageIndex = 2
      OnExecute = actSensorInfoExecute
    end
    object actDectecting: TAction
      Caption = 'actDectecting'
    end
    object actBackup: TAction
      Caption = #49468#49436' '#51221#48372' '#48177#50629
      ImageIndex = 4
      Visible = False
      OnExecute = actBackupExecute
    end
    object actRestore: TAction
      Caption = #49468#49436' '#51221#48372' '#48373#44396
      ImageIndex = 5
      Visible = False
      OnExecute = actRestoreExecute
    end
    object actInterlocking: TAction
      Caption = #50672#46041#49444#51221' '#52628#44032
      OnExecute = actInterlockingExecute
    end
    object actExecute: TAction
      Caption = #49892#54665
      OnExecute = actExecuteExecute
    end
    object actLogout: TAction
      Caption = #47196#44536#50500#50883
      OnExecute = actLogoutExecute
    end
  end
  object popSetting: TPopupMenu
    Alignment = paRight
    AutoHotkeys = maManual
    BiDiMode = bdLeftToRight
    ParentBiDiMode = False
    Left = 888
    Top = 48
    object actSetting1: TMenuItem
      Action = actSetting
    end
    object N01: TMenuItem
      Caption = '-'
    end
    object actBackup1: TMenuItem
      Action = actBackup
    end
    object actRestore1: TMenuItem
      Action = actRestore
    end
  end
  object TmrRefresh: TTimer
    Interval = 2000
    OnTimer = TmrRefreshTimer
    Left = 352
    Top = 152
  end
  object popGrid: TPopupMenu
    Left = 312
    Top = 208
    object mt1: TMenuItem
      Action = actSensorInfo
    end
    object N1: TMenuItem
      Action = actLogin
    end
    object N7: TMenuItem
      Action = actLogout
    end
    object N2: TMenuItem
      Action = actInterlocking
    end
    object N3: TMenuItem
      Action = actExecute
    end
  end
  object popWorks: TPopupMenu
    Left = 208
    Top = 46
    object N4: TMenuItem
      Action = actLogin
    end
    object N8: TMenuItem
      Action = actLogout
    end
    object N5: TMenuItem
      Action = actInterlocking
    end
    object N6: TMenuItem
      Action = actExecute
    end
  end
end
