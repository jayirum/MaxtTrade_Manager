unit MMastDB;

interface

uses
  SysUtils, Classes, Windows, Forms, Messages, DB, MemDS, DBAccess, Uni, UniProvider,
  RzLstBox, bsSkinCtrls, VCL_Helper, DBGridEh,
  SQLServerUniProvider, RzCommon, UniDacVcl, kcRaizeCtrl, ipwcore, ipwipport, PacketStruct, ShellAPI,
  ThdTimer;

type
  TTRThread = class(TThread)
  private
    FFlag: String;                                                              // S: Send R: Receive
    FData: String;
    FResult : String;
  protected
    procedure Execute; override;
  public
    procedure Recv_Packet(sData: String);
  end;

  TMastDB = class(TDataModule)
    RzFrameController: TRzFrameController;
    UniConnection: TUniConnection;
    SQLServerUniProvider: TSQLServerUniProvider;
    dbSQL: TUniQuery;
    PanelRzFrameController: TRzFrameController;
    UniConnectDialog: TUniConnectDialog;
    iwNotiClient: TipwIPPort;
    uniSp: TUniStoredProc;
    dbExec: TUniQuery;
    dbPower: TUniQuery;
    tmPolling: TThreadedTimer;
    procedure DataModuleCreate(Sender: TObject);
    procedure iwNotiClientError(Sender: TObject; ErrorCode: Integer;
      const Description: string);
    procedure iwNotiClientConnected(Sender: TObject; StatusCode: Integer;
      const Description: string);
    procedure iwNotiClientDataIn(Sender: TObject; Text: string; EOL: Boolean);
    procedure iwNotiClientDisconnected(Sender: TObject; StatusCode: Integer;
      const Description: string);
    procedure UniConnectionAfterDisconnect(Sender: TObject);
    procedure tmPollingTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Connect_SQLDB: Boolean;
  	procedure Get_CFG;
  	procedure Set_CFG;
    procedure cbDbCompCopy(cbDbComp : TComponent; cbComp : TComponent);
    function Noti_Connect: Boolean;

    procedure Power_Open(sUserID: String);

    procedure Set_LoginTP(DataSet: TUniQuery; sID, sIP, sLoginTP: String);
    function  PC001_Send:String;
    procedure PM001_Send(sMachine, sServerNM: String);
    procedure ServerDisConnect;
  end;

const
  __FORMAT_AMT    = '#,##0';
  __FORMAT_AMTUSD = '#,##0.00';

  WM_USER_NOTI_DATA   = WM_USER + 1394;                                         // 통보 Packet
  MESSAGE_TIMOUT_TR   = 500;                                                    // TR   SendMessage TimeOut

var
  MastDB: TMastDB;

  __DB_Server   : String;  // DB Server IP
  __DB_Port     : Integer; // DB Server Port
  __DB_UserName : String;  // DB UserName
  __DB_PassWord : String;  // DB PassWord
  __DB_DataBase : String;  // DB DataBase

  __CFG_Dir     : String;  // CFG FileName
  __Find_User   : String;  // Find SQL
  __Find_UserNm : String;  // Find SQL

  __Noti_IP     : String;  // Noti Server IP
  __Noti_Port   : Integer; // Noti Serever PORT
  __DefaultPort: Integer;                                                       // Server Default Port

  __Supervisor  : Boolean; // SuperVisor
  __Login_ID    : String;  // Login
  __Local_IP    : String;  // Local IP
  __Login_Pwd   : String;

  __Corp_NM     : STring;  //업체명

  __UserFlag    : Integer; // fmUser PageControl Index

  __Find_FileName: String;  // Find SQL

  __DisConnected: Boolean=False;                                                // 서버 DisConnected

  __Trade_DT: String;                                                           // 영업일자

  POLLING_TIME: Integer;                                                        // Polling Time

  __MNGSQL: String;                                                             // 관리자접속시 SQL

  procedure PartComp_Open(Comp: TComponent; sType: String; sDefault: String=''; sValue: String='');

  procedure TRPacket_Run(sFlag, sData: String);

