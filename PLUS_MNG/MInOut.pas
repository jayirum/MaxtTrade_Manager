unit MInOut;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList, Graphics,
//  Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsRibbon,
// Raize, kcRaize
  RzPanel, RzEdit, bsMessages, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav, RzDBEdit,
  RzLstBox, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmInOut = class(TfmBasic)
    RzPanel6: TRzPanel;
    rgType: TbsSkinRadioGroup;
    gdMain: TDBGridEh;
    RzPanel1: TRzPanel;
    RzPanel8: TRzPanel;
    bsSkinLabel45: TbsSkinLabel;
    RzPanel2: TRzPanel;
    cbCheckAll: TbsSkinCheckRadioBox;
    MoMsg: TRzMemo;
    btnOK: TbsSkinSpeedButton;
    btnNo: TbsSkinSpeedButton;
    btnAllOK: TbsSkinSpeedButton;
    btnAllNo: TbsSkinSpeedButton;
    cbMsg: TkcRzComboBox;
    dbMainCHECK_TF: TIntegerField;
    dbMainUSER_ID: TStringField;
    dbMainRQST_TM: TStringField;
    dbMainIO_TP: TStringField;
    dbMainACNT_TP: TStringField;
    dbMainACNT_NO: TStringField;
    dbMainUSER_NM: TStringField;
    dbMainRQST_AMT: TFloatField;
    dbMainRSLT_TP: TStringField;
    dbMainRSLT_AMT: TFloatField;
    dbMainRSLT_MNG_ID: TStringField;
    dbMainRQST_TRADE_DT: TStringField;
    dbMainRQST_SYS_DT: TStringField;
    dbMainRSLT_TRADE_DT: TStringField;
    dbMainRSLT_SYS_DT: TStringField;
    dbMainRSLT_TM: TStringField;
    dbMainRJCT_MSG: TStringField;
    dbMainUSER_BANK: TStringField;
    dbMainUSER_BANK_ACNT: TStringField;
    dbMainUSER_BANK_ACNT_NM: TStringField;
    dbMainMNG_YN: TStringField;
    bsSkinLabel1: TbsSkinLabel;
    edAmt: TRzEdit;
    edRqstAmt: TkcRzDBEdit;
    bsSkinLabel2: TbsSkinLabel;
    ed: TkcRzDBEdit;
    edUserNm: TkcRzDBEdit;
    bsRibbonDivider1: TbsRibbonDivider;
    bsSkinLabel3: TbsSkinLabel;
    edAcnt: TkcRzDBEdit;
    edAcntUserNm: TkcRzDBEdit;
    bsSkinLabel5: TbsSkinLabel;
    edOfficeNm: TkcRzDBEdit;
    bsSkinLabel6: TbsSkinLabel;
    btnPl: TbsSkinSpeedButton;
    edUser: TRzEdit;
    RzEdit1: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure edRqstAmtChange(Sender: TObject);
    procedure edAmtEnter(Sender: TObject);
    procedure edAmtExit(Sender: TObject);
    procedure edAmtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure cbMsgChange(Sender: TObject);
    procedure cbCheckAllClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnAllOKClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnAllNoClick(Sender: TObject);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMainTitleClick(Column: TColumnEh);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
    function InOutProcCall(sRsltTp : String; sRebuffMsg : String = ''): Integer;
    procedure InOutProcAll(sRsltTp : String; sRebuffMsg : String = '');
    procedure SingleInOutProc(sRsltTp : String; sRebuffMsg : String = '');
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure CheckAll(iData : Integer);
    procedure InOutSendNM001(sMsg : String);
  end;

var
  fmInOut: TfmInOut;

implementation

uses StdUtils, PacketStruct, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }
const
  _Approve  = '1';
  _Rebuff   = '2';

var
  _bAllCheck: Boolean=False;

procedure TfmInOut.btnOKClick(Sender: TObject);
begin
  inherited;
  if dbMain.FieldByName('USER_ID').AsString = '' then Exit;

  SingleInOutProc(_Approve);
end;

procedure TfmInOut.btnAllNoClick(Sender: TObject);
begin
  inherited;
  if dbMain.FieldByName('CHECK_TF').AsInteger = 0 then Exit;

  if bsMsgYesNo('선택된 모든 입출금자료가 일괄 거부처리됩니다. 일괄거부 하시겠습니까?', '일괄거부') then begin
    InOutProcAll(_Rebuff, MoMsg.Text);
  end;
