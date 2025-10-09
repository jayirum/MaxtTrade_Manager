unit MOrdDetail;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Math, Dialogs, ImgList, Graphics,
//  Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, RzPanel, bsSkinCtrls, bsRibbon, bsMessages,
// Raize, kcRaize
  RzEdit, RzButton, RzRadChk, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav, RzLstBox,
  RzDBEdit, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmOrdDetail = class(TfmBasic)
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    edFind: TRzEdit;
    dsUser: TDataSource;
    RzPanel1: TRzPanel;
    RzSizePanel1: TRzSizePanel;
    RzPanel2: TRzPanel;
    gdOrd: TDBGridEh;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzDBNavigator1: TRzDBNavigator;
    pnCntrCnt: TRzPanel;
    pnOrdCnt: TRzPanel;
    RzDBNavigator2: TRzDBNavigator;
    bsSkinLabel45: TbsSkinLabel;
    bsSkinLabel1: TbsSkinLabel;
    dsOrd: TDataSource;
    btnCntrExcel: TbsSkinSpeedButton;
    btnOrdExcel: TbsSkinSpeedButton;
    tmOpen: TTimer;
    dtCntrDt: TkcRzDateTimeEdit;
    rgCntrAcntTp: TbsSkinRadioGroup;
    gdCntr: TDBGridEh;
    chUserTp: TbsSkinCheckRadioBox;
    cbUserGrade: TkcRzComboBox;
    dbOrd: TADOQuery;
    dbUser: TADOQuery;
    cbxSearchBS: TRzCheckBox;
    btnOvCancel: TbsSkinSpeedButton;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    RzPanel7: TRzPanel;
    pnPL: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    pnCMSN: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnCntrExcelClick(Sender: TObject);
    procedure btnOrdExcelClick(Sender: TObject);
    procedure rgCntrAcntTpClick(Sender: TObject);
    procedure rgOrdAcntTpClick(Sender: TObject);
    procedure dbOrdCalcFields(DataSet: TDataSet);
    procedure dbOrdAfterOpen(DataSet: TDataSet);
    procedure tmOpenTimer(Sender: TObject);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure gdCntrTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdCntrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdOrdTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdOrdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnFilterClick(Sender: TObject);
  private
    { Private declarations }
    procedure OrdTableOpen;
  public
    { Public declarations }
    procedure MainTableOpen; override;
//    procedure UserTableOpen(sWhere : String='');
    procedure UserTableOpen;
  end;

var
  fmOrdDetail: TfmOrdDetail;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmOrdDetail.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmOrdDetail);
end;

procedure TfmOrdDetail.btnCntrExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdCntr);
end;

procedure TfmOrdDetail.btnOrdExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdOrd);
end;

procedure TfmOrdDetail.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdUser, dbUser, ACol);
end;

procedure TfmOrdDetail.gdCntrTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdCntr, dbMain, ACol);
end;

procedure TfmOrdDetail.gdOrdTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdOrd, dbOrd, ACol);
end;

procedure TfmOrdDetail.FormShow(Sender: TObject);
begin
  inherited;
  if _Supervisor then cbUserGrade.Visible := True;

  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), '회원등급', '0');
  cbUserGrade.ItemIndex := 0;

  dtCntrDt.Date := TextToDate(_Trade_DT); //Now;

  PartTableOpen(TComponent(gdCntr.Columns[ 4]), CodeFormat('ACNT_TP'));
  PartTableOpen(TComponent(gdCntr.Columns[ 5]), CodeFormat('BS_TP'));
  PartTableOpen(TComponent(gdCntr.Columns[13]), CodeFormat('CLR_TP'));
//  PartTableOpen(TComponent(gdCntr.Columns[23]), CodeFormat('ORD_TP'));
  PartTableOpen(TComponent(gdCntr.Columns[27]), CodeFormat('API_TP'));

  PartTableOpen(TComponent(gdOrd.Columns[ 4]), CodeFormat('ACNT_TP'));
  PartTableOpen(TComponent(gdOrd.Columns[ 6]), CodeFormat('BS_TP'));
  PartTableOpen(TComponent(gdOrd.Columns[ 7]), CodeFormat('ORD_TP'));
  PartTableOpen(TComponent(gdOrd.Columns[ 8]), CodeFormat('COND_TP'));
  PartTableOpen(TComponent(gdOrd.Columns[ 9]), CodeFormat('ACPT_TP'));
  PartTableOpen(TComponent(gdOrd.Columns[11]), CodeFormat('SL_TP'));
  PartTableOpen(TComponent(gdOrd.Columns[19]), CodeFormat('API_TP'));
