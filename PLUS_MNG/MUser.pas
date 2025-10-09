unit MUser;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, DBCtrls, Mask, math, ComCtrls, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsSkinTabs, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit, RzButton, RzLstBox, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit,
  RzRadChk, RzDBNav, RzDTP, RzDBDTP, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic, RzLabel, Menus, bsSkinMenus;

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
    btnPass: TbsSkinSpeedButton;
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
    ckGujaYn: TRzCheckBox;
    bsSkinTabSheet3: TbsSkinTabSheet;
    bsSkinLabel10: TbsSkinLabel;
    pnUmNm: TRzPanel;
    dsAcnt: TDataSource;
    gdUserMemo: TDBGridEh;
    dsMemo: TDataSource;
    cbPartNm: TkcRzDBComboBox;
    bsSkinLabel21: TbsSkinLabel;
    edUmTitle: TkcRzDBEdit;
    bsSkinLabel24: TbsSkinLabel;
    moUmBigo: TRzDBMemo;
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
    dsLogin: TDataSource;
    RzPanel7: TRzPanel;
    pnLogin: TRzPanel;
    lbLogin: TbsSkinLabel;
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
    bsSkinLabel32: TbsSkinLabel;
    edMinAmtGuja: TkcRzDBEdit;
    bsSkinLabel33: TbsSkinLabel;
    edInMsg: TRzMemo;
    dbLogin: TADOQuery;
    dbAcnt: TADOQuery;
    dbMemo: TADOQuery;
    cbxManagerSearch: TRzCheckBox;
    btnLoginManager: TbsSkinSpeedButton;
    bsSkinLabel34: TbsSkinLabel;
    cbUserBlack: TkcRzDBComboBox;
    bsSkinLabel35: TbsSkinLabel;
    cbBankCd: TkcRzDBComboBox;
    bsSkinLabel36: TbsSkinLabel;
    edPartnerNm: TkcRzDBEdit;
    bsSkinLabel40: TbsSkinLabel;
    cbMngUser: TkcRzDBComboBox;
    RzLabel1: TRzLabel;
    bsSkinLabel41: TbsSkinLabel;
    cbxLev: TkcRzDBComboBox;
    bsSkinLabel43: TbsSkinLabel;
    cbxOverNgtYN: TkcRzDBComboBox;
    cbxPLAmt: TkcRzDBEdit;
    bsSkinLabel44: TbsSkinLabel;
    bsSkinLabel46: TbsSkinLabel;
    cbxLevApply: TRzCheckBox;
    btnLev: TbsSkinButton;
    bsSkinButton4: TbsSkinButton;
    bsSkinLabel47: TbsSkinLabel;
    cbInGb: TkcRzDBComboBox;
    btnInMsgClear: TbsSkinButton;
    bsSkinLabel48: TbsSkinLabel;
    edOutMsg: TRzMemo;
    popBlockIP: TbsSkinPopupMenu;
    popbtnInputIP: TMenuItem;
    N4: TMenuItem;
    popbtnInputMac: TMenuItem;
    popbtnReleaseIP: TMenuItem;
    popbtnReleaseMac: TMenuItem;
    N2: TMenuItem;
    popbtnCopyIP: TMenuItem;
    popbtnCopyMac: TMenuItem;
    popbtnExcel: TMenuItem;
    N5: TMenuItem;
    edIP: TEdit;
    pnlLev: TRzPanel;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    RzPanel10: TRzPanel;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    cbxLev1: TRzCheckBox;
    cbxLev2: TRzCheckBox;
    cbxLev10: TRzCheckBox;
    cbxLev5: TRzCheckBox;
    cbxLev200: TRzCheckBox;
    cbxLev100: TRzCheckBox;
    cbxLev50: TRzCheckBox;
    cbxLev20: TRzCheckBox;
    btnLevSave: TbsSkinSpeedButton;
    btnLevCancel: TbsSkinSpeedButton;
    edGujaMaxCnt: TkcRzDBEdit;
    edLev: TkcRzDBEdit;
    bsSkinLabel49: TbsSkinLabel;
    edSign: TkcRzDBEdit;
    btnSign: TbsSkinSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure dbMainAfterEdit(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure dbMainBeforeDelete(DataSet: TDataSet);
    procedure dbMainBeforeEdit(DataSet: TDataSet);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure btnDetailClick(Sender: TObject);
    procedure btnPassClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure edAcntNoChange(Sender: TObject);
    procedure pgMainChange(Sender: TObject);
    procedure acntPassClick(Sender: TObject);
    procedure edUserIDExit(Sender: TObject);
    procedure edUserNickNameExit(Sender: TObject);
    procedure btnAcntMakeClick(Sender: TObject);
    procedure bsSkinButton1Click(Sender: TObject);
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
    procedure popbtnInputIPClick(Sender: TObject);
    procedure popbtnInputMacClick(Sender: TObject);
    procedure popbtnReleaseIPClick(Sender: TObject);
    procedure popbtnReleaseMacClick(Sender: TObject);
    procedure popbtnCopyIPClick(Sender: TObject);
    procedure popbtnCopyMacClick(Sender: TObject);
    procedure popbtnExcelClick(Sender: TObject);
    procedure btnInMsgClearClick(Sender: TObject);
    procedure btnLevClick(Sender: TObject);
    procedure btnLevCancelClick(Sender: TObject);
    procedure btnLevSaveClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure bsSkinButton4Click(Sender: TObject);
    procedure btnLoginManagerClick(Sender: TObject);
    procedure cbxManagerSearchClick(Sender: TObject);
    procedure dbAcntAfterOpen(DataSet: TDataSet);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure btnSignClick(Sender: TObject);
  private
    { Private declarations }
    procedure passInit(sFlag : String);
    procedure negoCmsnDelete(sData : String; sWhere : String='');
    procedure InOutProc(sIoTp : String; iAmt : Double);
    procedure LoginCnt;
    procedure LoginCntMerge;  // 통합
    procedure pgOpen;
    procedure AcntMstOpen(sId : String);
    function PosCheck(sId : String): Boolean;
    procedure prUserBlock(BlockYN: Boolean; sIP: String);
    function fnMainSql: string;
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure InOutSendNM001(sData : String);
  end;

var
  fmUser: TfmUser;

implementation

uses StdUtils, PacketStruct, MMastDB, MDelay, MUserFilter, MNegoCmsn,
  MArtcOpt, MAcntMake;

{$R *.dfm}

{ TfmUser }

procedure TfmUser.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmUser);
end;

