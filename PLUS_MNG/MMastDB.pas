{$OPTIMIZATION OFF}
unit MMastDB;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils,
  DB, DBClient, DBAccess, MemDS, Messages, ShellAPI, ADODB,
// Raize, kcRaize
  RzCommon, RzLstBox, bsSkinCtrls, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEh,
// IPWorks9
  ipwcore, ipwipport,
// TheadTimer
  ThdTimer;

type
  TMastDB = class(TDataModule)
    RzFrameController: TRzFrameController;
    PanelRzFrameController: TRzFrameController;
    iwNotiClient: TipwIPPort;
    tmPolling: TThreadedTimer;
    ADOConn: TADOConnection;
    dbSQL: TADOQuery;
    ADOSP: TADOStoredProc;
    dbExec: TADOQuery;
    dbPower: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure iwNotiClientDisconnected(Sender: TObject; StatusCode: Integer;
      const Description: string);
    procedure iwNotiClientDataIn(Sender: TObject; Text: string; EOL: Boolean);
    procedure iwNotiClientConnected(Sender: TObject; StatusCode: Integer;
      const Description: string);
    procedure iwNotiClientError(Sender: TObject; ErrorCode: Integer;
      const Description: string);
    procedure ADOConnAfterDisconnect(Sender: TObject);
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

    function  PC001_Send:String;
    procedure PM001_Send(sMachine, sServerNM: String);
    procedure ServerDisConnect;
  end;

var
  MastDB: TMastDB;

  _DB_Server : String;  // DB Server IP

  procedure PartComp_Open(Comp: TComponent; sType: String; sDefault: String=''; sValue: String='');

  procedure Set_LoginTP(DataSet: TADOQuery; sID, sIP, sLoginTP: String);
  procedure SetADOConn(AForm:TForm);

(* DB Data ===================================================================*)
function ActiveSQL(ADOQry:TADOQuery; iFetchRows: Integer=50): integer;
function fnSqlOpen(ADOQry: TADOQuery; sSQL:string; iFetchRows: Integer=50): String;

implementation

uses StdUtils, PacketThread, PacketStruct, GTNoti, MMain;

{$R *.dfm}

{ TMastDB }

var
  iUserFlag    : Integer; // fmUser PageControl Index
  iDB_Port     : Integer; // DB Server Port
  sDB_UserName : String;  // DB UserName
  sDB_PassWord : String;  // DB PassWord
  sDB_DataBase : String;  // DB DataBase
  sCFG_Dir     : String;  // CFG FileName

function ActiveSQL(ADOQry:TADOQuery; iFetchRows: Integer=50): integer;
begin
  Result := 0;

  if Not _GT_Sign then Exit;

  if not MastDB.ADOConn.Connected then Exit;

  ADOQry.Connection := MastDB.ADOConn;
  with ADOQry do begin
    Prepared := True;
    if Active then Active := False;

    try
      Active := True;

      Result := RecordCount;
      if Result = 0 then begin
        Active := False;
        Prepared := False;
        //if bShowMsgTF then
        //   InfoMsg('조건에 해당하는 Data가 없습니다.');
        Exit;
      end;
    except
      on E: Exception do begin
        Active := False;
        Prepared := False;
        MsgInfo('[' + IntToStr(E.HelpContext) + '] ' + E.Message);
      end;
    end;
  end;
end;

function fnSqlOpen(ADOQry: TADOQuery; sSQL:string; iFetchRows: Integer=50): String;
var
  iCnt : integer;
begin
  Result := '';

  if Not _GT_Sign then Exit;

  if not MastDB.ADOConn.Connected then Exit;

  ADOQry.Connection := MastDB.ADOConn;
  with ADOQry do begin
    if Active then Active := False;
    SQL.Text := sSQL;
    Prepared := True;

    //MaxRecords := iFetchRows; // TODO : 모든 조회결과를 50개만 표시?
    try
      //if UpperCase(Copy(sSQL, 1, 1)) = 'S' then begin
      if UpperCase(Copy(SQL.Text, 1, 1)) = 'S' then begin
        Active := True; //Open
        iCnt := RecordCount;
        if iCnt > 0 then begin
          First;
        end else begin
          //Active := False;
          //Prepared := False;
        end;
      end else begin
        ExecSQL;
      end;
      Exit;
    except
      on E: Exception do begin
        Active := False;
        Prepared := False;
        Result := '[' + IntToStr(E.HelpContext) + '] ' + E.Message;
      end;
    end;
  end;
end;

