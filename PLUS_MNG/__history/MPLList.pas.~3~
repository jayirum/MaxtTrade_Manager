unit MPLList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, UniDAC_Helper, Math, RzRadGrp;

type
  TfmPLList = class(TfmBasic)
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    RzPanel1: TRzPanel;
    RzSizePanel1: TRzSizePanel;
    RzPanel2: TRzPanel;
    dbUser: TUniQuery;
    dbUserUSER_NM: TStringField;
    dbUserUSER_ID: TStringField;
    dsUser: TDataSource;
    edUserID: TkcRzDBEdit;
    tmOpen: TTimer;
    edFind: TRzEdit;
    dbClsPL: TUniQuery;
    dsClsPL: TDataSource;
    RzPanel4: TRzPanel;
    btnPLClsExcel: TbsSkinSpeedButton;
    pnClsPL: TRzPanel;
    RzDBNavigator2: TRzDBNavigator;
    bsSkinLabel2: TbsSkinLabel;
    gdClsPL: TDBGridEh;
    RzPanel3: TRzPanel;
    btnPLExcel: TbsSkinSpeedButton;
    RzDBNavigator1: TRzDBNavigator;
    pnCntr: TRzPanel;
    bsSkinLabel45: TbsSkinLabel;
    rgPLAcntTp: TbsSkinRadioGroup;
    gdMain: TDBGridEh;
    cbFind: TkcRzComboBox;
    bsSkinLabel1: TbsSkinLabel;
    edTreadeDt: TkcRzDBEdit;
    tmPLOpen: TTimer;
    tmPLAll: TTimer;
    edClsUserId: TkcRzDBEdit;
    rgClsPLAcntTp: TbsSkinRadioGroup;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    edAcntTp: TkcRzDBEdit;
    chUserTp: TbsSkinCheckRadioBox;
    dtDetailStart: TkcRzDateTimeEdit;
    bsSkinLabel3: TbsSkinLabel;
    cbUserGrade: TkcRzComboBox;
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure tmOpenTimer(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnPLExcelClick(Sender: TObject);
    procedure btnPLClsExcelClick(Sender: TObject);
    procedure rgPLAcntTpClick(Sender: TObject);
    procedure rgClsPLAcntTpClick(Sender: TObject);
    procedure cbFindChange(Sender: TObject);
    procedure edTreadeDtChange(Sender: TObject);
    procedure tmPLOpenTimer(Sender: TObject);
    procedure edClsUserIdChange(Sender: TObject);
    procedure tmPLAllTimer(Sender: TObject);
    procedure edAcntTpChange(Sender: TObject);
    procedure chUserTpClick(Sender: TObject);
    procedure gdClsPLTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdClsPLDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
    procedure ClsPLTableOpen(sID : String='ALL');
    procedure StkClsTableOpen(sTp : String);
    procedure StkPlTableOpen(sTp : String);
  end;

var
  fmPLList: TfmPLList;

implementation

uses StdUtils, MMastDB, MDelay, MUserDetail;

{$R *.dfm}

{ TfmSample }

procedure TfmPLList.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPLList.btnFilterClick(Sender: TObject);
begin
  if cbFind.ItemIndex = 0 then ClsPLTableOpen
  else ClsPLTableOpen(dbUser.FieldByName('USER_ID').AsString);

  inherited;
end;

procedure TfmPLList.btnFindClick(Sender: TObject);
var
  sWhere, sUserTp, sGrade : String;
begin
  inherited;

  if __Supervisor then
  begin
    if cbUserGrade.ItemIndex <> 0 then sUserTp := Format(' USER_GRADE = %s AND ', [IntToStr(cbUserGrade.ItemIndex)])
    else if chUserTp.Checked then sUserTp := Format(' USER_GRADE IN (%s,%s) AND ', [QuotedStr('2'),QuotedStr('7')])
    else sUserTp := '';
  end
  else
  begin
    if chUserTp.Checked then sUserTp := ' USER_GRADE = 2 AND '
    else sUserTp := ' USER_GRADE <> 7 AND ';
  end;

//  sWhere := ' WHERE ' + StrReplace(__Find_User, '<X>', edFind.Text);
  sWhere := Format(' WHERE %s (%s)', [sUserTp, StrReplace(__Find_User, '<X>', edFind.Text)]);

  UserTableOpen(sWhere);
end;

procedure TfmPLList.btnPLClsExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdClsPL);
end;