procedure TfmUser.FormShow(Sender: TObject);
var
  iTop, iLeft : integer;
  sCd : String;
begin
  inherited;
  pnlLev.Top  := btnLev.Top - pnlLev.Height - 4;
  pnlLev.Left := btnLev.Left - (pnlLev.Width - btnLev.Width);

  pgMain.ActivePageIndex := 0;

  if UpperCase(Copy(_Login_ID,1,2)) = 'TM' then
    edPass.PasswordChar := #7; // 아스키코드 #7 : BEL(Bell), 경고

  if _Supervisor then sCd := '9'
                 else sCd := '8';

  if sCd = '9' then begin
    PartTableOpen(rgType,       CodeFormat('USER_GRADE', Format('AND CODE_VALUE < %s ORDER BY CODE_VALUE', [QuotedStr(sCd)])), '[전체]', '0');
    PartTableOpen(cbUser_Grade, CodeFormat('USER_GRADE', Format('AND CODE_VALUE < %s ORDER BY CODE_VALUE', [QuotedStr(sCd)]))); // 회원등급
  end else begin
    PartTableOpen(rgType,       CodeFormat('USER_GRADE', 'AND CODE_VALUE < ''7'' ORDER BY CODE_VALUE'), '[전체]', '0');
    PartTableOpen(cbUser_Grade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < ''7'' ORDER BY CODE_VALUE'));
  end;
  PartTableOpen(lbxPart, '회원분류', '[전체]', 'ALL');

  PartTableOpen(cbServerIP, '@|SERVER_NM, SERVER_IP|SERVER_MST');
  PartTableOpen(cbPartnerNick, Format('@|USER_NICK_NM+'',''+USER_NM, USER_ID|USER_MST|WHERE USER_GRADE IN (%s,%s)', [QuotedStr('3'),QuotedStr('6')]), '[없음]','');

// TODO : DB에 코드 만들것
//  PartTableOpen(cbUserBlack, '', '', '일반회원', '0', '관리회원', '1'); // 회원관리 / 관리회원
  cbUserBlack.Items.Add('일반회원');
  cbUserBlack.Values.Add('0');
  cbUserBlack.Items.Add('관리회원');
  cbUserBlack.Values.Add('1');

  PartTableOpen(cbUserPart, '회원분류','','');
  PartTableOpen(cbBankCd, '@|BANK_DISP_NM, BANK_CD|BANK_MST|ORDER BY BANK_CD');

  PartTableOpen(cbPartNm, '메모분류');
  PartTableOpen(cbInGb,   '관리자 입금분류');
  PartTableOpen(cbxLev, '@|LEVERAGE, LEVERAGE CD|LVG_MST|ORDER BY LEVERAGE');
  PartTableOpen(cbApiIp,  CodeFormat('API_TP'));
  PartTableOpen(cbAcntTp, CodeFormat('ACNT_TP', ' AND CODE_VALUE = ''0'' '), '','');
  PartTableOpen(cbAcntStat2, CodeFormat('ACNT_STATE'));

  PartTableOpen(TComponent(gdMain.Columns[3]), '회원분류');
  PartTableOpen(TComponent(gdMain.Columns[5]),  CodeFormat('ACNT_STATE'));
  PartTableOpen(TComponent(gdMain.Columns[6]),  Format('@|BANK_NM, BANK_CD|BANK_MST|WHERE BANK_CD = %s ORDER BY BANK_CD', ['BANK_CD']));
  PartTableOpen(TComponent(gdMain.Columns[3]),  CodeFormat('USER_GRADE', 'ORDER BY CODE_VALUE'));
  PartTableOpen(TComponent(gdAcnt.Columns[1]),  CodeFormat('ACNT_TP'));
  PartTableOpen(TComponent(gdInOut.Columns[1]), CodeFormat('ACNT_TP'));
  PartTableOpen(TComponent(gdLogin.Columns[5]), CodeFormat('ACNT_TP'));
  PartTableOpen(TComponent(gdLogin.Columns[6]), CodeFormat('LOGIN_TP'));

// TODO : DB에 코드 만들것
// TODO : 관리고객 표시 내용과 다름, 확인할것
  cbMngUser.Items.Add('정상');
  cbMngUser.Values.Add('0');
  cbMngUser.Items.Add('관리');
  cbMngUser.Values.Add('1');
  cbMngUser.ItemIndex := 0;

  with rgType do begin // Index를 바꾸면 Click 이벤트 발생됨
    Tag := 1;
    ItemIndex := 2;
    Tag := 0;
  end;

//  _sMainWhere := '';

  _sMainWhere := ' A.USER_GRADE = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

//  //계좌DB
//  sSql := 'SELECT * FROM ACNT_MST';
//  Uni_Open(dbAcnt,sSql);
//
//  //회원상담
//  sSql := 'SELECT * FROM USER_MEMO';
//  Uni_Open(dbMemo,sSql);
  pgOpen;

  //통합 LoginCnt;
  LoginCntMerge;
end;

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

procedure TfmUser.bsSkinButton4Click(Sender: TObject);
begin
  inherited;
  fmArtcOpt_Run(dbMain.FieldByName('USER_ID').AsString, dbMain.FieldByName('USER_NM').AsString);
end;

procedure TfmUser.btnInMsgClearClick(Sender: TObject);
begin
  inherited;
  edInMsg.Text := '';
end;

procedure TfmUser.btnAcntMakeClick(Sender: TObject);
var
  sRslt : BOOLEAN;
begin
  inherited;
  sRslt := fmAcntMake_Run(dbMain.FieldByName('USER_ID').AsString, dbMain.FieldByName('USER_NM').AsString);

  if sRslt then
    AcntMstOpen(dbMain.FieldByName('USER_ID').AsString);
end;

procedure TfmUser.btnCntResetClick(Sender: TObject);
begin
  inherited;
  //통합. LoginCnt;
  LoginCntMerge;
end;

procedure TfmUser.btnDeleteClick(Sender: TObject);
var
  sSql : String;
begin
  Case pgMain.ActivePageIndex of
    0 : begin
//    DeleteWork(dbMain);
      with dbMain do begin
        if Bof and Eof then Exit;

        if bsMsgYesNo('회원정보 및 계좌정보를 삭제하시겠습니까?') then Delete;
      end;
    end;
    1 : begin
//    bsMsgInfo('[ '+ dbacnt.FieldByName('ACNT_NO').AsString +' ]' + '계좌 삭제선택!');
//    DeleteWork(dbAcnt);
      with dbAcnt do begin
        if Bof and Eof then Exit;

        if bsMsgYesNo('[ '+ FieldByName('ACNT_NO').AsString +' ]' + '계좌를 삭제하시겠습니까?') then begin
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

procedure TfmUser.btnPassClick(Sender: TObject);
begin
  inherited;
  passInit('USER');
end;

procedure TfmUser.btnEditClick(Sender: TObject);
begin
  Case pgMain.ActivePageIndex of
    0 : EditWork(dbMain);
    1 : EditWork(dbAcnt);
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
                      else _sMainWhere := StrReplace(_Find_User, '<X>', edFind.Text);

  //통합. LoginCnt;
  LoginCntMerge;

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

procedure TfmUser.InOutProc(sIoTp : String; iAmt : Double);
var
  sSql, sRlst, sTpNm, sMsg, sBosangMsg : String;
begin
  if sIoTp = '1' then begin
    sTpNm := '입금';
    sBosangMsg := edInMsg.Text;
//    iInGb := cbInGb.ItemIndex; // TODO : 보상구분 추가할것
  end;
  if sIoTp = '2' then begin
    sTpNm := '출금';
    sBosangMsg := edOutMsg.Text;
  end;

  // TODO : iInGb (보상구분) 파라미터 추가할것
  sSql := Format('PT_REQ_INOUT %s,%s,%s,%s,%s,%g,%s,%s,%s',
                   [QuotedStr(sIoTp),
                    QuotedStr(dbAcnt.FieldByName('USER_ID').AsString),
                    QuotedStr(dbAcnt.FieldByName('ACNT_TP').AsString),
                    QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString),
                    QuotedStr(dbAcnt.FieldByName('ACNT_PWD').AsString),
                    iAmt,
                    QuotedStr('1'),
                    QuotedStr(_Login_ID),
                    QuotedStr(sBosangMsg)]);

  sRlst := fnSqlOpen(MastDB.dbExec, sSql);

  if sRlst = '' then begin
    sMsg := Format('[ %s ]원 관리자에 의해서 %s되었습니다.', [FormatFloat(FORMAT_AMT, iAmt), sTpNm]);
    InOutSendNM001(sMsg);
    bsMsgInfo(sTpNm + '처리완료!');
    if sIoTp = '1' then edInMsg.Text  := '' else
    if sIoTp = '2' then edOutMsg.Text := '';
  end else begin
    bsMsgError(sTpNm + '처리실패!');
  end;
