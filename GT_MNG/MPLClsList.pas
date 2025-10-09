unit MPLClsList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, Math;

type
  TfmPLClsList = class(TfmBasic)
    gdMain: TDBGridEh;
    rgClsPLAcntTp: TbsSkinRadioGroup;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    pnClsPL: TRzPanel;
    chUserTp: TbsSkinCheckRadioBox;
    cbUser: TbsSkinCheckRadioBox;
    cbUserGrade: TkcRzComboBox;
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure chUserTpClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmPLClsList: TfmPLClsList;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmPLClsList.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPLClsList.chUserTpClick(Sender: TObject);
begin
  inherited;
  btnFilter.ButtonClick;
end;

procedure TfmPLClsList.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;

	with DataSet do
  begin
//    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmPLClsList.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg: String;
begin
  inherited;

	with DataSet do
  begin
//  	sMsg := '';
//  	// 필수입력값 체크
//    if FieldByName('REG_DT').IsNull          then sMsg := '등록일자';
//    if FieldByName('CONN_PWD').AsString = '' then sMsg := '비밀번호';
//    if FieldByName('FRONT_IP').AsString = '' then sMsg := '접속IP';
//    if FieldByName('USER_NM').AsString = ''  then sMsg := '회원명';
//    if FieldByName('USERID').AsString = ''   then sMsg := '회원ID';
//
//    if sMsg <> '' then
//    begin
//      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
//      Abort;
//    end;
  end;
end;

