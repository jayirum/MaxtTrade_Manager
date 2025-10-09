inherited fmStkPL: TfmStkPL
  Tag = 3010
  Caption = #51333#47785#48324#49552#51061
  ClientWidth = 1192
  OnShow = FormShow
  ExplicitWidth = 1208
  ExplicitHeight = 592
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnTop: TRzPanel
    Width = 1192
    ExplicitWidth = 1192
    inherited btnFilter: TbsSkinSpeedButton
      Left = 595
      Top = 5
      Height = 23
      ExplicitLeft = 595
      ExplicitTop = 5
      ExplicitHeight = 23
    end
    inherited btnInsert: TbsSkinSpeedButton
      Left = 940
      Visible = False
      ExplicitLeft = 940
    end
    inherited btnEdit: TbsSkinSpeedButton
      Left = 936
      Top = 2
      Visible = False
      ExplicitLeft = 936
      ExplicitTop = 2
    end
    inherited btnDelete: TbsSkinSpeedButton
      Left = 924
      Top = 4
      Visible = False
      ExplicitLeft = 924
      ExplicitTop = 4
    end
    inherited btnPost: TbsSkinSpeedButton
      Left = 936
      Visible = False
      ExplicitLeft = 936
    end
    inherited btnClose: TbsSkinSpeedButton
      Left = 1107
      ExplicitLeft = 1048
    end
    inherited bsRibbonDivider4: TbsRibbonDivider
      Left = 907
      Top = 3
      Visible = False
      ExplicitLeft = 907
      ExplicitTop = 3
    end
    inherited btnExcel: TbsSkinSpeedButton
      Left = 1028
      Top = 4
      Height = 23
      Anchors = [akTop, akRight]
      OnClick = btnExcelClick
      ExplicitLeft = 773
      ExplicitTop = 4
      ExplicitHeight = 23
    end
    object bsSkinStdLabel1: TbsSkinStdLabel [8]
      Left = 373
      Top = 9
      Width = 23
      Height = 16
      EllipsType = bsetNone
      UseSkinFont = True
      UseSkinColor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #46321#44553
    end
    object bsSkinStdLabel2: TbsSkinStdLabel [9]
      Left = 484
      Top = 9
      Width = 23
      Height = 16
      EllipsType = bsetNone
      UseSkinFont = True
      UseSkinColor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #48516#47448
    end
    object bsSkinStdLabel3: TbsSkinStdLabel [10]
      Left = 676
      Top = 9
      Width = 36
      Height = 16
      EllipsType = bsetNone
      UseSkinFont = True
      UseSkinColor = True
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = -11
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      SkinDataName = 'stdlabel'
      AutoSize = False
      Caption = #54028#53944#45320
    end
    inherited pnTitle: TRzPanel
      BorderHighlight = clWhite
      BorderShadow = 13290186
      FlatColor = clGray
      FlatColorAdjustment = 0
      FrameController = MastDB.RzFrameController
    end
    inherited nvMain: TRzDBNavigator
      Left = 924
      Top = 4
      Height = 24
      Hints.Strings = ()
      Anchors = [akTop, akRight]
      ExplicitLeft = 924
      ExplicitTop = 4
      ExplicitHeight = 24
    end
    object pnCnt: TRzPanel
      Left = 799
      Top = 4
      Width = 113
      Height = 23
      Anchors = [akTop, akRight]
      BorderOuter = fsFlat
      BorderHighlight = clWhite
      BorderShadow = 13290186
      Color = clWhite
      FlatColor = clGray
      FlatColorAdjustment = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      FrameController = MastDB.RzFrameController
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
    object dtStart: TkcRzDateTimeEdit
      Left = 120
      Top = 6
      Width = 121
      Height = 20
      CalendarElements = [ceYear, ceMonth, ceArrows, ceDaysOfWeek, ceFillDays, ceTodayButton]
      CaptionTodayBtn = #50724#45720#47196
      EditType = etDate
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 3
      EnterToTab = True
    end
    object dtEnd: TkcRzDateTimeEdit
      Left = 245
      Top = 6
      Width = 121
      Height = 20
      CalendarElements = [ceYear, ceMonth, ceArrows, ceDaysOfWeek, ceFillDays, ceTodayButton]
      CaptionTodayBtn = #50724#45720#47196
      EditType = etDate
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft Office IME 2007'
      TabOrder = 4
      EnterToTab = True
    end
    object cbUserGrade: TkcRzComboBox
      Left = 399
      Top = 6
      Width = 82
      Height = 20
      Style = csDropDownList
      Ctl3D = False
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      ParentCtl3D = False
      TabOrder = 5
      EnterToTab = True
    end
    object cbUserPart: TkcRzComboBox
      Left = 511
      Top = 6
      Width = 82
      Height = 20
      Style = csDropDownList
      Ctl3D = False
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      ParentCtl3D = False
      TabOrder = 6
      EnterToTab = True
    end
    object cbPartner: TkcRzComboBox
      Left = 711
      Top = 5
      Width = 140
      Height = 20
      Style = csDropDownList
      Ctl3D = False
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft Office IME 2007'
      ItemHeight = 12
      ParentCtl3D = False
      TabOrder = 7
      EnterToTab = True
    end
  end
  inherited pnBottom: TbsSkinPanel
    Top = 508
    Width = 1192
    Height = 45
    ExplicitTop = 508
    ExplicitWidth = 1192
    ExplicitHeight = 45
    object cbxDayF: TbsSkinCheckRadioBox
      Left = 17
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 0
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #44397#49440'('#51452')'
    end
    object cbxNightF: TbsSkinCheckRadioBox
      Left = 97
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 1
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #44397#49440'('#50556')'
    end
    object cbxDayOp: TbsSkinCheckRadioBox
      Left = 177
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 2
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #44397#50741'('#50556')'
    end
    object cbxURO: TbsSkinCheckRadioBox
      Left = 257
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 3
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #50976#47196#49440#47932
    end
    object cbxCL: TbsSkinCheckRadioBox
      Left = 337
      Top = -1
      Width = 79
      Height = 24
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 4
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #53356#47336#46300#50724#51068
    end
    object cbxGC: TbsSkinCheckRadioBox
      Left = 417
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 5
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = 'GOLD'
    end
    object cbxES: TbsSkinCheckRadioBox
      Left = 497
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 6
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #52380#50672#44032#49828
    end
    object cbxAD: TbsSkinCheckRadioBox
      Left = 577
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 7
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = 'E-Mini S&&P'
    end
    object cbxBP: TbsSkinCheckRadioBox
      Left = 657
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 8
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = 'Aus.'#45804#47084
    end
    object cbxJY: TbsSkinCheckRadioBox
      Left = 737
      Top = -1
      Width = 79
      Height = 24
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 9
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = 'B.Pound'
    end
    object cbxNQ: TbsSkinCheckRadioBox
      Left = 817
      Top = 0
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 10
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = 'J.Yen'
    end
    object cbxYM: TbsSkinCheckRadioBox
      Left = 897
      Top = -1
      Width = 79
      Height = 24
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 11
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #45208#49828#45797
    end
    object cbxSCN: TbsSkinCheckRadioBox
      Left = 257
      Top = 22
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 12
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #45796#50864#51648#49688
    end
    object cbxHSI: TbsSkinCheckRadioBox
      Left = 337
      Top = 22
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 13
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #51473#44397' A 50'
    end
    object cbxNK: TbsSkinCheckRadioBox
      Left = 417
      Top = 21
      Width = 79
      Height = 24
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 14
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #54637#49485#51648#49688
    end
    object cbxDAX: TbsSkinCheckRadioBox
      Left = 497
      Top = 22
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 15
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #45768#52992#51060'225'
    end
    object cbxNG: TbsSkinCheckRadioBox
      Left = 577
      Top = 22
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 16
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #46021#51068' DAX'
    end
    object cbxCD: TbsSkinCheckRadioBox
      Left = 657
      Top = 22
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 17
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #52880#45208#45796#45804#47084
    end
    object cbxSI: TbsSkinCheckRadioBox
      Left = 737
      Top = 22
      Width = 79
      Height = 23
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 18
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #49892#48260
    end
    object cbxHG: TbsSkinCheckRadioBox
      Left = 817
      Top = 21
      Width = 79
      Height = 24
      Cursor = crHandPoint
      HintImageIndex = 0
      TabOrder = 19
      SkinDataName = 'checkbox'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = False
      WordWrap = False
      AllowGrayed = False
      State = cbChecked
      ImageIndex = 0
      Flat = True
      UseSkinFontColor = False
      TabStop = True
      CanFocused = True
      Radio = False
      Checked = True
      GroupIndex = 0
      Caption = #44396#47532
    end
  end
  object gdMain: TDBGridEh [2]
    Left = 0
    Top = 31
    Width = 1192
    Height = 477
    TabStop = False
    Align = alClient
    ColumnDefValues.Layout = tlCenter
    ColumnDefValues.Title.TitleButton = True
    Ctl3D = False
    DataSource = dsMain
    DynProps = <>
    FixedColor = 15790320
    Flat = True
    FooterRowCount = 1
    FooterParams.Font.Charset = DEFAULT_CHARSET
    FooterParams.Font.Color = clWindowText
    FooterParams.Font.Height = -12
    FooterParams.Font.Name = #44404#47548#52404
    FooterParams.Font.Style = [fsBold]
    FooterParams.ParentFont = False
    FrozenCols = 13
    ImeName = 'Microsoft IME 2010'
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentCtl3D = False
    RowDetailPanel.Color = clBtnFace
    RowHeight = 21
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 2
    TitleParams.Color = clBtnFace
    TitleParams.MultiTitle = True
    TitleParams.RowHeight = 21
    TitleParams.FillStyle = cfstGradientEh
    OnDrawColumnCell = gdMainDrawColumnCell
    OnTitleBtnClick = gdMainTitleBtnClick
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'TRADE_DT'
        Footer.Alignment = taRightJustify
        Footer.Value = #54633#44228
        Footer.ValueType = fvtStaticText
        Footers = <>
        Title.Caption = #50689#50629#51068
        Title.Color = 16250871
        Width = 91
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        Footers = <>
        Title.Color = 16250871
        Width = 1
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CLR_PL'
        Footers = <>
        Title.Caption = #52509#49892#54788#49552#51061
        Title.Color = 16250871
        Width = 100
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CMSN'
        Footers = <>
        Title.Caption = #52509#49688#49688#47308
        Title.Color = 16250871
        Width = 80
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'NET_PL'
        Footers = <>
        Title.Caption = #49692#49552#51061
        Title.Color = 16250871
        Width = 75
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CMSN'
        Footer.Alignment = taRightJustify
        Footers = <
          item
            Alignment = taRightJustify
            FieldName = 'CMSN'
            ValueType = fvtSum
          end>
        Title.Color = 16250871
        Width = 1
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACNT_AMT_BF'
        Footers = <
          item
            Alignment = taRightJustify
            FieldName = 'REALPL'
            ValueType = fvtSum
          end>
        Title.Caption = #51204#51068#51092#50529
        Title.Color = 16250871
        Width = 74
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'ACNT_AMT_TODAY'
        Footers = <
          item
            Alignment = taRightJustify
            FieldName = 'EVAPL'
            ValueType = fvtSum
          end>
        Title.Caption = #44552#51068#51092#50529
        Title.Color = 16250871
        Width = 80
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        Footers = <>
        Width = 1
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'RSLT_IN_AMT'
        Footers = <>
        Title.Caption = #51077#44552#50529
        Title.Color = 16250871
        Width = 78
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'RSLT_OUT_AMT'
        Footers = <
          item
            Alignment = taRightJustify
            FieldName = 'QTY'
            ValueType = fvtSum
          end>
        Title.Caption = #52636#44552#50529
        Title.Color = 16250871
        Width = 82
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'YET_OUT_AMT'
        Footers = <>
        Title.Caption = #48120#52376#47532#52636#44552#50529
        Width = 83
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        Footers = <>
        Width = 1
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSF_PL'
        Footers = <>
        Title.Caption = #44397#45236#49440#47932' ('#51452#44036')|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSF_CMSN'
        Footers = <>
        Title.Caption = #44397#45236#49440#47932' ('#51452#44036')|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSF_CMSN'
        Footers = <>
        Title.Caption = #44397#45236#50741#49496' ('#51452#44036')|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSO_CMSN_DAY'
        Footers = <>
        Title.Caption = #44397#45236#50741#49496' ('#51452#44036')|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSO_PL_NGT'
        Footers = <>
        Title.Caption = #44397#45236#50741#49496' ('#50556#44036')|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'KSO_CMSN_NGT'
        Footers = <>
        Title.Caption = #44397#45236#50741#49496' ('#50556#44036')|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'URO_CLR_PL'
        Footers = <>
        Title.Caption = #50976#47196#49440#47932'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'URO_CMSN'
        Footers = <>
        Title.Caption = #50976#47196#49440#47932'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CL_CLR_PL'
        Footers = <>
        Title.Caption = #53356#47336#46300#50724#51068'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CL_CMSN'
        Footers = <>
        Title.Caption = #53356#47336#46300#50724#51068'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'GC_CLR_PL'
        Footers = <>
        Title.Caption = 'GOLD|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'GC_CMSN'
        Footers = <>
        Title.Caption = 'GOLD|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'NG_CLR_PL'
        Footers = <>
        Title.Caption = #52380#50672#44032#49828'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'NG_CMSN'
        Footers = <>
        Title.Caption = #52380#50672#44032#49828'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'ES_CLR_PL'
        Footers = <>
        Title.Caption = 'E-Mini S&P|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'ES_CMSN'
        Footers = <>
        Title.Caption = 'E-Mini S&P|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'AD_CLR_PL'
        Footers = <>
        Title.Caption = 'Aus.'#45804#47084'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'AD_CMSN'
        Footers = <>
        Title.Caption = 'Aus.'#45804#47084'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'BP_CLR_PL'
        Footers = <>
        Title.Caption = 'B.Pound|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'BP_CMSN'
        Footers = <>
        Title.Caption = 'B.Pound|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'JY_CLR_PL'
        Footers = <>
        Title.Caption = 'J.Yen|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'JY_CMSN'
        Footers = <>
        Title.Caption = 'J.Yen|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'NQ_CLR_PL'
        Footers = <>
        Title.Caption = #45208#49828#45797'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'NQ_CMSN'
        Footers = <>
        Title.Caption = #45208#49828#45797'|'#54217#44032#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'YM_CLR_PL'
        Footers = <>
        Title.Caption = #45796#50864#51648#49688'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'YM_CMSN'
        Footers = <>
        Title.Caption = #45796#50864#51648#49688'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'SCN_CLR_PL'
        Footers = <>
        Title.Caption = #51473#44397' A 50|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'SCN_CMSN'
        Footers = <>
        Title.Caption = #51473#44397' A 50|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'HSI_CLR_PL'
        Footers = <>
        Title.Caption = #54637#49373#51648#49688'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'HSI_CMSN'
        Footers = <>
        Title.Caption = #54637#49373#51648#49688'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'SSI_CLR_PL'
        Footers = <>
        Title.Caption = #45768#52992#51060'225|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'SSI_CMSN'
        Footers = <>
        Title.Caption = #45768#52992#51060'225|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'FDAX_CLR_PL'
        Footers = <>
        Title.Caption = #46021#51068' DAX|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'FDAX_CMSN'
        Footers = <>
        Title.Caption = #46021#51068' DAX|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CD_CLR_PL'
        Footers = <>
        Title.Caption = #52880#45208#45796#45804#47084'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'CD_CMSN'
        Footers = <>
        Title.Caption = #52880#45208#45796#45804#47084'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'SI_CLR_PL'
        Footers = <>
        Title.Caption = #49892#48260'|'#49892#54788#49552#51061
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'SI_CMSN'
        Footers = <>
        Title.Caption = #49892#48260'|'#49688#49688#47308
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'HG_CLR_PL'
        Footers = <>
        Title.Caption = #44396#47532'|'#49892#54788#49548#45769
      end
      item
        Alignment = taRightJustify
        DynProps = <>
        EditButtons = <>
        FieldName = 'HG_CMSN'
        Footers = <>
        Title.Caption = #44396#47532'|'#49688#49688#47308
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  inherited bsBusinessSkinForm: TbsBusinessSkinForm
    Left = 64
    Top = 336
  end
  inherited imgBtn: TImageList
    Left = 144
    Top = 288
    Bitmap = {
      494C01010B003400C40010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B433070000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000566
      9500056695000566950005669500056695000566950000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000005669500304B5000B4330700354141000566950005669500000000000000
      00000000000000000000000000000000000095655F00A5696A00A5696A00A569
      6A00A5696A00006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A90030C9
      E90012CAFD0020CEFE0054DEFF0074E0F8002CA7D30005669500000000000000
      0000000000000000000000000000000000000000000000000000000000000274
      A90030C9E90013CAFB0072462A00B4330700797666002CA7D300056695000000
      00000000000000000000000000000000000098686000FBE5C000F4D5AD00F0CF
      9F00EFCA9600006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CAFD001FC6F40000008200000082000000820000008200000082000000
      82000000820000008200000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB002DAFCC00863E1B00AC400600506664000386C1000566
      9500000000000000000000000000000000009D6B6200FCE7C900F2D5B500F0D0
      A900EECB9E00006A0000FFFFFF0078BB7800006A00001C831C00FAFCFA006AB4
      6A00006A00004DA34D00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CAFD001FC6F400000082002753FF001641FF00072FFF000020FF000016
      F700000EE60000008200000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0067827A0093411800B43307003E4340000566
      950000000000000000000000000000000000A36F6400FEEED400F4DDC000F2D7
      B500F0D1AA00006A0000FFFFFF00FFFFFF00B4DAB400016C01000D780D00006A
      00006AB46A00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CAFD001FC6F400000082002C59FF001D49FF000D36FF000020FF00001A
      FB000011ED0000008200000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0055D8F600874F3100B8663000A62902002D41
      480000000000000000000000000000000000A7746600FFF4E100F6E1CA00F3DC
      BF00F2D7B400006A0000FFFFFF00FFFFFF00FFFFFF004EA44E00006A00000A76
      0A00FAFCFA00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A9009FFBFE00A3F3
      FF00B6F2FF00D8F6FC0000008200000082000000820000008200000082000000
      82000000820000008200000000000000000000000000000000000274A9009FFB
      FE00A3F3FF00B6F2FF00DAF8FF00E5FAFF00C5C2BA0093411800E7B47900A629
      020000000000000000000000000000000000AD786900FFFBEE00F7E7D500F4E1
      CA00F3DCBF00006A0000FFFFFF00FFFFFF005FAD5F00006A00004AA14A00016C
      010023892300EEF7EE00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A900A7E9F3001CAA
      D3000791C5000787BB00108BBC001F91BF001479AD0079C0DC00056695000000
      00000000000000000000000000000000000000000000000000000274A900A7E9
      F3001CAAD3000791C5000788BC00B0410000B0410000AC400600CE8C5900FEE0
      A700A6290200000000000000000000000000B47E6B00FFFFFB00F8EDE100F7E6
      D400F6E1C900006A0000FFFFFF00469F4600006A000060AD6000FFFFFF00BBDD
      BB00016B010023892300FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90031B5D3003FE3
      FE0012CAFD0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A000000
      00000000000000000000000000000000000000000000000000000274A90031B5
      D3003FE3FE0013CAFB0020CEFE00B0410000BF734000FCD39600EEB77A00A92D
      0300A6290200A62902000000000000000000BA836D00FFFFFF00FCF4EE00FAED
      E100F8E9D500006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CAFD0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF00B0410000BC693300F3B56A00DC8F
      4700A6290200000000000000000000000000BF877000FFFFFF00FFFBFA00FEF4
      ED00FAEEE000006A0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CAFD0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F800B0410000B2541700D877
      1D00C65D0C00A92D03000000000000000000C48C7200FFFFFF00FFFFFF00FFFC
      FA00FCF4ED00006A0000006A0000006A0000006A0000006A0000006A0000006A
      0000006A0000006A0000006A0000006A00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90073FAFE003FE3
      FE0012CAFD0020CEFE0054DEFF0074E0F80030B0DA000386C100056695000000
      00000000000000000000000000000000000000000000000000000274A90073FA
      FE003FE3FE0013CAFB0020CEFE0054DEFF0074E0F80030B0DA00B0410000B041
      0000B0410000A6290200A629020000000000CA917400FFFFFF00FFFFFF00FFFF
      FF00FFFCFA00FCF4ED00FAEDDE00F8E7D400FCEBD300E3D3BB00B7AD9C00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A90078FBFE0068F6
      FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC700056695000000
      00000000000000000000000000000000000000000000000000000274A90078FB
      FE0068F6FF0055F6FE005FFEFF0078FBFE0089FBFE0048CFF200058BC7000566
      950000000000000000000000000000000000CE957600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FEFCFA00FCF6EB00FAEFE000A5696A00A5696A00A5696A00A569
      6A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000274A900FBFFFF00F0FF
      FF00C6FFFF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE00056695000000
      00000000000000000000000000000000000000000000000000000274A900FBFF
      FF00F0FFFF00C6FFFF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE000566
      950000000000000000000000000000000000D3977800FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFC00F4EBE600A5696A00E2A35B00EF993800BB70
      4F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000479AF00EDFA
      FC00DCFFFF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A00000000000000
      0000000000000000000000000000000000000000000000000000000000000479
      AF00EDFAFC00DAF8FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A000000
      000000000000000000000000000000000000D59A7900FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F8F8FE00A5696A00E5A55F00C2805C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000274
      A9000274A9000274A9000274A9000274A9000274A90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000274A9000274A9000274A9000274A9000274A9000274A900000000000000
      000000000000000000000000000000000000D0906B00D0906B00D0906B00D090
      6B00D0906B00D0906B00D0906B00D0906B00A5696A00BB7F6A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000035A0500035A0500035A
      0500035A05000000000000000000000000000000000000000000000000000000
      00000000000000000000811E0000811E0000811E0000811E0000811E0000811E
      0000811E0000811E000000000000000000000000000000000000000D6C00000D
      6C00000C5D00000A5100000A4F00000A4F00000A4F00000A4F00000A4F00000A
      4F00000A4F000008400000000000000000000000000000000000003A9500003A
      95000035870000317E00002F7900002F7900002F7900002F7900002F7900002F
      7900002F790000296A0000000000000000000000000000000000056695000566
      95000566950005669500056695000566950000000000035A0500089511000690
      0E00035A05000000000000000000000000000000000000000000056695000566
      95000566950005669500811E0000FEFEFE00FEFEFE00FEFEFE00758EFC00A5B6
      FC00FEFEFE00811E0000000000000000000000000000001397000017B9000016
      B5000015AA000013A0000013A00000139700001397000013A000001397000013
      97000013A000000F7A00000840000000000000000000004BC0000058E2000054
      D7000054D700004BC000004BC000004BC000004BC000004BC000004BC000004B
      C000004BC0000041A50000296A0000000000000000000274A90030C9E90012CB
      FE0020CDFD0054DEFF0074E0F8002CA7D30005669500035A05000C9D19000A99
      1500035A0500000000000000000000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF00811E0000FEFEFE00FEFEFE006480FB00011FFA003D5D
      FB00FEFEFE00811E00000000000000000000000000000017B900001CE200001A
      D5000018CA000018C6000016B5000016B5000015AA000015AA000016B5000015
      AA000016B5000013A000000A4F0000000000000000000056DD000268FF000062
      F800005DEE00005DEE000058E2000054D7000054D7000054D7000054D7000056
      DD000056DD00004BC00000317E00000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0051D7F600035A0500035A0500035A0500035A050011A624000DA0
      1C00035A0500035A0500035A0500035A05000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E0000CAD4FE00284BFB00011FFA00284BFB000120
      FA00CAD4FE00811E00000000000000000000000000000018C600001EF000001C
      E200001AD5000018C6000018C6000016B5000016B5000015AA000013A0000015
      AA000015AA000013A000000A4F000000000000000000005DEE000268FF000268
      FF000062F800005DEE000664E700C1DCF8001C70DE000054D700004FCA00004F
      CA000056DD00004BC00000317E00000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0051D7F600035A050025C7470025C747001BB735001BB7350013AB
      270011A624000DA01C000A991500035A05000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E00003D5DFB00092AFA00AABAFC00EAEEFE00092A
      FA003859FB00811E00000000000000000000000000000018CA000224FF00001E
      F000001CE200001AD5000018CA000018C6000016B5000016B5000015AA000013
      A0000017B90000139700000A4F000000000000000000005EF0001176FF00086E
      FF000268FF000268FF00C1DCF800FFFFFF0076B1F2000054D7000054D700004F
      CA000054D700004BC000002F7900000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0051D8F700035A05002CD3550027CB4B0025C747001CBA38001BB7
      350017B02E0013AB270011A62400035A05000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF00811E0000DCE3FE00CAD4FE00FEFEFE00FEFEFE008097
      FC00011FFA00491F3F000000000000000000000000000018CA00163BFF000528
      FF00001EF000001CE200001AD5000018CA000018CA000017B9000016B5000015
      AA000015AA000013A000000A4F000000000000000000005EF0002585FF001579
      FF001176FF00C2E0FF00FFFFFF00FFFFFF00D6E9FD000058E2000054D7000054
      D7000054D700004BC000002F7900000000000274A9009FFBFE00A3F3FF00B6F2
      FF00DAF8FF00E2F7FC00035A0500035A0500035A0500035A050027CB4B0025C7
      4700035A0500035A0500035A0500035A05000274A9009FFBFE00A3F3FF00B6F2
      FF00DAF8FF00E5FAFF00811E0000FEFEFE00FEFEFE00FEFEFE00FEFEFE00FEFE
      FE003D5DFB00011FFA000000000000000000000000000018CA003559FF000F35
      FF000224FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000017
      B9000016B5000013A000000A4F000000000000000000005EF000459AFF001E80
      FF00D9EDFF00FFFFFF00C2E0FF00459AFF00FFFFFF002883F400005DEE000056
      DD000056DD00004BC00000317E00000000000274A900A7E9F3001CAAD3000791
      C5000788BC00108ABB001F91BF001479AD0079C0DC00035A05002CD3550029CF
      5200035A05000000000000000000000000000274A900A7E9F3001CAAD3000791
      C5000788BC00108BBC00811E0000811E0000811E0000811E0000811E0000811E
      0000761E0700111FB800011FFA0000000000000000000018CA004E6EFF00193F
      FF000224FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000018
      C6000018C60000139D00000C5D000000000000000000005EF0005CA7FF002A88
      FF005CA7FF0092C6FF000E74FF000268FF009CCBFF0089C0FE00005DEE000058
      E2000058E200004FCA0000358700000000000274A90031B5D3003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000268A300035A050034DE650030D9
      5E00035A05000000000000000000000000000274A90031B5D3003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000268A30003689A00000000000000
      00000000000000000000011FFA00011FFA00000000000018CA005A79FF002146
      FF00092DFF000224FF00001EF000001DEE00001DEE00001CE200001AD5000018
      CA000018CA000016B500000D6C000000000000000000005EF00069AFFF00328E
      FF00187BFF000E74FF000268FF000268FF00187BFF00D6E9FD000268FF000062
      F800005EF0000054D700003A9500000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000385C000035A0500035A0500035A
      0500035A05000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      0000000000000000000000000000011FFA00000000000018CA006682FF002D51
      FF00163BFF000F35FF000224FF00001FFF00001EF000001EF000001DEE00001C
      DE00001CDE000017B900000F7A000000000000000000005EF00074B5FF003D95
      FF002585FF001E80FF001579FF000E74FF00086EFF004D9FFF005CA7FF000268
      FF000268FF000058E2000041A500000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000385C00005669500000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000000000000018CA007690FF004163
      FF00193FFF00163BFF00092DFF000528FF000224FF000224FF00001DEE00001D
      EE00001CE2000018C600001187000000000000000000005EF00081BCFF0050A0
      FF002A88FF002585FF00187BFF001579FF001176FF000E74FF006DB2FF000268
      FF000268FF00005DEE000044AF00000000000274A90073FAFE003FE3FE0012CB
      FE0020CDFD0054DEFF0074E0F80030B0DA000385C00005669500000000000000
      0000000000000000000000000000000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074E0F80030B0DA000386C10005669500000000000000
      000000000000000000000000000000000000000000000018CA007F98FF00728C
      FF005676FF004163FF003559FF00284CFF00163BFF000224FF00001FFF00001D
      EE00001DEE00001CDE00001397000000000000000000005EF00089C0FE007FBB
      FF0066ACFF0050A0FF004D9FFF00328EFF002585FF001176FF00086EFF000268
      FF00086EFF000268FF00004BC000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      0000000000000000000000000000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0089FBFE0048CFF200058BC70005669500000000000000
      000000000000000000000000000000000000000000000018CA005877FF007F98
      FF00839CFF007690FF006682FF004E6EFF00284CFF000F35FF000224FF00001F
      FF00001DEE00001CE2000013A0000000000000000000005EF00066ACFF0089C0
      FE0092C6FF0081BCFF0074B5FF005CA7FF003690FF001E80FF000E74FF000E74
      FF00086EFF000268FF00004FCA00000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000274A900FEFEFE00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      0000000000000000000000000000000000000000000000000000001DEE00092D
      FF000F35FF00092DFF000528FF000224FF00001DEE00001CDE00001AD5000018
      CA00001AD5000016B500000000000000000000000000000000000268FF00187B
      FF00187BFF001E80FF001579FF000E74FF000268FF000268FF00005EF000005E
      F000005EF0000058E2000000000000000000000000000479AF00EDFAFC00DAF8
      FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A0000000000000000000000
      000000000000000000000000000000000000000000000479AF00F0FFFF00DAF8
      FF00B7FFFF009FFBFE0089FBFE0083FAFB00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051627E0053626D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003A9500003A
      95000035870000317E00002F7900002F7900002F7900002F7900002F7900002F
      7900002F790000296A0000000000000000000000000000000000056695000566
      9500056695000566950005669500056695000000000000000000000000000000
      0000000000005B667E000F6FD7004093D3000000000000000000000D6C00000D
      6C00000C5D00000A5100000A4F00000A4F00000A4F00000A4F00000A4F00000A
      4F00000A4F000008400000000000000000000000000000000000000D6C00000D
      6C00000C5D00000A5100000A4F00000A4F00000A4F00000A4F00000A4F00000A
      4F00000A4F0000084000000000000000000000000000004BC0000058E1000055
      D9000052D100004BC000004BC000004BC000004BC000004BC000004BC000004B
      C000004BC0000041A50000296A0000000000000000000274A90030C9E90012CB
      FE0020CEFE0054DEFF0074E0F8002CA7D3000566950000000000000000000000
      00005F697E00106CD30035A3FF003C9AF00000000000001397000017B9000016
      B5000015AA000013A0000013A00000139700001397000013A000001397000013
      97000013A000000F7A00000840000000000000000000001397000017B9000016
      B5000015AA000013A0000013A00000139700001397000013A000001397000013
      97000013A000000F7A000008400000000000000000000055D9000268FF000062
      F800005EF000005DEE000058E1000052D1000055D9000052D1000055D9000055
      D9000055D900004FCA00002F7900000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE0054DEFF0074DEF70032AFD8000484BF000566950000000000706C
      7D001165C100309FFF003C9AF00000000000000000000017B900001CE200001A
      D5000018CA000018C6000016B5000016B5000015AA000015AA000016B5000015
      AA000016B5000013A000000A4F0000000000000000000017B900001CE200001A
      D1000019CC000018C6000016B5000016B5000015AA000015AA000016B5000015
      AA000016B5000013A000000A4F000000000000000000005EF0000268FF000268
      FF000060F600005DEE000058E1000058E1000055D9000052D1000052D1000050
      CD000055D900004BC00000317E00000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE005BC7E1009E7F7A00B08F8100B6998A00986D6300735050004579
      AB0035A3FF00309FFF000000000000000000000000000018C600001EF000001C
      E200001AD5000018C6000018C6000016B5000016B5000015AA000013A0000015
      AA000015AA000013A000000A4F0000000000000000000018C600001EF000001C
      E200001AD1000018C6003653D300EAEEFA008899E000061FAF000013A0000015
      AA000015AA000013A000000A4F000000000000000000005EF0000F75FF00086E
      FF000268FF00FFFFFF00C1E0FF000665EA000058E10088BAEF00FFFFFF000050
      CD000055D900004BC000002F7900000000000274A90073FAFE003FE3FE0012CB
      FE002DB6DD009E7F7A00E5D4C000FEFBCF00FFFFDC00F4EECB00C4A58A00986D
      6300309FFF00000000000000000000000000000000000018CA000224FF00001E
      F000001CE200001AD5000018C600FFFFFF00F4F7FF000016B5000015AA000013
      A0000017B90000139700000A4F0000000000000000000019CC000224FF00001E
      F0009AACF6000624D7000019CC009AAAEB00FFFFFF008899E0000015AA000015
      AA000015AA000013A000000A4F000000000000000000005EF0002585FF001579
      FF00086EFF00C1E0FF00FFFFFF00C1E0FF0088BAEF00FFFFFF00C1E0FF000052
      D1000052D100004BC000002F7900000000000274A9009FFBFE00A3F3FF00B6F2
      FF00A3898700E1D3CA00FFFFEE00FEFBCF00FEFBCF00FFFAC700FFEEAB00BB8A
      720000000000000000000000000000000000000000000018CA00163BFF000528
      FF00001EF000001CE200001BD900FFFFFF00FFFFFF000017B9000016B5000015
      AA000015AA000013A000000A4F0000000000000000000019CC00163BFF000528
      FF00FFFFFF00768FF300001AD1003654DE00FFFFFF00ADBBEE000016B5000015
      AA000016B50000139700000A4F000000000000000000005EF000469AFF001E80
      FF000F75FF000F75FF00C1E0FF00FFFFFF00FFFFFF00C1E0FF000665EA000055
      D9000058E100004BC00000317E00000000000274A900A7E9F3001CAAD3000791
      C50084787600FCFBD700FEFBCF00FEFBCF00FCFBD700FBF0BF00F6C28300E9C5
      9600986C6B00000000000000000000000000000000000018CA003559FF000F35
      FF000224FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000017
      B9000016B5000013A000000A4F0000000000000000000019CC003559FF000F35
      FF00FFFFFF00FFFFFF00768FF300EAEEFA00FFFFFF00889CEB000018C6000016
      B5000016B5000013A000000A4F000000000000000000005EF0005CA7FF002A88
      FF000F75FF000F75FF008EC4FF00FFFFFF00FFFFFF00C1E0FF000060F600005D
      EE000058E1000050CD0000358700000000000274A90031B5D3003FE3FE0012CB
      FE008F878200FFFFDC00FEFBCF00FEFBCF00FCFBD700F3CF9600EFAD6A00F2D6
      A000986C6B00000000000000000000000000000000000018CA004E6EFF00193F
      FF000224FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000018
      C6000018C6000013A000000A510000000000000000000019CC004D6DFF00193F
      FF004D6DFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EAEEFA001C3BD5000018
      C6000017B9000015AA00000A51000000000000000000005EF00069AFFF00328E
      FF001579FF0093C7FF00FFFFFF00C1E0FF00C1E0FF00FFFFFF00C1E0FF000060
      F600005DEE000052D100003A9500000000000274A90073FAFE003FE3FE0012CB
      FE007F7B7A00F7F3CA00FEFBCF00FFFAC700F6D89E00EEBB8100FEE3A600DCBD
      9600986C6B00000000000000000000000000000000000018CA005A79FF002146
      FF00092DFF000224FF00001EF000FFFFFF00FFFFFF00001CE200001BD9000018
      CA000018CA000016B500000D6C0000000000000000000019CC005A79FF002146
      FF00092DFF00294DFF006681F8004565F400C1CCFB00FFFFFF00EAEEFA001C3B
      D5000019CC000016B500000D6C000000000000000000005EF00074B5FF003D95
      FF002585FF00EEF6FF00C9E3FF001579FF000F75FF00C9E3FF00FFFFFF000062
      F8000268FF000058E1000041A500000000000274A90073FAFE003FE3FE0012CB
      FE004392AB00C6A98C00FFF6B500F6C28300F0B87500FFF4D700F7F3EE00986C
      6B0000000000000000000000000000000000000000000018CA006682FF002D51
      FF00163BFF000F35FF000224FF00FFFFFF00FFFFFF00001DEE00001CE200001C
      E200001BD9000017B900000F7A0000000000000000000019CC006681F8002D51
      FF00163BFF000F35FF000224FF00001FFF000528FF00EAEEFA00FFFFFF00EAEE
      FA00001BD9000017B900000F7A000000000000000000005EF00081BCFF0050A0
      FF002A88FF002585FF00187BFF001579FF001579FF000F75FF000062F8000268
      FF000268FF00005DEE000044AF00000000000274A90073FAFE003FE3FE0012CB
      FE0020CEFE00708E9800BD967D00E9C59600F2D6A000CCB4A100986C6B00986C
      6B0000000000000000000000000000000000000000000018CA007690FF004163
      FF00193FFF00163BFF00092DFF000528FF000224FF000224FF00001EF000001D
      EE00001CE2000018CA000011870000000000000000000019CC007690FF004163
      FF00193FFF00163BFF00092DFF000528FF000224FF001C41FF00EAEEFA00C1CC
      FB00001CE2000019CC00001187000000000000000000005EF0008EC4FF007FBB
      FF0066ACFF0050A0FF00469AFF003690FF002585FF001579FF000F75FF000268
      FF00086EFF000062F800004BC000000000000274A90078FBFE0068F6FF0055F6
      FE005FFEFF0078FBFE0088B5B600767F83006C6A6E006E555500000000000000
      000000000000000000000000000000000000000000000018CA007F98FF00728C
      FF005676FF004163FF003559FF00284CFF00163BFF000224FF00001FF900001D
      EE00001EF000001BD9000013A00000000000000000000019CC007F98FF00728C
      FF005676FF004163FF003559FF002449FF00193FFF000224FF000224FF00001E
      F000001EF000001BD9000013A0000000000000000000005EF00066ACFF008EC4
      FF008EC4FF0081BCFF0074B5FF005CA7FF003690FF001E80FF000F75FF000F75
      FF000F75FF000062F8000052D100000000000274A900FBFFFF00F0FFFF00C6FF
      FF00A0FFFF009FFBFE009FFBFE0092FFFF0055F6FE0005669500000000000000
      000000000000000000000000000000000000000000000018CA005877FF007F98
      FF00839CFF007690FF006682FF004E6EFF00284CFF000F35FF000224FF00001F
      F900001FF900001CE2000013A00000000000000000000019CC005877FF007F98
      FF00839CFF007690FF006681F8004D6DFF00294DFF000F35FF00001FFF00001F
      FF00001FFF00001BD9000013A0000000000000000000000000000268FF00187B
      FF001E80FF00187BFF001579FF000F75FF000062F8000062F8000062F800005E
      F000005EF0000055D9000000000000000000000000000479AF00EDFAFC00DCFF
      FF00B7FFFF009FFBFE0092FFFF0078FBFE00086B9A0000000000000000000000
      0000000000000000000000000000000000000000000000000000001DEE00092D
      FF000F35FF00092DFF000528FF000224FF00001DEE00001BD900001AD5000018
      CA00001AD5000016B50000000000000000000000000000000000001DEE00092D
      FF000F35FF00092DFF000528FF000224FF00001DEE00001BD900001AD1000019
      CC000019CC000017B90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000274A9000274
      A9000274A9000274A9000274A9000274A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF00FFFFFBFFF8000000E07FF03F00000000
      C03FE01F000000008003C00F000000008003C00F000000008003C00F00000000
      8003C00F00000000801FC00700000000801FC00300000000801FC00700000000
      801FC00300000000801FC001000F0000801FC00F000F0000801FC00F000F0000
      C03FE01F001F0000E07FF03F003F0000FFFFFFFFFF87FC03C003C003C087C003
      8001800180078003800180010000000380018001000000038001800100000003
      80018001000000038001800100070001800180010007003C800180010007003E
      80018001003F003F80018001003F003F80018001003F003F80018001003F003F
      C003C003807F807FFFFFFFFFC0FFC0FFFFFFFFFCFFFFFFFFC003C0F8C003C003
      8001807080018001800100218001800180010003800180018001000780018001
      8001000F80018001800100078001800180010007800180018001000780018001
      8001000F800180018001000F800180018001003F800180018001003F80018001
      C003807FC003C003FFFFC0FFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  inherited dsMain: TDataSource
    Left = 104
    Top = 288
  end
  inherited bsSkinMessage: TbsSkinMessage
    Left = 104
    Top = 337
  end
  inherited dgSave: TSaveDialog
    Left = 144
    Top = 336
  end
  inherited dbMain: TADOQuery
    Left = 64
    Top = 288
  end
  inherited dbPart: TADOQuery
    Left = 185
    Top = 288
  end
  inherited dbPower: TADOQuery
    Left = 184
    Top = 336
  end
end
