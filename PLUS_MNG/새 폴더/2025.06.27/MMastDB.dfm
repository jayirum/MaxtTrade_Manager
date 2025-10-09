object MastDB: TMastDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 272
  Width = 475
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
    Left = 48
    Top = 132
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
    Left = 48
    Top = 188
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
    Left = 156
    Top = 136
  end
  object ADOConn: TADOConnection
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=opsapwd20231205!!!;Persist Security' +
      ' Info=True;User ID=maxsa;Initial Catalog=GTRADENEW;Data Source=1' +
      '10.4.89.203,6100'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'SQLOLEDB.1'
    AfterDisconnect = ADOConnAfterDisconnect
    Left = 276
    Top = 40
  end
  object dbSQL: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'select * from HT_USER_MASTER')
    Left = 276
    Top = 104
  end
  object ADOSP: TADOStoredProc
    Connection = ADOConn
    Parameters = <>
    Left = 276
    Top = 168
  end
  object dbExec: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'select * from HT_USER_MASTER')
    Left = 340
    Top = 104
  end
  object dbPower: TADOQuery
    Connection = ADOConn
    Parameters = <>
    SQL.Strings = (
      'select * from HT_USER_MASTER')
    Left = 396
    Top = 104
  end
end
