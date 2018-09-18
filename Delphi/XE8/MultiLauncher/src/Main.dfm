object FMain: TFMain
  Left = 0
  Top = 0
  ActiveControl = cbbFind
  Caption = 'FMain'
  ClientHeight = 660
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
    Top = 59
    Width = 965
    Height = 457
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
    GridImages = mdImage.imgGrid
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
    Top = 30
    Width = 965
    Height = 29
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object cbbFind: TComboBox
      AlignWithMargins = True
      Left = 0
      Top = 3
      Width = 965
      Height = 24
      Margins.Left = 0
      Margins.Right = 0
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
    Top = 516
    Width = 965
    Height = 120
    Align = alBottom
    TabOrder = 2
    Visible = False
    object GroupBox1: TGroupBox
      AlignWithMargins = True
      Left = 4
      Top = 28
      Width = 150
      Height = 88
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
    object grbModule: TGroupBox
      AlignWithMargins = True
      Left = 316
      Top = 28
      Width = 220
      Height = 88
      Align = alLeft
      Caption = #47784#46280' '#51221#48372
      TabOrder = 1
      object lvwModule: TListView
        Left = 2
        Top = 15
        Width = 216
        Height = 71
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
      Left = 542
      Top = 28
      Width = 220
      Height = 88
      Align = alLeft
      Caption = #46972#51060#49468#49828' '#51221#48372
      TabOrder = 2
      object lvwLicense: TListView
        Left = 2
        Top = 15
        Width = 216
        Height = 71
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
      Left = 160
      Top = 28
      Width = 150
      Height = 88
      Align = alLeft
      Caption = #49468#49436' '#51221#48372
      TabOrder = 3
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
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 963
      Height = 24
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object btnInfoClose: TSpeedButton
        Left = 941
        Top = 0
        Width = 22
        Height = 24
        Align = alRight
        Flat = True
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000006A00000014000000000000000000000000000000000000
          000000000000000000280000005A000000000000000000000000000000000000
          0000000000000000000501010182000000140000000000000000000000000000
          0000000000270000007600000000000000000000000000000000000000000000
          0000000000000000000000000005010101820000001300000000000000000000
          0027000000760000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000060101018200000013000000260000
          0075000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000060101018B0000007D0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000002700000078010101840000
          0015000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000270000007600000000000000060101
          0184000000150000000000000000000000000000000000000000000000000000
          0000000000000000000000000027000000760000000000000000000000000000
          0006010101840000001500000000000000000000000000000000000000000000
          0000000000000000002600000075000000000000000000000000000000000000
          0000000000060101018400000015000000000000000000000000000000000000
          0000000000000000004A00000000000000000000000000000000000000000000
          0000000000000000000600000046000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000}
        OnClick = btnInfoClick
        ExplicitLeft = 9
        ExplicitTop = 2
        ExplicitHeight = 22
      end
    end
  end
  object pnlMenubar: TPanel
    Left = 0
    Top = 0
    Width = 965
    Height = 30
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 3
    object btnSetting: TButton
      AlignWithMargins = True
      Left = 887
      Top = 3
      Width = 75
      Height = 24
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
      Height = 24
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
      Height = 24
      Action = actSensorInfo
      Align = alLeft
      TabOrder = 2
    end
    object btnAddSensor: TButton
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 75
      Height = 24
      Action = actAdd
      Align = alLeft
      TabOrder = 3
    end
  end
  object pnlStatusBar: TPanel
    Left = 0
    Top = 636
    Width = 965
    Height = 24
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 4
    object lblCount: TLabel
      AlignWithMargins = True
      Left = 939
      Top = 4
      Width = 22
      Height = 16
      Align = alRight
      Caption = '0 / 0'
      ExplicitHeight = 13
    end
    object btnInfo: TSpeedButton
      Left = 1
      Top = 1
      Width = 22
      Height = 22
      Align = alLeft
      Flat = True
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000000000000000
        00000000000000000000000000240000006C0000008D00000094000000970000
        008C0000006A0000002300000000000000000000000000000000000000000000
        000000000000000000590000007E000000360000001500000000000000000000
        0015000000350000007F00000057000000000000000000000000000000000000
        00000000006B0000004D00000000000000000000000000000000000000000000
        0000000000000000000000000050000000680000000000000000000000000000
        005A0000004D0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000000000500000005700000000000000250000
        007C0000000000000000000000000000000000000000000000720000006E0000
        0000000000000000000000000000000000000000007F000000230000006D0000
        003200000000000000000000000000000000000000000000007C000000780000
        000000000000000000000000000000000000000000350000006A0000008F0000
        001300000000000000000000000000000000000000000000007C000000780000
        000000000000000000000000000000000000000000150000008C000000940000
        000000000000000000000000000000000000000000000000007C000000780000
        0000000000000000000000000000000000000000000000000097000000910000
        000000000000000000000000000000000000000000000000007C000000780000
        00000000000000000000000000000000000000000000000000940000008F0000
        0012000000000000000000000000000000000000000000000048000000450000
        000000000000000000000000000000000000000000150000008D0000006E0000
        0033000000000000000000000000000000000000000000000019000000180000
        000000000000000000000000000000000000000000360000006C000000260000
        007B000000000000000000000000000000000000000000000073000000700000
        0000000000000000000000000000000000000000007E00000024000000000000
        005C0000004B0000000000000000000000000000000000000000000000000000
        00000000000000000000000000000000004D0000005900000000000000000000
        00000000006E0000004B00000000000000000000000000000000000000000000
        000000000000000000000000004D0000006B0000000000000000000000000000
        0000000000000000005C0000007B000000330000001200000000000000000000
        0013000000320000007C0000005A000000000000000000000000000000000000
        00000000000000000000000000260000006E0000008F00000091000000940000
        008F0000006D0000002500000000000000000000000000000000}
      OnClick = btnInfoClick
      ExplicitLeft = 0
      ExplicitTop = 3
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
      OnExecute = actDelExecute
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
    object N02: TMenuItem
      Caption = '-'
    end
    object miDelete: TMenuItem
      Action = actDel
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
    object N9: TMenuItem
      Caption = '-'
    end
    object N10: TMenuItem
      Action = actDel
    end
  end
end
