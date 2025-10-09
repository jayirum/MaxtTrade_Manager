inherited fmUser: TfmUser
  Tag = 2000
  Caption = #54924#50896#44288#47532
  OnShow = FormShow
  ExplicitWidth = 953
  ExplicitHeight = 591
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
          Left = 329
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
          ExplicitLeft = 330
        end
      end
    end
  end
  inherited imgBtn: TImageList
    Bitmap = {
      494C01011600A401D00110001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      000000000000000000000000000000000000000000000000000000000000087B
      1000107B1800107B1800107B1000087B100000730800006B0000000000000000
      00000000000000000000000000000000000000000000B58C8400B58C8400B58C
      8400B58C8400B58C8400B58C8400B58C8400B58C8400B58C8400B58C8400B58C
      8400B58C840021189C001021BD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001084210031B54A0039BD
      5A0031BD520029B54A0021AD39001094210010841800007B100000730000006B
      00000000000000000000000000000000000000000000B58C8400FFEFCE00FFE7
      C600FFDEBD00FFDEAD00D6A57B00EFB58400FFD69C00FFD69C00FFD69C00FFD6
      9C004A429C001831CE00396BFF000821CE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000188C210052E77B004AE77B0042CE
      6B0042B55A00429C42005284390073946B0073735A005A6B4200316B2100086B
      0800006B000000000000000000000000000000000000B58C8400FFEFD600FFE7
      C600FFE7BD00BD9C8C00635A7300738CA5009C8C8400D6A57B00F7CE9400A584
      9C002939CE00396BFF00104AFF000018D6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000219C31006BEF940084B58C009C94
      4A00AD4A2100AD4A0000AD4A2100DEC6CE00845A5A00A56B7B00AD7384005A5A
      4200006B000000000000000000000000000000000000B58C8400FFF7DE00A56B
      5A00A56B5A008C9494006BA5BD0073D6F70084EFF700526BA500211894002139
      CE003963FF001831DE000010D600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000219C310052945200EFCEE700EF9C
      4A00AD4A2100AD4A2100BD6B3900DECEDE00845A5A009C7B8400BD8494006B5A
      4A000000000000000000000000000000000000000000B58C8400FFF7E700FFEF
      DE00FFE7CE00A59C9C0073ADBD0084ADAD0094FFFF00214AC6001831CE00396B
      FF00214ADE0042397B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063634A00EFDEE700DEC6
      AD00CEAD9400CEAD9C00CEADA500DEC6B500845A5A009C737300AD8C94007B5A
      5A000000000000000000000000000000000000000000B58C8400FFFFEF00A56B
      5A00A56B5A00AD8C8400526B8C006B94AD007B9C9C004A5A94002942DE000839
      FF001863EF0042A5F70063424A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00E7CEAD00C6AD
      9400D6B58400DEB57300C6945200E79C2900845A5A00AD5A18009C5A3100845A
      5A000000000000000000000000000000000000000000B58C8400FFFFFF00FFFF
      F700FFFFEF00DEB5AD008C7B7B0073A5B5007BC6CE007BC6CE004A84C6003142
      A500426BB5003994EF00525A7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00FFEFBD00D6B5
      8400EFCE7B00E7BD6300CE944200EFAD3900845A5A00D66B0800BD520000845A
      5A000000000000000000000000000000000000000000B58C8400DEEFDE0073AD
      6B007BAD7300B5CEA500E7DEBD00E7C6AD00CEA59C009C949400739CAD00529C
      CE003973BD00426BAD005A4A6300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00E7DECE00D6BD
      AD00DEC6AD00D6BD9C00CEA58C00DEB58C00845A5A009C735200A5734A00845A
      5A000000000000000000000000000000000000000000C6AD9C00529C5200A5CE
      A500BDDEBD00B5CEB5009CBD940084AD7B00A5BD8400DECE9C00EFC6A500CEA5
      94008C8C940052638C005A313900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00EFDEB500D6B5
      8C00E7BD8400DEB56B00C6945200E7A53900845A5A001863AD001863AD001863
      AD001863AD001863AD00000000000000000000000000848C5A007BB58400A5E7
      A500089C080052BD5A00A5DEA500CEE7CE00ADCEAD007BAD73007BA55A00FFE7
      BD00FFD6AD00A56B5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00F7EFCE00D6BD
      9C00EFCE9C00E7BD7B00CE9C5A00EFAD4200845A5A001863AD0063D6FF005AC6
      FF00297BBD001863AD00000000000000000000000000B5A584005A9C5A00CEEF
      CE006BC66B00109C100000940000089C080052BD5200B5E7B5006BAD73007BA5
      5A00FFDEBD00A56B5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00F7EFEF00F7EF
      F700F7EFEF00EFEFEF00EFDEDE00FFE7DE007394BD001863AD0063CEFF0052BD
      FF001863AD0000000000000000000000000000000000E7B59C00A5CEA5006BA5
      6B00B5CEB500CEE7CE00A5DEA50063C66300089C080042B54200ADC6AD005A94
      4A00F7D6BD00A56B5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000845A5A00845A5A00845A
      5A00845A5A00845A5A00845A5A00845A5A00526B94001863AD001863AD00319C
      FF0031A5FF001863AD00000000000000000000000000E7B59C00FFFFFF00E7EF
      E700B5D6B50094BD94008CBD8C009CC69C00BDDEBD00BDB5A500DE9C5A00DE9C
      5A00DE9C5A00DE9C5A0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      AD00319CFF002984DE001863AD000000000000000000E7B59C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFF7EF00BDD6BD0084B5840094947300DE9C5A00FFBD
      6300DE9C4A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00001863AD001863AD00000000000000000000000000E7B59C00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DE9C5A00DE9C
      5A00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7B59C00E7B59C00E7B5
      9C00E7B59C00E7B59C00E7B59C00E7B59C00E7B59C00E7B59C00DE9C5A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000005A
      0800005A08000063080000630800005A0000004A0000004A0000004A00000000
      000000000000000000000000000000000000A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B73009C6B52009C6B52009C6B52009C6B52009C6B5200A57B
      7300A57B7300A57B7300A57B7300A57B73000000000000000000A57B7300A57B
      7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B73009C6B630000000000000000000000000000000000087B1000087B
      100008731000006B080000630800006308000063080000630800006308000063
      08000063080000520800000000000000000000000000005A08001894290021AD
      390021AD3900189C3100109429000884180000730800006B0800005A00000052
      0000004A0000000000000000000000000000A57B7300FFFFFF00FFFFFF00FFFF
      F700F7DEC600DEC69C00D6BD9C00DEBD9C00DEBD9C00E7CEAD00F7DEC600FFE7
      D600FFFFFF00FFFFFF00FFFFFF00A57B73000000000000000000A57B7300FFE7
      C600FFE7BD00FFE7BD00FFE7B500FFDEAD00FFDEAD00FFDEA500FFDEA500FFDE
      9C00FFD69C009C6B6300000000000000000000000000109C290018B5390010AD
      310010AD210008AD180008A5180008A5100008A5100008A5100008A5100008A5
      100008AD1800008C10000052080000000000086B080031CE520039E7630029CE
      520021B54A00219C310029732100397331005263420063393900215218000052
      0000004A0000004A00000000000000000000AD7B7300FFFFFF00A57B7300A57B
      7300004A6300ADBDB500F7D6B500F7D6B500F7D6B500FFD6B500FFD6AD00EFBD
      9400BD8C7300D6A58400D69C8400A57B73000000000000000000AD7B7300FFEF
      CE00FFEFC600FFE7C600FFE7BD00FFE7B500A57B7300A57B7300A57B7300A57B
      7300FFDEA5009C6B630000000000000000000000000018AD390021C6520018C6
      420010BD390008BD290008BD2100FFFFFF0029C6390000B5080000B5180008B5
      180008BD180008AD10000063080000000000108418004AF77B004AA563006B84
      4200845A10009429000094290000BD8C8C00BD94A500633939009C5A6B006339
      3900104A0800005200000000000000000000B5847B00FFFFFF00FFFFFF00FFFF
      FF00108CB50000B5E700108CB500D6CEC600E7BDAD00DEBDA500E7BDA500F7CE
      AD00B58C7B00B58C7B00B58C7B00A57B73000000000000000000B5847B00FFEF
      D600FFEFCE00FFEFCE00FFE7C600FFE7BD00FFE7BD00FFE7B500FFDEAD00FFDE
      AD00FFDEA5009C6B630000000000000000000000000021B5420031C6630029BD
      520031C65A00B5EFBD00B5F7C600DEFFE700B5EFBD005ACE630000B5100008B5
      180008B5180008A51000006B0800000000001084180031843900DEB5D600E78C
      4A009429000094290000A5310000BD949400B59CA500633939009C6B7B006339
      390008420000000000000000000000000000C6948400FFFFFF00A57B7300A57B
      7300108CB50000CEFF00735A31009C310000A57B7300A57B7300A57B7300FFDE
      B500FFDEAD00FFD6A500FFD69C00A57B73000000000000000000B5847B00FFF7
      DE00A57B7300FFEFD600A57B7300FFE7C600A57B7300FFE7BD00A57B7300FFE7
      B500FFDEAD009C6B630000000000000000000000000021B54A0039CE730031C6
      630063D68400FFFFFF0042C66300CEEFD6008CDE9C00FFFFFF005ACE6B0008B5
      180008BD180008A51000006308000000000000000000314A2100E7C6DE00DEBD
      9C00CE8C5A00B5846B00BD8C7B00CEB5B500B5949C00633939009C7B8C006339
      390000000000000000000000000000000000CE9C8400C6F7CE00C6F7BD00BDCE
      FF0063A5FF00B54A0000FFA52900EF7B00009C310000FFEFD600FFEFD600FFE7
      CE00FFE7C600FFDEBD00FFDEB500A57B73000000000000000000BD8C7B00FFF7
      E700FFF7DE00FFEFDE00FFEFD600FFEFCE00FFEFCE00FFE7C600FFE7BD00FFE7
      B500FFE7B5009C6B630000000000000000000000000021B54A005AD68C0042CE
      7B0063D68C0094DEAD0008B53900C6EFD6006BD68400FFFFFF009CE7A50008B5
      180008B5180008A5100000630800000000000000000063393900CEB59C00BDA5
      9400BD9C8400CEA57300B5845200CE8C3100AD6B210063393900944A21006339
      390000000000000000000000000000000000D6A58C00BDEFC6004A7BFF004A7B
      FF004A7BFF00B54A0000FFC68400FFB54200E77B00009C310000FFF7F700FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00A57B73000000000000000000C6948400FFF7
      EF00A57B7300A57B7300A57B7300A57B7300A57B7300FFEFCE00FFEFC600FFE7
      BD00FFE7BD009C6B630000000000000000000000000021B54A0073DE9C0052CE
      840039C6730039C66B0063CE8400DEFFE700F7FFF700FFFFFF008CDE9C0010B5
      290008BD210008A51800006B0800000000000000000063393900EFD69400CEA5
      6B00DEAD5200EFB54A00B5732900E7941800BD73180063393900BD3900006339
      390000000000000000000000000000000000DEAD8C00DEA58400DEA58400DEA5
      8400DEA58400DEA58400B54A0000FFC68400FFB53900B5731800004A6300DEA5
      8400DEA58400DEA58400DEA58400DEA584000000000000000000C6948400FFFF
      F700FFFFEF00FFF7EF00FFF7E700FFF7DE00FFEFDE00FFEFD600FFEFCE00FFEF
      C600FFE7C6009C6B630000000000000000000000000021B54A008CDEAD005AD6
      8C004ACE7B00BDF7D600FFFFFF00FFFFFF00FFFFFF00ADE7BD0039C65A0018BD
      390010BD310008AD2100006B0800000000000000000063393900E7D6B500CEB5
      9400D6B58C00DEB57B00B58C6300D69C6300AD7B520063393900C65A10006339
      3900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000B54A0000BD9C7300429CAD00B58421009C31
      0000000000000000000000000000000000000000000000000000CE9C8400FFFF
      FF00A57B7300A57B7300A57B7300A57B7300A57B7300FFF7DE00FFEFD600FFEF
      D600FFEFCE009C6B630000000000000000000000000021B54A0094E7B50063D6
      8C006BD69400FFFFFF00E7FFEF00EFFFF70063D68C0031C6630021BD4A0018BD
      420018BD390010AD2900087B1000000000000000000063393900D6B59C00CEAD
      9400CEA58400CEA57300B58C5A00C6945200A57342006339390008429C006339
      3900000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000004A6300A5AD8C00FFB53100EF7B
      00009C3100000000000000000000000000000000000000000000D6A58C00FFFF
      FF00FFFFFF00FFFFF700FFFFF700FFFFEF00FFF7EF00FFF7E700FFF7DE00FFE7
      C600F7DEBD009C6B630000000000000000000000000021B54A009CE7BD006BD6
      940073D69C00FFFFFF0094E7B500CEF7DE0052CE8400C6F7D6005AD68C0021BD
      520021C64A0018B5390008841800000000000000000063393900EFDEA500CEA5
      6B00DEAD5A00E7AD4A00B5732900DE8C1800BD6B100008429C000863D6000842
      9C00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B54A0000FFC68400FFB5
      3900EF8400009C31000000000000000000000000000000000000D6A58C00FFFF
      FF00A57B7300A57B7300A57B7300A57B7300A57B7300FFF7EF00FFF7E700E7D6
      C600C6BDAD009C6B630000000000000000000000000021B54A00ADE7C60084DE
      A5005AD68C00B5F7CE00D6FFE700D6FFE700C6F7DE00E7FFF70063DE940029C6
      630029C65A0021B54A00108C1800000000000000000063393900E7DECE00EFE7
      D600E7D6C600E7D6B500D6B59C00E7BD9400AD947B0008429C00218CFF00106B
      E70008429C0008429C00084A9C00000000000000000000000000000000000000
      000000000000000000000000000000000000AD4A0000AD420000B5521800FFC6
      8400FFB53900EF730000B5390000000000000000000000000000DEAD8C00FFFF
      FF00A57B7300FFFFFF00FFFFFF00FFFFFF00A57B7300FFFFF700B5847300B584
      7300B5847300B584730000000000000000000000000021B54A00ADEFC600A5E7
      BD0084DEA5007BDE9C008CDEAD00FFFFFF00A5EFBD0063D68C0039C6730031C6
      6B0031C66B0021BD5200109C2100000000000000000063393900633939006339
      3900633939006339390063393900633939006339390008429C001884FF00218C
      FF002184DE002173C600105AAD00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B54A0000AD390000B552
      2100FFC68400E77B100052736B002184A5000000000000000000DEAD8C00FFFF
      FF00A57B7300A57B7300A57B7300A57B7300A57B7300FFFFF700B5847300FFD6
      7B00F7B55A00CE947B0000000000000000000000000021B54A0094E7B500ADEF
      C600B5EFCE00ADE7C6009CE7BD0084DEAD006BD694004ACE840039C6730031C6
      730031CE730029BD5A0010A52900000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000852B5002994
      FF004AC6FF0042B5F7001052A500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B54A0000A531
      0000844A31004A84940000BDFF0000A5D6000000000000000000DEAD8C00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5847300F7C6
      8400CE947B00000000000000000000000000000000000000000039BD5A0052C6
      730052C6730052C66B004AC66B0042C6630031BD5A0029BD520021B54A0021B5
      4A0021B54A0018AD390000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000852A5003194
      DE004AC6FF0042B5F700105AAD00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000B54A
      0000A531000000A5D60000A5D600000000000000000000000000DEAD8C00DEA5
      8400DEA58400DEA58400DEA58400DEA58400DEA58400DEA58400B5847300CE94
      7B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000105AA500105A
      AD00105AAD00105AAD00084A9C00000000000000000000000000000000000000
      0000000000006329100063291000632910006329100063291000632910000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000031FF000031
      FF000031FF000031FF00000000000000000000000000000000000008AD000008
      AD000008AD000008AD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000006B29
      100063291000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A00006329
      1000632910000000000000000000000000000000000000000000007300000073
      0000007300000073000000730000007300000052A5000031FF005A7BFF006B8C
      FF004263FF003963FF000031FF0000000000000000000008AD000029EF000839
      FF009CB5FF000021F7000008AD00106B5200188C180010842100087B1000006B
      0000006B000000000000000000000000000000000000AD631800AD631800AD63
      1800AD631800AD631800AD631800AD631800AD631800AD631800AD631800AD63
      180000000000000000000000000000000000000000000000000084310800B542
      0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A0000BD4A
      0000B54A00006329100000000000000000000000000000730000009400000094
      0000009C080008A52100009C0000009C00000052A5006384FF006384FF00DEE7
      FF00ADBDFF00214AFF003963FF00000000000008AD000021EF002952FF00F7F7
      FF00FFFFFF006384FF000029FF000029DE0031B55A0031BD5A0029BD520029AD
      4A00219C3900006B0000006B000000000000AD631800F7A53900F7A53900F7A5
      3900F7A53900F7A53900F7A53900F7A53900F7A53900F7A53900F7A53900F7A5
      3900AD6318000000000000000000000000000000000084310800B5420000BD4A
      0000B5420000B5420000B5420000B5420000BD4A0000BD4A0000BD4A0000BD4A
      0000BD4A0000B54A0000632910000000000000000000007300000094000010AD
      290029CE630018AD21007BD67300008C0800295AD6004A6BFF006B8CFF00DEE7
      FF008CA5FF000831FF00527BFF008C4221000008AD000839FF004A73FF006384
      FF00B5C6FF00FFFFFF000031FF000031FF0029636B005A8C4A006B6B5200526B
      4200318431001894310010842100006B0000AD631800F7BD6B00EFAD5A00EFAD
      5200EFA54A00E7A54200F7A53900846B84000021FF001863EF0029A5FF00529C
      CE00AD63180000000000000000000000000000000000AD420000B5420000B542
      0000B5420000AD420000C66B2900CE7B4200CE7B4200CE733100C65A1000BD4A
      0000BD4A0000BD4A00006B29100000000000000000000073000010AD290039D6
      730021C6520018AD2100D6FFCE0021A54A000031FF006B8CFF008CA5FF00EFF7
      FF006384FF002152FF00426BFF008C4221000008AD00396BFF00184AFF009CB5
      FF00FFFFFF005A7BFF000029FF000029FF004A399400D6B5B500945A6B009C63
      73009C6B6B00735A52002173210000730800AD631800F7B56300EFA55200E7A5
      4A00E7A54200E79C4200EFA531008C6B73000021F7002163D600299CF7005A94
      C600AD63180000000000000000000000000094390000BD4A0000B54A0000B54A
      0000B54A0000B54A0000E7B58C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D684
      3900BD4A0000BD4A0000BD4A00006329100000000000000000000073000031DE
      6B0018AD2100D6F7D600CEFFBD0021C64A00F76B4A000031FF006B8CFF007394
      FF006B8CFF004A7BFF004239BD008C4221000008AD005273EF007394FF00FFFF
      FF00A5B5FF002152FF000031FF000029F7007B4A5A00D6BDBD00945A6B009C6B
      7300AD848C00AD7384002963210000730000AD631800F7B56300EFA55200E7A5
      4A00E7A54200E79C4200EFA53100EFA54200C68C5A00D69C5A00C6A56B00E7B5
      7300AD6B210000000000000000000000000094390000BD520800BD520800BD52
      0800B5520800B5520800B5520800B5520800B5520800B5520800DEA57300FFFF
      FF00BD4A0000BD4A0000BD4A00006B2910000000000000000000106329000852
      1800315273004263B5004A8C9C0063AD4A005A739C00FF8C63000031FF000031
      FF000031FF000031FF00EF7342008C422100000000000008AD00B5C6FF00CEDE
      FF00FFFFFF00E7EFFF000842FF001821B500B56B3900D6C6CE00945A6B009C73
      7B00AD848C00A57B8400525A390000000000AD631800DE944A00C6843100C684
      3100C6843100C67B2900C67B2900C67B2900DE9C4200E79C5200F7AD6300F7BD
      7B00B563210000000000000000000000000094390000C66B1800C6631800BD63
      1800BD631800BD631800E7BD9400B5520800B54A0000AD420000B54A0800FFFF
      FF00BD4A0000BD4A0000BD4A00006B2910000000000000000000000000000008
      21000839A5000839A5000031AD00394AA500F7846300AD6B5A009C949400739C
      AD00739CA500AD846B00C64A21000000000000000000000000000008AD009CB5
      FF00C6D6FF004A73FF00314ADE00AD94A500CEAD9C00C6ADAD00945A6B009C6B
      7B00AD8C9400A5848C008C525A0000000000AD631800E7A55200DE944200DE94
      3900DE943900D6943900D6943900DE943900DE9C4200E79C5200F7BD7300FFC6
      8C009C63210042842900428429000000000094390800D68C4A00CE7B3100C673
      2900C6732900E7C69C00FFFFFF00BD631000B5520800B54A0000CE844200FFFF
      FF00BD4A0000BD4A0000BD4A00006B2910000000000000000000000000001042
      9400185ACE001852BD001852BD00084AC6006363A5001884E700087BDE00107B
      D6000873CE00188CAD0000000000000000000000000000000000000000006B6B
      B5006B6BBD008C7B9400D6A56300C68C5200C68C4200E79C2100945A6B00AD5A
      2100A55218009C5231008C525A000000000000000000AD631800AD631800AD63
      1800AD631800AD631800AD631800AD631800AD631800AD631800AD631800AD63
      180063A54A00637321004AFF94004284290094390000DEA56B00DE9C6300CE84
      3900F7D6BD00FFFFFF00FFFFFF00F7EFDE00EFDEC600EFD6BD00FFFFFF00DEA5
      7300BD4A0000BD4A0000BD4A00006B2910000000000000000000000818002163
      CE00216BDE00216BD600216BD6002163D600186BDE003194FF00319CFF00319C
      FF003194FF002984F700188CAD00000000000000000000000000000000008C52
      5A00EFCE8C00DEBD7300FFD67B00D6A55A00CE9C4200E7AD3100945A6B00C66B
      1800BD5A0000B54A00008C525A00000000000000000000000000000000006373
      21004AC66B0042C6630042BD630039BD5A0039BD5A0039B5520039B5520031AD
      4A00109C310042E784004AFF94004284290094390000E79C6300EFC6A500DE9C
      5A00F7DEBD00FFFFFF00FFFFFF00F7DEC600E7BD9400E7B58C00D6844200B54A
      0000BD4A0000BD4A0000BD4A0000632910000000000000000000000008002173
      CE00298CFF002984EF002984EF002984EF00318CF70042ADFF0042ADFF0042A5
      FF0039A5FF00319CFF00298CF700188CAD000000000000000000000000008C52
      5A00DECEAD00D6B59400EFCEA500D6B58C00CEA57B00DEB57300945A6B00BD73
      3900BD6B2900B56B21008C525A00000000000000000000000000000000004284
      290042DE7B0039DE730039D6730031D66B0031D66B0031CE6B0031CE6B0031D6
      6B0010841800108C210031C6630042842900000000009C421000EFCEAD00F7CE
      AD00E7AD7300EFCEAD00FFFFFF00CE732900C66B1800BD5A1000BD520000BD4A
      0000BD4A0000BD4A00006B291000000000000000000000000000000000001039
      63003194E7003194F700319CFF00298CE7003184CE0042A5EF0042A5EF004AB5
      FF0042ADFF0039A5FF00319CFF00188CAD000000000000000000000000008C52
      5A00C6AD9C00BD9C8C00CEAD8C00BD9C8400BD947B00C69C7300945A6B009463
      5A009C634A00945A4A008C525A00000000000000000000000000000000004A84
      290042CE630039DE730039D6730031D66B0031D66B0031CE6B0031CE6B0031DE
      730039DE7B00189C310029B54A00428429000000000094390000E7A56B00F7E7
      CE00F7D6BD00E7AD7300EFC69C00CE732900C66B1800C65A1000C65A0800BD4A
      0000BD4A0000B54A000063291000000000000000000000000000848484000000
      000000102100082131000829420000102100106B9C0000527300005273004ABD
      FF004AB5FF0042ADFF0039A5FF00188CAD000000000000000000000000008C52
      5A00E7C69400D6B57B00F7CE7300D6A55200CE944200E7A52900945A6B00BD63
      1800B55A0000AD4A00008C525A00000000000000000000000000000000004A84
      290042CE6300429C420042A5420042A5420042A54200399C4200429C420039D6
      730042DE73004AE784005AFF9C0042842900000000000000000094390000E7A5
      6B00F7D6BD00F7DEC600EFC69C00E7A57300DE945200D68C4200CE732900C652
      0000B54A00007329080000000000000000000000000000000000000000008484
      8400848484000000000000000000184252006BADCE00005A84003194CE0052BD
      FF0052BDFF004AB5FF00188CAD00000000000000000000000000000000008C52
      5A00D6BDA500CEAD8C00DEBD9400C69C6B00BD8C5200D69C4200945A6B00BD63
      2900B55A1000AD5A21008C525A00000000000000000000000000000000004A84
      290042DE7B0039D66B0039CE6B0031CE6B0031CE630031CE630031CE6B0039D6
      730042DE73004AE7840063FFA500428429000000000000000000000000009439
      00009C4A1000E7AD7300EFBD9400EFBD8C00E7AD7300DE8C4A00C66310009C42
      08006B2910000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002184B5006BADCE00217BAD00085A
      8400085A840000528400188CAD00000000000000000000000000000000008C52
      5A00FFFFFF00FFFFFF00FFF7F700F7F7F700F7EFEF00F7EFEF00945A6B00A58C
      9400B5B5B500B5ADAD008C525A00000000000000000000000000000000000000
      0000428429004284290042842900428429004284290042842900428429004284
      2900428429004284290042842900000000000000000000000000000000000000
      0000000000009C3900009C4208009C4208009C4208009C420800843108000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003994BD002984AD00106B
      9400005284000000000000000000000000000000000000000000000000008C52
      5A008C525A008C525A008C525A008C525A008C525A008C525A008C525A008C52
      5A008C525A008C525A008C525A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000B531000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000006B0000006B0000006B0000006B0000006B0000006B0000006B
      0000006B0000006B0000006B0000006B0000000000000000000000639C000063
      9C0000639C00A57B7300A57B7300A57B7300A57B7300A57B7300A57B7300A57B
      7300A57B7300A57B73008C5A5A00000000000000000000000000000000000063
      9400006394000063940000639400006394000063940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000639400314A5200B5310000314242000063940000639400000000000000
      00000000000000000000000000000000000094635A00A56B6B00A56B6B00A56B
      6B00A56B6B00006B0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006B00000000000000639C0039BDE70031BD
      E70031B5DE00B5848400FFEFDE00FFF7E700FFF7E700F7EFDE00F7EFDE00F7EF
      DE00F7EFDE00FFEFDE008C5A5A000000000000000000000000000073AD0031CE
      EF0010CEFF0021CEFF0052DEFF0073E7FF0029A5D60000639400000000000000
      0000000000000000000000000000000000000000000000000000000000000073
      AD0031CEEF0010CEFF0073422900B53100007B73630029A5D600006394000000
      0000000000000000000000000000000000009C6B6300FFE7C600F7D6AD00F7CE
      9C00EFCE9400006B0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006B00000000000000639C0042C6E70039C6
      E70039BDE700B5848400F7E7DE00E7AD5A00E7A55A00E7A55A00E7A55A00E7A5
      5A00E7A55A00F7E7D6008C5A5A0000000000000000000073AD0073FFFF0039E7
      FF0010CEFF0018C6F70000008400000084000000840000008400000084000000
      84000000840000008400000000000000000000000000000000000073AD0073FF
      FF0039E7FF0010CEFF0029ADCE0084391800AD420000526363000084C6000063
      9400000000000000000000000000000000009C6B6300FFE7CE00F7D6B500F7D6
      AD00EFCE9C00006B0000FFFFFF007BBD7B00006B000018841800FFFFFF006BB5
      6B00006B00004AA54A00FFFFFF00006B00000000000000639C004ACEEF0042C6
      E70042C6E700BD848400FFEFDE00FFE7CE00FFDEBD00FFDEBD00FFDEBD00FFDE
      BD00F7DEC600F7E7D6008C5A5A0000000000000000000073AD0073FFFF0039E7
      FF0010CEFF0018C6F700000084002152FF001042FF000029FF000021FF000010
      F7000008E70000008400000000000000000000000000000000000073AD0073FF
      FF0039E7FF0010CEFF0021CEFF0063847B0094421800B5310000394242000063
      940000000000000000000000000000000000A56B6300FFEFD600F7DEC600F7D6
      B500F7D6AD00006B0000FFFFFF00FFFFFF00B5DEB500006B0000087B0800006B
      00006BB56B00FFFFFF00FFFFFF00006B00000000000000639C0052CEEF0052CE
      EF004AC6EF00BD848400FFEFE700E7AD5A00E7A55A00E7A55A00E7A55A00E7A5
      5200E7A55A00F7E7D6008C5A5A0000000000000000000073AD0073FFFF0039E7
      FF0010CEFF0018C6F70000008400295AFF00184AFF000831FF000021FF000018
      FF000010EF0000008400000000000000000000000000000000000073AD0073FF
      FF0039E7FF0010CEFF0021CEFF0052DEF700844A3100BD633100A52900002942
      4A0000000000000000000000000000000000A5736300FFF7E700F7E7CE00F7DE
      BD00F7D6B500006B0000FFFFFF00FFFFFF00FFFFFF004AA54A00006B00000873
      0800FFFFFF00FFFFFF00FFFFFF00006B00000000000000639C005AD6F7005ACE
      EF0052CEEF00C68C8400FFEFEF00FFEFDE00FFE7D600FFE7CE00FFE7CE00FFE7
      CE00F7E7D600F7EFDE008C5A5A0000000000000000000073AD009CFFFF00A5F7
      FF00B5F7FF00DEF7FF0000008400000084000000840000008400000084000000
      84000000840000008400000000000000000000000000000000000073AD009CFF
      FF00A5F7FF00B5F7FF00DEFFFF00E7FFFF00C6C6BD0094421800E7B57B00A529
      000000000000000000000000000000000000AD7B6B00FFFFEF00F7E7D600F7E7
      CE00F7DEBD00006B0000FFFFFF00FFFFFF005AAD5A00006B00004AA54A00006B
      0000218C2100EFF7EF00FFFFFF00006B00000000000000639C0063D6F70063D6
      F7005AD6EF00C6948400FFF7F700E7AD5A00E7A55200E7A55200E7A55200E7A5
      5200E7A55A00F7EFE7008C5A5A0000000000000000000073AD00A5EFF70018AD
      D6000094C6000084BD00108CBD001894BD00107BAD007BC6DE00006394000000
      00000000000000000000000000000000000000000000000000000073AD00A5EF
      F70018ADD6000094C600008CBD00B5420000B5420000AD420000CE8C5A00FFE7
      A500A5290000000000000000000000000000B57B6B00FFFFFF00FFEFE700F7E7
      D600F7E7CE00006B0000FFFFFF00429C4200006B000063AD6300FFFFFF00BDDE
      BD00006B0000218C2100FFFFFF00006B00000000000000639C006BDEF70063DE
      F70063D6F700CE948C00FFF7F700FFF7F700FFF7E700FFEFE700FFEFE700FFEF
      E700FFF7E700EFE7DE008C5A5A0000000000000000000073AD0031B5D60039E7
      FF0010CEFF0021CEFF0052DEFF0073E7FF0031B5DE00006BA500006B9C000000
      00000000000000000000000000000000000000000000000000000073AD0031B5
      D60039E7FF0010CEFF0021CEFF00B5420000BD734200FFD69400EFB57B00AD29
      0000A5290000A52900000000000000000000BD846B00FFFFFF00FFF7EF00FFEF
      E700FFEFD600006B0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006B00000000000000639C0073DEFF006BDE
      F7006BDEF700CE9C8C00FFFFF700FFFFFF00FFFFFF00FFFFFF00FFFFFF00B584
      7300B5847300B5847300B584730000000000000000000073AD0073FFFF0039E7
      FF0010CEFF0021CEFF0052DEFF0073E7FF0031B5DE000084C600006394000000
      00000000000000000000000000000000000000000000000000000073AD0073FF
      FF0039E7FF0010CEFF0021CEFF0052DEFF00B5420000BD6B3100F7B56B00DE8C
      4200A5290000000000000000000000000000BD847300FFFFFF00FFFFFF00FFF7
      EF00FFEFE700006B0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00006B00000000000000639C007BE7FF0073E7
      FF0073DEF700D69C8C00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B584
      7300E7AD7300F7945A00FF00FF0000000000000000000073AD0073FFFF0039E7
      FF0010CEFF0021CEFF0052DEFF0073E7FF0031B5DE000084C600006394000000
      00000000000000000000000000000000000000000000000000000073AD0073FF
      FF0039E7FF0010CEFF0021CEFF0052DEFF0073E7FF00B5420000B5521000DE73
      1800C65A0800AD2900000000000000000000C68C7300FFFFFF00FFFFFF00FFFF
      FF00FFF7EF00006B0000006B0000006B0000006B0000006B0000006B0000006B
      0000006B0000006B0000006B0000006B00000000000000639C007BE7FF007BE7
      FF0073E7FF00D69C8C00DEAD8400DEAD8400DEAD8400DEAD8400DEAD8400B584
      7300C6AD8C0000639C000000000000000000000000000073AD0073FFFF0039E7
      FF0010CEFF0021CEFF0052DEFF0073E7FF0031B5DE000084C600006394000000
      00000000000000000000000000000000000000000000000000000073AD0073FF
      FF0039E7FF0010CEFF0021CEFF0052DEFF0073E7FF0031B5DE00B5420000B542
      0000B5420000A5290000A529000000000000CE947300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFF7EF00FFEFDE00FFE7D600FFEFD600E7D6BD00B5AD9C00A56B
      6B00000000000000000000000000000000000000000000639C0084EFFF0084E7
      FF007BE7FF007BE7FF007BE7FF0073DEFF006BDEF70063D6F7005AD6EF0052CE
      EF0052CEEF0000639C000000000000000000000000000073AD007BFFFF006BF7
      FF0052F7FF005AFFFF007BFFFF008CFFFF004ACEF700008CC600006394000000
      00000000000000000000000000000000000000000000000000000073AD007BFF
      FF006BF7FF0052F7FF005AFFFF007BFFFF008CFFFF004ACEF700008CC6000063
      940000000000000000000000000000000000CE947300FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFF7EF00FFEFE700A56B6B00A56B6B00A56B6B00A56B
      6B00000000000000000000000000000000000000000000639C0084EFFF0084EF
      FF007373730073737300737373007373730073737300737373007373730063D6
      F7005ACEEF0000639C000000000000000000000000000073AD00FFFFFF00F7FF
      FF00C6FFFF00A5FFFF009CFFFF009CFFFF0094FFFF0052F7FF00006394000000
      00000000000000000000000000000000000000000000000000000073AD00FFFF
      FF00F7FFFF00C6FFFF00A5FFFF009CFFFF009CFFFF0094FFFF0052F7FF000063
      940000000000000000000000000000000000D6947B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00F7EFE700A56B6B00E7A55A00EF9C3900BD73
      4A00000000000000000000000000000000000000000000639C0084EFFF0084EF
      FF0073737300CEC6BD00CEC6BD00CEC6BD00CEC6BD00CEBDB500737373006BDE
      F70063D6F70000639C0000000000000000000000000000000000007BAD00EFFF
      FF00DEFFFF00B5FFFF009CFFFF008CFFFF0084FFFF00086B9C00000000000000
      000000000000000000000000000000000000000000000000000000000000007B
      AD00EFFFFF00DEFFFF00B5FFFF009CFFFF008CFFFF0084FFFF00086B9C000000
      000000000000000000000000000000000000D69C7B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A56B6B00E7A55A00C6845A000000
      000000000000000000000000000000000000000000000000000000639C000063
      9C0073737300E7DED600FFFFFF00FFFFF700FFFFF700D6C6BD00737373000063
      9C0000639C000000000000000000000000000000000000000000000000000073
      AD000073AD000073AD000073AD000073AD000073AD0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000073AD000073AD000073AD000073AD000073AD000073AD00000000000000
      000000000000000000000000000000000000D6946B00D6946B00D6946B00D694
      6B00D6946B00D6946B00D6946B00D6946B00A56B6B00BD7B6B00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007373730073737300737373007373730073737300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000005A0000005A0000005A
      0000005A00000000000000000000000000000000000000000000000000000000
      0000000000000000000084180000841800008418000084180000841800008418
      000084180000841800000000000000000000000000000000000000086B000008
      6B0000085A000008520000084A0000084A0000084A0000084A0000084A000008
      4A0000084A000008420000000000000000000000000000000000003994000039
      94000031840000317B0000297B0000297B0000297B0000297B0000297B000029
      7B0000297B0000296B0000000000000000000000000000000000006394000063
      94000063940000639400006394000063940000000000005A0000089410000094
      0800005A00000000000000000000000000000000000000000000006394000063
      9400006394000063940084180000FFFFFF00FFFFFF00FFFFFF00738CFF00A5B5
      FF00FFFFFF0084180000000000000000000000000000001094000010BD000010
      B5000010AD000010A5000010A50000109400001094000010A500001094000010
      94000010A50000087B00000842000000000000000000004AC600005AE7000052
      D6000052D600004AC600004AC600004AC600004AC600004AC600004AC600004A
      C600004AC6000042A50000296B0000000000000000000073AD0031CEEF0010CE
      FF0021CEFF0052DEFF0073E7FF0029A5D60000639400005A0000089C1800089C
      1000005A0000000000000000000000000000000000000073AD0031CEEF0010CE
      FF0021CEFF0052DEFF0084180000FFFFFF00FFFFFF006384FF000018FF00395A
      FF00FFFFFF00841800000000000000000000000000000010BD000018E7000018
      D6000018CE000018C6000010B5000010B5000010AD000010AD000010B5000010
      AD000010B5000010A50000084A0000000000000000000052DE00006BFF000063
      FF00005AEF00005AEF00005AE7000052D6000052D6000052D6000052D6000052
      DE000052DE00004AC60000317B00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052D6F700005A0000005A0000005A0000005A000010A5210008A5
      1800005A0000005A0000005A0000005A00000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0084180000CED6FF00294AFF000018FF00294AFF000021
      FF00CED6FF00841800000000000000000000000000000018C6000018F7000018
      E7000018D6000018C6000018C6000010B5000010B5000010AD000010A5000010
      AD000010AD000010A50000084A000000000000000000005AEF00006BFF00006B
      FF000063FF00005AEF000063E700C6DEFF001873DE000052D600004ACE00004A
      CE000052DE00004AC60000317B00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052D6F700005A000021C6420021C6420018B5310018B5310010AD
      210010A5210008A51800089C1000005A00000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0084180000395AFF000829FF00ADBDFF00EFEFFF000829
      FF00395AFF00841800000000000000000000000000000018CE000021FF000018
      F7000018E7000018D6000018CE000018C6000010B5000010B5000010AD000010
      A5000010BD000010940000084A000000000000000000005AF7001073FF00086B
      FF00006BFF00006BFF00C6DEFF00FFFFFF0073B5F7000052D6000052D600004A
      CE000052D600004AC60000297B00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEF700005A000029D6520021CE4A0021C6420018BD390018B5
      310010B5290010AD210010A52100005A00000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0084180000DEE7FF00CED6FF00FFFFFF00FFFFFF008494
      FF000018FF004A1839000000000000000000000000000018CE001039FF000029
      FF000018F7000018E7000018D6000018CE000018CE000010BD000010B5000010
      AD000010AD000010A50000084A000000000000000000005AF7002184FF00107B
      FF001073FF00C6E7FF00FFFFFF00FFFFFF00D6EFFF00005AE7000052D6000052
      D6000052D600004AC60000297B00000000000073AD009CFFFF00A5F7FF00B5F7
      FF00DEFFFF00E7F7FF00005A0000005A0000005A0000005A000021CE4A0021C6
      4200005A0000005A0000005A0000005A00000073AD009CFFFF00A5F7FF00B5F7
      FF00DEFFFF00E7FFFF0084180000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00395AFF000018FF000000000000000000000000000018CE00315AFF000831
      FF000021FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000010
      BD000010B5000010A50000084A000000000000000000005AF700429CFF001884
      FF00DEEFFF00FFFFFF00C6E7FF00429CFF00FFFFFF002984F700005AEF000052
      DE000052DE00004AC60000317B00000000000073AD00A5EFF70018ADD6000094
      C600008CBD00108CBD001894BD00107BAD007BC6DE00005A000029D6520029CE
      5200005A00000000000000000000000000000073AD00A5EFF70018ADD6000094
      C600008CBD00108CBD0084180000841800008418000084180000841800008418
      0000731800001018BD000018FF0000000000000000000018CE004A6BFF001839
      FF000021FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000018
      C6000018C60000109C0000085A000000000000000000005AF7005AA5FF00298C
      FF005AA5FF0094C6FF000873FF00006BFF009CCEFF008CC6FF00005AEF00005A
      E700005AE700004ACE0000318400000000000073AD0031B5D60039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE00006BA500005A000031DE630031DE
      5A00005A00000000000000000000000000000073AD0031B5D60039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE00006BA500006B9C00000000000000
      000000000000000000000018FF000018FF00000000000018CE005A7BFF002142
      FF000829FF000021FF000018F7000018EF000018EF000018E7000018D6000018
      CE000018CE000010B50000086B000000000000000000005AF7006BADFF00318C
      FF00187BFF000873FF00006BFF00006BFF00187BFF00D6EFFF00006BFF000063
      FF00005AF7000052D60000399400000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE000084C600005A0000005A0000005A
      0000005A00000000000000000000000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE000084C60000639400000000000000
      00000000000000000000000000000018FF00000000000018CE006384FF002952
      FF001039FF000831FF000021FF000018FF000018F7000018F7000018EF000018
      DE000018DE000010BD0000087B000000000000000000005AF70073B5FF003994
      FF002184FF001884FF00107BFF000873FF00086BFF004A9CFF005AA5FF00006B
      FF00006BFF00005AE7000042A500000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE000084C60000639400000000000000
      0000000000000000000000000000000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE000084C60000639400000000000000
      000000000000000000000000000000000000000000000018CE007394FF004263
      FF001839FF001039FF000829FF000029FF000021FF000021FF000018EF000018
      EF000018E7000018C600001084000000000000000000005AF70084BDFF0052A5
      FF00298CFF002184FF00187BFF00107BFF001073FF000873FF006BB5FF00006B
      FF00006BFF00005AEF000042AD00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE000084C60000639400000000000000
      0000000000000000000000000000000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073E7FF0031B5DE000084C60000639400000000000000
      000000000000000000000000000000000000000000000018CE007B9CFF00738C
      FF005273FF004263FF00315AFF00294AFF001039FF000021FF000018FF000018
      EF000018EF000018DE00001094000000000000000000005AF7008CC6FF007BBD
      FF0063ADFF0052A5FF004A9CFF00318CFF002184FF001073FF00086BFF00006B
      FF00086BFF00006BFF00004AC600000000000073AD007BFFFF006BF7FF0052F7
      FF005AFFFF007BFFFF008CFFFF004ACEF700008CC60000639400000000000000
      0000000000000000000000000000000000000073AD007BFFFF006BF7FF0052F7
      FF005AFFFF007BFFFF008CFFFF004ACEF700008CC60000639400000000000000
      000000000000000000000000000000000000000000000018CE005A73FF007B9C
      FF00849CFF007394FF006384FF004A6BFF00294AFF000831FF000021FF000018
      FF000018EF000018E7000010A5000000000000000000005AF70063ADFF008CC6
      FF0094C6FF0084BDFF0073B5FF005AA5FF003194FF001884FF000873FF000873
      FF00086BFF00006BFF00004ACE00000000000073AD00FFFFFF00F7FFFF00C6FF
      FF00A5FFFF009CFFFF009CFFFF0094FFFF0052F7FF0000639400000000000000
      0000000000000000000000000000000000000073AD00FFFFFF00F7FFFF00C6FF
      FF00A5FFFF009CFFFF009CFFFF0094FFFF0052F7FF0000639400000000000000
      00000000000000000000000000000000000000000000000000000018EF000829
      FF000831FF000829FF000029FF000021FF000018EF000018DE000018D6000018
      CE000018D6000010B50000000000000000000000000000000000006BFF00187B
      FF00187BFF001884FF00107BFF000873FF00006BFF00006BFF00005AF700005A
      F700005AF700005AE700000000000000000000000000007BAD00EFFFFF00DEFF
      FF00B5FFFF009CFFFF008CFFFF0084FFFF00086B9C0000000000000000000000
      00000000000000000000000000000000000000000000007BAD00F7FFFF00DEFF
      FF00B5FFFF009CFFFF008CFFFF0084FFFF00086B9C0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073AD000073
      AD000073AD000073AD000073AD000073AD000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073AD000073
      AD000073AD000073AD000073AD000073AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000052637B0052636B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000003994000039
      94000031840000317B0000297B0000297B0000297B0000297B0000297B000029
      7B0000297B0000296B0000000000000000000000000000000000006394000063
      9400006394000063940000639400006394000000000000000000000000000000
      0000000000005A637B00086BD6004294D600000000000000000000086B000008
      6B0000085A000008520000084A0000084A0000084A0000084A0000084A000008
      4A0000084A00000842000000000000000000000000000000000000086B000008
      6B0000085A000008520000084A0000084A0000084A0000084A0000084A000008
      4A0000084A0000084200000000000000000000000000004AC600005AE7000052
      DE000052D600004AC600004AC600004AC600004AC600004AC600004AC600004A
      C600004AC6000042A50000296B0000000000000000000073AD0031CEEF0010CE
      FF0021CEFF0052DEFF0073E7FF0029A5D6000063940000000000000000000000
      00005A6B7B00106BD60031A5FF00399CF70000000000001094000010BD000010
      B5000010AD000010A5000010A50000109400001094000010A500001094000010
      94000010A50000087B00000842000000000000000000001094000010BD000010
      B5000010AD000010A5000010A50000109400001094000010A500001094000010
      94000010A50000087B000008420000000000000000000052DE00006BFF000063
      FF00005AF700005AEF00005AE7000052D6000052DE000052D6000052DE000052
      DE000052DE00004ACE0000297B00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF0052DEFF0073DEF70031ADDE000084BD000063940000000000736B
      7B001063C600319CFF00399CF70000000000000000000010BD000018E7000018
      D6000018CE000018C6000010B5000010B5000010AD000010AD000010B5000010
      AD000010B5000010A50000084A0000000000000000000010BD000018E7000018
      D6000018CE000018C6000010B5000010B5000010AD000010AD000010B5000010
      AD000010B5000010A50000084A000000000000000000005AF700006BFF00006B
      FF000063F700005AEF00005AE700005AE7000052DE000052D6000052D6000052
      CE000052DE00004AC60000317B00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF005AC6E7009C7B7B00B58C8400B59C8C009C6B630073525200427B
      AD0031A5FF00319CFF000000000000000000000000000018C6000018F7000018
      E7000018D6000018C6000018C6000010B5000010B5000010AD000010A5000010
      AD000010AD000010A50000084A0000000000000000000018C6000018F7000018
      E7000018D6000018C6003152D600EFEFFF008C9CE7000018AD000010A5000010
      AD000010AD000010A50000084A000000000000000000005AF7000873FF00086B
      FF00006BFF00FFFFFF00C6E7FF000063EF00005AE7008CBDEF00FFFFFF000052
      CE000052DE00004AC60000297B00000000000073AD0073FFFF0039E7FF0010CE
      FF0029B5DE009C7B7B00E7D6C600FFFFCE00FFFFDE00F7EFCE00C6A58C009C6B
      6300319CFF00000000000000000000000000000000000018CE000021FF000018
      F7000018E7000018D6000018C600FFFFFF00F7F7FF000010B5000010AD000010
      A5000010BD000010940000084A0000000000000000000018CE000021FF000018
      F7009CADF7000021D6000018CE009CADEF00FFFFFF008C9CE7000010AD000010
      AD000010AD000010A50000084A000000000000000000005AF7002184FF00107B
      FF00086BFF00C6E7FF00FFFFFF00C6E7FF008CBDEF00FFFFFF00C6E7FF000052
      D6000052D600004AC60000297B00000000000073AD009CFFFF00A5F7FF00B5F7
      FF00A58C8400E7D6CE00FFFFEF00FFFFCE00FFFFCE00FFFFC600FFEFAD00BD8C
      730000000000000000000000000000000000000000000018CE001039FF000029
      FF000018F7000018E7000018DE00FFFFFF00FFFFFF000010BD000010B5000010
      AD000010AD000010A50000084A0000000000000000000018CE001039FF000029
      FF00FFFFFF00738CF7000018D6003152DE00FFFFFF00ADBDEF000010B5000010
      AD000010B5000010940000084A000000000000000000005AF700429CFF001884
      FF000873FF000873FF00C6E7FF00FFFFFF00FFFFFF00C6E7FF000063EF000052
      DE00005AE700004AC60000317B00000000000073AD00A5EFF70018ADD6000094
      C600847B7300FFFFD600FFFFCE00FFFFCE00FFFFD600FFF7BD00F7C68400EFC6
      94009C6B6B00000000000000000000000000000000000018CE00315AFF000831
      FF000021FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000010
      BD000010B5000010A50000084A0000000000000000000018CE00315AFF000831
      FF00FFFFFF00FFFFFF00738CF700EFEFFF00FFFFFF008C9CEF000018C6000010
      B5000010B5000010A50000084A000000000000000000005AF7005AA5FF00298C
      FF000873FF000873FF008CC6FF00FFFFFF00FFFFFF00C6E7FF000063F700005A
      EF00005AE7000052CE0000318400000000000073AD0031B5D60039E7FF0010CE
      FF008C848400FFFFDE00FFFFCE00FFFFCE00FFFFD600F7CE9400EFAD6B00F7D6
      A5009C6B6B00000000000000000000000000000000000018CE004A6BFF001839
      FF000021FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000018
      C6000018C6000010A5000008520000000000000000000018CE004A6BFF001839
      FF004A6BFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFEFFF001839D6000018
      C6000010BD000010AD00000852000000000000000000005AF7006BADFF00318C
      FF00107BFF0094C6FF00FFFFFF00C6E7FF00C6E7FF00FFFFFF00C6E7FF000063
      F700005AEF000052D60000399400000000000073AD0073FFFF0039E7FF0010CE
      FF007B7B7B00F7F7CE00FFFFCE00FFFFC600F7DE9C00EFBD8400FFE7A500DEBD
      94009C6B6B00000000000000000000000000000000000018CE005A7BFF002142
      FF000829FF000021FF000018F700FFFFFF00FFFFFF000018E7000018DE000018
      CE000018CE000010B50000086B0000000000000000000018CE005A7BFF002142
      FF000829FF00294AFF006384FF004263F700C6CEFF00FFFFFF00EFEFFF001839
      D6000018CE000010B50000086B000000000000000000005AF70073B5FF003994
      FF002184FF00EFF7FF00CEE7FF00107BFF000873FF00CEE7FF00FFFFFF000063
      FF00006BFF00005AE7000042A500000000000073AD0073FFFF0039E7FF0010CE
      FF004294AD00C6AD8C00FFF7B500F7C68400F7BD7300FFF7D600F7F7EF009C6B
      6B0000000000000000000000000000000000000000000018CE006384FF002952
      FF001039FF000831FF000021FF00FFFFFF00FFFFFF000018EF000018E7000018
      E7000018DE000010BD0000087B0000000000000000000018CE006384FF002952
      FF001039FF000831FF000021FF000018FF000029FF00EFEFFF00FFFFFF00EFEF
      FF000018DE000010BD0000087B000000000000000000005AF70084BDFF0052A5
      FF00298CFF002184FF00187BFF00107BFF00107BFF000873FF000063FF00006B
      FF00006BFF00005AEF000042AD00000000000073AD0073FFFF0039E7FF0010CE
      FF0021CEFF00738C9C00BD947B00EFC69400F7D6A500CEB5A5009C6B6B009C6B
      6B0000000000000000000000000000000000000000000018CE007394FF004263
      FF001839FF001039FF000829FF000029FF000021FF000021FF000018F7000018
      EF000018E7000018CE000010840000000000000000000018CE007394FF004263
      FF001839FF001039FF000829FF000029FF000021FF001842FF00EFEFFF00C6CE
      FF000018E7000018CE00001084000000000000000000005AF7008CC6FF007BBD
      FF0063ADFF0052A5FF00429CFF003194FF002184FF00107BFF000873FF00006B
      FF00086BFF000063FF00004AC600000000000073AD007BFFFF006BF7FF0052F7
      FF005AFFFF007BFFFF008CB5B500737B84006B6B6B006B525200000000000000
      000000000000000000000000000000000000000000000018CE007B9CFF00738C
      FF005273FF004263FF00315AFF00294AFF001039FF000021FF000018FF000018
      EF000018F7000018DE000010A50000000000000000000018CE007B9CFF00738C
      FF005273FF004263FF00315AFF00214AFF001839FF000021FF000021FF000018
      F7000018F7000018DE000010A5000000000000000000005AF70063ADFF008CC6
      FF008CC6FF0084BDFF0073B5FF005AA5FF003194FF001884FF000873FF000873
      FF000873FF000063FF000052D600000000000073AD00FFFFFF00F7FFFF00C6FF
      FF00A5FFFF009CFFFF009CFFFF0094FFFF0052F7FF0000639400000000000000
      000000000000000000000000000000000000000000000018CE005A73FF007B9C
      FF00849CFF007394FF006384FF004A6BFF00294AFF000831FF000021FF000018
      FF000018FF000018E7000010A50000000000000000000018CE005A73FF007B9C
      FF00849CFF007394FF006384FF004A6BFF00294AFF000831FF000018FF000018
      FF000018FF000018DE000010A500000000000000000000000000006BFF00187B
      FF001884FF00187BFF00107BFF000873FF000063FF000063FF000063FF00005A
      F700005AF7000052DE00000000000000000000000000007BAD00EFFFFF00DEFF
      FF00B5FFFF009CFFFF0094FFFF007BFFFF00086B9C0000000000000000000000
      00000000000000000000000000000000000000000000000000000018EF000829
      FF000831FF000829FF000029FF000021FF000018EF000018DE000018D6000018
      CE000018D6000010B500000000000000000000000000000000000018EF000829
      FF000831FF000829FF000029FF000021FF000018EF000018DE000018D6000018
      CE000018CE000010BD0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000073AD000073
      AD000073AD000073AD000073AD000073AD000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