end;

procedure TfmOrdDetail.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmOrdDetail.btnFilterClick(Sender: TObject);
begin
//  inherited;
// User 조회 먼저할것 msg
// 선택한 user로 체결내역/주문내역 조회할것
  btnFind.ButtonClick;
end;

procedure TfmOrdDetail.btnFindClick(Sender: TObject);
begin
  UserTableOpen
end;

//procedure TfmOrdDetail.UserTableOpen(sWhere: String ='');
procedure TfmOrdDetail.UserTableOpen;
var
  sSql, sWhere, sUserTp : String;
begin
  if _Supervisor then begin
    if cbUserGrade.ItemIndex > 0 then sUserTp := Format(' USER_GRADE = %s AND ', [IntToStr(cbUserGrade.ItemIndex)]) else
    if chUserTp.Checked          then sUserTp := Format(' USER_GRADE IN (%s,%s) AND ', [QuotedStr('2'),QuotedStr('7')])
                                 else sUserTp := '';
  end else begin
    if chUserTp.Checked then sUserTp := ' USER_GRADE = 2 AND '
                        else sUserTp := ' USER_GRADE <> 7 AND ';
  end;

//    sWhere := Format(' WHERE USER_NM LIKE %s', [QuotedStr('%' + edFind.Text + '%')]);
//  sWhere := ' WHERE ' + StrReplace(__Find_User, '<X>', edFind.Text);
  sWhere := Format(' WHERE %s (%s)', [sUserTp, StrReplace(_Find_User, '<X>', edFind.Text)]);

  sSql :=
    'SELECT USER_NM  ' +
    '      ,USER_ID  ' +
    '  FROM USER_MST ' +
    sWhere;
  fnSqlOpen(dbUser, sSql);
end;

procedure TfmOrdDetail.MainTableOpen;
var
  i, iCnt : integer;
  dPL, dCMSN : double;
  sSql, sResult, sAcntTp, sTm, sTableNm : String;