end;

procedure TfmInOut.btnAllOKClick(Sender: TObject);
begin
  inherited;
  if dbMain.FieldByName('CHECK_TF').AsInteger = 0 then Exit;

  if bsMsgYesNo('선택된 모든 입출금자료가 일괄 승인처리됩니다. 일괄승인 하시겠습니까?', '일괄승인') then begin
    InOutProcAll(_Approve);
  end;
end;

procedure TfmInOut.btnFilterClick(Sender: TObject);
begin
  _sMainWhere := '';
  rgType.ItemIndex := 0;

  inherited;
end;

procedure TfmInOut.btnInsertClick(Sender: TObject);
begin
  inherited;
//  edUserID.SetFocus;
end;

procedure TfmInOut.btnNoClick(Sender: TObject);
var
  sMsg : String;
begin
  inherited;
  if dbMain.FieldByName('USER_ID').AsString = '' then Exit;

  sMsg := MoMsg.Text;
  SingleInOutProc(_Rebuff, sMsg);
end;

procedure TfmInOut.cbCheckAllClick(Sender: TObject);
var
  iValue : Integer;
begin
  inherited;
  if cbCheckAll.Checked then iValue := 1
                        else iValue := 0;

  CheckAll(iValue);
end;

procedure TfmInOut.cbMsgChange(Sender: TObject);
begin
  inherited;
  MoMsg.Text := cbMsg.Text;
end;

procedure TfmInOut.CheckAll(iData : Integer);
var
  iKey: String;
begin
  with dbMain do begin
    iKey := FieldByName('RQST_TM').asString;
    DisableControls;
    First;
    while Not Eof do begin
      Edit;
      FieldByName('CHECK_TF').AsInteger := iData;
      Post;

      Next;
    end;

    Locate('RQST_TM', iKey, []);
    EnableControls;
  end;
end;

procedure TfmInOut.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('RQST_AMT')).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('RSLT_AMT')).DisplayFormat := FORMAT_AMT;
  end;
end;

procedure TfmInOut.edAmtEnter(Sender: TObject);
begin
  inherited;
  TRzEdit(Sender).Text := StrReplace(TRzEdit(Sender).Text, ',', '');
end;

procedure TfmInOut.edAmtExit(Sender: TObject);
begin
  inherited;
   TRzEdit(Sender).Text := FormatFloat(FORMAT_AMT, StrToFloatDef(TRzEdit(Sender).Text, 0));
end;

procedure TfmInOut.edAmtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnOK.ButtonClick;
end;

procedure TfmInOut.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmInOut.edRqstAmtChange(Sender: TObject);
begin
  inherited;
  edAmt.Text := FormatFloat(FORMAT_AMT, TextToFloat(edRqstAmt.Text));
end;

procedure TfmInOut.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmInOut);
end;

procedure TfmInOut.FormShow(Sender: TObject);
begin
  inherited;
  PartTableOpen(rgType, CodeFormat('IO_TP', 'AND CODE_DISP = ''Y'' ORDER BY CODE_VALUE'), '[전체]', '0');
  PartTableOpen(TComponent(gdMain.Columns[1]), CodeFormat('IO_TP', 'ORDER BY CODE_VALUE'));
  PartTableOpen(TComponent(gdMain.Columns[10]), CodeFormat('ACNT_TP', 'ORDER BY CODE_VALUE'));

  _sMainWhere := '';

  with rgType do begin
    Tag := 1;
    ItemIndex := 0;
    Tag := 0;
  end;
end;

procedure TfmInOut.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('IO_TP').AsString = '1' then
      Canvas.Font.Color := clRed
    else
      Canvas.Font.Color := clBlue;

    if DataCol = 1 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmInOut.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmInOut.gdMainTitleClick(Column: TColumnEh);
var
  iValue: Integer;
begin
  inherited;
  if Column = gdMain.Columns[0] then begin
    if _bAllCheck then
      iValue := 0
    else
      iValue := 1;

    CheckAll(iValue);

    _bAllCheck := Not _bAllCheck;
  end;
end;

procedure TfmInOut.SingleInOutProc(sRsltTp: String; sRebuffMsg : String = '');
var
  iRslt : Integer;
  sMsg, sIoTp  : String;