procedure TfmPLList.btnPLExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPLList.cbFindChange(Sender: TObject);
begin
  inherited;
  if cbFind.ItemIndex <> 0 then
  begin
    edFind.Visible  := True;
    btnFind.Visible := True;
    gdUser.Visible  := True;
    dtEnd.Visible   := True;
    dtStart.Date := TextToDate(__Trade_DT) -7;
    dtEnd.Date   := TextToDate(__Trade_DT);
  end
  else
  begin
    edFind.Visible  := False;
    btnFind.Visible := False;
    gdUser.Visible  := False;
    dtEnd.Visible   := False;
    dtStart.Date    := TextToDate(__Trade_DT);
  end;
end;

procedure TfmPLList.chUserTpClick(Sender: TObject);
begin
  inherited;
//  btnFilter.ButtonClick;
end;

procedure TfmPLList.ClsPLTableOpen(sID : String='ALL');
var
  sPLSql, sPLClsSql, sSQL, sAcntTp, sWhere , sUnion, sUserTp : String;
  bNowDt : BOOLEAN;
begin

  try
    Delay_Show();

    bNowDt := False;

//    if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
//    else sUserTp := '';

    if cbFind.ItemIndex = 0 then
    begin
      if __Supervisor then
      begin
        if cbUserGrade.ItemIndex <> 0 then sUserTp := Format(' AND B1.USER_GRADE = %s ', [IntToStr(cbUserGrade.ItemIndex)])
        else if chUserTp.Checked then sUserTp := Format(' AND B1.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
        else sUserTp := '';
      end
      else
      begin
        if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
        else sUserTp := ' AND B1.USER_GRADE <> 7 ';
      end;
    end;

    if (StrReplace(dtStart.Text, '-', '') <= __Trade_DT) and (__Trade_DT <= StrReplace(dtEnd.Text, '-', ''))  then
    begin
      bNowDt := True;
      sUnion := ' UNION ALL ';
    end;

    if rgClsPLAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND A.ACNT_TP = %s ', [QuotedStr(intTostr(rgClsPLAcntTp.ItemIndex))]);

    if cbFind.ItemIndex = 0 then sWhere  := Format(' A.TRADE_DT = %s ', [QuotedStr(StrReplace(dtStart.Text, '-', ''))])
    else sWhere := Format(' A.TRADE_DT BETWEEN %s AND %s ', [QuotedStr(StrReplace(dtStart.Text, '-', '')), QuotedStr(StrReplace(dtEnd.Text, '-', ''))]);

    sPLSql := Format( 'SELECT * FROM ( '+
                      'SELECT  %s AS TRADE_DT '+
                      '         , SUM(ISNULL(A.ACNT_AMT,0)) AS ACNT_AMT '+
                      '         ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP '+
                      '         , A.ACNT_NO '+
                      '         , A.USER_ID '+
                      '         , A.USER_NM '+
                      '         , SUM(ISNULL(A.BF_ACNT_AMT,0)) AS ACNT_AMT_BF '+
                      '         , SUM(ISNULL((A.ACNT_AMT + A.CLR_PL - A.CMSN),0)) AS ACNT_AMT_TODAY '+
                      '         , (SELECT ISNULL(SUM(RQST_AMT),0) FROM INOUT WHERE ACNT_NO = A.ACNT_NO AND IO_TP = %s AND RSLT_TRADE_DT = %s AND RSLT_TP = %s) AS RQST_IN_AMT '+
                      '         , (SELECT ISNULL(SUM(RQST_AMT),0) FROM INOUT WHERE ACNT_NO = A.ACNT_NO AND IO_TP = %s AND RSLT_TRADE_DT = %s AND RSLT_TP = %s) AS RQST_OUT_AMT '+
                      '         , (SELECT ISNULL(SUM(RSLT_AMT),0) FROM INOUT WHERE ACNT_NO = A.ACNT_NO AND IO_TP = %s AND RSLT_TRADE_DT = %s AND RSLT_TP = %s) AS RSLT_IN_AMT '+
                      '         , (SELECT ISNULL(SUM(RSLT_AMT),0) FROM INOUT WHERE ACNT_NO = A.ACNT_NO AND IO_TP = %s AND RSLT_TRADE_DT = %s AND RSLT_TP = %s) AS RSLT_OUT_AMT '+
                      '         , SUM(ISNULL(B.F101_PL,0)) AS KSF_PL '+
                      '         , SUM(ISNULL(B.F101_CMSN,0)) AS KSF_CMSN '+
                      '         , SUM(ISNULL(C.F101,0)) AS KSF_NCLR_QTY '+
                      '         , SUM(ISNULL(B.F201_PL,0)) AS KSO_PL '+
                      '         , SUM(ISNULL(B.F201_CMSN,0)) AS KSO_CMSN '+
                      '         , SUM(ISNULL(C.F201,0)) AS KSO_NCLR_QTY '+
                      '         , SUM(ISNULL(B.GF_PL,0)) AS GF_PL '+
                      '         , SUM(ISNULL(B.GF_CMSN,0)) AS GF_CMSN '+
                      '         , SUM(ISNULL(C.GF,0)) AS GF_NCLR_QTY '+
                      '         , ISNULL((SUM(B.F101_PL) + SUM(B.F201_PL) + SUM(B.GF_PL)),0) AS CLR_PL_SUM '+
                      '         , ISNULL((SUM(B.F101_CMSN) + SUM(B.F201_CMSN) + SUM(B.GF_CMSN)),0) AS CMSN_SUM '+
                      '         , ISNULL(((SUM(B.F101_PL) + SUM(B.F201_PL) + SUM(B.GF_PL)) - (SUM(B.F101_CMSN) + SUM(B.F201_CMSN) + SUM(B.GF_CMSN))),0) AS NET_PL_SUM '+
                      'FROM '+
                      ' (SELECT A1.* FROM ACNT_MST A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A '+
                      ' LEFT OUTER JOIN '+
                      '(SELECT ACNT_NO '+
                      '      ,ACNT_TP '+
                      '      ,TRADE_DT '+
                      '      ,SUM(ISNULL(F101_PL,0)) AS F101_PL '+
                      '      ,SUM(ISNULL(F101_CMSN,0)) AS F101_CMSN '+
                      '      ,SUM(ISNULL(F201_PL,0)) AS F201_PL '+
                      '      ,SUM(ISNULL(F201_CMSN,0)) AS F201_CMSN '+
                      '      ,SUM(ISNULL(GF_PL,0)) AS GF_PL '+
                      '      ,SUM(ISNULL(GF_CMSN,0)) AS GF_CMSN '+
                      'FROM '+
                      '      (SELECT ACNT_NO '+
                      '             ,ACNT_TP '+
                      '             ,TRADE_DT '+
                      '             , CASE WHEN ARTC_CD = %s THEN SUM(ISNULL(CLR_PL,0)) END F101_PL '+
                      '             , CASE WHEN ARTC_CD = %s THEN SUM(ISNULL(CMSN_AMT,0)) END F101_CMSN '+
                      '             , CASE WHEN ARTC_CD IN (%s, %s) THEN SUM(ISNULL(CLR_PL,0)) END F201_PL '+
                      '             , CASE WHEN ARTC_CD IN (%s, %s) THEN SUM(ISNULL(CMSN_AMT,0)) END F201_CMSN '+
                      '             , CASE WHEN ACNT_TP = %s THEN SUM(ISNULL(CLR_PL,0)) END GF_PL '+
                      '             , CASE WHEN ACNT_TP = %s THEN SUM(ISNULL(CMSN_AMT,0)) END GF_CMSN '+
                      '       FROM CNTR '+
                      '       WHERE TRADE_DT = %s '+
                      '       GROUP BY ACNT_TP, TRADE_DT, ACNT_NO, ARTC_CD) X '+
                      'GROUP BY ACNT_NO,ACNT_TP,TRADE_DT) B '+
                      'ON A.ACNT_NO = B.ACNT_NO '+
                      'LEFT OUTER JOIN '+
                      '(SELECT '+
                      '       ACNT_NO '+
                      '     , SUM(ISNULL(F101*SS,0)) F101 '+
                      '     , SUM(ISNULL(F201*SS,0)) F201 '+
                      '     , SUM(ISNULL(GF*SS,0)) GF '+
                      'FROM '+
                      '(SELECT CASE WHEN BS_TP = %s THEN -1 '+
                      '       ELSE 1 END SS '+
                      '     , CASE WHEN ARTC_CD = %s THEN NCLR_POS_QTY END F101 '+
                      '     , CASE WHEN ARTC_CD IN (%s, %s) THEN NCLR_POS_QTY END F201 '+
                      '     , CASE WHEN ACNT_TP = %s THEN NCLR_POS_QTY END GF '+
                      '     , ACNT_NO '+
                      'FROM '+
                      '  NCLR_POS) Z '+
                      'GROUP BY ACNT_NO) C '+
                      'ON B.ACNT_NO = C.ACNT_NO '+
                      'WHERE (%s = %s ' +sAcntTp+ ') OR (%s <> %s AND A.USER_ID = %s ' +sAcntTp+ ') '+
                      'GROUP BY B.TRADE_DT '+
                      '         , A.ACNT_NO '+
                      '         , A.ACNT_TP '+
                      '         , A.USER_ID '+
                      '         , A.USER_NM '+
                      ' ) TMP WHERE (ACNT_AMT <> 0 OR (RSLT_IN_AMT <> 0 OR RSLT_OUT_AMT <> 0 OR CMSN_SUM <> 0 OR NET_PL_SUM <> 0)) ',
//                      ' ORDER BY ACNT_TP, USER_NM ',
                      [QuotedStr(__Trade_DT),
                       QuotedStr('ACNT_TP'),
                       QuotedStr('1'),
                       QuotedStr(__Trade_DT),
                       QuotedStr('1'),
                       QuotedStr('2'),
                       QuotedStr(__Trade_DT),
                       QuotedStr('1'),
                       QuotedStr('1'),
                       QuotedStr(__Trade_DT),
                       QuotedStr('1'),
                       QuotedStr('2'),
                       QuotedStr(__Trade_DT),
                       QuotedStr('1'),
                       sUserTp,
                       QuotedStr('101'),
                       QuotedStr('101'),
                       QuotedStr('201'),
                       QuotedStr('301'),
                       QuotedStr('201'),
                       QuotedStr('301'),
                       QuotedStr('2'),
                       QuotedStr('2'),
                       QuotedStr(__Trade_DT),
                       QuotedStr('S'),
                       QuotedStr('101'),
                       QuotedStr('201'),
                       QuotedStr('301'),
                       QuotedStr('2'),
                       QuotedStr('ALL'),
                       QuotedStr(sID),
                       QuotedStr('ALL'),
                       QuotedStr(sID),
                       QuotedStr(sID)]);

    sPLClsSql := Format('SELECT TRADE_DT '+
                        '     ,0 AS ACNT_AMT '+
                        '			,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP '+
                        '			,ACNT_NO         '+
                        '			,USER_ID         '+
                        '			,USER_NM         '+
                        '			,ACNT_AMT_BF     '+
                        '			,ACNT_AMT_TODAY  '+
                        '			,RQST_IN_AMT     '+
                        '			,RQST_OUT_AMT    '+
                        '			,RSLT_IN_AMT     '+
                        '			,RSLT_OUT_AMT    '+
                        '			,KSF_PL          '+
                        '			,KSF_CMSN        '+
                        '			,KSF_NCLR_QTY    '+
                        '			,KSO_PL          '+
                        '			,KSO_CMSN        '+
                        '			,KSO_NCLR_QTY    '+
                        '			,GF_PL           '+
                        '			,GF_CMSN         '+
                        '			,GF_NCLR_QTY     '+
                        '			,CLR_PL_SUM      '+
                        '			,CMSN_SUM        '+
                        '			,NET_PL_SUM      '+
                        'FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A '+
                        'WHERE '+ sWhere +
                        sAcntTp +
                        'AND (ACNT_AMT_TODAY <> 0 OR (RSLT_IN_AMT <> 0 OR RSLT_OUT_AMT <> 0 OR CMSN_SUM <> 0 OR NET_PL_SUM <> 0)) '+
                        'AND ((%s = %s) OR (%s <> %s AND A.USER_ID = %s)) '+
                        'ORDER BY TRADE_DT DESC ',
                        [QuotedStr('ACNT_TP'),
                         sUserTp,
                         QuotedStr('ALL'),
                         QuotedStr(sID),
                         QuotedStr('ALL'),
                         QuotedStr(sID),
                         QuotedStr(sID)]);

    if cbFind.ItemIndex = 0 then
    begin
      if StrReplace(dtStart.Text, '-', '') = __Trade_DT then Uni_Open(dbClsPL, sPLSql)
      else Uni_Open(dbClsPL, sPLClsSql);
    end
    else
    begin
      if bNowDt then sSQL := sPLSql + sUnion + sPLClsSql
      else sSQL := sPLClsSql;
      Uni_Open(dbClsPL, sSQL);
    end;

    pnClsPL.Caption := IntToStr(dbClsPL.RecordCount) + ' 건';

    if cbFind.ItemIndex = 0 then
    begin
      gdClsPL.Columns[4].Footers[0].ValueType := fvtSum;
      gdClsPL.Columns[5].Footers[0].ValueType := fvtSum;
    end
    else
    begin
      gdClsPL.Columns[4].Footers[0].ValueType := fvtNon;
      gdClsPL.Columns[5].Footers[0].ValueType := fvtNon;
    end;

  finally
    Delay_Hide;
  end;

end;

procedure TfmPLList.edAcntTpChange(Sender: TObject);
begin
  Exit;
//  if edClsUserId.Text = '' then Exit;
//
//  tmPLAll.Enabled := False;
//  tmPLAll.Enabled := True;
end;

procedure TfmPLList.edClsUserIdChange(Sender: TObject);
begin
  Exit;
//  if (cbFind.ItemIndex <> 0) or (edClsUserId.Text = '') then Exit;
//
//  tmPLAll.Enabled := False;
//  tmPLAll.Enabled := True;
end;

procedure TfmPLList.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmPLList.edTreadeDtChange(Sender: TObject);
begin
  Exit;
//  if (cbFind.ItemIndex = 0) or (edTreadeDt.Text = '') then Exit;
//
//  tmPLOpen.Enabled := False;
//  tmPLOpen.Enabled := True;
end;

procedure TfmPLList.edUserIDChange(Sender: TObject);
begin
  Exit;
//  if (cbFind.ItemIndex = 0) or (edUserID.Text = '') then Exit;
//
//  tmOpen.Enabled := False;
//  tmOpen.Enabled := True;

end;

procedure TfmPLList.FormShow(Sender: TObject);
begin
  inherited;
  if __Supervisor then cbUserGrade.Visible := True;

  PartTableOpen(cbUserGrade, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE < 9 ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE')]), '회원등급', '0');
  cbUserGrade.ItemIndex := 0;

  dtStart.Date   := TextToDate(__Trade_DT); //TextToDate(NowDate)
  dtDetailStart.Date := TextToDate(__Trade_DT) -30;
end;

procedure TfmPLList.gdClsPLDblClick(Sender: TObject);
begin
  inherited;
  if edTreadeDt.Text = __Trade_DT then
  begin
    StkPlTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end
  else
  begin
    StkClsTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end;

  UserDetail(dbClsPL.FieldByName('USER_ID').AsString,dbClsPL.FieldByName('ACNT_TP').AsString, StrReplace(dtDetailStart.Text, '-', ''));
end;

procedure TfmPLList.gdClsPLTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbClsPL do
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

procedure TfmPLList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmPLList.gdUserDblClick(Sender: TObject);
begin
  inherited;
  ClsPLTableOpen(dbUser.FieldByName('USER_ID').AsString);
end;

procedure TfmPLList.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbUser do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmPLList.MainTableOpen;
begin
  //override
end;

procedure TfmPLList.rgClsPLAcntTpClick(Sender: TObject);
begin
  inherited;
  if cbFind.ItemIndex = 0 then ClsPLTableOpen
  else ClsPLTableOpen(dbUser.FieldByName('USER_ID').AsString);

  if edTreadeDt.Text = __Trade_DT then
  begin
    StkPlTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end
  else
  begin
    StkClsTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end;
end;

procedure TfmPLList.rgPLAcntTpClick(Sender: TObject);
begin
  inherited;
  if edTreadeDt.Text = __Trade_DT then
  begin
    StkPlTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end
  else
  begin
    StkClsTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end;
end;

procedure TfmPLList.StkClsTableOpen(sTp : String);
var
  sSql, sAcntTp : String;
begin
  try
    Delay_Show();

    if sTp = '국내파생' then sAcntTp := '1';
    if sTp = '해외파생' then sAcntTp := '2';

//    if rgClsPLAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND A.ACNT_TP = %s', [QuotedStr(intTostr(rgClsPLAcntTp.ItemIndex))]);

    sSql := Format( 'SELECT          '+
                    '      TRADE_DT  '+
                    '     ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP '+
                    '     ,ACNT_NO   '+
                    '     ,STK_CD    '+
                    '     ,USER_ID   '+
                    '     ,USER_NM   '+
                    '     ,TRADE_QTY '+
                    '     ,TRADE_CNT '+
                    '     ,NCLR_QTY  '+
                    '     ,CLR_PL    '+
                    '     ,CMSN      '+
                    '     ,NET_PL    '+
                    '     ,(SELECT STK_NM FROM STK_MST WHERE STK_CD = A.STK_CD) AS STK_NM '+
                    '     ,COUNT(1) OVER() AS TOTCNT '+
                    'FROM ACNT_STK_CLS A             '+
                    'WHERE A.USER_ID = %s            '+
//                    sAcntTp +
                    ' AND A.ACNT_TP = %s             '+
                    ' AND A.TRADE_DT = %s            '+
                    'ORDER BY TRADE_DT DESC          ',
                    [QuotedStr('ACNT_TP'),
                     QuotedStr(dbClsPL.FieldByName('USER_ID').AsString),
                     QuotedStr(sAcntTp),
                     QuotedStr(dbClsPL.FieldByName('TRADE_DT').AsString)]);

    Uni_Open(dbMain, sSql);

    if dbMain.RecordCount > 0 then pnCntr.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
    else pnCntr.Caption := '0 건';
  finally
    Delay_Hide;
  end;

end;

procedure TfmPLList.StkPlTableOpen(sTp : String);
var
  sSql, sAcntTp : String;
begin
  try
    Delay_Show();

    if sTp = '국내파생' then sAcntTp := '1';
    if sTp = '해외파생' then sAcntTp := '2';

//    if rgClsPLAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND A.ACNT_TP = %s', [QuotedStr(intTostr(rgClsPLAcntTp.ItemIndex))]);

    sSQL := Format( 'SELECT A.TRADE_DT '+
                    '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP '+
                    '      ,A.ACNT_NO '+
                    '      ,A.STK_CD '+
                    '      ,A.USER_ID '+
                    '      ,(SELECT USER_NM FROM ACNT_MST WHERE ACNT_NO = A.ACNT_NO) AS USER_NM '+
                    '      ,SUM(A.CNTR_QTY) AS TRADE_QTY '+
                    '      ,COUNT(*) AS TRADE_CNT '+
                    '      ,MAX(ISNULL(B.NCLR_POS_QTY,0)) AS NCLR_QTY '+
                    '      ,SUM(A.CLR_PL) AS CLR_PL '+
                    '      ,SUM(A.CMSN_AMT) AS CMSN '+
                    '      ,(SUM(A.CLR_PL) - SUM(A.CMSN_AMT)) AS NET_PL '+
                    '      ,(SELECT STK_NM FROM STK_MST WHERE STK_CD = A.STK_CD) AS STK_NM '+
                    '      ,COUNT(1) OVER()     AS TOTCNT '+
                    'FROM CNTR A LEFT OUTER JOIN '+
                    '    (SELECT ACNT_NO '+
                    '          , STK_CD '+
                    '          , ISNULL(SUM(NCLR_POS_QTY*SS), 0) AS NCLR_POS_QTY '+
                    '     FROM '+
                    '        (SELECT CASE WHEN BS_TP = %s THEN -1 '+
                    '                     ELSE 1 END SS '+
                    '              , NCLR_POS_QTY '+
                    '              , ACNT_NO '+
                    '              , STK_CD '+
                    '         FROM NCLR_POS) Z '+
                    '     GROUP BY ACNT_NO,STK_CD) B '+
                    'ON A.ACNT_NO = B.ACNT_NO '+
                    'AND A.STK_CD = B.STK_CD '+
                    'WHERE A.USER_ID = %s '+
//                    sAcntTp +
                    ' AND A.ACNT_TP = %s  '+
                    ' GROUP BY A.TRADE_DT '+
                    '      ,A.ACNT_TP '+
                    '      ,A.ACNT_NO '+
                    '      ,A.STK_CD '+
                    '      ,A.USER_ID ',
                    [QuotedStr('ACNT_TP'),
                     QuotedStr('S'),
                     QuotedStr(dbClsPL.FieldByName('USER_ID').AsString),
                     QuotedStr(sAcntTp)]);

    Uni_Open(dbMain, sSql);

    if dbMain.RecordCount > 0 then pnCntr.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
    else pnCntr.Caption := '0 건';
  finally
    Delay_Hide;
  end;
end;

procedure TfmPLList.tmOpenTimer(Sender: TObject);
begin
  inherited;
  tmOpen.Enabled := False;
  ClsPLTableOpen(dbUser.FieldByName('USER_ID').AsString);
end;

procedure TfmPLList.tmPLAllTimer(Sender: TObject);
begin
  inherited;
  tmPLAll.Enabled := False;

  if edTreadeDt.Text = __Trade_DT then
  begin
    StkPlTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end
  else
  begin
    StkClsTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end;
end;

procedure TfmPLList.tmPLOpenTimer(Sender: TObject);
begin
  inherited;
  tmPLOpen.Enabled := False;

  if edTreadeDt.Text = __Trade_DT then
  begin
    StkPlTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end
  else
  begin
    StkClsTableOpen(dbClsPL.FieldByName('ACNT_TP').AsString);
  end;

end;

procedure TfmPLList.UserTableOpen(sWhere: String);
var
  sSql : String;
begin
  sSql := 'SELECT USER_NM, USER_ID '+
          'FROM USER_MST           '+
          sWhere;
  Uni_Open(dbUser, sSql);
end;

end.