begin
  sTm := _Trade_DT;
  if sTm = StrReplace(dtCntrDt.Text, '-', '') then sTableNm := 'CNTR'
                                              else sTableNm := 'CNTR_HIS';
  try
    Delay_Show();

    if rgCntrAcntTp.ItemIndex > 0 then sAcntTp := Format(' AND ACNT_TP = %s', [QuotedStr(intTostr(rgCntrAcntTp.ItemIndex))])
                                  else sAcntTp := '';
    sSql := Format(
      'SELECT CNTR_NO         ' +
      '      ,API_CNTR_NO     ' +
      '      ,STK_CD          ' +
      '      ,ARTC_CD         ' +
      '      ,ACNT_TP         ' +
      '      ,ACNT_NO         ' +
      '      ,USER_ID         ' +
      '      ,BS_TP           ' +
      '      ,CNTR_QTY        ' +
      '      ,CNTR_PRC        ' +
      '      ,CLR_PL          ' +
      '      ,CLR_PL_F        ' +
      '      ,CMSN_AMT        ' +
      '      ,CMSN_AMT_F      ' +
      '      ,EXCH_RT         ' +
      '      ,CLR_TP          ' +
      '      ,BF_NCLR_POS_QTY ' +
      '      ,AF_NCLR_POS_QTY ' +
      '      ,BF_AVG_PRC      ' +
      '      ,AF_AVG_PRC      ' +
      '      ,BF_NET_ACNT_AMT ' +
      '      ,AF_NET_ACNT_AMT ' +
      '      ,ORD_NO          ' +
      '      ,API_ORD_NO      ' +
      '      ,ORD_PRC         ' +
      '      ,ORD_QTY         ' +
      '      ,CASE WHEN COND_TP = 2 THEN %s ' +
      '                             ELSE (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ORD_TP) ' +
      '            END ORD_TP ' +
      '      ,PARTNER_ID      ' +
      '      ,TRADE_DT        ' +
      '      ,CNTR_TM         ' +
      '      ,API_CNTR_TM     ' +
      '      ,SYS_DT          ' +
      '      ,CLENT_IP        ' +
      '      ,API_TP          ' +
      '      ,MNG_ID          ' +
      '      ,LEVERAGE        ' +
      '      ,(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT ' +
      '      ,(SELECT USER_NM    FROM USER_MST WHERE USER_ID = A.USER_ID) AS USER_NM     ' +
      '      ,(SELECT PARTNER_ID FROM USER_MST WHERE USER_ID = A.USER_ID) AS PARTNER_ID  ' +
      '      ,COUNT(1) OVER() AS TOTCNT                                                  ' +
      '  FROM %s A          ' +
      ' WHERE USER_ID = %s  ' +
      '   AND TRADE_DT = %s ' +
      sAcntTp,
      [QuotedStr('예약주문'),
       QuotedStr('ORD_TP'),
       sTableNm,
       QuotedStr(dbUser.FieldByName('USER_ID').AsString),
       QuotedStr(StrReplace(dtCntrDt.Text, '-', ''))]);
    fnSqlOpen(dbMain, sSql);

    // Form Show 로 이전하여 테스트
{    PartTableOpen(TComponent(gdCntr.Columns[ 4]), CodeFormat('ACNT_TP'));
    PartTableOpen(TComponent(gdCntr.Columns[ 5]), CodeFormat('BS_TP'));
    PartTableOpen(TComponent(gdCntr.Columns[13]), CodeFormat('CLR_TP'));
    //     PartTableOpen(TComponent(gdCntr.Columns[23]), CodeFormat('ORD_TP'));
    PartTableOpen(TComponent(gdCntr.Columns[27]), CodeFormat('API_TP'));
}
    if sResult= '' then pnCntrCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
                   else pnCntrCnt.Caption := '0 건';

    if sResult= '' then begin
       with dbMain do begin
         dPL   := 0;
         dCMSN := 0;

         for i:=0 to RecordCount - 1 do begin
           dPL   := dPL   + dbMain.FieldByName('CLR_PL').AsFloat;
           dCMSN := dCMSN + dbMain.FieldByName('CMSN_AMT').AsFloat;
         end;
         pnPL.Caption   := FloatToStr(dPL);
         pnCMSN.Caption := FloatToStr(dCMSN);
       end;
    end;
  finally
    Delay_Hide;
  end;
end;

procedure TfmOrdDetail.OrdTableOpen;
var
  sSql, sResult, sAcntTp, sTm, sTableNm : String;
begin
  sTm := _Trade_DT;
  if sTm = StrReplace(dtCntrDt.Text, '-', '') then sTableNm := 'ORD'
                                              else sTableNm := 'ORD_HIS';

  try
    Delay_Show();

    sAcntTp := '';

    if rgCntrAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND ACNT_TP = %s', [QuotedStr(intTostr(rgCntrAcntTp.ItemIndex))]);

    sSql := Format(
      'SELECT ORD_NO         ' +
      '      ,API_SEQ        ' +
      '      ,ORG_ORD_NO     ' +
      '      ,API_ORD_NO     ' +
      '      ,API_ORG_ORD_NO ' +
      '      ,ACNT_TP        ' +
      '      ,ACNT_NO        ' +
      '      ,USER_ID        ' +
      '      ,STK_CD         ' +
      '      ,ARTC_CD        ' +
      '      ,BS_TP          ' +
      '      ,ORD_TP         ' +
      '      ,COND_TP        ' +
      '      ,ACPT_TP        ' +
      '      ,ORD_PRC        ' +
      '      ,SL_TP          ' +
      '      ,ORD_QTY        ' +
      '      ,RJCT_QTY       ' +
      '      ,MDFY_QTY       ' +
      '      ,CNCL_QTY       ' +
      '      ,CNTR_QTY       ' +
      '      ,REMN_QTY       ' +
      '      ,API_RJCT_CD    ' +
      '      ,API_RJCT_MSG   ' +
      '      ,TRADE_DT       ' +
      '      ,ORD_TM         ' +
      '      ,CNFM_TM        ' +
      '      ,API_TM         ' +
      '      ,SYS_DT         ' +
      '      ,CLIENT_IP      ' +
      '      ,API_TP         ' +
      '      ,MNG_ID         ' +
      '      ,(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT ' +
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM %s A           ' +
      ' WHERE USER_ID = %s   ' +
      '   AND TRADE_DT  = %s ' +
      sAcntTp,
      [sTableNm,
       QuotedStr(dbUser.FieldByName('USER_ID').AsString),
       QuotedStr(StrReplace(dtCntrDt.Text, '-', ''))]);
    fnSqlOpen(dbOrd, sSql);

    // Form Show 로 이전하여 테스트
{    PartTableOpen(TComponent(gdOrd.Columns[ 4]), CodeFormat('ACNT_TP'));
    PartTableOpen(TComponent(gdOrd.Columns[ 6]), CodeFormat('BS_TP'));
    PartTableOpen(TComponent(gdOrd.Columns[ 7]), CodeFormat('ORD_TP'));
    PartTableOpen(TComponent(gdOrd.Columns[ 8]), CodeFormat('COND_TP'));
    PartTableOpen(TComponent(gdOrd.Columns[ 9]), CodeFormat('ACPT_TP'));
    PartTableOpen(TComponent(gdOrd.Columns[11]), CodeFormat('SL_TP'));
    PartTableOpen(TComponent(gdOrd.Columns[19]), CodeFormat('API_TP'));
}
    if sResult = '' then pnOrdCnt.Caption := dbOrd.FieldByName('TOTCNT').AsString + ' 건'
                    else pnOrdCnt.Caption := '0 건';
  finally
    Delay_Hide;
  end;