procedure PartComp_Open(Comp: TComponent; sType: String; sDefault: String=''; sValue: String='');
var
  i : integer;
  sSelect, sTable, sWhere: String;
begin
  with MastDB.dbSQL do begin
    // Close;
    if Active then Active := False;

    if Copy(sType, 1, 2) = '@|' then begin
      sSelect := Get_Delimiter(sType, 2);
      sTable  := Get_Delimiter(sType, 3);
      sWhere  := Get_Delimiter(sType, 4);
    end else begin
      sSelect := 'PART_NM, PART_CD';
      sTable  := 'PART_MST';
      sWhere  := Format('WHERE PART_TP = %s', [QuotedStr(sType)]);
    end;

    SQL.Text := Format('SELECT %s FROM %s %s', [sSelect, sTable, sWhere]);

    Active := True; // Open;
    if RecordCount = 0 then Exit;

    First;

    // ListBox =================================================================
    if Comp.ClassType = TRzListBox then begin
      TRzListBox(Comp).Clear;

      if sValue <> '' then begin
        TRzListBox(Comp).Add(sDefault);
        TRzListBox(Comp).Values.Add(sValue);
      end;

      for i:=0 to RecordCount -1 do begin
      //while Not Eof do begin
        TRzListBox(Comp).Add(Fields[0].AsString);
        TRzListBox(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // SkinRadioGroup ==========================================================
    if Comp.ClassType = TbsSkinRadioGroup then begin
      TbsSkinRadioGroup(Comp).Items.Clear;
      TbsSkinRadioGroup(Comp).ValueClear;

      if sValue <> '' then begin
        TbsSkinRadioGroup(Comp).Items.Add(sDefault);
        TbsSkinRadioGroup(Comp).Values.Add(sValue);
      end;

      for i:=0 to RecordCount -1 do begin
      //while Not Eof do begin
        TbsSkinRadioGroup(Comp).Items.Add(Fields[0].AsString);
        TbsSkinRadioGroup(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // DBComboBox ==============================================================
    if Comp.ClassType = TkcRzDBComboBox then begin
      TkcRzDBComboBox(Comp).Clear;
      TkcRzDBComboBox(Comp).Values.Clear;

      if sValue <> '' then begin
        TkcRzDBComboBox(Comp).Items.Add(sDefault);
        TkcRzDBComboBox(Comp).Values.Add(sValue);
      end;

      for i:=0 to RecordCount -1 do begin
      //while Not Eof do begin
        TkcRzDBComboBox(Comp).Items.Add(Fields[0].AsString);
        TkcRzDBComboBox(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // ComboBox ================================================================
    if Comp.ClassType = TkcRzComboBox then begin
      TkcRzComboBox(Comp).Clear;
      TkcRzComboBox(Comp).Values.Clear;

      if sValue <> '' then begin
        TkcRzComboBox(Comp).Items.Add(sDefault);
        TkcRzComboBox(Comp).Values.Add(sValue);
      end;

      for i:=0 to RecordCount -1 do begin
      //while Not Eof do begin
        TkcRzComboBox(Comp).Items.Add(Fields[0].AsString);
        TkcRzComboBox(Comp).Values.Add(Fields[1].AsString);

        Next;
      end;
    end;

    // DBGrid Columns ==========================================================
    if Comp.ClassType = TDBGridColumnEh then begin
      TDBGridColumnEh(Comp).PickList.Clear;
      TDBGridColumnEh(Comp).KeyList.Clear;

      if sValue <> '' then begin
        TDBGridColumnEh(Comp).PickList.Add(sDefault);
        TDBGridColumnEh(Comp).KeyList.Add(sValue);
      end;

      for i:=0 to RecordCount -1 do begin
      //while Not Eof do begin
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
  with TkcRzDBComboBox(cbDbComp) do begin
    for i := 0 to Items.Count - 1 do begin
      TkcRzComboBox(cbComp).Items.Add(Items[i]);
      TkcRzComboBox(cbComp).Values.Add(Values[i]);
    end;
  end;
end;

procedure SetADOConn(AForm:TForm);
var
   i : integer;
begin
  with AForm do begin
    for i:=0 to ComponentCount -1 do begin
      if Components[i].ClassType = TADOQuery then begin
        TADOQuery(Components[i]).Connection := MastDB.ADOConn;
      end;
    end;
  end;
end;

function TMastDB.Connect_SQLDB: Boolean;
var
  b : Boolean;
  sConnInStr : string;
  sUsername, sPassword, sDatabase, sServer, sPort : string;
begin
//  Result := False;

  with ADOConn do begin
    if Connected then Connected := False;

    LoginPrompt := _DB_Server = '';

    if Not LoginPrompt then begin
{      __DB_UserName := 'maxsa';
      __DB_PassWord := 'opsapwd20231205!!!';
      __DB_DataBase := 'GTRADENEW';
      __DB_Server   := '115.92.124.21';
      __DB_Port     := 33411;
}
      sConnInStr := 'Provider=SQLOLEDB.1;Persist Security Info=True;';
      sUsername := 'User ID=' + sDB_UserName + ';';
      sPassword := 'Password=' + sDB_PassWord + ';';
      sDatabase := 'Initial Catalog=' + sDB_DataBase + ';';
      sServer   := 'Data Source=' + _DB_Server + ',';
      sPort     := IntToStr(iDB_Port);

      sConnInStr := sConnInStr + sUsername + sPassword + sDatabase + sServer + sPort;
      ConnectionString := sConnInStr;
    end;
    Connected := True;

{    gsUsername := __DB_UserName;
    gsPassword := __DB_PassWord;
    gsDatabase := __DB_DataBase;
    gsServer   := __DB_Server;
    gsPort     := IntToStr(__DB_Port);
}
    Set_CFG;
    b := Connected;
    Result := Connected;
  end;
end;

procedure TMastDB.DataModuleCreate(Sender: TObject);
var
  sConnInStr : string;
begin
{   with UniConnection do begin
      if Connected then Connected := False;

      //Provider := 'MSDAORA';
      Mode := cmReadWrite;
      LoginPrompt := False;
      KeepConnection := True;

      sConnInStr := 'Provider=SQLOLEDB.1;Password=opsapwd20231205!!!;Persist Security Info=True;User ID=maxsa;Initial Catalog=GTRADENEW;Data Source=110.4.89.203,6100';
//      sConnInStr := 'Provider=SQLOLEDB.1;Password=opsapwd20231205!!!;Persist Security Info=True;User ID=maxsa;Initial Catalog=GTRADENEW;Data Source=110.4.89.203,6100;Use Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=DESKTOP-ULDPDV5;Use Encryption for Data=False;Tag with column collation when possible=False';
      //sLocalIP := GetLocalIP;
// 공인IP를 사용할 경우 아래의 Comment 풀어야함
//      if Copy(sLocalIP,1,3) = '192' then
         ConnectionString := sConnInStr;
//      else
//         ConnectionString := sConnOutStr;

      if not Connected then Connected := True;
   end;
}
  iUserFlag      := 0;

  _Supervisor    := False;

  sCFG_Dir       := ExtractFilePath(ParamStr(0)) + 'CFG\';
  _Find_FileName  := sCFG_Dir + 'FINDSQL.INI';

  Get_CFG;

  if not Connect_SQLDB then begin
    MsgError('DB 네트워크 상태가 불안합니다.\n\n재접속하세요.');
    Application.Terminate;
    Exit;
  end;

  tmPolling.Enabled  := False;
  if Noti_Connect then begin
    tmPolling.Interval := _POLLING_TIME * 1000;
    tmPolling.Enabled  := True;
  end;
end;

procedure TMastDB.DataModuleDestroy(Sender: TObject);
begin
   if dbSQL.Active then dbSQL.Active := False;
   if dbExec.Active then dbExec.Active := False;
   if dbPower.Active then dbPower.Active := False;
   if ADOSP.Active then ADOSP.Active := False;
   if ADOConn.Connected then ADOConn.Connected := False;  
end;

procedure TMastDB.ServerDisConnect;
begin
  if _DisConnected then Exit;
  _DisConnected := True;

  iwNotiClient.Disconnect;

  if fmMain.bsMsgYesNo('통보서버 상태가 불안합니다. 재접속하여 체크하시길 바랍니다.\n\n재접속하시겠습니까?') then begin
    ShellExecute(fmMain.Handle, 'open', PChar(Application.ExeName),
                 PChar(Format('%s %s %s', ['SELF_RUN', _Login_ID, _Login_Pwd])) , nil, SW_SHOWNORMAL);
  end;

//  MsgError('통보서버가 끊어졌습니다. 시스템에 문의 바랍니다.');
  Application.Terminate;
end;

procedure TMastDB.Set_CFG;
begin
  with ADOConn do begin
    Set_CFGFile('DATABASE', 'SERVER',   _DB_Server,   True, _CFGServerIP);
    Set_CFGFile('DATABASE', 'PORT',     IntToStr(iDB_Port), True, _CFGServerIP);
    Set_CFGFile('DATABASE', 'USERNAME', sDB_Username, True, _CFGServerIP);
    Set_CFGFile('DATABASE', 'PASSWORD', sDB_Password, True, _CFGServerIP);
    Set_CFGFile('DATABASE', 'DATABASE', sDB_Database, True, _CFGServerIP);
{    Set_CFGFile('DATABASE', 'SERVER',   gsServer,   True, __GTINF_CFG);
    Set_CFGFile('DATABASE', 'PORT',     gsPort,     True, __GTINF_CFG);
    Set_CFGFile('DATABASE', 'USERNAME', gsUsername, True, __GTINF_CFG);
    Set_CFGFile('DATABASE', 'PASSWORD', gsPassword, True, __GTINF_CFG);
    Set_CFGFile('DATABASE', 'DATABASE', gsDatabase, True, __GTINF_CFG);}
  end;

//  with iwNotiClient do begin
    Set_CFGFile('G_B_NOTI', 'IP',   _BASE_SERVERIP, True, _CFGServerIP);
    Set_CFGFile('G_B_NOTI', 'PORT', IntToStr(_DefaultPort), True, _CFGServerIP);
{    Set_CFGFile('G_B_NOTI', 'IP',   _BASE_SERVERIP, True, __GTINF_CFG);
    Set_CFGFile('G_B_NOTI', 'PORT', IntToStr(__DefaultPort), True, __GTINF_CFG);}
//  end;

  Get_CFG;
end;

procedure TMastDB.Get_CFG;
begin
  iDB_Port     := StrToIntDef(Get_CFGFile('DATABASE', 'PORT', '1433', True, _CFGServerIP), 1433);
  _DB_Server   := Get_CFGFile('DATABASE', 'SERVER'  , '', True, _CFGServerIP);
  sDB_UserName := Get_CFGFile('DATABASE', 'USERNAME', '', True, _CFGServerIP);
  sDB_PassWord := Get_CFGFile('DATABASE', 'PASSWORD', '', True, _CFGServerIP);
  sDB_DataBase := Get_CFGFile('DATABASE', 'DATABASE', '', True, _CFGServerIP);

  _Noti_IP     := Get_CFGFile('G_B_NOTI', 'IP', '127.0.0.1', True, _CFGServerIP);
  _Noti_Port   := StrToIntDef(Get_CFGFile('G_B_NOTI', 'PORT', '20200', True, _CFGServerIP), 20200);
  G_CHAT_IP    := _Noti_IP;
//  G_CHAT_PORT  := _Noti_Port + 2;
  G_CHAT_PORT  := 20202;

  _Find_User   := Get_INIFile(_Find_FileName, 'FINDSQL', 'USER');
  _Find_UserNM := Get_INIFile(_Find_FileName, 'FINDSQL', 'USER_A');

//  _POLLING_TIME := StrToIntDef(Get_CFGFile('MNG_OPTION', 'POLLING_TIME', '60', False, __CFGServerIP), 60);   // Polling Time
  _POLLING_TIME := StrToIntDef(Get_CFGFile('MNG_OPTION', 'POLLING_TIME', '60', False), 60);   // Polling Time

{  __DB_Server   := Get_CFGFile('DATABASE', 'SERVER', '', True, __GTINF_CFG);
  __DB_Port     := StrToIntDef(Get_CFGFile('DATABASE', 'PORT', '1433', True, __GTINF_CFG), 1433);
  __DB_UserName := Get_CFGFile('DATABASE', 'USERNAME', '', True, __GTINF_CFG);
  __DB_PassWord := Get_CFGFile('DATABASE', 'PASSWORD', '', True, __GTINF_CFG);
  __DB_DataBase := Get_CFGFile('DATABASE', 'DATABASE', '', True, __GTINF_CFG);

  __Noti_IP    := Get_CFGFile('G_B_NOTI', 'IP', '127.0.0.1', True, __GTINF_CFG);
  __Noti_Port  := StrToIntDef(Get_CFGFile('G_B_NOTI', 'PORT', '20200', True, __GTINF_CFG), 20200);

  __Find_User   := Get_INIFile(gs_Find_FileName, 'FINDSQL', 'USER');
  __Find_UserNM   := Get_INIFile(gs_Find_FileName, 'FINDSQL', 'USER_A');

//  _POLLING_TIME       := StrToIntDef(Get_CFGFile('MNG_OPTION', 'POLLING_TIME', '60', False, __GTINF_CFG), 60);   // Polling Time
  _POLLING_TIME       := StrToIntDef(Get_CFGFile('MNG_OPTION', 'POLLING_TIME', '60', False), 60);   // Polling Time}
end;

procedure TMastDB.iwNotiClientConnected(Sender: TObject; StatusCode: Integer;
  const Description: string);
begin
  iwNotiClient.EOL := _EOL;

  if StatusCode = 0 then begin
    iwNotiClient.DataToSend := '@C_IP' + _EOL;
    iwNotiClient.DataToSend := PC001_Send + _EOL;
  end else begin
    ServerDisConnect;
  end;

//  MsgError(Format('G_B_NOTI Server Connected = %s', [Description]))
end;

procedure TMastDB.iwNotiClientDisconnected(Sender: TObject; StatusCode: Integer;
  const Description: string);
begin
  ServerDisConnect;
end;

procedure TMastDB.iwNotiClientDataIn(Sender: TObject; Text: string;
  EOL: Boolean);
var
  Header : TTRHeader;
begin
  if Length(Text) < 1 then Exit;

  StrToRecord(Text, Header, SizeOf(Header));

  if Text[1] = '@' then _Local_IP := Copy(Text, 2, 15);

//  if ArrToStr(Header.PACKET_CD) = 'NC001' then
  if Copy(ArrToStr(Header.PACKET_CD), 1, 1) = 'N' then begin
    if _Supervisor then TRPacket_Run('R', Text);
  end;
end;

procedure TMastDB.iwNotiClientError(Sender: TObject; ErrorCode: Integer;
  const Description: string);
begin
  Set_Log(Format('GT_MNG Error = [%d] %s', [ErrorCode, Description]), 'E');
end;

function TMastDB.Noti_Connect: Boolean;
begin
  Result := False;

  with iwNotiClient do begin
    if not Connected then begin // Connected := False;
      RemoteHost := _Noti_IP;
      RemotePort := _Noti_Port;
  //    RemotePort := 20200;
      Connected  := True;

      EOL := _EOL;

      Result := Connected;
    end;
  end;
end;

function TMastDB.PC001_Send: String;
var
  PC001: TPC001;
begin
  Result := '';

  StrToArr(NumToStr(SizeOf(PC001)), PC001.TRHeader.LENGTH);
  StrToArr('PC001',                 PC001.TRHeader.PACKET_CD);
  StrToArr(_Login_ID,               PC001.TRHeader.USER_ID);
  StrToArr('0',                     PC001.TRHeader.ACNT_TP);
  StrToArr('0000',                  PC001.TRHeader.ERR_CODE);
  StrToArr(NowMSecTime,             PC001.TRHeader.TM);
  StrToArr('M',                     PC001.USER_TP);
  StrToArr('Y',                     PC001.DUP_YN);

  Result :=  RecordToStr(PC001, SizeOf(PC001));
end;

procedure TMastDB.PM001_Send(sMachine, sServerNM: String);
var
  PM001: TPM001;
  sData: String;
begin
  StrToArr(NumToStr(SizeOf(PM001)), PM001.TRHeader.LENGTH);
  StrToArr('PM001',                 PM001.TRHeader.PACKET_CD);
  StrToArr('@SYSTEM',               PM001.TRHeader.USER_ID);
  StrToArr('0',                     PM001.TRHeader.ACNT_TP);
  StrToArr('0000',                  PM001.TRHeader.ERR_CODE);
  StrToArr(NowMSecTime,             PM001.TRHeader.TM);
  StrToArr(sMachine,                PM001.MACHINE_TP);
  StrToArr(sServerNM,               PM001.SERVER_NM);

  sData := RecordToStr(PM001, SizeOf(PM001));

  iwNotiClient.DataToSend := sData + _EOL;
end;

procedure TMastDB.Power_Open(sUserID: String);
begin
  with dbPower do begin
    try
      Close;
      SQL.Text := Format('SELECT FORM_ID, POWER_SHOW FROM POWER_MST WHERE USER_ID = %s', [QuotedStr(sUserID)]);
      Open;
    except
    end;
  end;
end;

procedure Set_LoginTP(DataSet: TADOQuery; sID, sIP, sLoginTP: String);
var
  sField, sValue: String;
begin
  with DataSet do begin
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

  DataToServer(iwNotiClient, sData + _EOL);

  sSql := 'SELECT POLL_KEY FROM GT_POLLING';
  fnSqlOpen(dbSQL, sSql);

  tmPolling.Enabled := True;
end;

procedure TMastDB.ADOConnAfterDisconnect(Sender: TObject);
begin
  if _DisConnected then Exit;  //임시로직
  _DisConnected := False;       //임시로직

  ADOConn.Connected := False;

  MsgError('DB 네트워크 상태가 불안합니다.\n\n재접속하세요.');
  Application.Terminate;
end;

end.
