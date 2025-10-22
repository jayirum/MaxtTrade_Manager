object MastDB: TMastDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 239
  Width = 413
  object RzFrameController: TRzFrameController
    Color = clWhite
    DisabledColor = 15790320
    ReadOnlyColor = 14811135
    FlatButtonColor = 15790320
    FocusColor = 15790335
    FrameColor = clGray
    FrameHotColor = 7838964
    FrameHotTrack = True
    FrameVisible = True
    Left = 52
    Top = 100
  end
  object PanelRzFrameController: TRzFrameController
    Color = 15790320
    DisabledColor = 15790320
    ReadOnlyColor = 14811135
    FlatButtonColor = 15790320
    FocusColor = 15790335
    FrameColor = clGray
    FrameHotColor = 7838964
    FrameHotTrack = True
    FrameVisible = True
    Left = 52
    Top = 156
  end
  object iwNotiClient: TipwIPPort
    EOL = '#10'
    LocalPort = 20200
    RemoteHost = '110.4.89.203'
    RemotePort = 20200
    OnConnected = iwNotiClientConnected
    OnDataIn = iwNotiClientDataIn
    OnDisconnected = iwNotiClientDisconnected
    OnError = iwNotiClientError
    Left = 48
    Top = 24
  end
  object tmPolling: TThreadedTimer
    Interval = 60000
    OnTimer = tmPollingTimer
    Left = 136
    Top = 28
  end
  object ADOConn: TADOConnection
    ConnectionString = 
      #39'Provider=SQLOLEDB.1;Persist Security Info=True;User ID=sa;Passw' +
      'ord=eoqkrsa1029%^&;Initial Catalog=GTRADENEW;Data Source=eclick.' +
      'fxgolf.kr,4600'#39
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    AfterDisconnect = ADOConnAfterDisconnect
    Left = 224
    Top = 24
  end
  object dbSQL: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    Left = 228
    Top = 88
  end
  object ADOSP: TADOStoredProc
    Connection = ADOConn
    Parameters = <>
    Left = 224
    Top = 152
  end
  object dbExec: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    Left = 288
    Top = 88
  end
  object dbPower: TADOQuery
    Connection = ADOConn
    CursorType = ctStatic
    Parameters = <>
    Left = 344
    Top = 88
  end
end