end;

procedure TfmOrdDetail.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  dbMain.DB_Format('CNTR_NO', '###0');
//  dbMain.DB_Format('ORD_NO', '###0');
end;

procedure TfmOrdDetail.dbOrdAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('ORD_PRC')).DisplayFormat := FORMAT_AMTUSD;
  end;
end;

procedure TfmOrdDetail.dbMainCalcFields(DataSet: TDataSet);
var
  iDigit : Integer;
begin
  inherited;
  with DataSet do begin
    // dbMainAfterOpen 으로 이동
    iDigit := FieldByName('DOT_CNT').AsInteger;
    FieldByName('CNTRPRC' ).AsString := FormatFloat(FormatDotCnt(iDigit  ), FieldByName('CNTR_PRC'  ).AsFloat);
    FieldByName('CLRPLF'  ).AsString := FormatFloat(FormatDotCnt(iDigit  ), FieldByName('CLR_PL_F'  ).AsFloat);
    FieldByName('CMSNAMTF').AsString := FormatFloat(FormatDotCnt(iDigit  ), FieldByName('CMSN_AMT_F').AsFloat);
    FieldByName('ORDPRC'  ).AsString := FormatFloat(FormatDotCnt(iDigit  ), FieldByName('ORD_PRC'   ).AsFloat);
    FieldByName('BFAVGPRC').AsString := FormatFloat(FormatDotCnt(iDigit+3), FieldByName('BF_AVG_PRC').AsFloat);
    FieldByName('AFAVGPRC').AsString := FormatFloat(FormatDotCnt(iDigit+3), FieldByName('AF_AVG_PRC').AsFloat);
  end;
end;

procedure TfmOrdDetail.dbOrdCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('ORDPRC').AsString  := FormatFloat(FormatDotCnt(iCnt), FieldByName('ORD_PRC').AsFloat);
  end;
end;

procedure TfmOrdDetail.gdCntrDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
                                           else Canvas.Font.Color := clBlue;
    if DataCol = 5 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));

    Canvas.Font.Color := clBlack;
    if CompareValue(FieldByName('CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
    if CompareValue(FieldByName('CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
    if DataCol = 8 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmOrdDetail.gdOrdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
                                           else Canvas.Font.Color := clBlue;
    if DataCol = 6 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmOrdDetail.gdUserDblClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
  if cbxSearchBS.Checked then OrdTableOpen;
end;

procedure TfmOrdDetail.rgCntrAcntTpClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
  if cbxSearchBS.Checked then OrdTableOpen;
end;

procedure TfmOrdDetail.rgOrdAcntTpClick(Sender: TObject);
begin
  inherited;
  OrdTableOpen;
end;

procedure TfmOrdDetail.tmOpenTimer(Sender: TObject);
begin
  inherited;
  tmOpen.Enabled := False;

  MainTableOpen;
  if cbxSearchBS.Checked then OrdTableOpen;
end;

end.