end;

procedure TfmUser.btnInClick(Sender: TObject);
var
//  sSql, sRlst,
  sMsg, sAcntTp : String;
begin
  inherited;
  sAcntTp := dbAcnt.FieldByName('ACNT_NO').AsString;

  sMsg := '[ ' + dbAcnt.FieldByName('USER_NM').AsString + ' ] 님 ['
               + FormatFloat(FORMAT_AMT, TextToFloat(edInAmt.Text)) +'] 원 '
               + '입금처리 하시겠습니까?';

  if bsMsgYesNo(sMsg, '입금처리') then begin
    if CompareValue(TextToFloat(edInAmt.Text),0) <= 0  then begin
      bsMsgError('입금금액을 확인하세요!');
      Exit;
    end;
    InOutProc('1', TextToFloat(edInAmt.Text)); // 입금

    AcntMstOpen(dbAcnt.FieldByName('USER_ID').AsString);

    dbAcnt.Locate('ACNT_NO', sAcntTp, []);
  end;
  edInAmt.Text := '0';
end;

procedure TfmUser.btnOutClick(Sender: TObject);
var
  sMsg, sAcntTp: String;
begin
  inherited;
  sAcntTp := dbAcnt.FieldByName('ACNT_NO').AsString;

  sMsg := '[ ' + dbAcnt.FieldByName('USER_NM').AsString + ' ] 님 ['
               + FormatFloat(FORMAT_AMT, TextToFloat(edOutAmt.Text)) + '] 원 '
               + '출금처리 하시겠습니까?';
  if bsMsgYesNo(sMsg, '출금처리') then begin
    if CompareValue(TextToFloat(edOutAmt.Text),0) <= 0  then begin
      bsMsgError('출금금액을 확인하세요!');
      Exit;
    end;

    if CompareValue(TextToFloat(edOutAcntAmt.Text), TextToFloat(edOutAmt.Text)) < 0 then begin
      bsMsgError('출금가능금액을 초과하였습니다!');
      Exit;
    end;

    InOutProc('2', TextToFloat(edOutAmt.Text)); // 출금

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
    0 : PostWork(dbMain);
    1 : begin
      sAcntTp := dbAcnt.FieldByName('ACNT_NO').AsString;

      if ckGujaYn.Checked then sGujaCnt := StrToInt(edGujaMaxCnt.Text)
                          else sGujaCnt := -1;

      sSql := Format(
        'UPDATE ACNT_MST ' +
        '   SET NEGO_GUJA_MAXCNT = %d ' +
        ' WHERE ACNT_NO = %s ',
        [sGujaCnt,
         QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString) ]);
      fnSqlOpen(MastDB.dbExec, sSql);

      PostWork(dbAcnt);

      AcntMstOpen(dbAcnt.FieldByName('USER_ID').AsString);

      dbAcnt.Locate('ACNT_NO', sAcntTp, []);
    end;
    2 : PostWork(dbMemo);
  end;