begin
  with dbMain do begin
    sIoTp := FieldByName('IO_TP').AsString;

    if sIoTp = '1' then sMsg := '입금요청';
    if sIoTp = '2' then sMsg := '출금요청';

    if sRsltTp = '1' then begin
      if bsMsgYesNo('[ ' + FieldByName('USER_NM').AsString + ' ]' + '님 ' + '[ ' + FormatFloat(FORMAT_AMT, TextToFloat(edAmt.Text)) + '원 ]' + ' ' + sMsg + '을 승인하시겠습니까?', sMsg) then begin
        Edit;

        iRslt := InOutProcCall(sRsltTp);

        if iRslt = 0 then
          bsMsgInfo('처리 완료!')
        else
          bsMsgInfo('처리 실패!');

        Post;
        MainTableOpen;
      end;
    end;

    if sRsltTp = '2' then begin
      if bsMsgYesNo(FieldByName('USER_NM').AsString + '님 ' + sMsg + '을 거부하시겠습니까?', sMsg) then begin
        Edit;

        iRslt := InOutProcCall(sRsltTp, sRebuffMsg);

        if iRslt = 0 then bsMsgInfo('처리 완료!')
                     else bsMsgInfo('처리 실패!');

        Post;
        MainTableOpen;
      end;
    end;
  end;
end;

procedure TfmInOut.InOutProcAll(sRsltTp: String; sRebuffMsg : String = '');
var
  iTCnt, iCnt, iRlst : Integer;
begin
  iCnt := 0;
  iTCnt := 0;

  with dbMain do begin
    DisableControls;
    First;
    while Not Eof do begin
      Edit;

      if FieldByName('CHECK_TF').AsInteger = 1 then begin
        iRlst := InOutProcCall(sRsltTp, sRebuffMsg);
        if iRlst = 0 then Inc(iCnt);
        Inc(iTCnt);
        Post;
      end;

      Next;
    end;
    EnableControls;
  end;
  MsgInfo('총 ' + intTostr(iTCnt) + '건' + ' / ' + intTostr(iCnt) + '건 처리완료');
  MainTableOpen;
end;

function TfmInOut.InOutProcCall(sRsltTp : String; sRebuffMsg : String = ''): Integer;
var
//  db : TUniQuery;
//  sSql, sRslt,
  sMsg, sIoTp, sIoNm, sRlstNm : String;
begin
  sIoTp := dbMain.FieldByName('IO_TP').AsString;

  if sIoTp = '1' then sIoNm := '입금요청';
  if sIoTp = '2' then sIoNm := '출금요청';

  if sRsltTp = '1' then sRlstNm := '승인';
  if sRsltTp = '2' then sRlstNm := '거부';

//  sSql := Format('PT_INOUT_PROC %s,%s,%s,%g,%s,%s',
//                 [QuotedStr(dbMain.FieldByName('USER_ID').AsString)
//                 ,QuotedStr(dbMain.FieldByName('RQST_TM').AsString)
//                 ,QuotedStr(sRsltTp)
//                 ,TextToFloat(edAmt.Text)
//                 ,QuotedStr(_Login_ID)
//                 ,QuotedStr(sRebuffMsg)]);
//
//  try
//    db := TUniQuery.Create(nil);
//    db.Connection := MastDB.UniConnection;
//
//    sRslt := Uni_Open(db, sSql);
//
//    if sRslt <> '' then
//    begin
//      GT_Log(Format('ERROR : [%s][%s]', [sRslt,sSql]), 'E');
//      exit;
//    end;
//  finally
//    FreeAndNil(db);
//  end;

  with MastDB.ADOSP do begin
    if Active then Active := False;

    ProcedureName := 'PT_INOUT_PROC';
    Prepared := True;
    Parameters.ParamByName('@I_USER_ID').Value  := dbMain.FieldByName('USER_ID').AsString;
    Parameters.ParamByName('@I_TM').Value       := dbMain.FieldByName('RQST_TM').AsString;
    Parameters.ParamByName('@I_RSLT_TP').Value  := sRsltTp;
    Parameters.ParamByName('@I_RSLT_AMT').Value := TextToFloat(edAmt.Text);
    Parameters.ParamByName('@I_MNG_ID').Value   := _Login_ID;
    Parameters.ParamByName('@I_RJCT_MSG').Value := sRebuffMsg;

