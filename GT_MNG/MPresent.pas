unit MPresent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel;

type
  TfmPresent = class(TfmBasic)
    dbMainSTK_CD: TStringField;
    dbMainBS_TP: TStringField;
    dbMainNCLR_POS_QTY: TIntegerField;
    pnMain: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    gdMain: TDBGridEh;
    DBGridEh1: TDBGridEh;
    dbNclr: TUniQuery;
    dsNclr: TDataSource;
    dbNclrSTK_CD: TStringField;
    dbNclrBS_TP: TStringField;
    dbNclrNCLR_POS_QTY: TIntegerField;
    RzGroupBox2: TRzGroupBox;
    DBGridEh2: TDBGridEh;
    RzGroupBox3: TRzGroupBox;
    DBGridEh4: TDBGridEh;
    RzGroupBox4: TRzGroupBox;
    dbNclrListR: TUniQuery;
    dsNclrListR: TDataSource;
    dbNclrListV: TUniQuery;
    dsNclrListV: TDataSource;
    dbMitR: TUniQuery;
    dsMitR: TDataSource;
    dbMitV: TUniQuery;
    dsMitV: TDataSource;
    dbNoCntrR: TUniQuery;
    dsNoCntrR: TDataSource;
    dbNoCntrV: TUniQuery;
    dsNoCntrV: TDataSource;
    dbNclrListRSTK_CD: TStringField;
    dbNclrListRBS_TP: TStringField;
    dbNclrListRNCLR_POS_QTY: TIntegerField;
    dbNclrListRAVG_PRC: TFloatField;
    dbNclrListRUSER_NM: TStringField;
    dbNclrListROVERNGT_YN: TStringField;
    dbNclrListVSTK_CD: TStringField;
    dbNclrListVBS_TP: TStringField;
    dbNclrListVNCLR_POS_QTY: TIntegerField;
    dbNclrListVAVG_PRC: TFloatField;
    dbNclrListVUSER_NM: TStringField;
    dbNclrListVOVERNGT_YN: TStringField;
    DBGridEh3: TDBGridEh;
    dbMitRUSER_NM: TStringField;
    dbMitRSTK_CD: TStringField;
    dbMitRBS_TP: TStringField;
    dbMitRREMN_QTY: TIntegerField;
    dbMitRMIT_PRC: TFloatField;
    dbMitVUSER_NM: TStringField;
    dbMitVSTK_CD: TStringField;
    dbMitVBS_TP: TStringField;
    dbMitVREMN_QTY: TIntegerField;
    dbMitVMIT_PRC: TFloatField;
    DBGridEh5: TDBGridEh;
    dbNoCntrRUSER_NM: TStringField;
    dbNoCntrRSTK_CD: TStringField;
    dbNoCntrRBS_TP: TStringField;
    dbNoCntrRREMN_QTY: TIntegerField;
    dbNoCntrRORD_PRC: TFloatField;
    dbNoCntrVUSER_NM: TStringField;
    dbNoCntrVSTK_CD: TStringField;
    dbNoCntrVBS_TP: TStringField;
    dbNoCntrVREMN_QTY: TIntegerField;
    dbNoCntrVORD_PRC: TFloatField;
    DBGridEh11: TDBGridEh;
    DBGridEh12: TDBGridEh;
    DBGridEh13: TDBGridEh;
    DBGridEh14: TDBGridEh;
    DBGridEh6: TDBGridEh;
    DBGridEh7: TDBGridEh;
    DBGridEh15: TDBGridEh;
    DBGridEh16: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh4DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmPresent: TfmPresent;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmPresent.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPresent.DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = '매수' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 3 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPresent.DBGridEh4DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = '매수' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 2 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPresent.FormShow(Sender: TObject);
begin
  inherited;
//
end;

procedure TfmPresent.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = '매수' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 1 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPresent.MainTableOpen;
var
  sSql : String;
