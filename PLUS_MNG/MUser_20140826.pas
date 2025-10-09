unit MUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, ComCtrls, bsSkinTabs, DBCtrls, RzDTP, RzDBDTP,
  RzButton, RzRadChk, PacketStruct, UniDAC_Helper, math;

type
  TfmUser = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    edFind: TRzEdit;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel6: TRzPanel;
    rgType: TbsSkinRadioGroup;
    gdMain: TDBGridEh;
    lbxPart: TRzListBox;
    btnDetail: TbsSkinSpeedButton;
    pgMain: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinTabSheet2: TbsSkinTabSheet;
    RzPanel4: TRzPanel;
    userPass: TbsSkinSpeedButton;
    pnUser: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    bsSkinLabel6: TbsSkinLabel;
    bsSkinLabel7: TbsSkinLabel;
    bsSkinLabel8: TbsSkinLabel;
    bsSkinLabel9: TbsSkinLabel;
    bsSkinLabel11: TbsSkinLabel;
    bsSkinLabel12: TbsSkinLabel;
    bsSkinLabel13: TbsSkinLabel;
    bsSkinLabel15: TbsSkinLabel;
    bsSkinLabel16: TbsSkinLabel;
    bsSkinLabel17: TbsSkinLabel;
    bsSkinLabel18: TbsSkinLabel;
    bsSkinLabel19: TbsSkinLabel;
    SuperViser: TRzPanel;
    bsSkinLabel22: TbsSkinLabel;
    edMngid: TkcRzDBEdit;
    RzPanel3: TRzPanel;
    bsSkinLabel23: TbsSkinLabel;
    edPassM: TkcRzDBEdit;
    gdAcnt: TDBGridEh;
    dbAcnt: TUniQuery;
    RzPanel8: TRzPanel;
    bsSkinLabel42: TbsSkinLabel;
    bsSkinLabel39: TbsSkinLabel;
    cbAcntStat2: TkcRzDBComboBox;
    bsSkinLabel38: TbsSkinLabel;
    cbApiIp: TkcRzDBComboBox;
    bsSkinLabel37: TbsSkinLabel;
    edAcntPwd: TkcRzDBEdit;
    bsSkinLabel27: TbsSkinLabel;
    edAcntNo: TkcRzDBEdit;
    bsSkinLabel25: TbsSkinLabel;
    cbDupYn: TkcRzDBComboBox;
    cbAcntTp: TkcRzDBComboBox;
    bsSkinLabel45: TbsSkinLabel;
    pnAcnt: TRzPanel;
    bsSkinLabel14: TbsSkinLabel;
    moAcntBigo: TRzDBMemo;
    acntPass: TbsSkinSpeedButton;
    bsSkinLabel20: TbsSkinLabel;
    lbAlert: TLabel;
    btnAcntMake: TbsSkinButton;
    lbConnUser: TbsSkinLabel;
    bsSkinButton1: TbsSkinButton;
    edGujaMaxCnt: TkcRzEdit;
    ckGujaYn: TRzCheckBox;
    bsSkinTabSheet3: TbsSkinTabSheet;
    bsSkinLabel10: TbsSkinLabel;
    pnUmNm: TRzPanel;
    dsAcnt: TDataSource;
    gdUserMemo: TDBGridEh;
    dbMemo: TUniQuery;
    dsMemo: TDataSource;
    cbPartNm: TkcRzDBComboBox;
    bsSkinLabel21: TbsSkinLabel;
    edUmTitle: TkcRzDBEdit;
    bsSkinLabel24: TbsSkinLabel;
    moUmBigo: TRzDBMemo;
    dbMainCHECK_TF: TIntegerField;
    dbMainUSER_ID: TStringField;
    dbMainUSER_NM: TStringField;
    dbMainUSER_NICK_NM: TStringField;
    dbMainUSER_PWD: TStringField;
    dbMainUSER_GRADE: TStringField;
    dbMainPART_CD: TStringField;
    dbMainPART_NM: TStringField;
    dbMainUSER_BANK: TStringField;
    dbMainUSER_BANK_ACNT: TStringField;
    dbMainUSER_BANK_ACNT_NM: TStringField;
    dbMainPARTNER_ID: TStringField;
    dbMainPARTNER_NM: TStringField;
    dbMainPARTNER_NICK_NM: TStringField;
    dbMainREG_DT: TDateTimeField;
    dbMainSERVER_IP: TStringField;
    dbMainBIRTH_DT: TStringField;
    dbMainUPDATE_MNG_ID: TStringField;
    dbMainUPDATE_DT: TStringField;
    dbMainUPDATE_TM: TStringField;
    dbMainUPDATE_IP: TStringField;
    dbMainUSER_ADDR: TStringField;
    dbMainUSER_EMAIL: TStringField;
    dbMainUSER_TEL: TStringField;
    dbMainUSER_HP: TStringField;
    dbMainUSER_BIGO: TStringField;
    dbMemoUM_SEQ: TIntegerField;
    dbMemoUSER_ID: TStringField;
    dbMemoUM_DT: TDateTimeField;
    dbMemoPART_NM: TStringField;
    dbMemoUM_TITLE: TStringField;
    dbMemoUM_BIGO: TStringField;
    bsSkinTabSheet4: TbsSkinTabSheet;
    gdInout: TDBGridEh;
    RzPanel2: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    RzGroupBox2: TRzGroupBox;
    pnInout: TRzPanel;
    bsSkinLabel26: TbsSkinLabel;
    edInAmt: TRzEdit;
    bsSkinLabel28: TbsSkinLabel;
    btnIn: TbsSkinButton;
    btnOut: TbsSkinButton;
    bsSkinLabel29: TbsSkinLabel;
    bsSkinLabel30: TbsSkinLabel;
    edOutAmt: TRzEdit;
    edInAcntAmt: TRzEdit;
    edOutAcntAmt: TRzEdit;
    btnCntReset: TbsSkinSpeedButton;
    bsSkinTabSheet5: TbsSkinTabSheet;
    gdLogin: TDBGridEh;
    dbLogin: TUniQuery;
    dsLogin: TDataSource;
    RzPanel7: TRzPanel;
    pnLogin: TRzPanel;
    lbLogin: TbsSkinLabel;
    dbAcntACNT_NO: TStringField;
    dbAcntACNT_TP: TStringField;
    dbAcntUSER_ID: TStringField;
    dbAcntUSER_NM: TStringField;
    dbAcntACNT_PWD: TStringField;
    dbAcntGUJA_CNT: TIntegerField;
    dbAcntNEGO_GUJA_MAXCNT: TIntegerField;
    dbAcntAPI_TP: TStringField;
    dbAcntBF_ACNT_AMT: TFloatField;
    dbAcntACNT_AMT: TFloatField;
    dbAcntCLR_PL: TFloatField;
    dbAcntCLR_PL_F: TFloatField;
    dbAcntCMSN: TFloatField;
    dbAcntCMSN_F: TFloatField;
    dbAcntACNT_STATE: TStringField;
    dbAcntCONN_YN: TStringField;
    dbAcntNEGO_DUP_YN: TStringField;
    dbAcntFIRST_DT: TStringField;
    dbAcntLOGIN_DT: TStringField;
    dbAcntLOGIN_TM: TStringField;
    dbAcntLOGIN_IP: TStringField;
    dbAcntACNT_BIGO: TStringField;
    dbAcntLOSSCUT_YN: TStringField;
    dbAcntOVERNGT_YN: TStringField;
    dbAcntPLAMT: TFloatField;
    tmOpen: TTimer;
    edUserID: TkcRzDBEdit;
    edUserNickName: TkcRzDBEdit;
    edUser_Nm: TkcRzDBEdit;
    cbUser_Grade: TkcRzDBComboBox;
    cbUserPart: TkcRzDBComboBox;
    edRegNo: TkcRzDBEdit;
    edRegDt: TRzDBDateTimePicker;
    cbServerIP: TkcRzDBComboBox;
    edPass: TkcRzDBEdit;
    cbPartnerNick: TkcRzDBComboBox;
    edEmail: TkcRzDBEdit;
    edTelNo: TkcRzDBEdit;
    edHpNo: TkcRzDBEdit;
    edAddr1: TkcRzDBEdit;
    edUserAcnt: TkcRzDBEdit;
    edUserBank: TkcRzDBEdit;
    edAcntNm: TkcRzDBEdit;
    bsSkinLabel31: TbsSkinLabel;
    moBody: TRzDBMemo;
    dbLoginUSER_ID: TStringField;
    dbLoginLOGIN_DT: TStringField;
    dbLoginLOGIN_TM: TStringField;
    dbLoginLOGIN_IP: TStringField;
    dbLoginACNT_TP: TStringField;
    dbLoginLOGIN_TP: TStringField;
    dbLoginLOGIN_MAC: TStringField;
    dbLoginAPP_TP: TStringField;
    dbLoginHTS_VER: TStringField;
    dbLoginTOTCNT: TIntegerField;
    bsSkinLabel32: TbsSkinLabel;
    edMinAmtGuja: TkcRzDBEdit;
    dbAcntMINAMT_GUJA: TFloatField;
    dbMainLOGIN_DT: TStringField;
    bsSkinLabel33: TbsSkinLabel;
    edBosangMsg: TRzMemo;
    dbMainLASTCNTRDT: TStringField;
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure dbMainAfterEdit(DataSet: TDataSet);
    procedure btnDetailClick(Sender: TObject);
    procedure userPassClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure edAcntNoChange(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure acntPassClick(Sender: TObject);
    procedure edUserIDExit(Sender: TObject);
    procedure dbMainBeforeDelete(DataSet: TDataSet);
    procedure edUserNickNameExit(Sender: TObject);
    procedure btnAcntMakeClick(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
    procedure dbMainBeforeEdit(DataSet: TDataSet);
    procedure dbMemoBeforePost(DataSet: TDataSet);
    procedure edInAmtExit(Sender: TObject);
    procedure edInAmtEnter(Sender: TObject);
    procedure btnInClick(Sender: TObject);
    procedure btnOutClick(Sender: TObject);
    procedure edInAmtKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ckGujaYnClick(Sender: TObject);
    procedure btnCntResetClick(Sender: TObject);
    procedure tmOpenTimer(Sender: TObject);
    procedure dbAcntBeforeDelete(DataSet: TDataSet);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure passInit(sFlag : String);
    procedure negoCmsnDelete(sData : String; sWhere : String='');
    procedure InOutProc(sIoTp : String; iAmt : Double);
    procedure InOutSendNM001(sData : String);
    procedure LoginCnt;
    procedure pgOpen;
    procedure AcntMstOpen(sId : String);
    function PosCheck(sId : String): Boolean;
  end;

var
  fmUser: TfmUser;

implementation

uses StdUtils, MMastDB, MDelay, MUserFilter, MAcntMake, MNegoCmsn;

{$R *.dfm}

{ TfmSample }

procedure TfmUser.acntPassClick(Sender: TObject);
begin
  inherited;
  passInit('ACNT');
end;

procedure TfmUser.bsSkinButton1Click(Sender: TObject);
begin
  inherited;
  fmNegoCmsn_Run(dbMain.FieldByName('USER_ID').AsString, dbMain.FieldByName('USER_NM').AsString, dbAcnt.FieldByName('ACNT_NO').AsString, dbAcnt.FieldByName('ACNT_TP').AsString);
end;

procedure TfmUser.btnInClick(Sender: TObject);
var
  sSql, sRlst, sAcntTp : String;
begin
  inherited;
  sAcntTp := dbAcnt.FieldByName('ACNT_NO').AsString;

  if bsMsgYesNo('[ ' + dbAcnt.FieldByName('USER_NM').AsString + ' ] 님 [' + FormatFloat(__FORMAT_AMT, TextToFloat(edInAmt.Text)) +'] 원 ' + '입금처리 하시겠습니까?', '입금처리') then
  begin
    if CompareValue(TextToFloat(edInAmt.Text),0) <= 0  then
    begin
      bsMsgError('입금금액을 확인하세요!');
      Exit;
    end;
    InOutProc('1', TextToFloat(edInAmt.Text));

    AcntMstOpen(dbAcnt.FieldByName('USER_ID').AsString);

    dbAcnt.Locate('ACNT_NO', sAcntTp, []);
  end;
  edInAmt.Text := '0';
end;

procedure TfmUser.btnAcntMakeClick(Sender: TObject);
var
  sRslt : BOOLEAN;
  sSql  : String;
begin
  inherited;
  sRslt := fmAcntMake_Run(dbMain.FieldByName('USER_ID').AsString, dbMain.FieldByName('USER_NM').AsString);

  if sRslt then
  begin
    AcntMstOpen(dbMain.FieldByName('USER_ID').AsString);
  end;

end;

procedure TfmUser.btnCntResetClick(Sender: TObject);
begin
  inherited;
  LoginCnt;
end;

procedure TfmUser.btnDeleteClick(Sender: TObject);
var
  sSql : String;
begin
  Case pgMain.ActivePageIndex of
    0 : begin
//          DeleteWork(dbMain);
        with dbMain do
          begin
            if Bof and Eof then Exit;

            if bsMsgYesNo('회원정보 및 계좌정보를 삭제하시겠습니까?') then Delete;
          end;
        end;
    1 : begin
//          bsMsgInfo('[ '+ dbacnt.FieldByName('ACNT_NO').AsString +' ]' + '계좌 삭제선택!');
//          DeleteWork(dbAcnt);
          with dbAcnt do
          begin
            if Bof and Eof then Exit;

            if bsMsgYesNo('[ '+ FieldByName('ACNT_NO').AsString +' ]' + '계좌를 삭제하시겠습니까?') then
            begin
              sSql := Format('AND ACNT_NO = %s',[QuotedStr(FieldByName('ACNT_NO').AsString)]);
              negoCmsnDelete(FieldByName('USER_ID').AsString, sSql);
              Delete;
            end;
          end;
        end;
  end;
end;

procedure TfmUser.btnDetailClick(Sender: TObject);
var
  sSQL: String;
begin
  inherited;

  sSQL := UserFilter_Run;

  if sSQL <> '' then _sMainWhere := sSQL;

  MainTableOpen;
end;

procedure TfmUser.userPassClick(Sender: TObject);
begin
  inherited;
  passInit('USER');
end;

procedure TfmUser.btnEditClick(Sender: TObject);
begin
  Case pgMain.ActivePageIndex of
    0 : begin
          EditWork(dbMain);
        end;
    1 : begin
          EditWork(dbAcnt);
        end;
  end;
end;

procedure TfmUser.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmUser.btnFilterClick(Sender: TObject);
begin
	if edFind.Text = '' then _sMainWhere := ''
  else
  	_sMainWhere := StrReplace(__Find_User, '<X>', edFind.Text);

  LoginCnt;

  inherited;
end;

procedure TfmUser.btnInsertClick(Sender: TObject);
begin
  Case pgMain.ActivePageIndex of
    0 : begin
          edUserID.SetFocus;
          AppendWork(dbMain);
        end;
    1 : begin
          bsMsgInfo('주문계좌는 추가 불가능합니다.');
        end;
    2 : begin
          cbPartNm.SetFocus;
          AppendWork(dbMemo);
        end;
  end;
end;

procedure TfmUser.btnOutClick(Sender: TObject);
var
  sSql , sAcntTp: String;
begin
  inherited;
  sAcntTp := dbAcnt.FieldByName('ACNT_NO').AsString;

  if bsMsgYesNo('[ ' + dbAcnt.FieldByName('USER_NM').AsString + ' ] 님 [' + FormatFloat(__FORMAT_AMT, TextToFloat(edOutAmt.Text)) + '] 원 ' + '출금처리 하시겠습니까?', '출금처리') then
  begin
    if CompareValue(TextToFloat(edOutAmt.Text),0) <= 0  then
    begin
      bsMsgError('출금금액을 확인하세요!');
      Exit;
    end;

    if CompareValue(TextToFloat(edOutAcntAmt.Text), TextToFloat(edOutAmt.Text)) < 0 then
    begin
      bsMsgError('출금가능금액을 초과하였습니다!');
      Exit;
    end;

    InOutProc('2', TextToFloat(edOutAmt.Text));

    AcntMstOpen(dbAcnt.FieldByName('USER_ID').AsString);

    dbAcnt.Locate('ACNT_NO', sAcntTp, []);
  end;
  edOutAmt.Text := '0';
end;

procedure TfmUser.btnPostClick(Sender: TObject);
var
  sSql, sAcntTp : String;
  sGujaCnt : Integer;
begin
  Case pgMain.ActivePageIndex of
    0 : begin
          PostWork(dbMain);
        end;
    1 : begin
          sAcntTp := dbAcnt.FieldByName('ACNT_NO').AsString;

          if Not ckGujaYn.Checked then
          begin
            sGujaCnt := -1;
          end
          else sGujaCnt := StrToInt(edGujaMaxCnt.Text);

          sSql := Format('UPDATE ACNT_MST SET NEGO_GUJA_MAXCNT = %d WHERE ACNT_NO = %s',
                         [sGujaCnt, QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString)]);
          Uni_Open(MastDB.dbExec, sSql);

          PostWork(dbAcnt);

          AcntMstOpen(dbAcnt.FieldByName('USER_ID').AsString);

          dbAcnt.Locate('ACNT_NO', sAcntTp, []);

        end;
    2 : begin
          PostWork(dbMemo);
        end;
  end;
end;

procedure TfmUser.ckGujaYnClick(Sender: TObject);
begin
  inherited;
  edGujaMaxCnt.ReadOnly := Not ckGujaYn.Checked;
end;

procedure TfmUser.dbAcntBeforeDelete(DataSet: TDataSet);
var
  bRslt : Boolean;
begin
  inherited;
  with DataSet do
  begin
    bRslt := PosCheck(FieldByName('USER_ID').AsString);
    if bRslt = False then
    begin
      bsMsgError('미체결주문 및 미청산포지션이 있을경우 삭제 불가능합니다.');
      Abort;
      Cancel;
    end;
  end;
end;

procedure TfmUser.dbMainAfterEdit(DataSet: TDataSet);
begin
  inherited;
  edUserID.ReadOnly := True;
end;

procedure TfmUser.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  edUserID.ReadOnly := False;
  edPass.ReadOnly := False;

	with DataSet do
  begin
    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmUser.dbMainBeforeDelete(DataSet: TDataSet);
var
  sSql : String;
  bRslt : Boolean;
begin
  inherited;
  with DataSet do
  begin
    if FieldByName('USER_GRADE').AsString = '9' then
    begin
      bsMsgError('슈퍼바이져 ID는 삭제 불가능합니다!');
      Abort;
      Cancel;
    end;

    bRslt := PosCheck(FieldByName('USER_ID').AsString);
    if bRslt = False then
    begin
      bsMsgError('미체결주문 및 미청산포지션이 있을경우 삭제 불가능합니다.');
      Abort;
      Cancel;
    end;

    //회원ID삭제시 계좌,개별수수료,개별공지,회원메모 전부 삭제
    sSql := Format('DELETE FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(FieldByName('USER_ID').AsString)]);
    Uni_Open(MastDB.dbSQL, sSql);

    negoCmsnDelete(FieldByName('USER_ID').AsString);

    sSql := Format('DELETE FROM NOTICE_MST WHERE USER_ID = %s', [QuotedStr(FieldByName('USER_ID').AsString)]);
    Uni_Open(MastDB.dbSQL, sSql);

    sSql := Format('DELETE FROM USER_MEMO WHERE USER_ID = %s', [QuotedStr(FieldByName('USER_ID').AsString)]);
    Uni_Open(MastDB.dbSQL, sSql);
  end;

end;

procedure TfmUser.dbMainBeforeEdit(DataSet: TDataSet);
var
  sSql : String;
begin
  inherited;
  with DataSet do
  begin
  
  end;
end;

procedure TfmUser.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg,  sRslt, sSql, sTrim : String;
  iRslt : Integer;
begin
  inherited;

	with DataSet do
  begin
  	sMsg := '';
  	// 필수입력값 체크
    if FieldByName('USER_ID').AsString = ''        then sMsg := '회원ID';
    if FieldByName('USER_NICK_NM').AsString = ''   then sMsg := '회원필명';
    if FieldByName('USER_NM').AsString = ''        then sMsg := '회원명';
    if FieldByName('USER_GRADE').AsString = ''     then sMsg := '회원등급';
//    if FieldByName('REG_DT').AsString = ''         then sMsg := '등록일자';
    if FieldByName('USER_PWD').AsString = ''       then sMsg := '비밀번호';
    if FieldByName('SERVER_IP').AsString = ''      then sMsg := '접속IP';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

    FieldByName('UPDATE_MNG_ID').AsString := __Login_ID;

    if State in [dsInsert] then
    begin
      FieldByName('REG_DT').AsDateTime := Date;

//      sSql := 'SELECT DUP_YN FROM CORP_MST';
//      Uni_Open(MastDB.dbSQL, sSql);
//      ShowMessage(MastDB.dbSQL.FieldByName('DUP_YN').AsString);
//      FieldByName('NEGO_DUP_YN').AsString := MastDB.dbSQL.FieldByName('DUP_YN').AsString;

      dbMain.FieldByName('USER_ID').AsString := UpperCase(Trim(StrReplace(dbMain.FieldByName('USER_ID').AsString, ' ', '')));

      fmAcntMake_Run(dbMain.FieldByName('USER_ID').AsString, dbMain.FieldByName('USER_NM').AsString);

      if FieldByName('PARTNER_NICK_NM').AsString <> '' then
      begin                         
        sSql := Format('SELECT USER_ID,USER_NM FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(FieldByName('PARTNER_NICK_NM').AsString)]);
        Uni_Open(MastDB.dbSQL, sSql);

        FieldByName('PARTNER_ID').AsString := MastDB.dbSQL.FieldByName('USER_ID').AsString;
        FieldByName('PARTNER_NM').AsString := MastDB.dbSQL.FieldByName('USER_NM').AsString;

      end;

    end;

    if State in [dsEdit] then
    begin
      if FieldByName('USER_NM').OldValue <> FieldByName('USER_NM').NewValue then
      begin
        sSql := Format('UPDATE ACNT_MST SET USER_NM = %s WHERE USER_ID = %s',
                       [QuotedStr(FieldByName('USER_NM').AsString),
                        QuotedStr(FieldByName('USER_ID').AsString)]);
        Uni_Open(MastDB.dbSql, sSql);
      end;

      if FieldByName('PARTNER_NICK_NM').OldValue <> FieldByName('PARTNER_NICK_NM').NewValue then
      begin
        sSql := Format('SELECT USER_ID,USER_NM FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(FieldByName('PARTNER_NICK_NM').AsString)]);
        Uni_Open(MastDB.dbSQL, sSql);

        sSql := Format('UPDATE USER_MST SET PARTNER_ID = %s ,PARTNER_NM = %s WHERE USER_ID = %s',
                       [QuotedStr(MastDB.dbSQL.FieldByName('USER_ID').AsString),
                        QuotedStr(MastDB.dbSQL.FieldByName('USER_NM').AsString),
                        QuotedStr(FieldByName('USER_ID').AsString)]);
        Uni_Open(MastDB.dbSQL, sSql);
      end;

      if FieldByName('USER_GRADE').AsString = '3' then
      begin
        if (FieldByName('USER_NM').OldValue <> FieldByName('USER_NM').NewValue) or (FieldByName('USER_NICK_NM').OldValue <> FieldByName('USER_NICK_NM').NewValue) then
        begin
          sSql := Format('UPDATE USER_MST SET PARTNER_NM = %s, PARTNER_NICK_NM = %s WHERE PARTNER_ID = %s',
                         [QuotedStr(FieldByName('USER_NM').AsString),
                          QuotedStr(FieldByName('USER_NICK_NM').AsString),
                          QuotedStr(FieldByName('USER_ID').AsString)]);
          Uni_Open(MastDB.dbExec, sSql);
        end;
      end;

    end;

    FieldByName('USER_ID').AsString := UpperCase(FieldByName('USER_ID').AsString);
  end;
end;

procedure TfmUser.dbMemoBeforePost(DataSet: TDataSet);
var
  sMsg : String;
begin
  inherited;
  with DataSet do
  begin
    sMsg := '';
    // 필수입력값 체크
    if FieldByName('PART_NM').AsString = ''         then sMsg := '구분명';
    if FieldByName('UM_TITLE').AsString = ''        then sMsg := '제목';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

    if State in [dsInsert] then
    begin
      dbMemo.FieldByName('USER_ID').AsString := dbMain.FieldByName('USER_ID').AsString;
      dbMemo.FieldByName('UM_DT').AsDateTime := Date;
    end;
  end;
end;

procedure TfmUser.edAcntNoChange(Sender: TObject);
var
  sSql : String;
  iAmt, iPosAmt : Double;
begin
  inherited;
	if edAcntNo.Text = '' then
  begin
    pnAcnt.Caption  := '계좌번호 [ ]';
    pnInout.Caption := '계좌번호 [ ]';
    Exit;
  end;

  if pgMain.ActivePageIndex = 1 then
  begin
    pnAcnt.Caption  := Format('계좌번호 [%s]', [dbAcnt.FieldByName('ACNT_NO').AsString]);

    sSql := Format('SELECT dbo.FT_GUJA_MAX_CNT(%s,%s) AS RSLT',
                     [QuotedStr(dbAcnt.FieldByName('ACNT_TP').AsString),
                      QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString)]);
    Uni_Open(MastDB.dbSql, sSql);

    edGujaMaxCnt.Text := MastDB.dbSql.FieldByName('RSLT').AsString;

    ckGujaYn.Checked := dbAcnt.FieldByName('NEGO_GUJA_MAXCNT').AsInteger <> -1;
  end;

  if pgMain.ActivePageIndex = 3 then
  begin
    pnInout.Caption := Format('계좌번호 [%s]', [dbAcnt.FieldByName('ACNT_NO').AsString]);

    with dbAcnt do
    begin
      iAmt:= FieldByName('ACNT_AMT').AsFloat + FieldByName('CLR_PL').AsFloat - FieldByName('CMSN').AsFloat;

//      sSql := Format('SELECT COUNT(*) AS POSCNT FROM NCLR_POS WHERE ACNT_NO = %s', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
//      Uni_Open(MastDB.dbSQL, sSql);
//
//      sSql := Format('SELECT COUNT(*) AS QTYCNT FROM ORD WHERE ACNT_NO = %s AND REMN_QTY > 0', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
//      Uni_Open(MastDB.dbExec, sSql);
//
//      if (MastDB.dbSQL.FieldByName('POSCNT').AsInteger = 0) and (MastDB.dbExec.FieldByName('QTYCNT').AsInteger = 0) then iPosAmt := iAmt
//      else iPosAmt := 0;

      edInAcntAmt.Text  := FormatFloat(__FORMAT_AMT, iAmt);
      edOutAcntAmt.Text := FormatFloat(__FORMAT_AMT, iAmt);
//      edPosAmt.Text     := FormatFloat(__FORMAT_AMT, iPosAmt);
    end;
  end;

end;

procedure TfmUser.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmUser.edInAmtEnter(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).Text := StrReplace(TRzEdit(Sender).Text, ',', '');
//  edInAmt.Text := StrReplace(edInAmt.Text, ',', '');
end;

procedure TfmUser.edInAmtExit(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).Text := FormatFloat(__FORMAT_AMT, StrToFloatDef(TRzEdit(Sender).Text, 0));
//  edInAmt.Text := FormatFloat(__FORMAT_AMT, StrToFloatDef(edInAmt.Text, 0));
end;

procedure TfmUser.edInAmtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnIn.ButtonClick;
end;

procedure TfmUser.edUserIDChange(Sender: TObject);
var
  sGrade, sSql : String;
begin
  inherited;

	if edUserID.Text = '' then Exit;
  pnUser.Caption  := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
  pnUmNm.Caption  := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
  pnLogin.Caption := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);

  if __Supervisor then sGrade := '9'
  else sGrade := '8';

  cbUser_Grade.ReadOnly := dbMain.FieldByName('USER_GRADE').AsString = sGrade;

  tmOpen.Enabled := False;
  tmOpen.Enabled := True;
//  pgOpen;

end;

procedure TfmUser.edUserIDExit(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  lbAlert.Caption := '';

  if (dbMain.State in [dsBrowse]) or (edUserID.Text = '') then Exit;

  if dbMain.State in [dsInsert] then
  begin
    with MastDB.dbSQL do
    begin

        sSql := Format('SELECT COUNT(1) AS CNT FROM USER_MST WHERE USER_ID = %s', [QuotedStr(edUserID.Text)]);

        Uni_Open(MastDB.dbSQL, sSql);

        if FieldByName('CNT').AsInteger > 0 then
        begin
          lbAlert.Visible := TRUE;
          lbAlert.Caption := '중복된 ID 입니다..';
          dbMain.FieldByName('USER_ID').AsString := '';
          edUserID.SetFocus;
        end;
    end;
  end;

end;

procedure TfmUser.edUserNickNameExit(Sender: TObject);
var
  sSql : String;
begin
  inherited;
  lbAlert.Caption := '';

  if (dbMain.State in [dsBrowse]) or (edUserID.Text = '') then Exit;

  if dbMain.FieldByName('USER_NICK_NM').OldValue = dbMain.FieldByName('USER_NICK_NM').NewValue then Exit;

  with MastDB.dbSQL do
  begin

      sSql := Format('SELECT COUNT(1) AS CNT FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(edUserNickName.Text)]);

      Uni_Open(MastDB.dbSQL, sSql);

      if FieldByName('CNT').AsInteger > 0 then
      begin
        lbAlert.Visible := TRUE;
        lbAlert.Caption := '중복된 회원필명 입니다..';
        dbMain.FieldByName('USER_NICK_NM').AsString := '';
        edUserNickName.SetFocus;
      end;
  end;


  with MastDB.dbSQL do
  begin

      sSql := Format('SELECT COUNT(1) AS CNT FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(edUserNickName.Text)]);

      Uni_Open(MastDB.dbSQL, sSql);

      if FieldByName('CNT').AsInteger > 0 then
      begin
        lbAlert.Visible := TRUE;
        lbAlert.Caption := '중복된 회원필명 입니다..';
        dbMain.FieldByName('USER_NICK_NM').AsString := '';
        edUserNickName.SetFocus;
      end;
  end;

end;

procedure TfmUser.FormShow(Sender: TObject);
var
  sCd, sSql : String;
begin
  inherited;
  pgMain.ActivePageIndex := 0;

  if UpperCase(Copy(__Login_ID,1,2)) = 'TM' then edPass.PasswordChar := #7;


  if __Supervisor then sCd := '9' else sCd := '8';

	PartTableOpen(lbxPart, '회원분류', '[전체]', 'ALL');
	PartTableOpen(cbUserPart, '회원분류');
	PartTableOpen(TComponent(gdMain.Columns[4]), '회원분류');
  PartTableOpen(cbServerIP, '@|SERVER_NM, SERVER_IP|SERVER_MST');
  PartTableOpen(rgType, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE < %s ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE'),QuotedStr(sCd)]), '[전체]', '0');
  PartTableOpen(cbUser_Grade, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE < %s ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE'),QuotedStr(sCd)]));
	PartTableOpen(TComponent(gdMain.Columns[3]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE')]));
  PartTableOpen(TComponent(gdAcnt.Columns[1]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));
  PartTableOpen(TComponent(gdInOut.Columns[1]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));
  PartTableOpen(cbAcntStat2, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_STATE')]));
  PartTableOpen(cbPartnerNick, Format('@|USER_NICK_NM, USER_NICK_NM|USER_MST|WHERE USER_GRADE IN (%s,%s)', [QuotedStr('3'),QuotedStr('6')]));
  PartTableOpen(cbPartNm, Format('@|PART_NM, PART_NM|PART_MST|WHERE PART_TP = %s' , [QuotedStr('메모분류')]));
  PartTableOpen(cbApiIp, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('API_TP')]));

  with rgType do
  begin
    Tag := 1;
    ItemIndex := 2;
    Tag := 0;
  end;

	_sMainWhere := '';

  _sMainWhere := 'USER_GRADE = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

//  //계좌DB
//  sSql := 'SELECT * FROM ACNT_MST';
//  Uni_Open(dbAcnt,sSql);
//
//  //회원상담
//  sSql := 'SELECT * FROM USER_MEMO';
//  Uni_Open(dbMemo,sSql);
  pgOpen;

  LoginCnt;
end;

procedure TfmUser.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then
    begin
      IndexFieldNames := Column.FieldName + ' Desc';
      First;
    end
    else
    begin
      IndexFieldNames := Column.FieldName;
      First;
    end;
  end;
end;

procedure TfmUser.InOutProc(sIoTp : String; iAmt : Double);
var
  sSql, sRlst, sTpNm, sMsg, sBosangMsg : String;
begin
  if sIoTp = '1' then
  begin
   sTpNm := '입금';
   sBosangMsg := edBosangMsg.Text;
  end;
  if sIoTp = '2' then
  begin
   sTpNm := '출금';
   sBosangMsg := '';
  end;

  sSql := Format('PT_REQ_INOUT %s,%s,%s,%s,%s,%g,%s,%s,%s',
                   [QuotedStr(sIoTp),
                    QuotedStr(dbAcnt.FieldByName('USER_ID').AsString),
                    QuotedStr(dbAcnt.FieldByName('ACNT_TP').AsString),
                    QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString),
                    QuotedStr(dbAcnt.FieldByName('ACNT_PWD').AsString),
                    iAmt,
                    QuotedStr('1'),
                    QuotedStr(__Login_ID),
                    QuotedStr(sBosangMsg)]);
  sRlst := Uni_Open(MastDB.dbExec, sSql);

  if sRlst = '' then
  begin
    sMsg := Format('[ %s ]원 관리자에 의해서 %s되었습니다.', [FormatFloat(__FORMAT_AMT, iAmt), sTpNm]);
    InOutSendNM001(sMsg);
    bsMsgInfo(sTpNm + '처리완료!');
    edBosangMsg.Clear;
  end
  else
  begin
    bsMsgError(sTpNm + '처리실패!');
  end;

end;

procedure TfmUser.InOutSendNM001(sData: String);
var
  NM001  : TNM001;
  sValue : String;
begin
  FillChar(NM001, SizeOf(NM001), ' ');
  StrToArr(NumToStr(SizeOf(NM001)),                            NM001.GT_HEADER.LENGTH);
  StrToArr('NM001',                                            NM001.GT_HEADER.PACKET_CD);
  StrToArr(UpperCase(dbAcnt.FieldByName('USER_ID').AsString),  NM001.GT_HEADER.USER_ID);
  StrToArr(dbAcnt.FieldByName('ACNT_TP').AsString,             NM001.GT_HEADER.ACNT_TP);
  StrToArr('0000',                                             NM001.GT_HEADER.ERR_CODE);
  StrToArr(NowMSecTime,                                        NM001.GT_HEADER.TM);
  StrToArr(sData,                                              NM001.NOTI_MSG);
  StrToArr('Y',                                                NM001.REFRESH_YN);

  sValue := RecordToStr(NM001, SizeOf(NM001));
  MastDB.iwNotiClient.DataToSend := sValue + __EOL;
end;

procedure TfmUser.lbxPartClick(Sender: TObject);
begin
  inherited;

  with rgType do
  begin
  	Tag := 1;
  	ItemIndex := 0;
  	Tag := 0;
  end;

  if lbxPart.ItemIndex = 0 then _sMainWhere := ''
  else _sMainWhere := Format('PART_CD = %s', [QuotedStr(lbxPart.Values[lbxPart.ItemIndex])]);

  MainTableOpen;
end;

procedure TfmUser.LoginCnt;
var
  sSql, sKo, sGf : String;
begin
  sSql := Format( 'SELECT (SELECT COUNT(*)                                                 '+
                  '        FROM ACNT_MST WHERE CONN_YN = %s AND ACNT_TP = %s) AS KO_CNT,   '+
                  '       (SELECT COUNT(*)                                                 '+
                  '        FROM ACNT_MST WHERE CONN_YN = %s AND ACNT_TP = %s) AS GF_CNT    ',
                  [QuotedStr('Y'),
                   QuotedStr('1'),
                   QuotedStr('Y'),
                   QuotedStr('2')]);

  Uni_Open(MastDB.dbSQL, sSql);

  sKo := MastDB.dbSQL.FieldByName('KO_CNT').AsString;
  sGf := MastDB.dbSQL.FieldByName('GF_CNT').AsString;

  lbConnUser.Caption := '국내접속 : ' + sKo + '명  /  해외접속 : ' + sGf + '명';
end;

procedure TfmUser.MainTableOpen;
var
  sGrade: String;
begin
  with dbMain do
  begin
  	try
      Delay_Show();

      Close;
      SQL.Text := Format('SELECT                ' +
                  '  0 AS CHECK_TF     , ' +
                  '  USER_ID					 , ' +
                  '  USER_NM           , ' +
                  '  USER_NICK_NM      , ' +
                  '  USER_PWD          , ' +
                  '  USER_GRADE        , ' +
                  '  PART_CD           , ' +
                  '  PART_NM           , ' +
                  '  USER_BANK         , ' +
                  '  USER_BANK_ACNT    , ' +
                  '  USER_BANK_ACNT_NM , ' +
                  '  PARTNER_ID        , ' +
                  '  PARTNER_NM        , ' +
                  '  PARTNER_NICK_NM   , ' +
                  '  REG_DT            , ' +
                  '  SERVER_IP         , ' +
                  '  BIRTH_DT          , ' +
                  '  UPDATE_MNG_ID     , ' +
                  '  UPDATE_DT         , ' +
                  '  UPDATE_TM         , ' +
                  '  UPDATE_IP         , ' +
                  '  USER_ADDR         , ' +
                  '  USER_EMAIL        , ' +
                  '  USER_TEL          , ' +
                  '  USER_HP           , ' +
                  '  USER_BIGO         , ' +
                  ' CASE WHEN (SELECT COUNT(1) FROM CNTR WHERE USER_ID = A.USER_ID) > 0 THEN (SELECT CURR_TRADE_DT FROM CORP_MST) ELSE (SELECT MAX(CNTR_DT) FROM CNTR_HIS WHERE USER_ID = A.USER_ID) END LASTCNTRDT , ' +
                  ' (SELECT MAX(LOGIN_DT) FROM LOGIN_HIS WHERE USER_ID = A.USER_ID AND LOGIN_TP = %s AND APP_TP = %s) AS LOGIN_DT ' +
                  'FROM                  ' +
                  '  USER_MST A   ',
                  [QuotedStr('I'),
                   QuotedStr('C')]);

      SQL.Add(Format('WHERE USER_ID = %s ', [QuotedStr(__Login_ID)]));

      if _sMainWhere <> '' then SQL.Add(Format('OR (%s)', [_sMainWhere]))
      else
      begin
        if __Supervisor then sGrade := '9'
        else sGrade := '8';

        SQL.Add(Format('OR USER_GRADE <= %s', [sGrade]));

        if sGrade = '8' then _sMainWhere := _sMainWhere + __MNGSQL;
      end;

      Open;
    finally
      Delay_Hide;
    end;
  end;
end;

procedure TfmUser.negoCmsnDelete(sData : String; sWhere : String='');
var
  sSql : String;
begin
  sSql := Format('DELETE FROM NEGO_CMSN WHERE USER_ID = %s' + sWhere, [QuotedStr(sData)]);
  Uni_Open(MastDB.dbSQL, sSql);
end;

procedure TfmUser.passInit(sFlag : String);
var
  sVal : String;
  sData : TUniQuery;
begin
  if bsMsgYesNo('비밀번호 초기화 하시겠습니까? \n\n [1111]로 변경됩니다.') then
  begin

    if sFlag = 'USER' then
    begin
      with dbMain do
        begin
          Edit;
          FieldByName('USER_PWD').AsString := '1111';
          Post;
        end;
    end;

    if sFlag = 'ACNT' then
    begin
      with dbAcnt do
      begin
        Edit;
        FieldByName('ACNT_PWD').AsString := '1111';
        Post;
      end;
    end;

    bsMsgInfo('처리되었습니다.');

  end;
end;

procedure TfmUser.pgMainChange(Sender: TObject);
begin
  inherited;
  pgOpen;
end;

procedure TfmUser.pgOpen;
var
  sSql : String;
begin
  if pgMain.ActivePageIndex = 0 then SuperViser.Visible := __Supervisor;
  
  if (pgMain.ActivePageIndex = 1) or (pgMain.ActivePageIndex = 3) then
  begin
    with dbAcnt do
    begin
      Close;
      SQL.Text := Format( 'SELECT '+
                          'ACNT_NO          ,'+
                          'ACNT_TP          ,'+
                          'USER_ID          ,'+
                          'USER_NM          ,'+
                          'ACNT_PWD         ,'+
                          'GUJA_CNT         ,'+
                          'NEGO_GUJA_MAXCNT ,'+
                          'API_TP           ,'+
                          'BF_ACNT_AMT      ,'+
                          'ACNT_AMT         ,'+
                          'CLR_PL           ,'+
                          'CLR_PL_F         ,'+
                          'CMSN             ,'+
                          'CMSN_F           ,'+
                          'ACNT_STATE       ,'+
                          'CONN_YN          ,'+
                          'NEGO_DUP_YN      ,'+
                          'FIRST_DT         ,'+
                          'LOGIN_DT         ,'+
                          'LOGIN_TM         ,'+
                          'LOGIN_IP         ,'+
                          'ACNT_BIGO        ,'+
                          'LOSSCUT_YN       ,'+
                          'OVERNGT_YN       ,'+
                          'MINAMT_GUJA      ,'+
                          '(ACNT_AMT + CLR_PL - CMSN) AS PLAMT '+
                          'FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(dbMain.FieldByName('USER_ID').AsString)]);

      open;

      First;
    end;
  end;

  if pgMain.ActivePageIndex = 2 then
  begin
    with dbMemo do
    begin
      Close;
      SQL.Text := Format( 'SELECT '+
                          ' UM_SEQ   '+
                          ',USER_ID  '+
                          ',UM_DT    '+
                          ',PART_NM  '+
                          ',UM_TITLE '+
                          ',UM_BIGO  '+
                          'FROM USER_MEMO WHERE USER_ID = %s',
                          [QuotedStr(dbMain.FieldByName('USER_ID').AsString)]);

      open;

      First;
    end;
  end;

  if pgMain.ActivePageIndex = 4 then
  begin

    sSql := Format('SELECT                         '+
                   '     USER_ID,                  '+
                   '     LOGIN_DT,                 '+
                   '     LOGIN_TM,                 '+
                   '     LOGIN_IP,                 '+
                   '     ACNT_TP,                  '+
                   '     LOGIN_TP,                 '+
                   '     LOGIN_MAC,                '+
                   '     APP_TP,                   '+
                   '     HTS_VER,                  '+
                   '     COUNT(1) OVER() AS TOTCNT '+
                   'FROM LOGIN_HIS                 '+
                   'WHERE USER_ID = %s             '+
                   'ORDER BY LOGIN_DT DESC,LOGIN_TM DESC '
                   , [QuotedStr(dbMain.FieldByName('USER_ID').AsString)]);
    Uni_Open(dbLogin, sSql);

    PartTableOpen(TComponent(gdLogin.Columns[5]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));
    PartTableOpen(TComponent(gdLogin.Columns[6]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('LOGIN_TP')]));
//    PartTableOpen(TComponent(gdLogin.Columns[2]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('APP_TP')]));

    lbLogin.Caption := dbLogin.FieldByName('TOTCNT').AsString + ' 건';

  end;
end;

procedure TfmUser.rgTypeClick(Sender: TObject);
begin
  inherited;

  if rgType.Tag = 0 then
  begin
    if rgType.ItemIndex = 0 then _sMainWhere := ''
    else _sMainWhere := 'USER_GRADE = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

    MainTableOpen;

	  lbxPart.ItemIndex := 0;
  end;
end;

procedure TfmUser.AcntMstOpen(sId: String);
var
  sSql : String;
begin
  sSql := Format( 'SELECT '+
                  'ACNT_NO          ,'+
                  'ACNT_TP          ,'+
                  'USER_ID          ,'+
                  'USER_NM          ,'+
                  'ACNT_PWD         ,'+
                  'GUJA_CNT         ,'+
                  'NEGO_GUJA_MAXCNT ,'+
                  'API_TP           ,'+
                  'BF_ACNT_AMT      ,'+
                  'ACNT_AMT         ,'+
                  'CLR_PL           ,'+
                  'CLR_PL_F         ,'+
                  'CMSN             ,'+
                  'CMSN_F           ,'+
                  'ACNT_STATE       ,'+
                  'CONN_YN          ,'+
                  'NEGO_DUP_YN      ,'+
                  'FIRST_DT         ,'+
                  'LOGIN_DT         ,'+
                  'LOGIN_TM         ,'+
                  'LOGIN_IP         ,'+
                  'ACNT_BIGO        ,'+
                  'LOSSCUT_YN       ,'+
                  'OVERNGT_YN       ,'+
                  'MINAMT_GUJA      ,'+
                  '(ACNT_AMT + CLR_PL - CMSN) AS PLAMT '+
                  'FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(sId)]);

  Uni_Open(dbAcnt,sSql);

end;

procedure TfmUser.tmOpenTimer(Sender: TObject);
begin
  tmOpen.Enabled := False;

  pgOpen;
end;

function TfmUser.PosCheck(sId: String): Boolean;
var
  sSql : String;
  POSCNT, QTYCNT : Integer;
begin
  Result := True;

  sSql := Format('SELECT ACNT_NO FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(sId)]);
  Uni_Open(MastDB.dbSQL, sSql);

  with MastDB.dbSQL do
  begin
    while Not Eof do
    begin
      sSql := Format('SELECT COUNT(*) AS POSCNT FROM NCLR_POS WHERE ACNT_NO = %s', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
      Uni_Open(MastDB.dbExec, sSql);
      POSCNT := MastDB.dbExec.FieldByName('POSCNT').AsInteger;

      sSql := Format('SELECT COUNT(*) AS QTYCNT FROM ORD WHERE ACNT_NO = %s AND REMN_QTY > 0', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
      Uni_Open(MastDB.dbExec, sSql);
      QTYCNT := MastDB.dbExec.FieldByName('QTYCNT').AsInteger;

      if (POSCNT <> 0) or (QTYCNT <> 0) then
      begin
        Result := False;
        Break;
      end;

      Next;
    end;
  end;

end;

end.
