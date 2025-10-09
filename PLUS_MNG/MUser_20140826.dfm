inherited fmUser: TfmUser
  Tag = 2000
  Caption = #54924#50896#44288#47532
  OnShow = FormShow
  ExplicitWidth = 945
  ExplicitHeight = 580
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnTop: TRzPanel
    inherited btnFilter: TbsSkinSpeedButton
      Left = 442
      Top = 4
      Visible = False
      ExplicitLeft = 442
      ExplicitTop = 4
    end
    inherited btnInsert: TbsSkinSpeedButton
      Left = 121
      ExplicitLeft = 121
    end
    inherited btnEdit: TbsSkinSpeedButton
      Left = 197
      ExplicitLeft = 197
    end
    inherited btnDelete: TbsSkinSpeedButton
      Left = 273
      ExplicitLeft = 273
    end
    inherited btnPost: TbsSkinSpeedButton
      Left = 349
      ExplicitLeft = 349
    end
    inherited bsRibbonDivider4: TbsRibbonDivider
      Left = 419
      ExplicitLeft = 419
    end
    inherited btnExcel: TbsSkinSpeedButton
      Left = 772
      Top = 4
      Height = 23
      Anchors = [akTop, akRight]
      OnClick = btnExcelClick
      ExplicitLeft = 772
      ExplicitTop = 4
      ExplicitHeight = 23
    end
    inherited nvMain: TRzDBNavigator
      Left = 667
      Hints.Strings = ()
      Anchors = [akTop, akRight]
      ExplicitLeft = 667
    end
  end
  object pnFilter: TbsSkinPanel [2]
    Left = 0
    Top = 31
    Width = 937
    Height = 29
    HintImageIndex = 0
    TabOrder = 2
    SkinDataName = 'panel'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    DefaultWidth = 0
    DefaultHeight = 0
    UseSkinFont = True
    EmptyDrawing = False
    RibbonStyle = False
    ImagePosition = bsipDefault
    TransparentMode = False
    CaptionImageIndex = -1
    RealHeight = -1
    AutoEnabledControls = True
    CheckedMode = False
    Checked = False
    DefaultAlignment = taLeftJustify
    DefaultCaptionHeight = 22
    BorderStyle = bvFrame
    CaptionMode = False
    RollUpMode = False
    RollUpState = False
    NumGlyphs = 1
    Spacing = 2
    Align = alTop
    DesignSize = (
      937
      29)
    object btnDetail: TbsSkinSpeedButton
      Tag = 500
      Left = 433
      Top = 4
      Width = 75
      Height = 20
      Cursor = crHandPoint
      HintImageIndex = 0
      SkinData = fmMain.bsSkinData
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      ImageList = imgBtn
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 11
      RepeatMode = False
      RepeatInterval = 100
      Transparent = False
      Flat = False
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = #49345#49464#51312#54924
      ShowCaption = True
      NumGlyphs = 1
      Spacing = 1
      OnClick = btnDetailClick
    end
    object btnCntReset: TbsSkinSpeedButton
      Tag = 500
      Left = 856
      Top = 4
      Width = 78
      Height = 20
      Cursor = crHandPoint
      HintImageIndex = 0
      Anchors = [akTop, akRight]
      SkinData = fmMain.bsSkinData
      SkinDataName = 'resizetoolbutton'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 14
      DefaultFont.Name = 'Arial'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      CheckedMode = False
      ImageList = imgBtn
      UseSkinSize = True
      UseSkinFontColor = True
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ImageIndex = 12
      RepeatMode = False
      RepeatInterval = 100
      Transparent = False
      Flat = False
      AllowAllUp = False
      Down = False
      GroupIndex = 0
      Caption = #49352#47196#44256#52840
      ShowCaption = True
      NumGlyphs = 1
      Spacing = 1
      OnClick = btnCntResetClick
    end
    object bsSkinLabel1: TbsSkinLabel
      Left = 122
      Top = 4
      Width = 75
      Height = 20
      HintImageIndex = 0
      TabOrder = 0
      SkinData = fmMain.bsSkinData
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = False
      UseSkinFontColor = True
      BorderStyle = bvFrame
      Alignment = taCenter
      Caption = #44160#49353
      AutoSize = False
    end
    object edFind: TRzEdit
      Left = 205
      Top = 4
      Width = 227
      Height = 20
      Hint = #54924#50896#47749' '#48143' '#54924#50896' ID'#47484' '#51077#47141#54980' '#50644#53552#47484' '#52824#49464#50836'!'
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
      OnKeyDown = edFindKeyDown
    end
    object lbConnUser: TbsSkinLabel
      Left = 633
      Top = 1
      Width = 219
      Height = 27
      HintImageIndex = 0
      Anchors = [akTop, akRight]
      TabOrder = 2
      SkinData = fmMain.bsSkinData
      SkinDataName = 'label'
      DefaultFont.Charset = DEFAULT_CHARSET
      DefaultFont.Color = clWindowText
      DefaultFont.Height = 13
      DefaultFont.Name = 'Tahoma'
      DefaultFont.Style = []
      DefaultWidth = 0
      DefaultHeight = 0
      UseSkinFont = True
      Transparent = False
      ShadowEffect = False
      ShadowColor = clBlack
      ShadowOffset = 0
      ShadowSize = 3
      ReflectionEffect = False
      ReflectionOffset = -5
      EllipsType = bsetNoneEllips
      UseSkinSize = False
      UseSkinFontColor = True
      BorderStyle = bvFrame
      Alignment = taCenter
      AutoSize = False
    end
  end
  object pnLeft: TRzSizePanel [3]
    Left = 0
    Top = 60
    Width = 131
    Height = 471
    Color = 15987699
    HotSpotVisible = True
    SizeBarWidth = 7
    TabOrder = 3
    object RzPanel5: TRzPanel
      Left = 0
      Top = 166
      Width = 123
      Height = 28
      Align = alTop
      BorderOuter = fsFlat
      BorderHighlight = clWhite
      BorderShadow = 12303291
      Color = 15790320
      FlatColor = clGray
      FlatColorAdjustment = 0
      FrameController = MastDB.PanelRzFrameController
      TabOrder = 0
      object RzPanel1: TRzPanel
        Left = 5
        Top = 4
        Width = 113
        Height = 21
        BorderOuter = fsFlat
        Caption = #48516#47448#49440#53469
        Color = clWhite
        FlatColor = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object RzPanel6: TRzPanel
      Left = 0
      Top = 0
      Width = 123
      Height = 166
      Align = alTop
      BorderOuter = fsFlat
      BorderHighlight = clWhite
      BorderShadow = 12303291
      Color = 15790320
      FlatColor = clGray
      FlatColorAdjustment = 0
      FrameController = MastDB.PanelRzFrameController
      TabOrder = 1
      object rgType: TbsSkinRadioGroup
        Left = 5
        Top = 5
        Width = 113
        Height = 155
        Cursor = crHandPoint
        HintImageIndex = 0
        TabOrder = 0
        SkinDataName = 'groupbox'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        EmptyDrawing = False
        RibbonStyle = False
        ImagePosition = bsipDefault
        TransparentMode = False
        CaptionImageIndex = -1
        RealHeight = -1
        AutoEnabledControls = True
        CheckedMode = False
        Checked = False
        DefaultAlignment = taCenter
        DefaultCaptionHeight = 22
        BorderStyle = bvFrame
        CaptionMode = True
        RollUpMode = False
        RollUpState = False
        NumGlyphs = 1
        Spacing = 2
        Caption = #54924#50896#46321#44553
        OnClick = rgTypeClick
        UseSkinSize = True
        ButtonSkinDataName = 'radiobox'
        ButtonDefaultFont.Charset = DEFAULT_CHARSET
        ButtonDefaultFont.Color = clWindowText
        ButtonDefaultFont.Height = 13
        ButtonDefaultFont.Name = 'Tahoma'
        ButtonDefaultFont.Style = []
      end
    end
    object lbxPart: TRzListBox
      Left = 0
      Top = 194
      Width = 123
      Height = 277
      Align = alClient
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft IME 2010'
      ItemHeight = 12
      TabOrder = 2
      OnClick = lbxPartClick
    end
  end
  object gdMain: TDBGridEh [4]
    Left = 131
    Top = 60
    Width = 307
    Height = 471
    TabStop = False
    Align = alClient
    ColumnDefValues.Layout = tlCenter
    ColumnDefValues.Title.TitleButton = True
    Ctl3D = False
    DataSource = dsMain
    DynProps = <>
    FixedColor = 15790320
    Flat = True
    ImeName = 'Microsoft IME 2010'
    IndicatorOptions = [gioShowRecNoEh]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    ParentCtl3D = False
    RowDetailPanel.Color = clBtnFace
    RowHeight = 21
    TabOrder = 4
    TitleParams.Color = clBtnFace
    TitleParams.RowHeight = 21
    TitleParams.FillStyle = cfstGradientEh
    OnTitleBtnClick = gdMainTitleBtnClick
    Columns = <
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_ID'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54924#50896'ID'
        Title.Color = 16250871
        Width = 130
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_NM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54924#50896#47749
        Title.Color = 16250871
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_NICK_NM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #45769#45348#51076
        Title.Color = 16250871
        Width = 130
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_GRADE'
        Footers = <>
        KeyList.Strings = (
          '1'
          '2'
          '3'
          '4')
        PickList.Strings = (
          #51456#54924#50896
          #51221#54924#50896
          #53580#49828#53552
          #54028#53944#45320)
        Title.Alignment = taCenter
        Title.Caption = #54924#50896#46321#44553
        Title.Color = 16250871
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'PART_CD'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54924#50896#48516#47448
        Title.Color = 16250871
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_HP'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54648#46300#54256#48264#54840
        Title.Color = 16250871
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_EMAIL'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #51060#47700#51068
        Title.Color = 16250871
        Width = 150
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'PARTNER_NICK_NM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54028#53944#45320
        Title.Color = 16250871
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'BIRTH_DT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #49892#47749#48264#54840
        Title.Color = 16250871
        Visible = False
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_TEL'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #51204#54868#48264#54840
        Title.Color = 16250871
        Visible = False
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'REG_DT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #46321#47197#51068
        Title.Color = 16250871
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'LASTCNTRDT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #52572#51333#44144#47000#51068
        Title.Color = 16250871
        Width = 90
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'LOGIN_DT'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #52572#51333#47196#44536#51064
        Title.Color = 16250871
        Width = 90
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'SERVER_IP'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #51217#49549#49436#48260
        Title.Color = 16250871
        Width = 110
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  object pgMain: TbsSkinPageControl [5]
    Left = 438
    Top = 60
    Width = 499
    Height = 471
    ActivePage = bsSkinTabSheet1
    Align = alRight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBtnText
    Font.Height = 13
    Font.Name = 'Tahoma'
    Font.Style = []
    Images = imgBtn
    ParentFont = False
    TabHeight = 25
    TabOrder = 5
    OnChange = pgMainChange
    MouseWheelSupport = False
    TabExtededDraw = False
    ButtonTabSkinDataName = 'resizetoolbutton'
    TabsOffset = 0
    TabSpacing = 1
    TextInHorizontal = False
    TabsInCenter = False
    FreeOnClose = False
    ShowCloseButtons = False
    TabsBGTransparent = False
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clBtnText
    DefaultFont.Height = 13
    DefaultFont.Name = 'Tahoma'
    DefaultFont.Style = []
    UseSkinFont = True
    DefaultItemHeight = 20
    SkinData = fmMain.bsSkinData
    SkinDataName = 'tab'
    object bsSkinTabSheet1: TbsSkinTabSheet
      Caption = #54924#50896#44288#47532
      ImageIndex = 13
      object RzPanel4: TRzPanel
        Left = 2
        Top = 0
        Width = 495
        Height = 444
        Align = alRight
        BorderOuter = fsFlat
        BorderHighlight = clWhite
        BorderShadow = 12303291
        Color = 15790320
        FlatColor = clGray
        FlatColorAdjustment = 0
        FrameController = MastDB.PanelRzFrameController
        TabOrder = 0
        object userPass: TbsSkinSpeedButton
          Tag = 300
          Left = 415
          Top = 135
          Width = 73
          Height = 20
          Cursor = crHandPoint
          HintImageIndex = 0
          SkinData = fmMain.bsSkinData
          SkinDataName = 'resizetoolbutton'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          CheckedMode = False
          ImageList = imgBtn
          UseSkinSize = True
          UseSkinFontColor = True
          WidthWithCaption = 0
          WidthWithoutCaption = 0
          ImageIndex = 12
          RepeatMode = False
          RepeatInterval = 100
          Transparent = False
          Flat = False
          AllowAllUp = False
          Down = False
          GroupIndex = 0
          Caption = #52488#44592#54868
          ShowCaption = True
          NumGlyphs = 1
          Spacing = 1
          OnClick = userPassClick
        end
        object lbAlert: TLabel
          Left = 254
          Top = 31
          Width = 232
          Height = 20
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = 13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Visible = False
        end
        object pnUser: TRzPanel
          Left = 6
          Top = 4
          Width = 482
          Height = 21
          BorderOuter = fsFlat
          Caption = #54924#50896#47749' ['#54861#44600#46041']'
          Color = clWhite
          FlatColor = 8404992
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = #44404#47548#52404
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object bsSkinLabel2: TbsSkinLabel
          Left = 6
          Top = 31
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 1
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54924#50896'ID'
          AutoSize = False
        end
        object bsSkinLabel3: TbsSkinLabel
          Left = 254
          Top = 57
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 2
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54924#50896#47749
          AutoSize = False
        end
        object bsSkinLabel4: TbsSkinLabel
          Left = 6
          Top = 83
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 3
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54924#50896#46321#44553
          AutoSize = False
        end
        object bsSkinLabel5: TbsSkinLabel
          Left = 254
          Top = 83
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 4
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54924#50896#48516#47448
          AutoSize = False
        end
        object bsSkinLabel6: TbsSkinLabel
          Left = 6
          Top = 109
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 5
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #49892#47749#48264#54840
          AutoSize = False
        end
        object bsSkinLabel7: TbsSkinLabel
          Left = 254
          Top = 109
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 6
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #46321#47197#51068
          AutoSize = False
        end
        object bsSkinLabel8: TbsSkinLabel
          Left = 6
          Top = 135
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 7
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #51217#49549#49436#48260
          AutoSize = False
        end
        object bsSkinLabel9: TbsSkinLabel
          Left = 254
          Top = 135
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 8
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #48708#48128#48264#54840
          AutoSize = False
        end
        object bsSkinLabel11: TbsSkinLabel
          Left = 6
          Top = 161
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 9
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54028#53944#45320#45769#45348#51076
          AutoSize = False
        end
        object bsSkinLabel12: TbsSkinLabel
          Left = 6
          Top = 187
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 10
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #51204#54868#48264#54840
          AutoSize = False
        end
        object bsSkinLabel13: TbsSkinLabel
          Left = 6
          Top = 213
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 11
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #51452#49548#51648
          AutoSize = False
        end
        object bsSkinLabel15: TbsSkinLabel
          Left = 254
          Top = 187
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 12
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54648#46300#54256
          AutoSize = False
        end
        object bsSkinLabel16: TbsSkinLabel
          Left = 254
          Top = 161
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 13
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = True
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = 'EMAIL'
          AutoSize = False
        end
        object bsSkinLabel17: TbsSkinLabel
          Left = 254
          Top = 239
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 14
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44256#44061#51008#54665
          AutoSize = False
        end
        object bsSkinLabel18: TbsSkinLabel
          Left = 6
          Top = 239
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 15
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = True
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #51008#54665#44228#51340#48264#54840
          AutoSize = False
        end
        object bsSkinLabel19: TbsSkinLabel
          Left = 6
          Top = 265
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 16
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = True
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44228#51340#51452
          AutoSize = False
        end
        object SuperViser: TRzPanel
          Left = 6
          Top = 368
          Width = 482
          Height = 65
          BorderOuter = fsFlat
          TabOrder = 17
          object bsSkinLabel22: TbsSkinLabel
            Left = 6
            Top = 31
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 0
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #52572#51333#49688#51221#51088
            AutoSize = False
          end
          object edMngid: TkcRzDBEdit
            Left = 90
            Top = 31
            Width = 146
            Height = 20
            DataSource = dsMain
            DataField = 'UPDATE_MNG_ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBtnText
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft Office IME 2007'
            ParentFont = False
            TabOrder = 1
            EnterToTab = True
          end
          object RzPanel3: TRzPanel
            Left = 3
            Top = 3
            Width = 476
            Height = 20
            BorderOuter = fsFlat
            Caption = #45824#54364#44288#47532#51088
            Color = clWhite
            FlatColor = 8404992
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object bsSkinLabel23: TbsSkinLabel
            Left = 242
            Top = 31
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 4
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #48708#48128#48264#54840
            AutoSize = False
          end
          object edPassM: TkcRzDBEdit
            Left = 325
            Top = 31
            Width = 150
            Height = 20
            DataSource = dsMain
            DataField = 'USER_PWD'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBtnText
            Font.Height = -12
            Font.Name = #44404#47548
            Font.Style = []
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft IME 2010'
            ParentFont = False
            TabOrder = 2
            EnterToTab = True
          end
        end
        object bsSkinLabel20: TbsSkinLabel
          Left = 6
          Top = 57
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 18
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #54924#50896#54596#47749
          AutoSize = False
        end
        object edUserID: TkcRzDBEdit
          Left = 90
          Top = 31
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_ID'
          ReadOnly = True
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeMode = imSAlpha
          ImeName = 'Microsoft IME 2010'
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 19
          OnChange = edUserIDChange
          OnExit = edUserIDExit
          EnterToTab = True
        end
        object edUserNickName: TkcRzDBEdit
          Left = 90
          Top = 57
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_NICK_NM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ParentFont = False
          TabOrder = 20
          OnExit = edUserNickNameExit
          EnterToTab = True
        end
        object edUser_Nm: TkcRzDBEdit
          Left = 338
          Top = 57
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_NM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ParentFont = False
          TabOrder = 21
          EnterToTab = True
        end
        object cbUser_Grade: TkcRzDBComboBox
          Left = 90
          Top = 83
          Width = 150
          Height = 20
          DataField = 'USER_GRADE'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 12
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 22
          EnterToTab = True
        end
        object cbUserPart: TkcRzDBComboBox
          Left = 338
          Top = 83
          Width = 150
          Height = 20
          DataField = 'PART_CD'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 12
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 23
          Items.Strings = (
            #51456#54924#50896
            #51221#54924#50896
            #53580#49828#53552
            #54028#53944#45320)
          Values.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4')
          EnterToTab = True
        end
        object edRegNo: TkcRzDBEdit
          Left = 90
          Top = 109
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'BIRTH_DT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ParentFont = False
          TabOrder = 24
          EnterToTab = True
        end
        object edRegDt: TRzDBDateTimePicker
          Left = 338
          Top = 109
          Width = 150
          Height = 20
          Date = 41774.586684583330000000
          Time = 41774.586684583330000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          ImeName = 'Microsoft IME 2010'
          ParentFont = False
          TabOrder = 25
          FrameController = MastDB.RzFrameController
          DataField = 'REG_DT'
          DataSource = dsMain
        end
        object cbServerIP: TkcRzDBComboBox
          Left = 90
          Top = 135
          Width = 150
          Height = 20
          DataField = 'SERVER_IP'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 12
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 26
          EnterToTab = True
        end
        object edPass: TkcRzDBEdit
          Left = 338
          Top = 135
          Width = 74
          Height = 20
          DataSource = dsMain
          DataField = 'USER_PWD'
          ReadOnly = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ParentFont = False
          TabOrder = 27
          EnterToTab = True
        end
        object cbPartnerNick: TkcRzDBComboBox
          Left = 90
          Top = 161
          Width = 150
          Height = 20
          DataField = 'PARTNER_NICK_NM'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 12
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 28
          EnterToTab = True
        end
        object edEmail: TkcRzDBEdit
          Left = 338
          Top = 161
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_EMAIL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 29
          EnterToTab = True
        end
        object edTelNo: TkcRzDBEdit
          Left = 90
          Top = 187
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_TEL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 30
          EnterToTab = True
        end
        object edHpNo: TkcRzDBEdit
          Left = 338
          Top = 187
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_HP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 31
          EnterToTab = True
        end
        object edAddr1: TkcRzDBEdit
          Left = 90
          Top = 213
          Width = 396
          Height = 20
          DataSource = dsMain
          DataField = 'USER_ADDR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 32
          EnterToTab = True
        end
        object edUserAcnt: TkcRzDBEdit
          Left = 90
          Top = 239
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_BANK_ACNT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 33
          EnterToTab = True
        end
        object edUserBank: TkcRzDBEdit
          Left = 338
          Top = 239
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_BANK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 34
          EnterToTab = True
        end
        object edAcntNm: TkcRzDBEdit
          Left = 90
          Top = 265
          Width = 150
          Height = 20
          DataSource = dsMain
          DataField = 'USER_BANK_ACNT_NM'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 35
          EnterToTab = True
        end
        object bsSkinLabel31: TbsSkinLabel
          Left = 6
          Top = 291
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 36
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = True
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #47700#47784
          AutoSize = False
        end
        object moBody: TRzDBMemo
          Left = 90
          Top = 291
          Width = 396
          Height = 50
          DataField = 'USER_BIGO'
          DataSource = dsMain
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBtnText
          Font.Height = -12
          Font.Name = #44404#47548
          Font.Style = []
          ImeName = 'Microsoft Office IME 2007'
          ParentFont = False
          TabOrder = 37
          FrameController = MastDB.RzFrameController
        end
      end
    end
    object bsSkinTabSheet2: TbsSkinTabSheet
      Tag = 800
      Caption = #44228#51340#44288#47532
      ImageIndex = 15
      object gdAcnt: TDBGridEh
        Left = 0
        Top = 21
        Width = 497
        Height = 132
        TabStop = False
        Align = alTop
        ColumnDefValues.Layout = tlCenter
        Ctl3D = False
        DataSource = dsAcnt
        DynProps = <>
        FixedColor = 15790320
        Flat = True
        ImeName = 'Microsoft IME 2010'
        IndicatorOptions = [gioShowRecNoEh]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentCtl3D = False
        RowDetailPanel.Color = clBtnFace
        RowHeight = 21
        TabOrder = 0
        TitleParams.Color = clBtnFace
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clBtnText
        TitleParams.Font.Height = -11
        TitleParams.Font.Name = 'Tahoma'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 21
        TitleParams.FillStyle = cfstGradientEh
        Columns = <
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACNT_NO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44228#51340#48264#54840
            Title.Color = 16250871
            Width = 80
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACNT_TP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44228#51340#53440#51077
            Title.Color = 16250871
            Width = 70
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_ID'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #54924#50896'ID'
            Title.Color = 16250871
            Width = 70
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLAMT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51092#50529
            Title.Color = 16250871
            Width = 80
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'CMSN'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #45817#51068#49688#49688#47308#54633
            Title.Color = 16250871
            Width = 80
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIRST_DT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #52395#44144#47000#51068
            Title.Color = 16250871
            Width = 80
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'GUJA_CNT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #54788#51116#44396#51340#49688
            Title.Color = 16250871
            Width = 70
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_DT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #52572#51333#47196#44536#51064#51068#51088
            Title.Color = 16250871
            Width = 90
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_IP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #52572#51333#47196#44536#51064'IP'
            Title.Color = 16250871
            Width = 80
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object RzPanel8: TRzPanel
        Left = 0
        Top = 153
        Width = 497
        Height = 291
        Align = alClient
        BorderOuter = fsFlat
        BorderHighlight = clWhite
        BorderShadow = 12303291
        Color = 15790320
        FlatColor = clGray
        FlatColorAdjustment = 0
        FrameController = MastDB.PanelRzFrameController
        TabOrder = 1
        object acntPass: TbsSkinSpeedButton
          Tag = 300
          Left = 432
          Top = 2
          Width = 60
          Height = 21
          Cursor = crHandPoint
          HintImageIndex = 0
          SkinData = fmMain.bsSkinData
          SkinDataName = 'resizetoolbutton'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 14
          DefaultFont.Name = 'Arial'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          CheckedMode = False
          ImageList = imgBtn
          UseSkinSize = True
          UseSkinFontColor = True
          WidthWithCaption = 0
          WidthWithoutCaption = 0
          ImageIndex = 12
          RepeatMode = False
          RepeatInterval = 100
          Transparent = False
          Flat = False
          AllowAllUp = False
          Down = False
          GroupIndex = 0
          Caption = #52488#44592#54868
          ShowCaption = True
          NumGlyphs = 1
          Spacing = 1
          OnClick = acntPassClick
        end
        object bsSkinLabel42: TbsSkinLabel
          Left = 5
          Top = 133
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 11
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44228#51340#47700#47784
          AutoSize = False
        end
        object bsSkinLabel39: TbsSkinLabel
          Left = 258
          Top = 54
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 12
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #51473#48373#51217#49549#50668#48512
          AutoSize = False
        end
        object cbAcntStat2: TkcRzDBComboBox
          Left = 91
          Top = 54
          Width = 151
          Height = 21
          DataField = 'ACNT_STATE'
          DataSource = dsAcnt
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 4
          EnterToTab = True
        end
        object bsSkinLabel38: TbsSkinLabel
          Left = 5
          Top = 54
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 13
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44228#51340#49345#53468
          AutoSize = False
        end
        object cbApiIp: TkcRzDBComboBox
          Left = 344
          Top = 28
          Width = 150
          Height = 21
          DataField = 'API_TP'
          DataSource = dsAcnt
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 3
          EnterToTab = True
        end
        object bsSkinLabel37: TbsSkinLabel
          Left = 258
          Top = 28
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 14
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #52404#44208#53440#51077
          AutoSize = False
        end
        object edAcntPwd: TkcRzDBEdit
          Left = 344
          Top = 2
          Width = 89
          Height = 21
          DataSource = dsAcnt
          DataField = 'ACNT_PWD'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          PasswordChar = #7
          TabOrder = 1
          EnterToTab = True
        end
        object bsSkinLabel27: TbsSkinLabel
          Left = 258
          Top = 2
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 15
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44228#51340#48708#48264
          AutoSize = False
        end
        object edAcntNo: TkcRzDBEdit
          Left = 91
          Top = 28
          Width = 151
          Height = 21
          DataSource = dsAcnt
          DataField = 'ACNT_NO'
          ReadOnly = True
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          TabOrder = 2
          OnChange = edAcntNoChange
          EnterToTab = True
        end
        object bsSkinLabel25: TbsSkinLabel
          Left = 5
          Top = 28
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 16
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44228#51340#48264#54840
          AutoSize = False
        end
        object cbDupYn: TkcRzDBComboBox
          Left = 344
          Top = 54
          Width = 150
          Height = 21
          DataField = 'NEGO_DUP_YN'
          DataSource = dsAcnt
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 5
          Items.Strings = (
            'Y'
            'N')
          EnterToTab = True
        end
        object cbAcntTp: TkcRzDBComboBox
          Left = 91
          Top = 2
          Width = 151
          Height = 21
          DataField = 'ACNT_TP'
          DataSource = dsAcnt
          ReadOnly = True
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 0
          Items.Strings = (
            '1:'#44397#45236#54028#49373
            '2:'#54644#50808#54028#49373
            '3:'#44397#45236#54788#47932)
          Values.Strings = (
            '1'
            '2'
            '3')
          EnterToTab = True
        end
        object bsSkinLabel45: TbsSkinLabel
          Left = 5
          Top = 2
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 17
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #44228#51340#53440#51077
          AutoSize = False
        end
        object bsSkinLabel14: TbsSkinLabel
          Left = 5
          Top = 80
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 18
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #52572#45824#44396#51340#49688
          AutoSize = False
        end
        object moAcntBigo: TRzDBMemo
          Left = 91
          Top = 133
          Width = 403
          Height = 67
          DataField = 'ACNT_BIGO'
          DataSource = dsAcnt
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 8
          FrameController = MastDB.RzFrameController
        end
        object btnAcntMake: TbsSkinButton
          Tag = 200
          Left = 29
          Top = 222
          Width = 89
          Height = 25
          HintImageIndex = 0
          TabOrder = 9
          SkinDataName = 'button'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          CheckedMode = False
          ImageList = imgBtn
          ImageIndex = 15
          AlwaysShowLayeredFrame = False
          UseSkinSize = True
          UseSkinFontColor = True
          RepeatMode = False
          RepeatInterval = 100
          AllowAllUp = False
          TabStop = True
          CanFocused = True
          Down = False
          GroupIndex = 0
          Caption = #44228#51340#49373#49457
          NumGlyphs = 1
          Spacing = 1
          OnClick = btnAcntMakeClick
        end
        object bsSkinButton1: TbsSkinButton
          Tag = 200
          Left = 133
          Top = 222
          Width = 97
          Height = 25
          HintImageIndex = 0
          TabOrder = 10
          SkinDataName = 'button'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          CheckedMode = False
          ImageList = imgBtn
          ImageIndex = 16
          AlwaysShowLayeredFrame = False
          UseSkinSize = True
          UseSkinFontColor = True
          RepeatMode = False
          RepeatInterval = 100
          AllowAllUp = False
          TabStop = True
          CanFocused = True
          Down = False
          GroupIndex = 0
          Caption = #54801#51032#49688#49688#47308
          NumGlyphs = 1
          Spacing = 1
          OnClick = bsSkinButton1Click
        end
        object edGujaMaxCnt: TkcRzEdit
          Left = 91
          Top = 80
          Width = 151
          Height = 21
          Alignment = taRightJustify
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 6
          EnterToTab = True
        end
        object ckGujaYn: TRzCheckBox
          Left = 258
          Top = 81
          Width = 103
          Height = 15
          Caption = #44060#51064#48324#44396#51340#51201#50857
          DisabledColor = 15790320
          FillColor = clWhite
          FocusColor = 15790335
          FrameColor = clGray
          FrameController = MastDB.RzFrameController
          HotTrack = True
          HotTrackColor = 7838964
          HotTrackStyle = htsFrame
          ReadOnlyColor = 14811135
          State = cbUnchecked
          TabOrder = 7
          WordWrap = True
          OnClick = ckGujaYnClick
        end
        object bsSkinLabel32: TbsSkinLabel
          Left = 5
          Top = 107
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 19
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = #52572#49548#44552#50529
          AutoSize = False
        end
        object edMinAmtGuja: TkcRzDBEdit
          Left = 91
          Top = 107
          Width = 151
          Height = 21
          DataSource = dsAcnt
          DataField = 'MINAMT_GUJA'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          TabOrder = 20
          EnterToTab = True
        end
      end
      object pnAcnt: TRzPanel
        Left = 0
        Top = 0
        Width = 497
        Height = 21
        Align = alTop
        BorderOuter = fsFlat
        Caption = #44228#51340#48264#54840'[]'
        Color = clWhite
        FlatColor = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object bsSkinTabSheet3: TbsSkinTabSheet
      Caption = #54924#50896#49345#45812
      ImageIndex = 17
      object bsSkinLabel10: TbsSkinLabel
        Left = 3
        Top = 199
        Width = 80
        Height = 20
        HintImageIndex = 0
        TabOrder = 0
        SkinData = fmMain.bsSkinData
        SkinDataName = 'label'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Transparent = False
        ShadowEffect = False
        ShadowColor = clBlack
        ShadowOffset = 0
        ShadowSize = 3
        ReflectionEffect = False
        ReflectionOffset = -5
        EllipsType = bsetNoneEllips
        UseSkinSize = False
        UseSkinFontColor = True
        BorderStyle = bvFrame
        Alignment = taCenter
        Caption = #44396#48516#47749
        AutoSize = False
      end
      object pnUmNm: TRzPanel
        Left = 0
        Top = 0
        Width = 497
        Height = 21
        Align = alTop
        BorderOuter = fsFlat
        Caption = #54924#50896#47749' ['#54861#44600#46041']'
        Color = clWhite
        FlatColor = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object gdUserMemo: TDBGridEh
        Left = 0
        Top = 21
        Width = 497
        Height = 172
        TabStop = False
        Align = alTop
        AutoFitColWidths = True
        ColumnDefValues.Layout = tlCenter
        Ctl3D = False
        DataSource = dsMemo
        DynProps = <>
        FixedColor = 15790320
        Flat = True
        ImeName = 'Microsoft IME 2010'
        IndicatorOptions = [gioShowRecNoEh]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentCtl3D = False
        RowDetailPanel.Color = clBtnFace
        RowHeight = 21
        TabOrder = 2
        TitleParams.Color = clBtnFace
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clBtnText
        TitleParams.Font.Height = -11
        TitleParams.Font.Name = 'Tahoma'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 21
        TitleParams.FillStyle = cfstGradientEh
        Columns = <
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'UM_DT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51077#47141#51068
            Title.Color = 16250871
            Width = 80
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'PART_NM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44396#48516#47749
            Title.Color = 16250871
            Width = 130
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'UM_TITLE'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51228#47785
            Title.Color = 16250871
            Width = 250
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object cbPartNm: TkcRzDBComboBox
        Left = 89
        Top = 199
        Width = 150
        Height = 21
        DataField = 'PART_NM'
        DataSource = dsMemo
        Style = csDropDownList
        Ctl3D = False
        FrameController = MastDB.RzFrameController
        ImeName = 'Microsoft IME 2010'
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 3
        EnterToTab = True
      end
      object bsSkinLabel21: TbsSkinLabel
        Left = 3
        Top = 226
        Width = 80
        Height = 20
        HintImageIndex = 0
        TabOrder = 4
        SkinData = fmMain.bsSkinData
        SkinDataName = 'label'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Transparent = False
        ShadowEffect = False
        ShadowColor = clBlack
        ShadowOffset = 0
        ShadowSize = 3
        ReflectionEffect = False
        ReflectionOffset = -5
        EllipsType = bsetNoneEllips
        UseSkinSize = False
        UseSkinFontColor = True
        BorderStyle = bvFrame
        Alignment = taCenter
        Caption = #51228#47785
        AutoSize = False
      end
      object edUmTitle: TkcRzDBEdit
        Left = 89
        Top = 226
        Width = 150
        Height = 21
        DataSource = dsMemo
        DataField = 'UM_TITLE'
        FrameController = MastDB.RzFrameController
        ImeName = 'Microsoft IME 2010'
        TabOrder = 5
        OnExit = edUserNickNameExit
        EnterToTab = True
      end
      object bsSkinLabel24: TbsSkinLabel
        Left = 3
        Top = 252
        Width = 80
        Height = 20
        HintImageIndex = 0
        TabOrder = 6
        SkinData = fmMain.bsSkinData
        SkinDataName = 'label'
        DefaultFont.Charset = DEFAULT_CHARSET
        DefaultFont.Color = clWindowText
        DefaultFont.Height = 13
        DefaultFont.Name = 'Tahoma'
        DefaultFont.Style = []
        DefaultWidth = 0
        DefaultHeight = 0
        UseSkinFont = True
        Transparent = False
        ShadowEffect = False
        ShadowColor = clBlack
        ShadowOffset = 0
        ShadowSize = 3
        ReflectionEffect = False
        ReflectionOffset = -5
        EllipsType = bsetNoneEllips
        UseSkinSize = False
        UseSkinFontColor = True
        BorderStyle = bvFrame
        Alignment = taCenter
        Caption = #45236#50857
        AutoSize = False
      end
      object moUmBigo: TRzDBMemo
        Left = 89
        Top = 252
        Width = 403
        Height = 189
        DataField = 'UM_BIGO'
        DataSource = dsMemo
        ImeName = 'Microsoft Office IME 2007'
        ScrollBars = ssBoth
        TabOrder = 7
        FrameController = MastDB.RzFrameController
      end
    end
    object bsSkinTabSheet4: TbsSkinTabSheet
      Tag = 800
      Caption = #44288#47532#51088' '#51077#52636#44552
      ImageIndex = 18
      object gdInout: TDBGridEh
        Left = 0
        Top = 21
        Width = 497
        Height = 132
        TabStop = False
        Align = alTop
        AutoFitColWidths = True
        ColumnDefValues.Layout = tlCenter
        Ctl3D = False
        DataSource = dsAcnt
        DynProps = <>
        FixedColor = 15790320
        Flat = True
        ImeName = 'Microsoft IME 2010'
        IndicatorOptions = [gioShowRecNoEh]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentCtl3D = False
        RowDetailPanel.Color = clBtnFace
        RowHeight = 21
        TabOrder = 0
        TitleParams.Color = clBtnFace
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clBtnText
        TitleParams.Font.Height = -11
        TitleParams.Font.Name = 'Tahoma'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 21
        TitleParams.FillStyle = cfstGradientEh
        Columns = <
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACNT_NO'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44228#51340#48264#54840
            Title.Color = 16250871
            Width = 100
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACNT_TP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44228#51340#53440#51077
            Title.Color = 16250871
            Width = 100
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'PLAMT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51092#50529
            Title.Color = 16250871
            Width = 100
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'USER_ID'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #54924#50896'ID'
            Title.Color = 16250871
            Width = 90
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'FIRST_DT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #52395#44144#47000#51068
            Title.Color = 16250871
            Visible = False
            Width = 100
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'GUJA_CNT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #54788#51116#44396#51340#49688
            Title.Color = 16250871
            Visible = False
            Width = 80
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_DT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #52572#51333#47196#44536#51064#51068#51088
            Title.Color = 16250871
            Visible = False
            Width = 100
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_IP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #52572#51333#47196#44536#51064'IP'
            Title.Color = 16250871
            Visible = False
            Width = 100
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object RzPanel2: TRzPanel
        Left = 0
        Top = 153
        Width = 497
        Height = 291
        Align = alClient
        BorderOuter = fsFlat
        BorderHighlight = clWhite
        BorderShadow = 12303291
        Color = 15790320
        FlatColor = clGray
        FlatColorAdjustment = 0
        FrameController = MastDB.PanelRzFrameController
        TabOrder = 1
        object RzGroupBox1: TRzGroupBox
          Left = 5
          Top = 6
          Width = 487
          Height = 131
          Caption = #51077#44552
          FrameController = MastDB.RzFrameController
          TabOrder = 0
          object bsSkinLabel26: TbsSkinLabel
            Left = 8
            Top = 25
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 2
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #49892#51092#50529
            AutoSize = False
          end
          object edInAmt: TRzEdit
            Tag = 500
            Left = 92
            Top = 52
            Width = 150
            Height = 21
            Text = '0'
            Alignment = taRightJustify
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft IME 2010'
            TabOrder = 0
            OnEnter = edInAmtEnter
            OnExit = edInAmtExit
            OnKeyDown = edInAmtKeyDown
          end
          object bsSkinLabel28: TbsSkinLabel
            Left = 8
            Top = 52
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 4
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #51077#44552#44552#50529
            AutoSize = False
          end
          object btnIn: TbsSkinButton
            Tag = 200
            Left = 389
            Top = 96
            Width = 89
            Height = 25
            HintImageIndex = 0
            TabOrder = 1
            SkinDataName = 'button'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            CheckedMode = False
            ImageList = imgBtn
            ImageIndex = 20
            AlwaysShowLayeredFrame = False
            UseSkinSize = True
            UseSkinFontColor = True
            RepeatMode = False
            RepeatInterval = 100
            AllowAllUp = False
            TabStop = True
            CanFocused = True
            Down = False
            GroupIndex = 0
            Caption = #51077#44552#52376#47532
            NumGlyphs = 1
            Spacing = 1
            OnClick = btnInClick
          end
          object edInAcntAmt: TRzEdit
            Tag = 500
            Left = 92
            Top = 25
            Width = 150
            Height = 21
            Alignment = taRightJustify
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft IME 2010'
            ReadOnly = True
            TabOrder = 3
          end
          object bsSkinLabel33: TbsSkinLabel
            Left = 8
            Top = 79
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 5
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #48372#49345#45236#50857
            AutoSize = False
          end
          object edBosangMsg: TRzMemo
            Left = 92
            Top = 79
            Width = 285
            Height = 42
            TabOrder = 6
            FrameController = MastDB.RzFrameController
          end
        end
        object RzGroupBox2: TRzGroupBox
          Left = 5
          Top = 143
          Width = 487
          Height = 149
          Caption = #52636#44552
          FrameController = MastDB.RzFrameController
          TabOrder = 1
          object btnOut: TbsSkinButton
            Tag = 200
            Left = 389
            Top = 114
            Width = 89
            Height = 25
            HintImageIndex = 0
            TabOrder = 1
            SkinDataName = 'button'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            CheckedMode = False
            ImageList = imgBtn
            ImageIndex = 19
            AlwaysShowLayeredFrame = False
            UseSkinSize = True
            UseSkinFontColor = True
            RepeatMode = False
            RepeatInterval = 100
            AllowAllUp = False
            TabStop = True
            CanFocused = True
            Down = False
            GroupIndex = 0
            Caption = #52636#44552#52376#47532
            NumGlyphs = 1
            Spacing = 1
            OnClick = btnOutClick
          end
          object bsSkinLabel29: TbsSkinLabel
            Left = 8
            Top = 25
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 3
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #49892#51092#50529
            AutoSize = False
          end
          object bsSkinLabel30: TbsSkinLabel
            Left = 8
            Top = 68
            Width = 80
            Height = 20
            HintImageIndex = 0
            TabOrder = 4
            SkinData = fmMain.bsSkinData
            SkinDataName = 'label'
            DefaultFont.Charset = DEFAULT_CHARSET
            DefaultFont.Color = clWindowText
            DefaultFont.Height = 13
            DefaultFont.Name = 'Tahoma'
            DefaultFont.Style = []
            DefaultWidth = 0
            DefaultHeight = 0
            UseSkinFont = True
            Transparent = False
            ShadowEffect = False
            ShadowColor = clBlack
            ShadowOffset = 0
            ShadowSize = 3
            ReflectionEffect = False
            ReflectionOffset = -5
            EllipsType = bsetNoneEllips
            UseSkinSize = False
            UseSkinFontColor = True
            BorderStyle = bvFrame
            Alignment = taCenter
            Caption = #52636#44552#44552#50529
            AutoSize = False
          end
          object edOutAmt: TRzEdit
            Tag = 500
            Left = 92
            Top = 68
            Width = 150
            Height = 21
            Text = '0'
            Alignment = taRightJustify
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft IME 2010'
            TabOrder = 0
            OnEnter = edInAmtEnter
            OnExit = edInAmtExit
          end
          object edOutAcntAmt: TRzEdit
            Tag = 500
            Left = 92
            Top = 25
            Width = 150
            Height = 21
            Alignment = taRightJustify
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft IME 2010'
            ReadOnly = True
            TabOrder = 2
          end
        end
      end
      object pnInout: TRzPanel
        Left = 0
        Top = 0
        Width = 497
        Height = 21
        Align = alTop
        BorderOuter = fsFlat
        Caption = #44228#51340#48264#54840'[]'
        Color = clWhite
        FlatColor = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    object bsSkinTabSheet5: TbsSkinTabSheet
      Caption = #47196#44536#51064#45236#50669
      ImageIndex = 21
      object gdLogin: TDBGridEh
        Left = 0
        Top = 21
        Width = 497
        Height = 423
        TabStop = False
        Align = alClient
        ColumnDefValues.Layout = tlCenter
        Ctl3D = False
        DataSource = dsLogin
        DynProps = <>
        FixedColor = 15790320
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ImeName = 'Microsoft IME 2010'
        IndicatorOptions = [gioShowRecNoEh]
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        ParentCtl3D = False
        ParentFont = False
        RowDetailPanel.Color = clBtnFace
        RowHeight = 21
        TabOrder = 0
        TitleParams.Color = clBtnFace
        TitleParams.Font.Charset = DEFAULT_CHARSET
        TitleParams.Font.Color = clBtnText
        TitleParams.Font.Height = -11
        TitleParams.Font.Name = 'Tahoma'
        TitleParams.Font.Style = []
        TitleParams.ParentFont = False
        TitleParams.RowHeight = 21
        TitleParams.FillStyle = cfstGradientEh
        Columns = <
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_DT'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51217#49549#51068#51088
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 70
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_TM'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51217#49549#49884#44036
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 88
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'APP_TP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44396#48516
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 36
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'HTS_VER'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'HTS '#48260#51260
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_IP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51217#49549'IP'
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 106
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'ACNT_TP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #44228#51340#44396#48516
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 74
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_TP'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = #51217#49549#44396#48516
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 58
          end
          item
            Alignment = taCenter
            DynProps = <>
            EditButtons = <>
            FieldName = 'LOGIN_MAC'
            Footers = <>
            Title.Alignment = taCenter
            Title.Caption = 'MAC'#51452#49548
            Title.Color = 16250871
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clBtnText
            Title.Font.Height = -12
            Title.Font.Name = #44404#47548#52404
            Title.Font.Style = []
            Width = 116
          end>
        object RowDetailData: TRowDetailPanelControlEh
          object RzPanel7: TRzPanel
            Left = 0
            Top = 0
            Width = 0
            Height = 21
            Align = alTop
            BorderOuter = fsFlat
            Caption = #44228#51340#48264#54840'[]'
            Color = clWhite
            FlatColor = 8404992
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = #44404#47548#52404
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object pnLogin: TRzPanel
        Left = 0
        Top = 0
        Width = 497
        Height = 21
        Align = alTop
        BorderOuter = fsFlat
        Color = clWhite
        FlatColor = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #44404#47548#52404
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          496
          20)
        object lbLogin: TbsSkinLabel
          Left = 330
          Top = 1
          Width = 126
          Height = 19
          HintImageIndex = 0
          Anchors = [akTop, akRight]
          TabOrder = 0
          SkinData = fmMain.bsSkinData
          SkinDataName = 'label'
          DefaultFont.Charset = DEFAULT_CHARSET
          DefaultFont.Color = clWindowText
          DefaultFont.Height = 13
          DefaultFont.Name = 'Tahoma'
          DefaultFont.Style = []
          DefaultWidth = 0
          DefaultHeight = 0
          UseSkinFont = True
          Transparent = False
          ShadowEffect = False
          ShadowColor = clBlack
          ShadowOffset = 0
          ShadowSize = 3
          ReflectionEffect = False
          ReflectionOffset = -5
          EllipsType = bsetNoneEllips
          UseSkinSize = False
          UseSkinFontColor = True
          BorderStyle = bvFrame
          Alignment = taCenter
          Caption = '0'#44148
          AutoSize = False
        end
      end
    end
  end
  inherited imgBtn: TImageList
    Bitmap = {
      494C01011600C401C40110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001001000000000000030
      000000000000000000000000000000000000000000000000E109E20DE20DE209
      E109C005A0010000000000000000000000000000364236423642364236423642
      364236423642364236423642644C825C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000212C626E72EE62AC526A41E
      4212020EE009C001A001000000000000000000003642BF679F637F5F7F579A3E
      DD425F4F5F4F5F4F5F4F094DC364A77D81640000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000023128A3F893F2837C82E68220A1E
      4E36CE2DAB21A611A105A00100000000000000003642BF6B9F639F5F77466C39
      2E5233429A3E3E4B144EE564A77D227D60680000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000641AAD4BD0465326351135013511
      1B67702DB43DD5416B21A00100000000000000003642DF6FB42DB42D514A8D5E
      4E7BB07BAA516448E464877DC36C406800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000641A4A2A3D737D2635113511B71D
      3B6F702DF341174A6D25000000000000000000003642DF73BF6F9F67744EAE5E
      B056F27F2461C364A77D246DE83C000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000008C257D731B57B94AB94EB952
      1B5B702DD339354A6F2D000000000000000000003642FF77B42DB42D3542AA45
      4D566F4E6949056DE17C8375887A0C2500000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702D3C57B84ADA42DB3A582A
      7C16702D750D7319702D000000000000000000003642FF7FFF7BFF77DB56F13D
      8E5A0F670F6709620651A85947766A3D00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702DBF5FDA423D3FFC325922
      BD1E702DBA055701702D000000000000000000003642BB6FAE36AF3A36537C5F
      1C57994E534A6E566A66C75DA8552B3100000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702D7C67FA561B57FA4E9946
      DB46702DD329D425702D00000000000000000000B84E6A2A3453775F365BF34A
      B03EF4423B4F1D53994A314A8A45CB1C00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702D7D5BDA46FC42DB36582A
      9C1E702D83558355835583558355000000000000302ECF4294536106EA2E7453
      99673557AF3A8F2E9F5F5F57B42D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702DBE67FA4E3D4FFC3E792E
      BD22702D83554C7F0B7FE55D835500000000000096426B2EB9670D37620A4002
      6106EA2A965BAD3A8F2E7F5FB42D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702DBE77BE7BBE77BD777D6F
      9F6F4E5E83552C7FEA7E83550000000000000000DC4E34538D36365B99677453
      0C336106C82215574B265E5FB42D000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000702D702D702D702D702D702D
      702DAA4983558355667E867E8355000000000000DC4EFF7FBC73565BF24AF146
      134F775FD7527B2E7B2E7B2E7B2E000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008355667E056E835500000000DC4EFF7FFF7FFF7FFF7FDD77
      575FD042523A7B2EFF327B260000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000083558355000000000000DC4EFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F7B2E7B2E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000DC4EDC4EDC4EDC4EDC4EDC4E
      DC4EDC4EDC4E7B2E000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000006005600580058005
      600120012001200100000000000000000000F439F439F439F439F439F439B329
      B329B329B329B329F439F439F439F439F43900000000F439F439F439F439F439
      F439F439F439F439F439F439B3310000000000000000E109E109C109A0058005
      800580058005800580058005400500000000000060054316A41EA41E631A4216
      010EC005A005600140012001000000000000F439FF7FFF7FFF7B7E631B4FFA4E
      FB4EFB4E3C577E639F6BFF7FFF7FFF7FF43900000000F4399F639F5F9F5F9F5B
      7F577F577F537F537F4F5F4FB3310000000000006216C31EA21AA212A10E810E
      810A810A810A810A810AA10E200A40050000A105262B8733252BC426641AC511
      C7198A21EC1C440D40012001200100000000F539FF7FF439F4392031F55A5E5B
      5E5B5E5B5F5B5F57FD4A373A9A427A42F43900000000F539BF67BF639F639F5F
      9F5BF439F439F439F4397F53B331000000000000A31E042B0323E21EE116E112
      FF7F051FC006C00EC10EE10EA10A80050000020EC93F89320D227009B200B200
      37465752EC1C7335EC1C2205400100000000163EFF7FFF7FFF7F225AC072225A
      3A63FC56FB52FC523E57363E363E363EF43900000000163EBF6BBF67BF679F63
      9F5F9F5F9F5B7F577F577F53B331000000000000C4220633E52A062FB65FD663
      FB73B65F2B33C00AC10EC10E810AA0050000020E061EDB6A3C26B200B200D400
      574A7652EC1CB33DEC1C01010000000000005842FF7FF439F439225A207F6E19
      D300F439F439F4397F5B7F575F535F4FF43900000000163EDF6FF439BF6BF439
      9F63F4399F5FF4399F5B7F57B331000000000000C426273B06334C43FF7F0833
      B96B714FFF7F2B37C10EE10E810A80050000000026111C6FFB4E392E1636373E
      D95A564EEC1CF345EC1C00000000000000007942D867D85F377F8C7E36019F16
      FD01D300BF6BBF6B9F679F637F5F7F5BF43900000000373EDF73DF6FBF6FBF6B
      BF67BF679F639F5F9F5B9F5BB331000000000000C4264B47283F4C477257C11E
      B86B4D43FF7F9353C10EC10E810A800500000000EC1CD94E974A7742993A162A
      391AB511EC1C3211EC1C00000000000000009A46B763E97DE97DE97D36011F43
      DF22FC01D300DF7BFF7FFF7FFF7FFF7FF439000000005842DF77F439F439F439
      F439F439BF67BF639F5F9F5FB331000000000000C4266E4F2A43073B07372C43
      FB73FE7BFF7F714FC216E112810EA00500000000EC1C5D4B9936BB2ADD26D615
      5C0ED70DEC1CF700EC1C0000000000000000BB469B429B429B429B429B423601
      1F43DF1ED60D20319B429B429B429B429B42000000005842FF7BFF77DF77DF73
      DF6FBF6FBF6BBF67BF639F63B331000000000000C42671574B47293FD76BFF7F
      FF7FFF7F955F072FE31EE21AA112A00500000000EC1C5C5BD94ADA46DB3E3632
      7A32F529EC1C7809EC1C00000000000000000000000000000000000000000000
      3601773A68561612D3000000000000000000000000007942FF7FF439F439F439
      F439F439DF6FBF6BBF6BBF67B331000000000000C426925B4C474D4BFF7FFC77
      FD7B4C470633E426E322E31EA216E10900000000EC1CDA4EB94A9942993A362E
      582AD421EC1C014DEC1C00000000000000000000000000000000000000000000
      00002031B446DF1AFD01D300000000000000000000009A46FF7FFF7FFF7BFF7B
      FF77DF77DF73DF6F9F637E5FB331000000000000C426935F4D4B4E4FFF7F925B
      D96F2A43D86B4B47E42A0427C31E010E00000000EC1C7D539936BB2EBC26D615
      3B0EB709014D8169014D00000000000000000000000000000000000000000000
      0000000036011F43DF1E1D02D30000000000000000009A46FF7FF439F439F439
      F439F439DF77DF735C63F856B331000000000000C426956370534B47D667FA73
      FA73D86FFC7B6C4B0533052FC426220E00000000EC1C7C679D6B5C635C5BDA4E
      FC4A553E014D247EA271014D014D214D00000000000000000000000000000000
      000035011501560D1F43DF1EDD01F600000000000000BB46FF7FF439FF7FFF7F
      FF7FF439FF7B163A163A163A163A000000000000C426B563945F70536F4F7157
      FF7FB45F4C47073B06370637E42A621200000000EC1CEC1CEC1CEC1CEC1CEC1C
      EC1CEC1C014D037E247E046EC461625500000000000000000000000000000000
      000000003601F50056111F43FC09CA35045200000000BB46FF7FF439F439F439
      F439F439FF7B163A5F3FDE2E593E000000000000C426925BB563B6679563935F
      70574D4B2943073B063B263BE52E821600000000000000000000000000000000
      0000000000004159457E097FC87A425100000000000000000000000000000000
      0000000000003601D4003019094AE07E806A00000000BB46FF7FFF7FFF7FFF7F
      FF7FFF7FFF7F163A1E43593E00000000000000000000E72E0A3B0A3B0A370937
      0833E62EE52AC426C426C426A31E000000000000000000000000000000000000
      0000000000004151466E097FC87A625500000000000000000000000000000000
      00000000000000003601D400806A806A000000000000BB469B429B429B429B42
      9B429B429B42163A593E00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000006251625562556255214D000000000000000000000000AC08AC08
      AC08AC08AC08AC08000000000000000000000000000000000000000000000000
      000000000000C07CC07CC07CC07C000000000000000020542054205420540000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000AD08AC0837013701
      3701370137013701AC08AC0800000000000000000000C001C001C001C001C001
      C0014051C07CEB7D2D7E887D877DC07C000000002054A074E17CD37E80782054
      A229230E0212E109A001A0010000000000000000950D950D950D950D950D950D
      950D950D950D950D950D000000000000000000000000D0041601370137013701
      370137013701370137013601AC08000000000000C00140024002600681126002
      600240510C7E0C7E9B7FF57E247D877D000020548074457DDE7FFF7F0C7EA07C
      A06CC62EE62EE52AA526641EA001A0010000950D9E1E9E1E9E1E9E1E9E1E9E1E
      9E1E9E1E9E1E9E1E9E1E950D0000000000000000D00416013701160116011601
      1601370137013701370137013601AC0800000000C0014002A2162533A3124F3B
      20066569A97D2D7E9B7F917EC17CEA7D11112054E17CC97D0C7E167FFF7FC07C
      C07C85352B26AD29AA21061A431A0212A001950DFE36BD2EBD2A9D269C229E1E
      B041807C8375857E6A66950D000000000000000015011601160116011501B815
      F921F921D9197809370137013701AD0800000000C001A216473B042BA312FA67
      8426C07C2D7E917EDD7F0C7E447DA87D11112054A77D237DD37EFF7FEB7DA07C
      A07CE948DA5A72359339B3356E29C411C005950DDE329D2A9C269C227C229D1A
      B13980788469657A4B62950D000000000000F20037013601360136013601DC46
      FF7FFF7FFF7FFF7F1A1E370137013701AC0800000000C0016637A312DA6BF95F
      0427BE25C07C2D7E4E7E2D7EE97DE85C11112054CA754E7EFF7FD47E447DC07C
      A0782F2DFA5E7235B3391546D5418511C001950DDE329D2A9C269C227C229D1A
      9D22382E7A2E9836DC3AB511000000000000F200570557055705560556055605
      5605560556059B3AFF7F370137013701AD08000000008215410D46398859294E
      AC26CB4D3F32C07CC07CC07CC07CDD21111100002054167F797FFF7FBC7F017D
      8358B61D1A677235D33D1546F4416A1D0000950D5B26181A181A181AF815F815
      F8157B227C2ABE32FE3E9611000000000000F200B80D980D970D970D970DFC4A
      5605360115013605FF7F370137013701AD080000000000002010E150E150C054
      27511E32B52D534A6E566E52153638110000000000002054D37E587FC97D266D
      5552B94EB8567235B33D354A1446512D0000950D9C2A5B225B1E5B1E5A1E5A1E
      5B1E7B227C2AFE3A1F479311081608160000F2043A26F919D815D8151C4FFF7F
      9709560536011922FF7F370137013701AD0800000000000002496365435D435D
      21618C510372E16DE269C165235600000000000000000000AD59AD5DF1499A32
      382A38227C1272357511540D5319512D00000000950D950D950D950D950D950D
      950D950D950D950D950D8C26CC11E94B0816F2009B367B32191E5E5FFF7FFF7F
      BE6F7D635D5FFF7F9B3A370137013701AD0800000000200C8465A46DA469A469
      8469A36D467E667E667E467E057A23560000000000000000512D3D47FB3A5F3F
      9A2E7922BC1A7235B80D77013601512D0000000000000000CC1109370833E832
      E72EE72EC72AC72AA626621A8843E94B0816F2007C321D537B2E7E5FFF7FFF7F
      7E63FC4ADC461A223601370137013701AC08000000000004C465257E05760576
      0576267AA87EA87E887E877E667E257A2356000000000000512D3B57DA4A3D53
      DA46993EDB3A7235D71DB715B611512D00000000000000000816683F673B473B
      46374637263726374637020E221206330816000013093D573E57BC3A3D57FF7F
      D915B80D77095701370137013701AD080000000000000000E2304672467A667E
      2572066688768876C97EA87E877E667E2356000000000000512DB84E7746B946
      7742573E783A7235922D93257225512D000000000000000009162833673B473B
      4637463726372637663B673F631AC52608160000F2009C369E675E5FBC3A1D4F
      D915B80D78097805370137013601AC080000000000001042000040108118A120
      4010A24D40394039E97EC97EA87E877E2356000000000000512D1C4BDA3E3E3B
      9A2A59229C167235970D76013501512D00000000000000000916283368228822
      8822882267226822473B683B8943EB4F081600000000F2009C365E5F7E631D4F
      9C3A5B2A3A22D91558013601AE04000000000000000000001042104200000000
      0329AD6660414666EA7EEA7EC97E23560000000000000000512DFA52B946FB4A
      7836372A7A227235971576097511512D00000000000000000916683F47372737
      2637263326332637473B683B8943EC530816000000000000F2003309BC3AFD4A
      FD46BC3A3B2698091305AD080000000000000000000000000000000000000000
      0000045AAD66E45561416141404123560000000000000000512DFF7FFF7FDF7B
      DE7BBE77BE777235344AD65AB656512D00000000000000000000081608160816
      08160816081608160816081608160816000000000000000000000000F3001305
      130513051305D004000000000000000000000000000000000000000000000000
      00000000475E0556A2494041000000000000000000000000512D512D512D512D
      512D512D512D512D512D512D512D512D00000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000D6000000
      00000000000000000000000000000000000000000000000000000000A001A001
      A001A001A001A001A001A001A001A001A00100000000804D804D804DF439F439
      F439F439F439F439F439F439F439712D00000000000000008049804980498049
      804980490000000000000000000000000000000000000000000080492629D600
      062180498049000000000000000000000000922DB435B435B435B435A001FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA0010000804DE772E672C66E1642BF6F
      DF73DF73BE6FBE6FBE6FBE6FBF6F712D000000000000C0552677227F247F6A7F
      8E7F856A8049000000000000000000000000000000000000C0552677227F0E15
      D600CF31856A804900000000000000000000B3319F635E573E4F3D4BA001FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA0010000804D08730773E77216429E6F
      BC2E9C2E9C2E9C2E9C2E9C2E9E6B712D00000000C055EE7F877F227F037B0040
      00400040004000400040004000400000000000000000C055EE7F877F227FA566
      F00C15018A31006280490000000000000000B3319F675E5B5E573D4FA001FF7F
      EF3EA001030EFF7FCD36A0018926FF7FA0010000804D2977087308731742BF6F
      9F677F5F7F5F7F5F7F5F7E639E6B712D00000000C055EE7F877F227F037B0040
      447D027DA07C807C4078207000400000000000000000C055EE7F877F227F247F
      0C3E120DD600072180490000000000000000B431BF6B7E635E5B5E57A001FF7F
      FF7F765BA001E105A001CD36FF7FFF7FA0010000804D2A772A7709771742BF73
      BC2E9C2E9C2E9C2E9C2A9C2E9E6B712D00000000C055EE7F877F227F037B0040
      657D237DC17C807C607C407400400000000000000000C055EE7F877F227F247F
      6A7B30199719B40005250000000000000000D431DF739E677E5F5E5BA001FF7F
      FF7FFF7F8926A001C105FF7FFF7FFF7FA0010000804D4B7B2B772A773842BF77
      BF6F9F6B9F679F679F679E6BBE6F712D00000000C055F37FD47FD67FDB7F0040
      00400040004000400040004000400000000000000000C055F37FD47FD67FFB7F
      FC7F185F120DDC3EB4000000000000000000F535FF779E6B9E677E5FA001FF7F
      FF7FAB2EA0018926A0012412DD77FF7FA0010000804D4C7B4C7B4B775842DF7B
      BC2E9C2A9C2A9C2A9C2A9C2EBE73712D00000000C055B47BA36A4062005E225E
      435EE2550F6F80490000000000000000000000000000C055B47BA36A4062205E
      160116011501392E9F53B400000000000000F635FF7FBF739E6B9E67A001FF7F
      6822A001AC32FF7F775FA0012412FF7FA0010000804D6D7B6C7B4C7B5946DF7B
      DF7BDF73BF73BF73BF73DF739D6F712D00000000C055C66A877F227F247F6A7F
      8E7FC66EA051A04D0000000000000000000000000000C055C66A877F227F247F
      1601D7215F4BDD3EB500B400B400000000001736FF7FDF77BF73BF6BA001FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA0010000804D6E7F6D7B6D7B7946FF7B
      FF7FFF7FFF7FFF7F163A163A163A163A00000000C055EE7F877F227F247F6A7F
      8E7FC66E006280490000000000000000000000000000C055EE7F877F227F247F
      6A7F1601B719DE363B22B400000000000000173AFF7FFF7FDF77BF73A001FF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FA0010000804D8F7F8E7F6E7B7A46FF7F
      FF7FFF7FFF7FFF7F163ABC3A5E2E1F7C00000000C055EE7F877F227F247F6A7F
      8E7FC66E006280490000000000000000000000000000C055EE7F877F227F247F
      6A7F8E7F16015609DB0D7805B50000000000383AFF7FFF7FFF7FDF77A001A001
      A001A001A001A001A001A001A001A001A0010000804D8F7F8F7F8E7F7A46BB42
      BB42BB42BB42BB42163AB846804D000000000000C055EE7F877F227F247F6A7F
      8E7FC66E006280490000000000000000000000000000C055EE7F877F227F247F
      6A7F8E7FC66E160116011601B400B4000000593AFF7FFF7FFF7FFF7FDF77BF6F
      9F6BBF6B5C5FB64EB43500000000000000000000804DB07F907F8F7F8F7F8F7F
      6E7F6D7B4C7B4B772A772A77804D000000000000C055EF7FCD7FCA7FEB7FEF7F
      F17F297B206280490000000000000000000000000000C055EF7FCD7FCA7FEB7F
      EF7FF17F297B206280490000000000000000593AFF7FFF7FFF7FFF7FFF7FDF77
      BF73B435B435B435B43500000000000000000000804DB07FB07FCE39CE39CE39
      CE39CE39CE39CE394C7B2B77804D000000000000C055FF7FFE7FF87FF47FF37F
      F37FF27FCA7F80490000000000000000000000000000C055FF7FFE7FF87FF47F
      F37FF37FF27FCA7F804900000000000000005A3EFF7FFF7FFF7FFF7FFF7FFF7F
      BE73B4359C2E7D1ED72500000000000000000000804DB07FB07FCE39195F195F
      195F195FF95ACE396D7B4C7B804D0000000000000000E055FD7FFB7FF67FF37F
      F17FF07FA14D000000000000000000000000000000000000E055FD7FFB7FF67F
      F37FF17FF07FA14D000000000000000000007A3EFF7FFF7FFF7FFF7FFF7FFF7F
      FF7FB4359C2E182E0000000000000000000000000000804D804DCE397C6BFF7F
      FF7BFF7B1A5FCE39804D804D000000000000000000000000C055C055C055C055
      C055C05500000000000000000000000000000000000000000000C055C055C055
      C055C055C0550000000000000000000000005A365A365A365A365A365A365A36
      5A36B435F73500000000000000000000000000000000000000000000CE39CE39
      CE39CE39CE390000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000060016001600160010000000000000000000000000000000000007000
      7000700070007000700070007000000000000000000020342034202C20282024
      20242024202420242024202420200000000000000000E048E048C040C03CA03C
      A03CA03CA03CA03CA03CA03CA034000000000000000080498049804980498049
      804900006001410A400660010000000000000000000080498049804980497000
      FF7FFF7FFF7F2E7ED47EFF7F70000000000000004048405C4058405440504050
      404840484050404840484050203C202000000000206160714069406920612061
      2061206120612061206120610051A03400000000C0552677227F247F6A7F8E7F
      856A80496001610E610A60010000000000000000C0552677227F247F6A7F7000
      FF7FFF7F0C7E607C677DFF7F7000000000000000405C60706068606460604058
      4058405440544058405440584050202400000000406DA07D807D607560756071
      4069406940694069406D406D2061C03C0000C055EE7F877F227F247F4A7B6001
      6001600160018212810E6001600160016001C055EE7F877F227F247F6A7F7000
      597F257D607C257D807C597F7000000000000000606060786070606860606060
      40584058405440504054405440502024000000006075A07DA07D807D60758071
      787FC36D406920652065406D2061C03C0000C055EE7F877F227F247F4A7B6001
      04230423C31AC31AA2128212810E610A6001C055EE7F877F227F247F6A7F7000
      677DA17CF57EBD7FA17C677D70000000000000006064807C6078607060686064
      60604058405840544050405C40482024000000006079C27DA17DA07DA07D787F
      FF7FCE7A40694069206540692061A03C0000C055EE7F877F227F247F6A7B6001
      452B24270423E31EC31AC216A21282126001C055EE7F877F227F247F6A7F7000
      9B7F597FFF7FFF7F507E607C691C0000000000006064E27CA07C607860706068
      60646064405C40584054405440502024000000006079047EE27DC27D987FFF7F
      FF7FBA7F60714069406940692061A03C0000C055F37FD47FD67FFB7FDC7F6001
      600160016001242704236001600160016001C055F37FD47FD67FFB7FFC7F7000
      FF7FFF7FFF7FFF7FFF7F677D607C0000000000006064667DC17C807CFF7FFF7F
      FF7FFF7FFF7FFF7F405C405840502024000000006079687E037EBB7FFF7F987F
      687EFF7F057A6075406D406D2061C03C0000C055B47BA36A4062205E225E435E
      E2550F6F6001452B252B6001000000000000C055B47BA36A4062205E225E7000
      700070007000700070006E00625C607C000000006064A97DE37C807CFF7FFF7F
      FF7FFF7FFF7FFF7F60606060404C202C0000000060798B7E257E8B7E127FC17D
      A07D337F117F6075607160712065C0400000C055C66A877F227F247F6A7F8E7F
      C66EA05160016633662F6001000000000000C055C66A877F227F247F6A7F8E7F
      C66EA051A04D0000000000000000607C607C00006064EB7D047DA17C807C6078
      60746074607060686064606440582034000000006079AD7E267EE37DC17DA07D
      A07DE37DBA7FA07D807D60794069E0480000C055EE7F877F227F247F6A7F8E7F
      C66E00626001600160016001000000000000C055EE7F877F227F247F6A7F8E7F
      C66E0062804900000000000000000000607C000060640C7E457DE27CC17C807C
      607C607860786074606C606C405C203C000000006079CE7E477E047E037EE27D
      C17DA17D697E8B7EA07DA07D607100510000C055EE7F877F227F247F6A7F8E7F
      C66E00628049000000000000000000000000C055EE7F877F227F247F6A7F8E7F
      C66E00628049000000000000000000000000000060644E7E887DE37CE27CA17C
      A07C807C807C60746074607060604040000000006079F07E8A7E257E047EE37D
      E27DC27DC17DCD7EA07DA07D607500550000C055EE7F877F227F247F6A7F8E7F
      C66E00628049000000000000000000000000C055EE7F877F227F247F6A7F8E7F
      C66E00628049000000000000000000000000000060646F7E2E7ECA7D887D667D
      257DE27C807C607C60746074606C4048000000006079117FEF7EAC7E8A7E697E
      267E047EC27DA17DA07DA17DA07D20610000C055EF7FCD7FCA7FEB7FEF7FF17F
      297B20628049000000000000000000000000C055EF7FCD7FCA7FEB7FEF7FF17F
      297B2062804900000000000000000000000000006064CB7D6F7E707E4E7E0C7E
      A97D257DC17C807C607C607460704050000000006079AC7E117F127FF07ECE7E
      8B7E467E037EC17DC17DA17DA07D20650000C055FF7FFE7FF87FF47FF37FF37F
      F27FCA7F8049000000000000000000000000C055FF7FFE7FF87FF47FF37FF37F
      F27FCA7F8049000000000000000000000000000000006074A17CC17CA17CA07C
      807C6074606C60686064606840580000000000000000A07DE37DE37D037EE27D
      C17DA07DA07D6079607960796071000000000000E055FD7FFB7FF67FF37FF17F
      F07FA14D00000000000000000000000000000000E055FE7FFB7FF67FF37FF17F
      F07FA14D00000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C055C055C055C055C055
      C0550000000000000000000000000000000000000000C055C055C055C055C055
      C055000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008A3D8A350000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E048E048C040C03CA03C
      A03CA03CA03CA03CA03CA03CA034000000000000000080498049804980498049
      8049000000000000000000008B3DA169486A0000000020342034202C20282024
      2024202420242024202420242020000000000000000020342034202C20282024
      202420242024202420242024202000000000000020616071406D406920612061
      2061206120612061206120610051A03400000000C0552677227F247F6A7F8E7F
      856A8049000000000000AB3DA269867E677A00004048405C4058405440504050
      404840484050404840484050203C2020000000004048405C4058405440504050
      404840484050404840484050203C202000000000406DA07D807D607960756071
      4069406D4069406D406D406D2065A03C0000C055EE7F877F227F247F6A7F6E7B
      A66E005E80490000AE3D8261667E677A00000000405C60706068606460604058
      4058405440544058405440584050202400000000405C60706068606460604058
      40584054405440584054405840502024000000006079A07DA07D807960756071
      6071406D406940694065406D2061C03C0000C055EE7F877F227F247F0B73F33D
      36427646B3314E29E855867E667E000000000000606060786070606860606060
      4058405840544050405440544050202400000000606060786070606860604669
      BD7F7172605440504054405440502024000000006079C17DA17DA07DFF7F987F
      80756071F176FF7F4065406D2061A03C0000C055EE7F877F227FC56EF33D5C63
      FF67FF6FBE679846B331667E00000000000000006064807C6078607060686060
      FF7FDE7F405840544050405C40482024000000006064807C6078B37A80686064
      B376FF7F717240544054405440502024000000006079047EE27DA17D987FFF7F
      987FF176FF7F987F406940692061A03C0000C055F37FD47FD67F34425C67FF77
      FF67FF67FF63BF57373A000000000000000000006064E27CA07C60786070606C
      FF7FFF7F405C40584054405440502024000000006064E27CA07CFF7F2E7A6068
      466DFF7FF57640584054405840482024000000006079687E037EC17DC17D987F
      FF7FFF7F987F8075406D60712061C03C0000C055B47BA36A4062F039FF6BFF67
      FF67FF6BDF5F1E431D4BB33500000000000000006064667DC17C807CFF7FFF7F
      FF7FFF7FFF7FFF7F405C405840502024000000006064667DC17CFF7FFF7F2E7A
      BD7FFF7F7176606040584058405020240000000060798B7E257EC17DC17D117F
      FF7FFF7F987F8079607560714065C0400000C055C66A877F227F1142FF6FFF67
      FF67FF6B3E4BBD365E53B33500000000000000006064A97DE37C807CFF7FFF7F
      FF7FFF7FFF7FFF7F6060606040502028000000006064A97DE37CA97DFF7FFF7F
      FF7FFF7FBD7FE3686060405C40542028000000006079AD7E267EE27D127FFF7F
      987F987FFF7F987F807960754069E0480000C055EE7F877F227FEF3DDE67FF67
      FF637E4FFD429F53FB4AB33500000000000000006064EB7D047DA17C807C6078
      FF7FFF7F6070606C6064606440582034000000006064EB7D047DA17C257D0C7E
      8879387FFF7FBD7FE368606440582034000000006079CE7E477E047EDD7F997F
      E27DC17D997FFF7F807DA07D607100510000C055EE7F877F227F4856B846DF5B
      1E43FE3ADF6BDE77B3350000000000000000000060640C7E457DE27CC17C807C
      FF7FFF7F607460706070606C405C203C0000000060640C7E457DE27CC17C807C
      607CA07CBD7FFF7FBD7F606C405C203C000000006079F07E8A7E257E047EE37D
      E27DE27DC17D807DA07DA07D607500550000C055EE7F877F227F247F2E4E573E
      1D4B5E53D952B335B3350000000000000000000060644E7E887DE37CE27CA17C
      A07C807C807C607860746070606440400000000060644E7E887DE37CE27CA17C
      A07C807C037DBD7F387F607060644040000000006079117FEF7EAC7E8A7E687E
      467E047EE27DC17DA07DA17D807D20610000C055EF7FCD7FCA7FEB7FEF7FD15A
      EE41AD354D29000000000000000000000000000060646F7E2E7ECA7D887D667D
      257DE27C807C607C60746078606C40500000000060646F7E2E7ECA7D887D667D
      247DE37C807C807C60786078606C4050000000006079AC7E117F117FF07ECE7E
      8B7E467E037EC17DC17DC17D807D40690000C055FF7FFE7FF87FF47FF37FF37F
      F27FCA7F804900000000000000000000000000006064CB7D6F7E707E4E7E0C7E
      A97D257DC17C807C607C607C60704050000000006064CB7D6F7E707E4E7E0C7E
      A97D257DC17C607C607C607C606C4050000000000000A07DE37D037EE37DE27D
      C17D807D807D807D60796079406D000000000000E055FD7FFB7FF67FF37FF27F
      EF7FA14D0000000000000000000000000000000000006074A17CC17CA17CA07C
      807C6074606C606860646068405800000000000000006074A17CC17CA17CA07C
      807C6074606C606860646064405C000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C055C055C055C055C055
      C055000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00E03F800100000000800F800000000000
      00078000000000000007800100000000000F800300000000800F800100000000
      800F800100000000800F800100000000800F8001000000008003800300000000
      800380030000000080078003000000008003800300000000FFE1800700000000
      FFF3800F00000000FFFF801F00000000FFFFFFFFFFFFE01F0000C003C0038007
      0000C003800100030000C003800100030000C003800100070000C0038001800F
      0000C0038001800F0000C0038001800F0000C0038001800FFE0FC0038001800F
      FF07C0038001800FFF83C00380018001FF01C00380018001FF80C0038001FFC1
      FFC0C007C003FFC1FFE1C00FFFFFFFC1F81FFFC3C3FFFFFFE007C0018007800F
      C003800100010007800180000000000780018000000000070000C00000000007
      0000C0008001000700008001C001000100000003E001800000000001E001E000
      00000000E001E00080010000E001E00080018000E001E000C003C001E001E000
      E007E301E001F001F81FFF87E001FFFFFFFFFBFFF800C001E07FF03F00008001
      C03FE01F000080018003C00F000080018003C00F000080018003C00F00008001
      8003C00F00008001801FC00700008001801FC00300008001801FC00700008001
      801FC00300008003801FC001000F8003801FC00F000F8003801FC00F000F8003
      C03FE01F001FC007E07FF03F003FF83FFFFFFFFFFF87FC03C003C003C087C003
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
  inherited dbMain: TUniQuery
    SQL.Strings = (
      'SELECT               '
      '   0 AS CHECK_TF     ,'
      '   USER_ID'#9#9#9#9#9' , '
      '   USER_NM           ,'
      '   USER_NICK_NM      ,'
      '   USER_PWD          ,'
      '   USER_GRADE        ,'
      '   PART_CD           ,'
      '   PART_NM           ,'
      '   USER_BANK         ,'
      '   USER_BANK_ACNT    ,'
      '   USER_BANK_ACNT_NM ,'
      '   PARTNER_ID        ,'
      '   PARTNER_NM        ,'
      '   PARTNER_NICK_NM   ,'
      '   REG_DT            ,'
      '   SERVER_IP         ,'
      '   BIRTH_DT          ,'
      '   UPDATE_MNG_ID     ,'
      '   UPDATE_DT         ,'
      '   UPDATE_TM         ,'
      '   UPDATE_IP         ,'
      '   USER_ADDR         ,'
      '   USER_EMAIL        ,'
      '   USER_TEL          ,'
      '   USER_HP           ,'
      '   USER_BIGO         ,'
      
        '   CASE WHEN (SELECT COUNT(1) FROM CNTR WHERE USER_ID = A.USER_I' +
        'D) > 0 THEN (SELECT CURR_TRADE_DT FROM CORP_MST) ELSE (SELECT MA' +
        'X(CNTR_DT) FROM CNTR_HIS WHERE USER_ID = A.USER_ID) END LASTCNTR' +
        'DT ,'
      
        '   (SELECT MAX(LOGIN_DT) FROM LOGIN_HIS WHERE USER_ID = A.USER_I' +
        'D AND LOGIN_TP = '#39'I'#39' AND APP_TP = '#39'C'#39') AS LOGIN_DT'
      ' FROM                 '
      '   USER_MST A')
    FetchRows = 50
    SpecificOptions.Strings = (
      'SQL Server.FetchAll=False')
    AfterInsert = dbMainAfterInsert
    BeforeEdit = dbMainBeforeEdit
    AfterEdit = dbMainAfterEdit
    BeforePost = dbMainBeforePost
    BeforeDelete = dbMainBeforeDelete
    object dbMainCHECK_TF: TIntegerField
      FieldName = 'CHECK_TF'
      ReadOnly = True
      Required = True
    end
    object dbMainUSER_ID: TStringField
      FieldName = 'USER_ID'
      Required = True
    end
    object dbMainUSER_NM: TStringField
      FieldName = 'USER_NM'
    end
    object dbMainUSER_NICK_NM: TStringField
      FieldName = 'USER_NICK_NM'
    end
    object dbMainUSER_PWD: TStringField
      FieldName = 'USER_PWD'
      Size = 15
    end
    object dbMainUSER_GRADE: TStringField
      FieldName = 'USER_GRADE'
      FixedChar = True
      Size = 1
    end
    object dbMainPART_CD: TStringField
      FieldName = 'PART_CD'
      FixedChar = True
      Size = 2
    end
    object dbMainPART_NM: TStringField
      FieldName = 'PART_NM'
    end
    object dbMainUSER_BANK: TStringField
      FieldName = 'USER_BANK'
    end
    object dbMainUSER_BANK_ACNT: TStringField
      FieldName = 'USER_BANK_ACNT'
    end
    object dbMainUSER_BANK_ACNT_NM: TStringField
      FieldName = 'USER_BANK_ACNT_NM'
    end
    object dbMainPARTNER_ID: TStringField
      FieldName = 'PARTNER_ID'
    end
    object dbMainPARTNER_NM: TStringField
      FieldName = 'PARTNER_NM'
    end
    object dbMainPARTNER_NICK_NM: TStringField
      FieldName = 'PARTNER_NICK_NM'
    end
    object dbMainREG_DT: TDateTimeField
      FieldName = 'REG_DT'
    end
    object dbMainSERVER_IP: TStringField
      FieldName = 'SERVER_IP'
      Size = 15
    end
    object dbMainBIRTH_DT: TStringField
      FieldName = 'BIRTH_DT'
      Size = 13
    end
    object dbMainUPDATE_MNG_ID: TStringField
      FieldName = 'UPDATE_MNG_ID'
    end
    object dbMainUPDATE_DT: TStringField
      FieldName = 'UPDATE_DT'
      FixedChar = True
      Size = 8
    end
    object dbMainUPDATE_TM: TStringField
      FieldName = 'UPDATE_TM'
      FixedChar = True
      Size = 12
    end
    object dbMainUPDATE_IP: TStringField
      FieldName = 'UPDATE_IP'
      Size = 15
    end
    object dbMainUSER_ADDR: TStringField
      FieldName = 'USER_ADDR'
      Size = 100
    end
    object dbMainUSER_EMAIL: TStringField
      FieldName = 'USER_EMAIL'
      Size = 50
    end
    object dbMainUSER_TEL: TStringField
      FieldName = 'USER_TEL'
    end
    object dbMainUSER_HP: TStringField
      FieldName = 'USER_HP'
    end
    object dbMainUSER_BIGO: TStringField
      FieldName = 'USER_BIGO'
      Size = 100
    end
    object dbMainLOGIN_DT: TStringField
      FieldName = 'LOGIN_DT'
      Size = 8
    end
    object dbMainLASTCNTRDT: TStringField
      FieldName = 'LASTCNTRDT'
      ReadOnly = True
      FixedChar = True
      Size = 8
    end
  end
  inherited dbPart: TUniQuery
    Left = 161
  end
  object dbAcnt: TUniQuery
    Connection = MastDB.UniConnection
    SQL.Strings = (
      'SELECT '
      'ACNT_NO          ,'
      'ACNT_TP          ,'
      'USER_ID          ,'
      'USER_NM          ,'
      'ACNT_PWD         ,'
      'GUJA_CNT         ,'
      'NEGO_GUJA_MAXCNT ,'
      'API_TP           ,'
      'BF_ACNT_AMT      ,'
      'ACNT_AMT         ,'
      'CLR_PL           ,'
      'CLR_PL_F         ,'
      'CMSN             ,'
      'CMSN_F           ,'
      'ACNT_STATE       ,'
      'CONN_YN          ,'
      'NEGO_DUP_YN      ,'
      'FIRST_DT         ,'
      'LOGIN_DT         ,'
      'LOGIN_TM         ,'
      'LOGIN_IP         ,'
      'ACNT_BIGO        ,'
      'LOSSCUT_YN       ,'
      'OVERNGT_YN       ,'
      'MINAMT_GUJA      ,'
      '(ACNT_AMT + CLR_PL - CMSN) AS PLAMT '
      'FROM ACNT_MST')
    BeforeDelete = dbAcntBeforeDelete
    Left = 208
    Top = 440
    object dbAcntACNT_NO: TStringField
      FieldName = 'ACNT_NO'
      Required = True
      FixedChar = True
      Size = 11
    end
    object dbAcntACNT_TP: TStringField
      FieldName = 'ACNT_TP'
      Required = True
      FixedChar = True
      Size = 1
    end
    object dbAcntUSER_ID: TStringField
      FieldName = 'USER_ID'
      Required = True
    end
    object dbAcntUSER_NM: TStringField
      FieldName = 'USER_NM'
      Required = True
    end
    object dbAcntACNT_PWD: TStringField
      FieldName = 'ACNT_PWD'
    end
    object dbAcntGUJA_CNT: TIntegerField
      FieldName = 'GUJA_CNT'
    end
    object dbAcntNEGO_GUJA_MAXCNT: TIntegerField
      FieldName = 'NEGO_GUJA_MAXCNT'
    end
    object dbAcntAPI_TP: TStringField
      FieldName = 'API_TP'
      FixedChar = True
      Size = 1
    end
    object dbAcntBF_ACNT_AMT: TFloatField
      FieldName = 'BF_ACNT_AMT'
    end
    object dbAcntACNT_AMT: TFloatField
      FieldName = 'ACNT_AMT'
      Required = True
    end
    object dbAcntCLR_PL: TFloatField
      FieldName = 'CLR_PL'
    end
    object dbAcntCLR_PL_F: TFloatField
      FieldName = 'CLR_PL_F'
    end
    object dbAcntCMSN: TFloatField
      FieldName = 'CMSN'
    end
    object dbAcntCMSN_F: TFloatField
      FieldName = 'CMSN_F'
    end
    object dbAcntACNT_STATE: TStringField
      FieldName = 'ACNT_STATE'
      FixedChar = True
      Size = 1
    end
    object dbAcntCONN_YN: TStringField
      FieldName = 'CONN_YN'
      FixedChar = True
      Size = 1
    end
    object dbAcntNEGO_DUP_YN: TStringField
      FieldName = 'NEGO_DUP_YN'
      FixedChar = True
      Size = 1
    end
    object dbAcntFIRST_DT: TStringField
      FieldName = 'FIRST_DT'
      FixedChar = True
      Size = 8
    end
    object dbAcntLOGIN_DT: TStringField
      FieldName = 'LOGIN_DT'
      FixedChar = True
      Size = 8
    end
    object dbAcntLOGIN_TM: TStringField
      FieldName = 'LOGIN_TM'
      FixedChar = True
      Size = 12
    end
    object dbAcntLOGIN_IP: TStringField
      FieldName = 'LOGIN_IP'
      Size = 15
    end
    object dbAcntACNT_BIGO: TStringField
      FieldName = 'ACNT_BIGO'
      Size = 200
    end
    object dbAcntLOSSCUT_YN: TStringField
      FieldName = 'LOSSCUT_YN'
      Size = 1
    end
    object dbAcntOVERNGT_YN: TStringField
      FieldName = 'OVERNGT_YN'
      FixedChar = True
      Size = 1
    end
    object dbAcntPLAMT: TFloatField
      FieldName = 'PLAMT'
      ReadOnly = True
    end
    object dbAcntMINAMT_GUJA: TFloatField
      FieldName = 'MINAMT_GUJA'
    end
  end
  object dsAcnt: TDataSource
    DataSet = dbAcnt
    Left = 248
    Top = 440
  end
  object dbMemo: TUniQuery
    Connection = MastDB.UniConnection
    SQL.Strings = (
      'SELECT * FROM USER_MEMO')
    FetchRows = 50
    SpecificOptions.Strings = (
      'SQL Server.FetchAll=False')
    BeforePost = dbMemoBeforePost
    Left = 296
    Top = 440
    object dbMemoUM_SEQ: TIntegerField
      FieldName = 'UM_SEQ'
      ReadOnly = True
      Required = True
    end
    object dbMemoUSER_ID: TStringField
      FieldName = 'USER_ID'
      FixedChar = True
    end
    object dbMemoUM_DT: TDateTimeField
      FieldName = 'UM_DT'
    end
    object dbMemoPART_NM: TStringField
      FieldName = 'PART_NM'
    end
    object dbMemoUM_TITLE: TStringField
      FieldName = 'UM_TITLE'
      Size = 50
    end
    object dbMemoUM_BIGO: TStringField
      FieldName = 'UM_BIGO'
      Size = 200
    end
  end
  object dsMemo: TDataSource
    DataSet = dbMemo
    Left = 336
    Top = 440
  end
  object dbLogin: TUniQuery
    Connection = MastDB.UniConnection
    SQL.Strings = (
      'SELECT '
      '      USER_ID,'
      '      LOGIN_DT,'
      '      LOGIN_TM,'
      '      LOGIN_IP,'
      '      ACNT_TP,'
      '      LOGIN_TP,'
      '      LOGIN_MAC,'
      '      APP_TP,'
      '      HTS_VER,'
      '      COUNT(1) OVER() AS TOTCNT'
      'FROM LOGIN_HIS')
    FetchRows = 50
    SpecificOptions.Strings = (
      'SQL Server.FetchAll=False')
    Left = 272
    Top = 392
    object dbLoginUSER_ID: TStringField
      FieldName = 'USER_ID'
      Required = True
    end
    object dbLoginLOGIN_DT: TStringField
      FieldName = 'LOGIN_DT'
      Required = True
      FixedChar = True
      Size = 8
    end
    object dbLoginLOGIN_TM: TStringField
      FieldName = 'LOGIN_TM'
      Required = True
      FixedChar = True
      Size = 12
    end
    object dbLoginLOGIN_IP: TStringField
      FieldName = 'LOGIN_IP'
      Required = True
      Size = 15
    end
    object dbLoginACNT_TP: TStringField
      FieldName = 'ACNT_TP'
      FixedChar = True
      Size = 1
    end
    object dbLoginLOGIN_TP: TStringField
      FieldName = 'LOGIN_TP'
      FixedChar = True
      Size = 1
    end
    object dbLoginLOGIN_MAC: TStringField
      FieldName = 'LOGIN_MAC'
      Size = 15
    end
    object dbLoginAPP_TP: TStringField
      FieldName = 'APP_TP'
      FixedChar = True
      Size = 1
    end
    object dbLoginHTS_VER: TStringField
      FieldName = 'HTS_VER'
      Size = 10
    end
    object dbLoginTOTCNT: TIntegerField
      FieldName = 'TOTCNT'
      ReadOnly = True
    end
  end
  object dsLogin: TDataSource
    DataSet = dbLogin
    Left = 328
    Top = 392
  end
  object tmOpen: TTimer
    Enabled = False
    Interval = 500
    OnTimer = tmOpenTimer
    Left = 208
    Top = 400
  end
end
