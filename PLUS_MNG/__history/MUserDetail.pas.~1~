unit MUserDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, kcRaizeCtrl, bsSkinCtrls, ExtCtrls, RzPanel,
  ImgList, DB, MemDS, DBAccess, Uni, bsMessages, BusinessSkinForm,
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, DBCtrls, RzDBEdit, math;

type
  TfmUserDetail = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    dbMain: TUniQuery;
    dsMain: TDataSource;
    imgBtn: TImageList;
    pnFind: TRzPanel;
    pnSTKCd: TRzPanel;
    pnNm: TRzPanel;
    RzPanel3: TRzPanel;
    pnId: TRzPanel;
    lbPwd: TRzPanel;
    pnConn: TRzPanel;
    RzPanel7: TRzPanel;
    pnTotAcntAmt: TRzPanel;
    RzPanel8: TRzPanel;
    pnTodayPL: TRzPanel;
    RzPanel10: TRzPanel;
    pnTotInAmt: TRzPanel;
    RzPanel12: TRzPanel;
    pnTotOutAmt: TRzPanel;
    RzPanel14: TRzPanel;
    pnTotPL: TRzPanel;
    pnAcntAmt: TRzPanel;
    pnPosQty: TRzPanel;
    RzPanel16: TRzPanel;
    pnMitQty: TRzPanel;
    RzPanel18: TRzPanel;
    pnOrdQty: TRzPanel;
    RzPanel20: TRzPanel;
    btnFilter: TbsSkinSpeedButton;
    bsSkinLabel1: TbsSkinLabel;
    dtStart: TkcRzDateTimeEdit;
    bsSkinSpeedButton1: TbsSkinSpeedButton;
    RzPanel4: TRzPanel;
    pnPwd: TRzPanel;
    gdUserMemo: TDBGridEh;
    dbMemo: TUniQuery;
    dbMemoUM_SEQ: TIntegerField;
    dbMemoUSER_ID: TStringField;
    dbMemoUM_DT: TDateTimeField;
    dbMemoPART_NM: TStringField;
    dbMemoUM_TITLE: TStringField;
    dbMemoUM_BIGO: TStringField;
    dsMemo: TDataSource;
    moUmBigo: TRzDBMemo;
    pnTp: TRzPanel;
    procedure bsSkinSpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
  private
    { Private declarations }
    procedure DetailOpen;
  public
    { Public declarations }
  end;

var
  fmUserDetail: TfmUserDetail;
  procedure UserDetail(sId, sTp, sDate : String);

implementation

uses StdUtils, MMastDB, MDelay;

var
  _sDate, _sId, _sTp  : String;
  _sAmtFormat : String = '#,##0';

{$R *.dfm}

procedure UserDetail(sId, sTp, sDate : String);
begin
  _sDate := sDate;
  _sId := sId;

  if sTp = '국내파생' then _sTp := '1'
  else if sTp = '해외파생' then _sTp := '2';

  fmUserDetail := TfmUserDetail.Create(Application);

//  showmessage(Format('%s , %s , %s, %s', [sId, sTp, sDate, __Trade_DT]));
  with fmUserDetail do
  begin
    try
      ShowModal;
	 	finally
    	Free;
    end;
  end;

end;

procedure TfmUserDetail.bsSkinSpeedButton1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmUserDetail.btnFilterClick(Sender: TObject);
begin
  DetailOpen;
end;

procedure TfmUserDetail.DetailOpen;
var
  sSql : String;
begin
  try