implementation

uses StdUtils, GTNoti, MMain;

{$R *.dfm}

{ TMastDB }

//var
//	_Find_FileName: String;  // Find SQL

procedure PartComp_Open(Comp: TComponent; sType: String; sDefault: String=''; sValue: String='');
var
	sSelect, sTable, sWhere: String;
begin
	with MastDB.dbSQL do
  begin
    Close;

    if Copy(sType, 1, 2) = '@|' then
    begin
      sSelect := Get_Delimiter(sType, 2);
      sTable  := Get_Delimiter(sType, 3);
      sWhere  := Get_Delimiter(sType, 4);
    end
    else
    begin
      sSelect := 'PART_NM, PART_CD';
    	sTable  := 'PART_MST';
      sWhere  := Format('WHERE PART_TP = %s', [QuotedStr(sType)]);
    end;

    SQL.Text := Format('SELECT %s FROM %s %s', [sSelect, sTable, sWhere]);

    Open;

  	First;

    // ListBox =================================================================
    if Comp.ClassType = TRzListBox then
    begin
    	TRzListBox(Comp).Clear;

      if sValue <> '' then
			begin
	      TRzListBox(Comp).Add(sDefault);
  	    TRzListBox(Comp).Values.Add(sValue);
      end;

      while Not Eof do
      begin
        TRzListBox(Comp).Add(Fields[0].AsString);
        TRzListBox(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // SkinRadioGroup ==========================================================
    if Comp.ClassType = TbsSkinRadioGroup then
    begin
    	TbsSkinRadioGroup(Comp).Items.Clear;
    	TbsSkinRadioGroup(Comp).ValueClear;

      if sValue <> '' then
			begin
	      TbsSkinRadioGroup(Comp).Items.Add(sDefault);
  	    TbsSkinRadioGroup(Comp).Values.Add(sValue);
      end;

      while Not Eof do
      begin
        TbsSkinRadioGroup(Comp).Items.Add(Fields[0].AsString);
        TbsSkinRadioGroup(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // DBComboBox ==============================================================
    if Comp.ClassType = TkcRzDBComboBox then
    begin
    	TkcRzDBComboBox(Comp).Clear;
      TkcRzDBComboBox(Comp).Values.Clear;

      if sValue <> '' then
      begin
	      TkcRzDBComboBox(Comp).Items.Add(sDefault);
  	    TkcRzDBComboBox(Comp).Values.Add(sValue);
      end;

      while Not Eof do
      begin
        TkcRzDBComboBox(Comp).Items.Add(Fields[0].AsString);
        TkcRzDBComboBox(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // ComboBox ================================================================
    if Comp.ClassType = TkcRzComboBox then
    begin
    	TkcRzComboBox(Comp).Clear;
      TkcRzComboBox(Comp).Values.Clear;

      if sValue <> '' then
      begin
	      TkcRzComboBox(Comp).Items.Add(sDefault);
  	    TkcRzComboBox(Comp).Values.Add(sValue);
      end;

      while Not Eof do
      begin
        TkcRzComboBox(Comp).Items.Add(Fields[0].AsString);
        TkcRzComboBox(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // DBGrid Columns ==========================================================
    if Comp.ClassType = TDBGridColumnEh then
    begin
    	TDBGridColumnEh(Comp).PickList.Clear;
    	TDBGridColumnEh(Comp).KeyList.Clear;

      if sValue <> '' then
      begin
	      TDBGridColumnEh(Comp).PickList.Add(sDefault);
  	    TDBGridColumnEh(Comp).KeyList.Add(sValue);
      end;

      while Not Eof do
      begin
        TDBGridColumnEh(Comp).PickList.Add(Fields[0].AsString);
        TDBGridColumnEh(Comp).KeyList.Add(Fields[1].AsString);

        Next;
      end;
    end;
  end;
end;

procedure TMastDB.cbDbCompCopy(cbDbComp, cbComp: TComponent);
var
  i: Integer;
begin
  with TkcRzDBComboBox(cbDbComp) do
  begin
    for i := 0 to Items.Count - 1 do
    begin
      TkcRzComboBox(cbComp).Items.Add(Items[i]);
      TkcRzComboBox(cbComp).Values.Add(Values[i]);
    end;
  end;
end;

function TMastDB.Connect_SQLDB: Boolean;
begin
	Result := False;

  with UniConnection do
  begin
    if Connected then Connected := False;

    LoginPrompt := __DB_Server = '';

    if Not LoginPrompt then
    begin
      Server   := __DB_Server;
      Port     := __DB_Port;
      Username := __DB_UserName;
      Password := __DB_PassWord;
      Database := __DB_DataBase;
    end;

    Connected := True;
    Set_CFG;

    Result := Connected;
  end;
end;

procedure TMastDB.DataModuleCreate(Sender: TObject);
begin
  __UserFlag      := 0;

	__Supervisor    := False;
  
  __CFG_Dir       := ExtractFilePath(ParamStr(0)) + 'CFG\';
	__Find_FileName  := __CFG_Dir + 'FINDSQL.INI';

	Get_CFG;

  Connect_SQLDB;
  Noti_Connect;

  tmPolling.Enabled  := False;
  tmPolling.Interval := POLLING_TIME * 1000;
  tmPolling.Enabled  := True;

	__MNGSQL := Format(' AND USER_GRADE <> %s ', [QuotedStr()]);
end;

procedure TMastDB.ServerDisConnect;
begin
  if __DisConnected then Exit;
  __DisConnected := True;

	iwNotiClient.Disconnect;

  if fmMain.bsMsgYesNo('통보서버 상태가 불안합니다. 재접속하여 체크하시길 바랍니다.\n\n재접속하시겠습니까?') then
  begin
    ShellExecute(fmMain.Handle, 'open', PChar(Application.ExeName),
                 PChar(Format('%s %s %s', ['SELF_RUN', __Login_ID, __Login_Pwd])) , nil, SW_SHOWNORMAL);
  end;

//  MsgError('통보서버가 끊어졌습니다. 시스템에 문의 바랍니다.');
  Application.Terminate;
end;

procedure TMastDB.Set_CFG;
begin
	with UniConnection do
  begin
	  Set_CFGFile('DATABASE', 'SERVER',   Server,   True, __CFGServerIP);
	  Set_CFGFile('DATABASE', 'PORT',     IntToStr(Port), True, __CFGServerIP);
  	Set_CFGFile('DATABASE', 'USERNAME', Username, True, __CFGServerIP);
	  Set_CFGFile('DATABASE', 'PASSWORD', Password, True, __CFGServerIP);
  	Set_CFGFile('DATABASE', 'DATABASE', Database, True, __CFGServerIP);
  end;

  with iwNotiClient do
  begin
    Set_CFGFile('G_B_NOTI', 'IP',   BASE_SERVERIP, True, __CFGServerIP);
    Set_CFGFile('G_B_NOTI', 'PORT', IntToStr(__DefaultPort), True, __CFGServerIP);
  end;

  Get_CFG;
end;

procedure TMastDB.Get_CFG;
begin
  __DB_Server   := Get_CFGFile('DATABASE', 'SERVER', '', True, __CFGServerIP);
  __DB_Port     := StrToIntDef(Get_CFGFile('DATABASE', 'PORT', '1433', True, __CFGServerIP), 1433);
  __DB_UserName := Get_CFGFile('DATABASE', 'USERNAME', '', True, __CFGServerIP);
  __DB_PassWord := Get_CFGFile('DATABASE', 'PASSWORD', '', True, __CFGServerIP);
  __DB_DataBase := Get_CFGFile('DATABASE', 'DATABASE', '', True, __CFGServerIP);

  __Noti_IP    := Get_CFGFile('G_B_NOTI', 'IP', '127.0.0.1', True, __CFGServerIP);
  __Noti_Port  := StrToIntDef(Get_CFGFile('G_B_NOTI', 'PORT', '20200', True, __CFGServerIP), 20200);

  __Find_User   := Get_INIFile(__Find_FileName, 'FINDSQL', 'USER');
  __Find_UserNM   := Get_INIFile(__Find_FileName, 'FINDSQL', 'USER_A');

//  POLLING_TIME       := StrToIntDef(Get_CFGFile('MNG_OPTION', 'POLLING_TIME', '60', False, __CFGServerIP), 60);   // Polling Time
  POLLING_TIME       := StrToIntDef(Get_CFGFile('MNG_OPTION', 'POLLING_TIME', '60', False), 60);   // Polling Time
end;

procedure TMastDB.iwNotiClientConnected(Sender: TObject; StatusCode: Integer;
  const Description: string);
var
  sType, sData: String;
begin
  iwNotiClient.EOL := __EOL;

  if StatusCode = 0 then
  begin
    iwNotiClient.DataToSend := '@C_IP' + __EOL;
    iwNotiClient.DataToSend := PC001_Send + __EOL;
  end
  else ServerDisConnect;

//  MsgError(Format('G_B_NOTI Server Connected = %s', [Description]))
end;

procedure TMastDB.iwNotiClientDataIn(Sender: TObject; Text: string;
  EOL: Boolean);
var
  Header : TTRHeader;
begin
	if Length(Text) < 1 then Exit;

  StrToRecord(Text, Header, SizeOf(Header));

  if Text[1] = '@' then __Local_IP := Copy(Text, 2, 15);

//  if ArrToStr(Header.PACKET_CD) = 'NC001' then
  if Copy(ArrToStr(Header.PACKET_CD), 1, 1) = 'N' then
  begin
    TRPacket_Run('R', Text);
  end;

end;

procedure TMastDB.iwNotiClientDisconnected(Sender: TObject; StatusCode: Integer;
  const Description: string);
begin
  ServerDisConnect;
end;

procedure TMastDB.iwNotiClientError(Sender: TObject; ErrorCode: Integer;
  const Description: string);
begin
  Set_Log(Format('GT_MNG Error = [%d] %s', [ErrorCode, Description]), 'E');
end;

function TMastDB.Noti_Connect: Boolean;
begin
  Result := False;

  with iwNotiClient do
  begin
    Connected  := False;
    RemoteHost := __Noti_IP;
    RemotePort := __Noti_Port;
    Connected  := True;

    EOL := __EOL;

    Result := Connected;
  end;
end;

function TMastDB.PC001_Send: String;
var
	PC001: TPC001;
begin
	Result := '';

  StrToArr(NumToStr(SizeOf(PC001)), PC001.GT_HEADER.LENGTH);
  StrToArr('PC001',                 PC001.GT_HEADER.PACKET_CD);
  StrToArr(__Login_ID,              PC001.GT_HEADER.USER_ID);
  StrToArr('0',                     PC001.GT_HEADER.ACNT_TP);
  StrToArr('0000',                  PC001.GT_HEADER.ERR_CODE);
  StrToArr(NowMSecTime,             PC001.GT_HEADER.TM);
  StrToArr('M',                     PC001.USER_TP);
  StrToArr('Y',                     PC001.DUP_YN);

  Result :=  RecordToStr(PC001, SizeOf(PC001));
end;

procedure TMastDB.PM001_Send(sMachine, sServerNM: String);
var
	PM001: TPM001;
  sData: String;
begin
  StrToArr(NumToStr(SizeOf(PM001)), PM001.GT_HEADER.LENGTH);
  StrToArr('PM001',                 PM001.GT_HEADER.PACKET_CD);
  StrToArr('@SYSTEM',               PM001.GT_HEADER.USER_ID);
  StrToArr('0',                     PM001.GT_HEADER.ACNT_TP);
  StrToArr('0000',                  PM001.GT_HEADER.ERR_CODE);
  StrToArr(NowMSecTime,             PM001.GT_HEADER.TM);
  StrToArr(sMachine,                PM001.MACHINE_TP);
  StrToArr(sServerNM,               PM001.SERVER_NM);

  sData := RecordToStr(PM001, SizeOf(PM001));

  iwNotiClient.DataToSend := sData + __EOL;
end;

procedure TMastDB.Power_Open(sUserID: String);
begin
  with dbPower do
  begin
    try
      Close;
      SQL.Text := Format('SELECT FORM_ID, POWER_SHOW FROM POWER_MST WHERE USER_ID = %s', [QuotedStr(sUserID)]);
      Open;
    except
    end;
  end;
end;

procedure TMastDB.Set_LoginTP(DataSet: TUniQuery; sID, sIP, sLoginTP: String);
var
  sField, sValue: String;
begin
  with DataSet do
  begin
  	try
      Close;

      sField := 'USER_ID, LOGIN_DT, LOGIN_TM, LOGIN_IP, ACNT_TP, LOGIN_TP, LOGIN_MAC, APP_TP';
      sValue := Format('%s, %s, %s, %s, %s, %s, %s, %s',
                              [QuotedStr(sID),
                               QuotedStr(NowDate),
                               QuotedStr(NowMSecTime(True)),
                               QuotedStr(sIP),
                               QuotedStr('0'),
                               QuotedStr(sLoginTP),
                               QuotedStr(GetMacAddress),
                               QuotedStr('M')
                              ]);

      SQL.Text := Format('INSERT INTO LOGIN_HIS (%s) VALUES (%s);', [sField, sValue]);
      ExecSQL;
    except
    end;
  end;
end;

procedure TMastDB.tmPollingTimer(Sender: TObject);
var
	sSql, sData : String;
begin
	tmPolling.Enabled := False;

  sData := '@POLLING';

  DataToServer(iwNotiClient, sData + __EOL);

	sSql := 'SELECT POLL_KEY FROM GT_POLLING';
  Uni_Open(dbSQL, sSql);

	tmPolling.Enabled := True;
end;

procedure TMastDB.UniConnectionAfterDisconnect(Sender: TObject);
begin
  if __DisConnected then Exit;  //임시로직
  __DisConnected := False;       //임시로직

  UniConnection.Connected := False;

  MsgError('DB 네트워크 상태가 불안합니다.\n\n재접속하세요.');
  Application.Terminate;
end;

procedure TRPacket_Run(sFlag, sData: String);
var
  TRThread: TTRThread;
begin
	TRThread := TTRThread.Create(True);
  TRThread.FreeOnTerminate := True;

  TRThread.FFlag := sFlag;
  TRThread.FData := sData;

  TRThread.Resume;
end;

{ TTRThread }

procedure TTRThread.Execute;
begin
  inherited;
  if FFlag = 'R' then Recv_Packet(FData);
end;

procedure TTRThread.Recv_Packet(sData: String);
var
	Header: TTRHeader;
  NB001 : TNB001;
  sPacket: String;
  sResult: DWord;
begin
  StrToRecord(FData, Header, SizeOf(Header));

  sPacket := ArrToStr(Header.PACKET_CD);

  if Copy(sPacket, 1, 1) = 'N' then                                             // 통보
  begin
    SendMessageTimeout(Application.MainForm.Handle,
                       WM_USER_NOTI_DATA,
                       wParam(LongInt(FData)),
                       lParam(LongInt(Pchar(sPacket))),
                       SMTO_NORMAL,
                       MESSAGE_TIMOUT_TR,
                       sResult);

    if sPacket = 'NB001' then
    begin
      FResult := 'fmHybrid';
      StrToRecord(FData, NB001, SizeOf(NB001));

      if ArrToStr(NB001.NOTI_TP) = '02' then
      begin
        SendMessageTimeout(Application.MainForm.Handle,
                           WM_USER_NOTI_RESULT,
                           wParam(LongInt(FResult)),
                           lParam(LongInt(Pchar(NowTime))),
                           SMTO_NORMAL,
                           500,
                           sResult);
      end;
      
    end;

  end
end;

end.