begin

  try
    Delay_Show();

    sSql := Format( 'SELECT STK_CD,                           '+
                    ' (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       SUM(NCLR_POS_QTY) AS NCLR_POS_QTY '+
                    'FROM NCLR_POS A                          '+
                    'WHERE API_TP = %s                        '+
                    'GROUP BY STK_CD,BS_TP                    '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('R')]);

    Uni_Open(dbMain,sSql);

    sSql := Format( 'SELECT STK_CD,                           '+
                    ' (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       SUM(NCLR_POS_QTY) AS NCLR_POS_QTY '+
                    'FROM NCLR_POS A                          '+
                    'WHERE API_TP = %s                        '+
                    'GROUP BY STK_CD,BS_TP                    '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('V')]);

    Uni_Open(dbNclr,sSql);

    sSql := Format( 'SELECT A.STK_CD, '+
                    '       (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       A.NCLR_POS_QTY, '+
                    '       A.AVG_PRC, '+
                    '       B.USER_NM, '+
                    '       CASE WHEN B.OVERNGT_YN = %s THEN %s WHEN B.OVERNGT_YN = %s THEN %s END OVERNGT_YN '+
                    'FROM NCLR_POS A, '+
                    '     ACNT_MST B '+
                    'WHERE A.ACNT_NO = B.ACNT_NO '+
                    'AND A.API_TP = %s '+
                    'ORDER BY B.USER_NM DESC, A.STK_CD DESC '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('1'),
                      QuotedStr('종가'),
                      QuotedStr('2'),
                      QuotedStr('오버'),
                      QuotedStr('R')]);

    Uni_Open(dbNclrListR, sSql);

    sSql := Format( 'SELECT A.STK_CD, '+
                    '       (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       A.NCLR_POS_QTY, '+
                    '       A.AVG_PRC, '+
                    '       B.USER_NM, '+
                    '       CASE WHEN B.OVERNGT_YN = %s THEN %s WHEN B.OVERNGT_YN = %s THEN %s END OVERNGT_YN '+
                    'FROM NCLR_POS A, '+
                    '     ACNT_MST B '+
                    'WHERE A.ACNT_NO = B.ACNT_NO '+
                    'AND A.API_TP = %s '+
                    'ORDER BY B.USER_NM DESC, A.STK_CD DESC '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('1'),
                      QuotedStr('종가'),
                      QuotedStr('2'),
                      QuotedStr('오버'),
                      QuotedStr('V')]);

    Uni_Open(dbNclrListV, sSql);

    sSql := Format( 'SELECT B.USER_NM, '+
                    '       A.STK_CD,'+
                    '       (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       A.REMN_QTY, '+
                    '       A.MIT_PRC '+
                    'FROM ORD A, '+
                    '     ACNT_MST B '+
                    'WHERE A.ACNT_NO = B.ACNT_NO '+
                    'AND A.COND_TP = %s '+
                    'AND A.REMN_QTY > 0 '+
                    'AND A.API_TP = %s '+
                    'ORDER BY B.USER_NM DESC, A.STK_CD DESC '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('1'),
                      QuotedStr('R')]);

    Uni_Open(dbMitR, sSql);

    sSql := Format( 'SELECT B.USER_NM, '+
                    '       A.STK_CD,'+
                    '       (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       A.REMN_QTY, '+
                    '       A.MIT_PRC '+
                    'FROM ORD A, '+
                    '     ACNT_MST B '+
                    'WHERE A.ACNT_NO = B.ACNT_NO '+
                    'AND A.COND_TP = %s '+
                    'AND A.REMN_QTY > 0 '+
                    'AND A.API_TP = %s '+
                    'ORDER BY B.USER_NM DESC, A.STK_CD DESC '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('1'),
                      QuotedStr('V')]);

    Uni_Open(dbMitV, sSql);

    sSql := Format( 'SELECT B.USER_NM, '+
                    '       A.STK_CD, '+
                    '       (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       A.REMN_QTY, '+
                    '       A.ORD_PRC '+
                    'FROM ORD A, '+
                    '     ACNT_MST B '+
                    'WHERE A.ACNT_NO = B.ACNT_NO '+
                    'AND A.COND_TP <> %s '+
                    'AND A.REMN_QTY > 0 '+
                    'AND A.API_TP = %s '+
                    'ORDER BY B.USER_NM DESC, A.STK_CD DESC '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('1'),
                      QuotedStr('R')]);

    Uni_Open(dbNoCntrR, sSql);

    sSql := Format( 'SELECT B.USER_NM, '+
                    '       A.STK_CD, '+
                    '       (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP, '+
                    '       A.REMN_QTY, '+
                    '       A.ORD_PRC '+
                    'FROM ORD A, '+
                    '     ACNT_MST B '+
                    'WHERE A.ACNT_NO = B.ACNT_NO '+
                    'AND A.COND_TP <> %s '+
                    'AND A.REMN_QTY > 0 '+
                    'AND A.API_TP = %s '+
                    'ORDER BY B.USER_NM DESC, A.STK_CD DESC '
                    ,[QuotedStr('BS_TP'),
                      QuotedStr('1'),
                      QuotedStr('V')]);

    Uni_Open(dbNoCntrV, sSql);

  finally
    Delay_Hide;
  end;
end;

end.