end;

procedure TfmUser.cbxManagerSearchClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmUser.ckGujaYnClick(Sender: TObject);
begin
  inherited;
  edGujaMaxCnt.ReadOnly := Not ckGujaYn.Checked;
end;

procedure TfmUser.dbAcntAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('ACNT_AMT')).DisplayFormat := FORMAT_AMT;
  end;
end;

procedure TfmUser.dbAcntBeforeDelete(DataSet: TDataSet);
var
  bRslt : Boolean;
begin
  inherited;

  with DataSet do begin
    bRslt := PosCheck(FieldByName('USER_ID').AsString);
    if bRslt = False then begin
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
  edSign.ReadOnly := False;

  with DataSet do begin
    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmUser.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('ACNT_AMT')).DisplayFormat := FORMAT_AMT;
  end;
end;

procedure TfmUser.dbMainBeforeDelete(DataSet: TDataSet);
var
  sSql : String;
  bRslt : Boolean;
begin
  inherited;
  with DataSet do begin
    if FieldByName('USER_GRADE').AsString = '9' then begin
      bsMsgError('슈퍼바이져 ID는 삭제 불가능합니다!');
      Abort;
      Cancel;
    end;

    bRslt := PosCheck(FieldByName('USER_ID').AsString);
    if bRslt = False then begin
      bsMsgError('미체결주문 및 미청산포지션이 있을경우 삭제 불가능합니다.');
      Abort;
      Cancel;
    end;

    //회원ID삭제시 계좌,개별수수료,개별공지,회원메모 전부 삭제
    sSql := Format('DELETE FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(FieldByName('USER_ID').AsString)]);
    fnSqlOpen(MastDB.dbSQL, sSql);

    negoCmsnDelete(FieldByName('USER_ID').AsString);

    sSql := Format('DELETE FROM NOTICE_MST WHERE USER_ID = %s', [QuotedStr(FieldByName('USER_ID').AsString)]);
    fnSqlOpen(MastDB.dbSQL, sSql);

    sSql := Format('DELETE FROM USER_MEMO WHERE USER_ID = %s', [QuotedStr(FieldByName('USER_ID').AsString)]);
    fnSqlOpen(MastDB.dbSQL, sSql);
  end;
end;

procedure TfmUser.dbMainBeforeEdit(DataSet: TDataSet);
begin
  inherited;
  //
end;

procedure TfmUser.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg, sSql : String;
begin
  inherited;

  with DataSet do begin
    sMsg := '';
    // 필수입력값 체크
    if FieldByName('USER_ID').AsString = ''        then sMsg := '회원ID';
    if FieldByName('USER_NICK_NM').AsString = ''   then sMsg := '회원필명';
    if FieldByName('USER_NM').AsString = ''        then sMsg := '회원명';
    if FieldByName('USER_GRADE').AsString = ''     then sMsg := '회원등급';
//    if FieldByName('REG_DT').AsString = ''         then sMsg := '등록일자';
    if FieldByName('USER_PWD').AsString = ''       then sMsg := '비밀번호';
    if FieldByName('SERVER_IP').AsString = ''      then sMsg := '접속IP';

    if sMsg <> '' then begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

    FieldByName('UPDATE_MNG_ID').AsString := _Login_ID;

    if State in [dsInsert] then begin
      FieldByName('REG_DT').AsDateTime := Date;

//      sSql := 'SELECT DUP_YN FROM CORP_MST';
//      Uni_Open(MastDB.dbSQL, sSql);
//      ShowMessage(MastDB.dbSQL.FieldByName('DUP_YN').AsString);
//      FieldByName('NEGO_DUP_YN').AsString := MastDB.dbSQL.FieldByName('DUP_YN').AsString;

      dbMain.FieldByName('USER_ID').AsString := UpperCase(Trim(StrReplace(dbMain.FieldByName('USER_ID').AsString, ' ', '')));

      fmAcntMake_Run(dbMain.FieldByName('USER_ID').AsString, dbMain.FieldByName('USER_NM').AsString);

      if FieldByName('PARTNER_NICK_NM').AsString <> '' then begin
        sSql := Format('SELECT USER_ID, USER_NM FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(FieldByName('PARTNER_NICK_NM').AsString)]);
        fnSqlOpen(MastDB.dbSQL, sSql);

        FieldByName('PARTNER_ID').AsString := MastDB.dbSQL.FieldByName('USER_ID').AsString;
        FieldByName('PARTNER_NM').AsString := MastDB.dbSQL.FieldByName('USER_NM').AsString;
      end;
    end;

    if State in [dsEdit] then begin
      if FieldByName('USER_NM').OldValue <> FieldByName('USER_NM').NewValue then begin
        sSql := Format('UPDATE ACNT_MST SET USER_NM = %s WHERE USER_ID = %s',
                       [QuotedStr(FieldByName('USER_NM').AsString),
                        QuotedStr(FieldByName('USER_ID').AsString)]);
        fnSqlOpen(MastDB.dbSql, sSql);
      end;

      if FieldByName('PARTNER_NICK_NM').OldValue <> FieldByName('PARTNER_NICK_NM').NewValue then begin
        sSql := Format('SELECT USER_ID, USER_NM FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(FieldByName('PARTNER_NICK_NM').AsString)]);
        fnSqlOpen(MastDB.dbSQL, sSql);

        sSql := Format('UPDATE USER_MST SET PARTNER_ID = %s ,PARTNER_NM = %s WHERE USER_ID = %s',
                       [QuotedStr(MastDB.dbSQL.FieldByName('USER_ID').AsString),
                        QuotedStr(MastDB.dbSQL.FieldByName('USER_NM').AsString),
                        QuotedStr(FieldByName('USER_ID').AsString)]);
        fnSqlOpen(MastDB.dbSQL, sSql);
      end;

      if FieldByName('USER_GRADE').AsString = '3' then begin
        if (FieldByName('USER_NM').OldValue <> FieldByName('USER_NM').NewValue) or (FieldByName('USER_NICK_NM').OldValue <> FieldByName('USER_NICK_NM').NewValue) then
        begin
          sSql := Format('UPDATE USER_MST SET PARTNER_NM = %s, PARTNER_NICK_NM = %s WHERE PARTNER_ID = %s',
                         [QuotedStr(FieldByName('USER_NM').AsString),
                          QuotedStr(FieldByName('USER_NICK_NM').AsString),
                          QuotedStr(FieldByName('USER_ID').AsString)]);
          fnSqlOpen(MastDB.dbExec, sSql);
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

  with DataSet do begin
    sMsg := '';
    // 필수입력값 체크
    if FieldByName('PART_NM').AsString  = '' then sMsg := '구분명';
    if FieldByName('UM_TITLE').AsString = '' then sMsg := '제목';

    if sMsg <> '' then begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

    if State in [dsInsert] then begin
      dbMemo.FieldByName('USER_ID').AsString := dbMain.FieldByName('USER_ID').AsString;
      dbMemo.FieldByName('UM_DT').AsDateTime := Date;
    end;
  end;
end;

procedure TfmUser.edAcntNoChange(Sender: TObject);
var
  sSql : String;
  iAmt : Double;
begin
  inherited;
  if edAcntNo.Text = '' then begin
    pnAcnt.Caption  := '계좌번호 [ ]';
    pnInout.Caption := '계좌번호 [ ]';
    Exit;
  end;

  if pgMain.ActivePageIndex = 1 then begin
    pnAcnt.Caption  := Format('계좌번호 [%s]', [dbAcnt.FieldByName('ACNT_NO').AsString]);

    sSql := Format('SELECT dbo.FT_GUJA_MAX_CNT(%s,%s) AS RSLT',
                     [QuotedStr(dbAcnt.FieldByName('ACNT_TP').AsString),
                      QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString)]);
    fnSqlOpen(MastDB.dbSql, sSql);

    edGujaMaxCnt.Text := MastDB.dbSql.FieldByName('RSLT').AsString;

    ckGujaYn.Checked := dbAcnt.FieldByName('NEGO_GUJA_MAXCNT').AsInteger <> -1;
  end;

  if pgMain.ActivePageIndex = 3 then begin
    pnInout.Caption := Format('계좌번호 [%s]', [dbAcnt.FieldByName('ACNT_NO').AsString]);

    with dbAcnt do begin
      iAmt:= FieldByName('ACNT_AMT').AsFloat + FieldByName('CLR_PL').AsFloat - FieldByName('CMSN').AsFloat;

//      sSql := Format('SELECT COUNT(*) AS POSCNT FROM NCLR_POS WHERE ACNT_NO = %s', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
//      Uni_Open(MastDB.dbSQL, sSql);
//
//      sSql := Format('SELECT COUNT(*) AS QTYCNT FROM ORD WHERE ACNT_NO = %s AND REMN_QTY > 0', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
//      Uni_Open(MastDB.dbExec, sSql);
//
//      if (MastDB.dbSQL.FieldByName('POSCNT').AsInteger = 0) and (MastDB.dbExec.FieldByName('QTYCNT').AsInteger = 0) then iPosAmt := iAmt
//      else iPosAmt := 0;

      edInAcntAmt.Text  := FormatFloat(FORMAT_AMT, iAmt);
      edOutAcntAmt.Text := FormatFloat(FORMAT_AMT, iAmt);
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
  TRzEdit(Sender).Text := FormatFloat(FORMAT_AMT, StrToFloatDef(TRzEdit(Sender).Text, 0));
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
  sGrade : String;
begin
  inherited;

  if edUserID.Text = '' then Exit;

  pnUser.Caption  := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
  pnUmNm.Caption  := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
//  pnLogin.Caption := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);

  if _Supervisor then sGrade := '9'
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

  if dbMain.State in [dsInsert] then begin
    with MastDB.dbSQL do begin
      sSql := Format('SELECT COUNT(1) AS CNT FROM USER_MST WHERE USER_ID = %s', [QuotedStr(Trim(StrReplace(edUserID.Text, ' ', '')))]);

      fnSqlOpen(MastDB.dbSQL, sSql);

      if FieldByName('CNT').AsInteger > 0 then begin
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

  with MastDB.dbSQL do begin
    sSql := Format('SELECT COUNT(1) AS CNT FROM USER_MST WHERE USER_NICK_NM = %s', [QuotedStr(edUserNickName.Text)]);

    fnSqlOpen(MastDB.dbSQL, sSql);

    if FieldByName('CNT').AsInteger > 0 then begin
      lbAlert.Visible := TRUE;
      lbAlert.Caption := '중복된 회원필명 입니다..';
      dbMain.FieldByName('USER_NICK_NM').AsString := '';
      edUserNickName.SetFocus;
    end;
  end;
end;

procedure TfmUser.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
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
  MastDB.iwNotiClient.DataToSend := sValue + _EOL;
end;

procedure TfmUser.lbxPartClick(Sender: TObject);
begin
  inherited;

  with rgType do begin // Index를 바꾸면 Click 이벤트 발생됨
    Tag := 1;
    ItemIndex := 0;
    Tag := 0;
  end;

  if lbxPart.ItemIndex = 0 then _sMainWhere := ''
                           else _sMainWhere := Format(' A.PART_CD = %s', [QuotedStr(lbxPart.Values[lbxPart.ItemIndex])]);

  MainTableOpen;
end;

procedure TfmUser.LoginCnt;
var
  sSql, sKo, sGf : String;
begin
  sSql := Format(
    'SELECT (SELECT COUNT(*) ' +
    '          FROM ACNT_MST ' +
    '         WHERE CONN_YN = %s AND ACNT_TP = %s) AS KO_CNT, ' +
    '       (SELECT COUNT(*) ' +
    '          FROM ACNT_MST WHERE CONN_YN = %s AND ACNT_TP = %s) AS GF_CNT ',
    [QuotedStr('Y'), QuotedStr('1'), QuotedStr('Y'), QuotedStr('2')]);

  fnSqlOpen(MastDB.dbSQL, sSql);

  sKo := MastDB.dbSQL.FieldByName('KO_CNT').AsString;
  sGf := MastDB.dbSQL.FieldByName('GF_CNT').AsString;

  lbConnUser.Caption := '국내접속 : ' + sKo + '명  /  해외접속 : ' + sGf + '명';
end;

procedure TfmUser.LoginCntMerge;
var
  sSql, sKo : String;
begin
  sSql := Format('SELECT COUNT(*) CNT FROM ACNT_MST WHERE CONN_YN = %s ', [QuotedStr('Y')]);
  fnSqlOpen(MastDB.dbSQL, sSql);

  sKo := MastDB.dbSQL.FieldByName('CNT').AsString;
  lbConnUser.Caption := '접속자 : ' + sKo + '명';
end;

procedure TfmUser.negoCmsnDelete(sData : String; sWhere : String='');
var
  sSql : String;
begin
  sSql := Format('DELETE FROM NEGO_CMSN WHERE USER_ID = %s' + sWhere, [QuotedStr(sData)]);
  fnSqlOpen(MastDB.dbSQL, sSql);
end;

procedure TfmUser.passInit(sFlag : String);
begin
  if bsMsgYesNo('비밀번호 초기화 하시겠습니까? \n\n [1111]로 변경됩니다.') then begin
    if sFlag = 'USER' then begin
      with dbMain do begin
        Edit;
        FieldByName('USER_PWD').AsString := '1111';
        Post;
      end;
    end;

    if sFlag = 'ACNT' then begin
      with dbAcnt do begin
        Edit;
        FieldByName('ACNT_PWD').AsString := '1111';
        Post;
      end;
    end;

    bsMsgInfo('처리되었습니다.');
  end;
end;

procedure TfmUser.btnSignClick(Sender: TObject);
begin
  inherited;
  if bsMsgYesNo('보안번호 변경 하시겠습니까?') then begin
    with dbMain do begin
      Edit;
      FieldByName('USER_SIGN').AsString := edSign.Text;
      Post;
    end;

    bsMsgInfo('처리되었습니다.');
  end;
end;

procedure TfmUser.pgMainChange(Sender: TObject);
begin
  inherited;
  pgOpen;
end;

procedure TfmUser.rgTypeClick(Sender: TObject);
begin
  inherited;

  if rgType.Tag = 0 then begin 
    if rgType.ItemIndex = 0 then _sMainWhere := ''
                            else _sMainWhere := ' A.USER_GRADE = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

    MainTableOpen;

    lbxPart.ItemIndex := 0;
  end;
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
  fnSqlOpen(MastDB.dbSQL, sSql);

  with MastDB.dbSQL do begin
    while Not Eof do begin
      sSql := Format('SELECT COUNT(*) AS POSCNT FROM NCLR_POS WHERE ACNT_NO = %s', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
      fnSqlOpen(MastDB.dbExec, sSql);
      POSCNT := MastDB.dbExec.FieldByName('POSCNT').AsInteger;

      sSql := Format('SELECT COUNT(*) AS QTYCNT FROM ORD WHERE ACNT_NO = %s AND REMN_QTY > 0', [QuotedStr(FieldByName('ACNT_NO').AsString)]);
      fnSqlOpen(MastDB.dbExec, sSql);
      QTYCNT := MastDB.dbExec.FieldByName('QTYCNT').AsInteger;

      if (POSCNT <> 0) or (QTYCNT <> 0) then begin
        Result := False;
        Break;
      end;

      Next;
    end;
  end;
end;

function TfmUser.fnMainSql:string;
begin
  Result := Format(
    'SELECT 0 AS CHECK_TF     ' + // TODO : 어디에 사용되는지?
    '      ,A.USER_ID         ' +
    '      ,A.USER_NM         ' +
    '      ,USER_NICK_NM      ' +
    '      ,USER_GRADE        ' +
    '      ,B.ACNT_AMT   ACNT_AMT   ' +     // 추가
    '      ,B.ACNT_STATE ACNT_STATE ' +     // 추가
    '      ,BANK_CD           ' +           // 추가
    '      ,PART_CD           ' +
    '      ,PART_NM           ' +
    '      ,REG_DT            ' +
    '      ,USER_HP           ' +
    '      ,USER_EMAIL        ' +
    '      ,PARTNER_ID        ' +
    '      ,PARTNER_NM        ' +
    '      ,PARTNER_NICK_NM   ' +
    '      ,BIRTH_DT          ' +
    '      ,USER_TEL          ' +
    '      ,CASE WHEN (SELECT COUNT(1) FROM CNTR WHERE USER_ID = A.USER_ID) > 0 THEN (SELECT CURR_TRADE_DT FROM CORP_MST) ' +
    '            ELSE (SELECT MAX(CNTR_DT) FROM CNTR_HIS WHERE USER_ID = A.USER_ID) ' +
    '       END LAST_CNTR_DT  ' +
    '      ,(SELECT MAX(LOGIN_DT) FROM LOGIN_HIS WHERE USER_ID = A.USER_ID AND LOGIN_TP = ''I'' AND APP_TP = ''C'') AS LOGIN_DT ' +
    '      ,SERVER_IP         ' +
    '      ,RECOMM_NM         ' +     // 추가
    '      ,USER_PWD          ' +
    '      ,USER_SIGN         ' +
    '      ,USER_BANK         ' +
    '      ,USER_BANK_ACNT    ' +
    '      ,USER_BANK_ACNT_NM ' +
    '      ,UPDATE_MNG_ID     ' +
    '      ,UPDATE_DT         ' +
    '      ,UPDATE_TM         ' +
    '      ,UPDATE_IP         ' +
    '      ,USER_ADDR         ' +
    '      ,USER_BIGO         ' +
    '      ,USER_BLACK        ' +
    '      ,CASE WHEN (USER_REAL = ''1'' AND ADD_PORT = 1000) THEN ''1'' ' +
    '            WHEN (USER_REAL = ''0'' AND ADD_PORT =    0) THEN ''0'' ' +
    '            ELSE ''0''   ' +
    '       END MNG_USER      ' +
    '  FROM USER_MST A LEFT OUTER JOIN ACNT_MST B ON A.USER_ID = B.USER_ID ' +
    ' WHERE A.USER_ID = %s    ',
    [QuotedStr(_Login_ID) ]); // USER_ID
end;

procedure TfmUser.btnLoginManagerClick(Sender: TObject);
var
  sSql : string;
begin
  inherited;
  sSql := fnMainSql + Format(' AND A.USER_GRADE <= %s AND B.CONN_YN = %s ', [QuotedStr('8'), QuotedStr('Y') ]);

  try
    Delay_Show;
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmUser.MainTableOpen;
var
  sSql, sGrade: String;
begin
  sSql := fnMainSql;

  if cbxManagerSearch.Checked then
    sSql := sSql + Format(' AND A.USER_GRADE < 9 AND A.USER_BLACK = %s', [QuotedStr('1') ]);

  if _Supervisor then sGrade := '9'
                 else sGrade := '7';

  if _sMainWhere <> '' then sSql := sSql + Format(' OR (%s) AND (A.USER_GRADE < %s) ', [_sMainWhere, sGrade])
                       else sSql := sSql + Format(' OR (A.USER_GRADE < %s)', [sGrade]);

  try
    Delay_Show;
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmUser.pgOpen;
var
  sSql : String;
begin
  if pgMain.ActivePageIndex = 0 then
    SuperViser.Visible := _Supervisor;

  if (pgMain.ActivePageIndex = 1) or (pgMain.ActivePageIndex = 3) then begin
    AcntMstOpen(dbMain.FieldByName('USER_ID').AsString);
  end;

  if pgMain.ActivePageIndex = 2 then begin
    sSql := Format(
      'SELECT UM_SEQ   ' +
      '      ,USER_ID  ' +
      '      ,UM_DT    ' +
      '      ,PART_NM  ' +
      '      ,UM_TITLE ' +
      '      ,UM_BIGO   ' +
      ' FROM USER_MEMO WHERE USER_ID = %s ',
      [QuotedStr(dbMain.FieldByName('USER_ID').AsString)]);
    fnSqlOpen(dbMemo, sSql);
  end;

  if pgMain.ActivePageIndex = 4 then begin
    sSql := Format(
      'SELECT USER_ID   ' +
      '      ,LOGIN_DT  ' +
      '      ,LOGIN_TM  ' +
      '      ,LOGIN_IP  ' +
      '      ,ACNT_TP   ' +
      '      ,LOGIN_TP  ' +
      '      ,LOGIN_MAC ' +
      '      ,APP_TP    ' +
      '      ,HTS_VER   ' +
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM LOGIN_HIS    ' +
      ' WHERE USER_ID = %s ' +
      ' ORDER BY LOGIN_DT DESC,LOGIN_TM DESC ',
      [QuotedStr(dbMain.FieldByName('USER_ID').AsString)]);
    fnSqlOpen(dbLogin, sSql);

//    PartTableOpen(TComponent(gdLogin.Columns[5]), CodeFormat('ACNT_TP'));
//    PartTableOpen(TComponent(gdLogin.Columns[6]), CodeFormat('LOGIN_TP'));
//    PartTableOpen(TComponent(gdLogin.Columns[2]), CodeFormat('APP_TP'));

    lbLogin.Caption := dbLogin.FieldByName('TOTCNT').AsString + ' 건';
  end;
end;

procedure TfmUser.AcntMstOpen(sId: String);
var
  i, j : integer;
  sSql, sLev : String;
begin
  sSql := Format(
    'SELECT ACNT_NO          ' +
    '      ,ACNT_TP          ' +
    '      ,USER_ID          ' +
    '      ,USER_NM          ' +
    '      ,ACNT_PWD         ' +
    '      ,GUJA_CNT         ' +
    '      ,CASE WHEN NEGO_GUJA_MAXCNT = -1 THEN (SELECT GUJA_MAX_CNT_1 FROM CORP_MST) ELSE NEGO_GUJA_MAXCNT END NEGO_GUJA_MAXCNT ' +
    '      ,API_TP           ' +
    '      ,BF_ACNT_AMT      ' +
    '      ,ACNT_AMT         ' +
    '      ,CLR_PL           ' +
    '      ,CLR_PL_F         ' +
    '      ,CMSN             ' +
    '      ,CMSN_F           ' +
    '      ,ACNT_STATE       ' +
    '      ,CONN_YN          ' +
    '      ,NEGO_DUP_YN      ' +
    '      ,FIRST_DT         ' +
    '      ,LOGIN_DT         ' +
    '      ,LOGIN_TM         ' +
    '      ,LOGIN_IP         ' +
    '      ,ACNT_BIGO        ' +
    '      ,LOSSCUT_YN       ' +
    '      ,OVERNGT_YN       ' +
    '      ,MINAMT_GUJA      ' +
    '      ,LEVERAGE         ' +
    '      ,LEVERAGE_MANUAL  ' +
    '      ,PROFITCUT_AMT    ' + 
    '      ,(ACNT_AMT + CLR_PL - CMSN) AS PLAMT ' +
    '  FROM ACNT_MST WHERE USER_ID = %s ',
    [QuotedStr(sId)]);
  fnSqlOpen(dbAcnt,sSql);

  edMinAmtGuja.Text := FormatFloat(FORMAT_AMT, dbAcnt.FieldByName('MINAMT_GUJA').AsFloat);

  cbxLev1.Checked   := False;
  cbxLev2.Checked   := False;
  cbxLev5.Checked   := False;
  cbxLev10.Checked  := False;
  cbxLev20.Checked  := False;
  cbxLev50.Checked  := False;
  cbxLev100.Checked := False;
  cbxLev200.Checked := False;

  sLev := dbAcnt.FieldByName('LEVERAGE_MANUAL').AsString;
  j := 1;
  for i:=1 to Length(sLev) do begin
    if sLev[i] = '/' then begin
      if Copy(sLev, j, i) = '1/'   then cbxLev1.Checked   := True;
      if Copy(sLev, j, i) = '2/'   then cbxLev2.Checked   := True;
      if Copy(sLev, j, i) = '5/'   then cbxLev5.Checked   := True;
      if Copy(sLev, j, i) = '10/'  then cbxLev10.Checked  := True;
      if Copy(sLev, j, i) = '20/'  then cbxLev20.Checked  := True;
      if Copy(sLev, j, i) = '50/'  then cbxLev50.Checked  := True;
      if Copy(sLev, j, i) = '100/' then cbxLev100.Checked := True;
      if Copy(sLev, j, i) = '200/' then cbxLev200.Checked := True;
      j := i + 1;
    end;
  end;
end;

procedure TfmUser.prUserBlock(BlockYN:Boolean; sIP:String);
var
  sSql, sID, sNm : String;
begin
  sID := dbMain.FieldByName('USER_ID').AsString;
  sNm := dbMain.FieldByName('USER_NM').AsString;

  if BlockYN then begin
    sSql := Format('INSERT INTO USER_BLOCK_IP VALUES (%s, %s) ', [QuotedStr(sIP), 'CONVERT(CHAR(8),GETDATE(),112) + ' +QuotedStr(' - '+sNm+'('+sID+')') ]);
  end else begin
    sSql := Format('DELETE FROM USER_BLOCK_IP WHERE UIP_IP = %s ', [QuotedStr(sIP) ]);
  end;
  fnSqlOpen(dbAcnt,sSql);
end;

procedure TfmUser.popbtnInputIPClick(Sender: TObject);
begin
  inherited;
  prUserBlock(True, dbLogin.FieldByName('LOGIN_IP').AsString);
end;

procedure TfmUser.popbtnInputMacClick(Sender: TObject);
begin
  inherited;
  prUserBlock(True, dbLogin.FieldByName('LOGIN_MAC').AsString);
end;

procedure TfmUser.popbtnReleaseIPClick(Sender: TObject);
begin
  inherited;
  prUserBlock(False, dbLogin.FieldByName('LOGIN_IP').AsString);
end;

procedure TfmUser.popbtnReleaseMacClick(Sender: TObject);
begin
  inherited;
  prUserBlock(False, dbLogin.FieldByName('LOGIN_MAC').AsString);
end;

procedure TfmUser.popbtnCopyIPClick(Sender: TObject);
begin
  inherited;
  edIP.Text := dbLogin.FieldByName('LOGIN_IP').AsString;
  edIP.CopyToClipboard;
end;
procedure TfmUser.popbtnCopyMacClick(Sender: TObject);
begin
  inherited;
  edIP.Text := dbLogin.FieldByName('LOGIN_MAC').AsString;
  edIP.CopyToClipboard;
end;

procedure TfmUser.popbtnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdLogin);
end;

procedure TfmUser.btnLevClick(Sender: TObject);
begin
  inherited;
  // TODO : 회원의 레버리지 조회
  pnlLev.Visible := not pnlLev.Visible;
end;

procedure TfmUser.btnLevCancelClick(Sender: TObject);
begin
  pnlLev.Visible := False;
end;

procedure TfmUser.btnLevSaveClick(Sender: TObject);
var
  s1, s2, s5, s10, s20, s50, s100, s200, sLev, sSql : string;
begin
  s1   := '';
  s2   := '';
  s5   := '';
  s10  := '';
  s20  := '';
  s50  := '';
  s100 := '';
  s200 := '';

  if cbxLev1.Checked   then begin sLev := '1';   s1   := sLev+'/'; end;
  if cbxLev2.Checked   then begin sLev := '2';   s2   := sLev+'/'; end;
  if cbxLev5.Checked   then begin sLev := '5';   s5   := sLev+'/'; end;
  if cbxLev10.Checked  then begin sLev := '10';  s10  := sLev+'/'; end;
  if cbxLev20.Checked  then begin sLev := '20';  s20  := sLev+'/'; end;
  if cbxLev50.Checked  then begin sLev := '50';  s50  := sLev+'/'; end;
  if cbxLev100.Checked then begin sLev := '100'; s100 := sLev+'/'; end;
  if cbxLev200.Checked then begin sLev := '200'; s200 := sLev+'/'; end;

  edLev.Text := s1+s2+s5+s10+s20+s50+s100+s200;

  sSql := Format(
    'UPDATE ACNT_MST ' +
    '   SET LEVERAGE = %s, ' +
    '       LEVERAGE_MANUAL = %s ' +
    ' WHERE ACNT_NO = %s ',
    [QuotedStr(sLev),
     QuotedStr(edLev.Text),
     QuotedStr(dbAcnt.FieldByName('ACNT_NO').AsString) ]);
  fnSqlOpen(MastDB.dbExec, sSql);

  AcntMstOpen(dbMain.FieldByName('USER_ID').AsString);
  pnlLev.Visible := False;
end;

end.