//    Delay_Show();

    sSql := Format( 'SELECT A.USER_ID,                                                              '+
                    '       A.USER_PWD,                                                             '+
                    '       A.USER_NM,                                                              '+
                    '       B.CONN_YN,                                                              '+
                    '       ISNULL((B.ACNT_AMT + B.CLR_PL - B.CMSN),0) AS ACNT_AMT_TODAY,           '+
                    '       ISNULL((B.CLR_PL - B.CMSN),0) AS NET_PL_SUM,                            '+
                    '       ISNULL(((B.CLR_PL - B.CMSN) + C.NET_PL_SUM),0) AS TOT_NET_PL_SUM,       '+
                    '       ISNULL(D.NCLR_POS_QTY,0) AS POS_QTY,                                    '+
                    '       ISNULL(E.REMN_QTY,0) AS ORD_QTY,                                        '+
                    '       ISNULL(F.REMN_QTY,0) AS MIT_QTY                                         '+
                    'FROM USER_MST A,                                                               '+
                    '     ACNT_MST B                                                                '+
                    '     LEFT OUTER JOIN                                                           '+
                    '     (SELECT ISNULL(SUM(NET_PL_SUM),0) AS NET_PL_SUM,                          '+
                    '             ACNT_TP, USER_ID                                                  '+
                    '      FROM ACNT_CLS                                                            '+
                    '      WHERE TRADE_DT BETWEEN %s AND %s                                         '+
                    '      GROUP BY ACNT_TP, USER_ID) C                                             '+
                    '      ON B.ACNT_TP = C.ACNT_TP                                                 '+
                    '      AND B.USER_ID = C.USER_ID                                                '+
                    '      LEFT OUTER JOIN                                                          '+
                    '     (SELECT ISNULL(SUM(NCLR_POS_QTY),0) AS NCLR_POS_QTY, ACNT_NO              '+
                    '      FROM NCLR_POS                                                            '+
                    '      GROUP BY ACNT_NO) D                                                      '+
                    '      ON B.ACNT_NO = D.ACNT_NO                                                 '+
                    '      LEFT OUTER JOIN                                                          '+
                    '     (SELECT ISNULL(SUM(REMN_QTY),0) AS REMN_QTY, USER_ID, ACNT_TP             '+
                    '      FROM ORD                                                                 '+
                    '      WHERE REMN_QTY > 0                                                       '+
                    '      AND ACPT_TP <> %s                                                        '+
                    '      AND COND_TP = 0                                                          '+
                    '      GROUP BY USER_ID, ACNT_TP) E                                             '+
                    '      ON B.USER_ID = E.USER_ID                                                 '+
                    '      AND B.ACNT_TP = E.ACNT_TP                                                '+
                    '      LEFT OUTER JOIN                                                          '+
                    '      (SELECT ISNULL(SUM(REMN_QTY),0) AS REMN_QTY, USER_ID, ACNT_TP            '+
                    '       FROM ORD                                                                '+
                    '       WHERE COND_TP = 1                                                       '+
                    '       AND REMN_QTY > 0                                                        '+
                    '       GROUP BY USER_ID, ACNT_TP) F                                            '+
                    '       ON B.USER_ID = F.USER_ID                                                '+
                    '       AND B.ACNT_TP = F.ACNT_TP                                               '+
                    'WHERE A.USER_ID = B.USER_ID                                                    '+
                    'AND A.USER_ID = %s                                                             '+
                    'AND B.ACNT_TP = %s                                                             ',
                    [QuotedStr(StrReplace(dtStart.Text, '-', '')),
                     QuotedStr(__Trade_DT),
                     QuotedStr('X'),
                     QuotedStr(_sId),
                     QuotedStr(_sTp)]);

    Uni_Open(dbMain, sSql);

    with dbMain do
    begin
      pnTotAcntAmt.Caption := FormatFloat(_sAmtFormat, FieldByName('ACNT_AMT_TODAY').AsFloat);
      pnTodayPL.Caption := FormatFloat(_sAmtFormat, FieldByName('NET_PL_SUM').AsFloat);

      if CompareValue(TextToFloat(pnTodayPL.Caption),0) < 0 then pnTodayPL.Font.Color := clBlue
      else if CompareValue(TextToFloat(pnTodayPL.Caption),0) > 0 then pnTodayPL.Font.Color := clRed
      else pnTodayPL.Font.Color := clBlack;
           
      pnTotPL.Caption := FormatFloat(_sAmtFormat, FieldByName('TOT_NET_PL_SUM').AsFloat);

      if CompareValue(TextToFloat(pnTotPL.Caption),0) < 0 then pnTotPL.Font.Color := clBlue
      else if CompareValue(TextToFloat(pnTotPL.Caption),0) > 0 then pnTotPL.Font.Color := clRed
      else pnTotPL.Font.Color := clBlack;
      
      pnNm.Caption := FieldByName('USER_NM').AsString;
      pnId.Caption := FieldByName('USER_ID').AsString;
      pnPwd.Caption := FieldByName('USER_PWD').AsString;

      if FieldByName('CONN_YN').AsString = 'Y' then pnConn.Caption := '접속중'
      else pnConn.Caption := '미접속';

      pnPosQty.Caption := FieldByName('POS_QTY').AsString;
      pnMitQty.Caption := FieldByName('MIT_QTY').AsString;
      pnOrdQty.Caption := FieldByName('ORD_QTY').AsString;
    end;

    sSql := Format( 'SELECT ISNULL(SUM(RSLT_AMT),0) AS IN_AMT, COUNT(*) AS CNT '+
                    'FROM INOUT                                                '+
                    'WHERE USER_ID = %s                                        '+
                    'AND IO_TP = 1                                             '+
                    'AND RSLT_TP = 1                                           '+
                    'AND ACNT_TP = %s                                          '+
                    'AND RSLT_TRADE_DT BETWEEN %s AND %s                       ',
                    [QuotedStr(_sId),
                     QuotedStr(_sTp),
                     QuotedStr(StrReplace(dtStart.Text, '-', '')),
                     QuotedStr(__Trade_DT)]);

    Uni_Open(dbMain, sSql);
    pnTotInAmt.Caption := Format('%s (%d)', [FormatFloat(_sAmtFormat, dbMain.FieldByName('IN_AMT').AsFloat),dbMain.FieldByName('CNT').AsInteger]);

    sSql := Format( 'SELECT ISNULL(SUM(RSLT_AMT),0) AS OUT_AMT, COUNT(*) AS CNT '+
                    'FROM INOUT                                                '+
                    'WHERE USER_ID = %s                                        '+
                    'AND IO_TP = 2                                             '+
                    'AND RSLT_TP = 1                                           '+
                    'AND ACNT_TP = %s                                          '+
                    'AND RSLT_TRADE_DT BETWEEN %s AND %s                       ',
                    [QuotedStr(_sId),
                     QuotedStr(_sTp),
                     QuotedStr(StrReplace(dtStart.Text, '-', '')),
                     QuotedStr(__Trade_DT)]);

    Uni_Open(dbMain, sSql);
    pnTotOutAmt.Caption := Format('%s (%d)', [FormatFloat(_sAmtFormat, dbMain.FieldByName('OUT_AMT').AsFloat),dbMain.FieldByName('CNT').AsInteger]);

    sSql := Format( 'SELECT    '+
                    ' UM_SEQ   '+
                    ',USER_ID  '+
                    ',UM_DT    '+
                    ',PART_NM  '+
                    ',UM_TITLE '+
                    ',UM_BIGO  '+
                    'FROM USER_MEMO WHERE USER_ID = %s',
                    [QuotedStr(_sId)]);

    Uni_Open(dbMemo, sSql);

  finally
//    Delay_Hide;
  end;
end;

procedure TfmUserDetail.FormShow(Sender: TObject);
begin
  dtStart.Date := TextToDate(_sDate);

  if _sTp = '1' then pnTp.Caption := '국내파생'
  else if _sTp = '2' then pnTp.Caption := '해외파생';
       
  DetailOpen;

end;

end.