procedure TfmPLClsList.FormShow(Sender: TObject);
begin
  inherited;
  if __Supervisor then cbUserGrade.Visible := True;

  PartTableOpen(cbUserGrade, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE < 9 ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE')]), '회원등급', '0');
  cbUserGrade.ItemIndex := 0;

  dtStart.Date   := TextToDate(__Trade_DT) -7;
  dtEnd.Date     := TextToDate(__Trade_DT) -1;
end;

procedure TfmPLClsList.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    Canvas.Font.Color := clBlack;
    if CompareValue(FieldByName('NET_PL_SUM').AsFloat, 0) > 0 then Canvas.Font.Color := clRed
    else if CompareValue(FieldByName('NET_PL_SUM').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;

    if DataCol = 4 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPLClsList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
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

procedure TfmPLClsList.MainTableOpen;
var
  sSql, sAcntTp, sUserTp : String;
begin
  try
    Delay_Show();

//    if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
//    else sUserTp := '';

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

    if rgClsPLAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND ACNT_TP = %s ', [QuotedStr(intTostr(rgClsPLAcntTp.ItemIndex))]);

    if cbUser.Checked then
    begin
      gdMain.Columns[0].Title.Caption := '회원명';
      gdMain.Columns[0].FieldName := 'USER_NM';

      sSql := Format( 'SELECT USER_ID,USER_NM,ACNT_TP,RSLT_IN_AMT,RSLT_OUT_AMT,                                               '+
                      '       KSF_PL,KSF_CMSN,KSO_PL,KSO_CMSN,K_PL_SUM,K_CMSN_SUM,                                            '+
                      '       GF_PL,GF_CMSN,GF_PL_SUM,GF_CMSN_SUM,CLR_PL_SUM,CMSN_SUM,                                        '+
                      '       NET_PL_SUM,TOTCNT                                                                               '+
                      'FROM                                                                                                   '+
                      '(SELECT USER_ID,USER_NM,                                                                               '+
                      '	(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP,        '+
                      '	SUM(ISNULL(RSLT_IN_AMT,0)) AS RSLT_IN_AMT,                                                            '+
                      '	SUM(ISNULL(RSLT_OUT_AMT,0)) AS RSLT_OUT_AMT,                                                          '+
                      '	SUM(ISNULL(KSF_PL,0)) AS KSF_PL,                                                                      '+
                      '	SUM(ISNULL(KSF_CMSN,0)) AS KSF_CMSN,                                                                  '+
                      '	SUM(ISNULL(KSO_PL,0)) AS KSO_PL,                                                                      '+
                      '	SUM(ISNULL(KSO_CMSN,0)) AS KSO_CMSN,                                                                  '+
                      '	SUM(ISNULL(K_PL_SUM,0)) AS K_PL_SUM,                                                                  '+
                      '	SUM(ISNULL(K_CMSN_SUM,0)) AS K_CMSN_SUM,                                                              '+
                      '	SUM(ISNULL(GF_PL,0)) AS GF_PL,                                                                        '+
                      '	SUM(ISNULL(GF_CMSN,0)) AS GF_CMSN,                                                                    '+
                      '	SUM(ISNULL(GF_PL_SUM,0)) AS GF_PL_SUM,                                                                '+
                      '	SUM(ISNULL(GF_CMSN_SUM,0)) AS GF_CMSN_SUM,                                                            '+
                      '	SUM(ISNULL(CLR_PL_SUM,0)) AS CLR_PL_SUM,                                                              '+
                      '	SUM(ISNULL(CMSN_SUM,0)) AS CMSN_SUM,                                                                  '+
                      '	SUM(ISNULL(NET_PL_SUM,0)) AS NET_PL_SUM,                                                              '+
                      '	COUNT(1) OVER() AS TOTCNT                                                                             '+
                      '	FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A                  '+
                      '	WHERE TRADE_DT BETWEEN %s AND %s                                                                      '+
                      sAcntTp +
                      '	GROUP BY  ACNT_TP,USER_ID,USER_NM ) TMP                                                               '+
                      '	WHERE (NET_PL_SUM <> 0 OR (RSLT_IN_AMT <> 0 OR RSLT_OUT_AMT <> 0))                                    '+
                      ' ORDER BY USER_NM                                                                                      ',
                      [QuotedStr('ACNT_TP'),
                       sUserTp,
                       QuotedStr(StrReplace(dtStart.Text, '-', '')),
                       QuotedStr(StrReplace(dtEnd.Text, '-', ''))]);
      Uni_Open(dbMain, sSql);

    end
    else
    begin
      gdMain.Columns[0].Title.Caption := '영업일';
      gdMain.Columns[0].FieldName := 'TRADE_DT';

      sSql := Format( 'SELECT TRADE_DT,                             '+
                      '(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP, '+
                      'SUM(ISNULL(RSLT_IN_AMT,0)) AS RSLT_IN_AMT,   '+
                      'SUM(ISNULL(RSLT_OUT_AMT,0)) AS RSLT_OUT_AMT, '+
                      'SUM(ISNULL(KSF_PL,0)) AS KSF_PL,             '+
                      'SUM(ISNULL(KSF_CMSN,0)) AS KSF_CMSN,         '+
                      'SUM(ISNULL(KSO_PL,0)) AS KSO_PL,             '+
                      'SUM(ISNULL(KSO_CMSN,0)) AS KSO_CMSN,         '+
                      'SUM(ISNULL(K_PL_SUM,0)) AS K_PL_SUM,         '+
                      'SUM(ISNULL(K_CMSN_SUM,0)) AS K_CMSN_SUM,     '+
                      'SUM(ISNULL(GF_PL,0)) AS GF_PL,               '+
                      'SUM(ISNULL(GF_CMSN,0)) AS GF_CMSN,           '+
                      'SUM(ISNULL(GF_PL_SUM,0)) AS GF_PL_SUM,       '+
                      'SUM(ISNULL(GF_CMSN_SUM,0)) AS GF_CMSN_SUM,   '+
                      'SUM(ISNULL(CLR_PL_SUM,0)) AS CLR_PL_SUM,     '+
                      'SUM(ISNULL(CMSN_SUM,0)) AS CMSN_SUM,         '+
                      'SUM(ISNULL(NET_PL_SUM,0)) AS NET_PL_SUM,     '+
                      'COUNT(1) OVER() AS TOTCNT                    '+
                      'FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A '+
                      'WHERE TRADE_DT BETWEEN %s AND %s             '+
                      sAcntTp +
                      'GROUP BY TRADE_DT, ACNT_TP                   '+
                      'ORDER BY TRADE_DT DESC                       ',
                      [QuotedStr('ACNT_TP'),
                       sUserTp,
                       QuotedStr(StrReplace(dtStart.Text, '-', '')),
                       QuotedStr(StrReplace(dtEnd.Text, '-', ''))]);
      Uni_Open(dbMain, sSql);

    end;

//    Uni_Open(dbMain, sSql);

    if dbMain.RecordCount > 0 then pnClsPL.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
    else pnClsPL.Caption := '0 건';

  finally
    Delay_Hide;
  end;
end;

end.
