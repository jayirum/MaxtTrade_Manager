object MastDB: TMastDB
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 583
  Width = 772
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
    Top = 348
  end
  object UniConnection: TUniConnection
    ProviderName = 'SQL Server'
    Port = 6100
    Database = 'GTRADE'
    SpecificOptions.Strings = (
      'SQL Server.ConnectionTimeout=3'
      'SQL Server.LockTimeout=1000'
      'Access.ConnectionTimeout=3')
    Username = 'sa'
    Server = '222.234.2.164'
    ConnectDialog = UniConnectDialog
    LoginPrompt = False
    AfterDisconnect = UniConnectionAfterDisconnect
    Left = 48
    Top = 136
    EncryptedPassword = '98FFD2FF8BFF8DFF9EFF9BFF9AFFCFFFC6FFCFFFCDFFDEFFDEFFBFFFBFFF'
  end
  object SQLServerUniProvider: TSQLServerUniProvider
    Left = 48
    Top = 184
  end
  object dbSQL: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      'select * from HT_USER_MASTER')
    Left = 128
    Top = 184
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
    Top = 404
  end
  object UniConnectDialog: TUniConnectDialog
    DatabaseLabel = 'Database'
    PortLabel = 'Port'
    ProviderLabel = 'Provider'
    Caption = 'GTS DataBase '#50672#44208
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = #50672#44208
    CancelButton = #52712#49548
    LabelSet = lsCustom
    Left = 48
    Top = 80
  end
  object iwNotiClient: TipwIPPort
    RemoteHost = '192.168.0.10'
    RemotePort = 8200
    OnConnected = iwNotiClientConnected
    OnDataIn = iwNotiClientDataIn
    OnDisconnected = iwNotiClientDisconnected
    OnError = iwNotiClientError
    Left = 48
    Top = 24
  end
  object uniSp: TUniStoredProc
    Connection = UniConnection
    Left = 48
    Top = 256
  end
  object dbExec: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      'select * from HT_USER_MASTER')
    Left = 128
    Top = 248
  end
  object dbPower: TUniQuery
    Connection = UniConnection
    SQL.Strings = (
      'select * from HT_USER_MASTER')
    Left = 664
    Top = 24
  end
  object tmPolling: TThreadedTimer
    Interval = 60000
    OnTimer = tmPollingTimer
    Left = 176
    Top = 336
  end
end
