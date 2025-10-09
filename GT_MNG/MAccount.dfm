inherited fmAccount: TfmAccount
  Caption = #44228#51340#44288#47532
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited pnTop: TRzPanel
    inherited btnFilter: TbsSkinSpeedButton
      Tag = 1070
    end
    inherited btnInsert: TbsSkinSpeedButton
      Tag = 1010
    end
    inherited btnEdit: TbsSkinSpeedButton
      Tag = 1020
    end
    inherited btnDelete: TbsSkinSpeedButton
      Tag = 1030
    end
    inherited btnExcel: TbsSkinSpeedButton
      OnClick = btnExcelClick
    end
    inherited nvMain: TRzDBNavigator
      Hints.Strings = ()
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
      FrameController = MastDB.RzFrameController
      ImeName = 'Microsoft IME 2010'
      TabOrder = 1
      OnKeyDown = edFindKeyDown
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
        Top = 6
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
        Items.Strings = (
          #51204#52404
          #51456#54924#50896
          #51221#54924#50896
          #53580#49828#53552
          #54028#53944#45320)
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
  object RzPanel4: TRzPanel [4]
    Left = 442
    Top = 60
    Width = 495
    Height = 471
    Align = alRight
    BorderOuter = fsFlat
    BorderHighlight = clWhite
    BorderShadow = 12303291
    Color = 15790320
    FlatColor = clGray
    FlatColorAdjustment = 0
    FrameController = MastDB.PanelRzFrameController
    TabOrder = 4
    object pgMain: TbsSkinPageControl
      Left = 1
      Top = 1
      Width = 493
      Height = 469
      ActivePage = bsSkinTabSheet2
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBtnText
      Font.Height = 13
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = imgBtn
      ParentFont = False
      TabOrder = 0
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
      SkinDataName = 'tab'
      object bsSkinTabSheet1: TbsSkinTabSheet
        Caption = #54924#50896#44288#47532
        object bsSkinSpeedButton2: TbsSkinSpeedButton
          Tag = 1070
          Left = 415
          Top = 110
          Width = 73
          Height = 19
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
          Top = 31
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
          Top = 57
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
          Top = 57
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
          Top = 83
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
          Top = 84
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
        object edUserID: TkcRzDBEdit
          Left = 90
          Top = 31
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'USERID'
          ReadOnly = True
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          TabOrder = 7
          OnChange = edUserIDChange
          EnterToTab = True
        end
        object edUser_Nm: TkcRzDBEdit
          Left = 338
          Top = 31
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'USER_NM'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          TabOrder = 8
          EnterToTab = True
        end
        object cbUser_Grade: TkcRzDBComboBox
          Left = 90
          Top = 57
          Width = 150
          Height = 21
          DataField = 'USER_GRADE'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 9
          EnterToTab = True
        end
        object cbUserPart: TkcRzDBComboBox
          Left = 338
          Top = 57
          Width = 150
          Height = 21
          DataField = 'PART_CODE'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 10
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
          Top = 84
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'REG_NO'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          TabOrder = 11
          EnterToTab = True
        end
        object edReg_Dt: TkcRzDBDateTimeEdit
          Left = 338
          Top = 84
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'REG_DT'
          ReadOnly = True
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          TabOrder = 12
          EditType = etDate
          EnterToTab = True
        end
        object bsSkinLabel8: TbsSkinLabel
          Left = 6
          Top = 109
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
          Caption = #51217#49549#49436#48260
          AutoSize = False
        end
        object cbServerIP: TkcRzDBComboBox
          Left = 90
          Top = 109
          Width = 150
          Height = 21
          DataField = 'FRONT_IP'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 14
          EnterToTab = True
        end
        object bsSkinLabel9: TbsSkinLabel
          Left = 254
          Top = 110
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
          Caption = #48708#48128#48264#54840
          AutoSize = False
        end
        object edPass: TkcRzDBEdit
          Left = 338
          Top = 110
          Width = 74
          Height = 21
          DataSource = dsMain
          DataField = 'CONN_PWD'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          PasswordChar = #7
          TabOrder = 16
          EnterToTab = True
        end
        object bsSkinLabel10: TbsSkinLabel
          Left = 6
          Top = 136
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
          Caption = #54028#53944#45320'ID'
          AutoSize = False
        end
        object edPartnerId: TkcRzDBEdit
          Left = 90
          Top = 136
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'PARTNER_ID'
          ReadOnly = True
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 18
          EnterToTab = True
        end
        object bsSkinLabel11: TbsSkinLabel
          Left = 254
          Top = 136
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
          Caption = #54028#53944#45320#45769#45348#51076
          AutoSize = False
        end
        object edPartnerNick: TkcRzDBEdit
          Left = 338
          Top = 136
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'PARTNER_NICK_NM'
          ReadOnly = True
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 20
          EnterToTab = True
        end
        object bsSkinLabel12: TbsSkinLabel
          Left = 6
          Top = 162
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 21
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
          Top = 188
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 22
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
        object bsSkinLabel14: TbsSkinLabel
          Left = 6
          Top = 214
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 23
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
          Caption = #49345#49464#51452#49548
          AutoSize = False
        end
        object bsSkinLabel15: TbsSkinLabel
          Left = 254
          Top = 162
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 24
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
        object edTelNo: TkcRzDBEdit
          Left = 90
          Top = 162
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'TEL_NO'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 25
          EnterToTab = True
        end
        object edHpNo: TkcRzDBEdit
          Left = 338
          Top = 162
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'HP_NO'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 26
          EnterToTab = True
        end
        object edAddr1: TkcRzDBEdit
          Left = 90
          Top = 188
          Width = 315
          Height = 21
          DataSource = dsMain
          DataField = 'ADDR_1'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 27
          EnterToTab = True
        end
        object edAddr2: TkcRzDBEdit
          Left = 90
          Top = 214
          Width = 315
          Height = 21
          DataSource = dsMain
          DataField = 'ADDR_2'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 28
          EnterToTab = True
        end
        object bsSkinLabel16: TbsSkinLabel
          Left = 6
          Top = 240
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 29
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
        object edEmail: TkcRzDBEdit
          Left = 90
          Top = 240
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'EMAIL'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 30
          EnterToTab = True
        end
        object bsSkinLabel17: TbsSkinLabel
          Left = 254
          Top = 240
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 31
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
        object edUserBank: TkcRzDBEdit
          Left = 338
          Top = 240
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'USER_BANK'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 32
          EnterToTab = True
        end
        object bsSkinLabel18: TbsSkinLabel
          Left = 6
          Top = 266
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 33
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
        object edUserAcnt: TkcRzDBEdit
          Left = 90
          Top = 266
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'USER_BANK_ACNT'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 34
          EnterToTab = True
        end
        object bsSkinLabel19: TbsSkinLabel
          Left = 254
          Top = 266
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 35
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
          Caption = #44228#51340#47749
          AutoSize = False
        end
        object edAcntNm: TkcRzDBEdit
          Left = 338
          Top = 266
          Width = 150
          Height = 21
          DataSource = dsMain
          DataField = 'USER_BANK_ACNT_NM'
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          TabOrder = 36
          EnterToTab = True
        end
        object bsSkinLabel20: TbsSkinLabel
          Left = 6
          Top = 292
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 37
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
          Caption = 'EMAIL '#49688#49888
          AutoSize = False
        end
        object cbEmailYn: TkcRzDBComboBox
          Left = 90
          Top = 292
          Width = 150
          Height = 21
          DataField = 'EMAIL_YN'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 38
          Items.Strings = (
            'Y'
            'N')
          EnterToTab = True
        end
        object bsSkinLabel21: TbsSkinLabel
          Left = 254
          Top = 292
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 39
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
          Caption = 'SMS '#49688#49888
          AutoSize = False
        end
        object cbSmsYn: TkcRzDBComboBox
          Left = 338
          Top = 292
          Width = 150
          Height = 21
          DataField = 'SMS_YN'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft Office IME 2007'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 40
          Items.Strings = (
            'Y'
            'N')
          EnterToTab = True
        end
        object RzPanel2: TRzPanel
          Tag = 999
          Left = 6
          Top = 384
          Width = 482
          Height = 65
          BorderOuter = fsFlat
          TabOrder = 41
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
            Caption = #52572#51333#49688#51221
            AutoSize = False
          end
          object edMngid: TkcRzDBEdit
            Left = 90
            Top = 31
            Width = 146
            Height = 21
            DataSource = dsMain
            DataField = 'MNG_ID'
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft Office IME 2007'
            TabOrder = 1
            EnterToTab = True
          end
          object RzPanel3: TRzPanel
            Left = 3
            Top = 4
            Width = 476
            Height = 21
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
            TabOrder = 2
          end
          object bsSkinLabel23: TbsSkinLabel
            Left = 242
            Top = 31
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
            Caption = #48708#48128#48264#54840
            AutoSize = False
          end
          object edPassM: TkcRzDBEdit
            Left = 325
            Top = 31
            Width = 150
            Height = 21
            DataSource = dsMain
            DataField = 'CONN_PWD'
            FrameController = MastDB.RzFrameController
            ImeName = 'Microsoft IME 2010'
            TabOrder = 4
            EnterToTab = True
          end
        end
        object bsSkinLabel24: TbsSkinLabel
          Left = 6
          Top = 318
          Width = 80
          Height = 20
          HintImageIndex = 0
          TabOrder = 42
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
          Caption = #44228#51340#49345#53468
          AutoSize = False
        end
        object cbAcntStat: TkcRzDBComboBox
          Left = 90
          Top = 318
          Width = 150
          Height = 21
          DataField = 'ACNT_STAT'
          DataSource = dsMain
          Style = csDropDownList
          Ctl3D = False
          FrameController = MastDB.RzFrameController
          ImeName = 'Microsoft IME 2010'
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 43
          Values.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          EnterToTab = True
        end
      end
      object bsSkinTabSheet2: TbsSkinTabSheet
        Caption = #44228#51340#44288#47532
        object RzPanel8: TRzPanel
          Left = 0
          Top = 130
          Width = 491
          Height = 319
          Align = alClient
          BorderOuter = fsNone
          Color = 16579836
          TabOrder = 0
          ExplicitLeft = 4
          ExplicitTop = 126
        end
        object DBGridEh1: TDBGridEh
          Left = 0
          Top = 0
          Width = 491
          Height = 130
          TabStop = False
          Align = alTop
          DataSource = DataSource1
          DynProps = <>
          FixedColor = 15790320
          ImeName = 'Microsoft IME 2010'
          IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
          RowDetailPanel.Color = clBtnFace
          RowHeight = 21
          TabOrder = 1
          TitleParams.Color = clBtnFace
          TitleParams.RowHeight = 21
          TitleParams.FillStyle = cfstGradientEh
          Columns = <
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ACNT_NO'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #44228#51340#48264#54840
              Title.Color = 15790320
              Width = 129
            end
            item
              DynProps = <>
              EditButtons = <>
              FieldName = 'ACNT_TP'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #44228#51340#53440#51077
              Title.Color = 15790320
              Width = 189
            end
            item
              Alignment = taCenter
              DynProps = <>
              EditButtons = <>
              FieldName = 'USERID'
              Footers = <>
              Title.Alignment = taCenter
              Title.Caption = #54924#50896#49457#47749
              Title.Color = 15790320
              Width = 100
            end>
          object RowDetailData: TRowDetailPanelControlEh
          end
        end
      end
    end
  end
  object gdMain: TDBGridEh [5]
    Left = 131
    Top = 60
    Width = 311
    Height = 471
    TabStop = False
    Align = alClient
    DataSource = dsMain
    DynProps = <>
    FixedColor = 15790320
    ImeName = 'Microsoft IME 2010'
    IndicatorOptions = [gioShowRowIndicatorEh, gioShowRecNoEh]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
    RowDetailPanel.Color = clBtnFace
    RowHeight = 21
    TabOrder = 5
    TitleParams.Color = clBtnFace
    TitleParams.RowHeight = 21
    TitleParams.FillStyle = cfstGradientEh
    Columns = <
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'USERID'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54924#50896'ID'
        Title.Color = 15790320
        Width = 129
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'USER_NM'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54924#50896#47749
        Title.Color = 15790320
        Width = 189
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
        Title.Color = 15790320
        Width = 100
      end
      item
        Alignment = taCenter
        DynProps = <>
        EditButtons = <>
        FieldName = 'PART_CODE'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #54924#50896#48516#47448
        Title.Color = 15790320
        Width = 100
      end
      item
        DynProps = <>
        EditButtons = <>
        FieldName = 'REG_NO'
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #49892#47749#48264#54840
        Title.Color = 15790320
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
        Title.Color = 15790320
        Width = 100
      end>
    object RowDetailData: TRowDetailPanelControlEh
    end
  end
  inherited imgBtn: TImageList
    Bitmap = {
      494C01010B003400480010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
  inherited dbMain: TUniQuery
    AfterInsert = dbMainAfterInsert
    BeforePost = dbMainBeforePost
  end
  inherited dbPart: TUniQuery
    Left = 161
  end
  object dbAcnt: TUniQuery
    Connection = MastDB.UniConnection
    Left = 240
    Top = 336
  end
  object DataSource1: TDataSource
    DataSet = dbAcnt
    Left = 264
    Top = 376
  end
end