{    PrepareSQL;
    ParamByName('I_USER_ID').AsString  := dbMain.FieldByName('USER_ID').AsString;
    ParamByName('I_TM').AsString       := dbMain.FieldByName('RQST_TM').AsString;
    ParamByName('I_RSLT_TP').AsString  := sRsltTp;
    ParamByName('I_RSLT_AMT').AsFloat  := TextToFloat(edAmt.Text);
    ParamByName('I_MNG_ID').AsString   := _Login_ID;
    ParamByName('I_RJCT_MSG').AsString := sRebuffMsg;}

    try
      ExecProc; // Output 파라미터가 없거나 Output 파라미터만 있는 경우 사용
    Except
      on E:Exception do begin
        Active := False;
        Prepared := False;
        Set_Log(E.Message,'E');
      end;
    end;

    //Result := Parameters.ParamByName('RETURN_VALUE').AsInteger;
    Result := Parameters.ParamByName('@RETURN_VALUE').Value;

    if Result = 0 then begin
      sMsg := Format('[ %s ]원 %s이 %s되었습니다.', [FormatFloat(FORMAT_AMT, TextToFloat(edAmt.Text)), sIoNm, sRlstNm]);
      InOutSendNM001(sMsg);
    end;
  end;
end;

procedure TfmInOut.InOutSendNM001(sMsg : String);
var
  NM001  : TNM001;
  sValue : String;
begin
  FillChar(NM001, SizeOf(NM001), ' ');
  StrToArr(NumToStr(SizeOf(NM001)),                            NM001.GT_HEADER.LENGTH);
  StrToArr('NM001',                                            NM001.GT_HEADER.PACKET_CD);
  StrToArr(UpperCase(dbMain.FieldByName('USER_ID').AsString),  NM001.GT_HEADER.USER_ID);
  StrToArr(dbMain.FieldByName('ACNT_TP').AsString,             NM001.GT_HEADER.ACNT_TP);
  StrToArr('0000',                                             NM001.GT_HEADER.ERR_CODE);
  StrToArr(NowMSecTime,                                        NM001.GT_HEADER.TM);
  StrToArr(sMsg,                                               NM001.NOTI_MSG);
  StrToArr('Y',                                                NM001.REFRESH_YN);

  sValue := RecordToStr(NM001, SizeOf(NM001));
  MastDB.iwNotiClient.DataToSend := sValue + _EOL;
end;

procedure TfmInOut.MainTableOpen;
var
  sSQL : string;
begin
  with dbMain do begin
    try
      Delay_Show();

      Close;
      sSQL := Format(
        'SELECT 0 AS CHECK_TF     ' +
        '      ,USER_ID           ' +
        '      ,RQST_TM           ' +
        '      ,IO_TP             ' +
        '      ,ACNT_TP           ' +
        '      ,ACNT_NO           ' +
        '      ,USER_NM           ' +
        '      ,RQST_AMT          ' +
        '      ,RSLT_TP           ' +
        '      ,RSLT_AMT          ' +
        '      ,RSLT_MNG_ID       ' +
        '      ,RQST_TRADE_DT     ' +
        '      ,RQST_SYS_DT       ' +
        '      ,RSLT_TRADE_DT     ' +
        '      ,RSLT_SYS_DT       ' +
        '      ,RSLT_TM           ' +
        '      ,RJCT_MSG          ' +
        '      ,USER_BANK         ' +
        '      ,USER_BANK_ACNT    ' +
        '      ,USER_BANK_ACNT_NM ' +
        '      ,MNG_YN            ' +
        '  FROM INOUT A           ' +
        ' WHERE RSLT_TP = %s      ',
        [QuotedStr('0') ]);
      if _sMainWhere <> '' then sSQL := sSQL + ' AND ' + _sMainWhere;
      sSQL := sSQL + ' ORDER BY RQST_TRADE_DT, RQST_TM ';
      SQL.Text := sSQL;

      Open;
      gdMain.Columns[0].Checkboxes := RecordCount <> 0;
      cbCheckAll.Checked := False;
    finally
      Delay_Hide;
    end;
  end;
end;

procedure TfmInOut.rgTypeClick(Sender: TObject);
begin
  inherited;
  if rgType.Tag = 0 then begin
    if rgType.ItemIndex = 0 then
      _sMainWhere := ''
    else
      _sMainWhere := 'IO_TP = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

    MainTableOpen;
  end;
end;

end.
