unit MPresent;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Dialogs, ImgList, Graphics,
//  Mask, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav, RzLstBox,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic, RzButton, RzRadChk, ThdTimer;

type
  TfmPresent = class(TfmBasic)
    pnMain: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    gdMain: TDBGridEh;
    RzGroupBox2: TRzGroupBox;
    gdNclrListR: TDBGridEh;
    RzGroupBox3: TRzGroupBox;
    gdMitR: TDBGridEh;
    RzGroupBox4: TRzGroupBox;
    dsNclrListR: TDataSource;
    dsMitR: TDataSource;
    dsNoCntrR: TDataSource;
    gdNoCntrR: TDBGridEh;
    DBGridEh12: TDBGridEh;
    DBGridEh13: TDBGridEh;
    DBGridEh14: TDBGridEh;
    dbNclrListR: TADOQuery;
    dbMitR: TADOQuery;
    dbNoCntrR: TADOQuery;
    cbxAuto: TRzCheckBox;
    cbStk: TRzCheckBox;
    chUserTp: TRzCheckBox;
    tmAutoSearch: TThreadedTimer;
    cbInterval: TkcRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdNclrListRDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMitRDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cbxAutoClick(Sender: TObject);
    procedure tmAutoSearchTimer(Sender: TObject);
    procedure cbStkClick(Sender: TObject);
    procedure chUserTpClick(Sender: TObject);
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

procedure TfmPresent.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmPresent);
end;

procedure TfmPresent.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPresent.cbStkClick(Sender: TObject);
begin
  inherited;
//  if cbStk.Checked then begin
//    PartTableOpen(TComponent(gdMain.Columns[0]     ), '@|STK_NM, API_STK_CD|STK_MST|ORDER BY STK_CD');
//    PartTableOpen(TComponent(gdNclrListR.Columns[1]), '@|STK_NM, API_STK_CD|STK_MST|ORDER BY STK_CD');
//    PartTableOpen(TComponent(gdMitR.Columns[1]     ), '@|STK_NM, API_STK_CD|STK_MST|ORDER BY STK_CD');
//    PartTableOpen(TComponent(gdNoCntrR.Columns[1]  ), '@|STK_NM, API_STK_CD|STK_MST|ORDER BY STK_CD');
//  end;

  MainTableOpen;
end;

procedure TfmPresent.MainTableOpen;
var
  sSql, sUserTp, sStk : String;
begin
  try
    Delay_Show();

    if _Supervisor then begin
      if chUserTp.Checked then sUserTp := Format(' AND C1.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                          else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND C1.USER_GRADE = 2 '
                          else sUserTp := ' AND C1.USER_GRADE <> 7 ';
    end;

    if cbStk.Checked then sStk := 'STK_NM'
                     else sStk := 'API_STK_CD';

    sSql := Format(
      'SELECT STK_CD ' +
      '      ,(SELECT %s FROM STK_MST WHERE STK_CD = A.STK_CD) AS STK_NM ' +
      '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP ' +
      '      ,CASE BS_TP WHEN %s THEN SUM(NCLR_POS_QTY) WHEN %s THEN -SUM(NCLR_POS_QTY) END AS NCLR_POS_QTY ' +
      '  FROM (SELECT A1.* FROM NCLR_POS A1, ACNT_MST B1, USER_MST C1 WHERE A1.ACNT_NO = B1.ACNT_NO AND B1.USER_ID = C1.USER_ID %s ) A ' +
      ' WHERE API_TP = %s      ' +
      ' GROUP BY STK_CD, BS_TP ',
      [sStk,
       QuotedStr('BS_TP'),
       QuotedStr('B'),
       QuotedStr('S'),
       sUserTp,
       QuotedStr('V')]); // 'R'
    fnSqlOpen(dbMain,sSql);

    sSql := Format(
      'SELECT A.STK_CD ' +
      '      ,(SELECT %s FROM STK_MST WHERE STK_CD = A.STK_CD) AS STK_NM ' +
      '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP ' +
      '      ,CASE BS_TP WHEN %s THEN A.NCLR_POS_QTY WHEN %s THEN -A.NCLR_POS_QTY END AS NCLR_POS_QTY ' +
      '      ,A.AVG_PRC ' +
      '      ,B.USER_NM ' +
      '      ,CASE WHEN B.OVERNGT_YN = %s THEN %s ' +
      '            WHEN B.OVERNGT_YN = %s THEN %s ' +
      '             END OVERNGT_YN ' +
      '  FROM (SELECT A1.* FROM NCLR_POS A1, ACNT_MST B1, USER_MST C1 WHERE A1.ACNT_NO = B1.ACNT_NO AND B1.USER_ID = C1.USER_ID %s ) A ' +
      '      ,ACNT_MST B ' +
      ' WHERE A.ACNT_NO = B.ACNT_NO ' +
      '   AND A.API_TP = %s         ' +
      ' ORDER BY STK_CD, BS_TP      ',
      [sStk,
       QuotedStr('BS_TP'),
       QuotedStr('B'),
       QuotedStr('S'),
       QuotedStr('1'),
       QuotedStr('종가'),
       QuotedStr('2'),
       QuotedStr('오버'),
       sUserTp,
       QuotedStr('V')]); // 'R'
    fnSqlOpen(dbNclrListR, sSql);

    sSql := Format(
      'SELECT B.USER_NM ' +
      '      ,A.STK_CD  ' +
      '      ,(SELECT %s FROM STK_MST WHERE STK_CD = A.STK_CD) AS STK_NM ' +
      '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP ' +
      '      ,A.REMN_QTY ' +
      '      ,A.MIT_PRC  ' +
      '  FROM ORD A      ' +
      //'      ,ACNT_MST B ' +
      '      ,(SELECT B1.* FROM ACNT_MST B1, USER_MST C1 WHERE B1.USER_ID = C1.USER_ID %s ) B ' +
      ' WHERE A.ACNT_NO = B.ACNT_NO ' +
      '   AND A.COND_TP = %s ' +
      '   AND A.REMN_QTY > 0 ' +
      '   AND A.API_TP = %s  ' +
      ' ORDER BY B.USER_NM DESC, A.STK_CD DESC ',
      [sStk,
       QuotedStr('BS_TP'),
       sUserTp,
       QuotedStr('1'),
       QuotedStr('V')]); // 'R'
    fnSqlOpen(dbMitR, sSql);

    sSql := Format(
      'SELECT B.USER_NM ' +
      '      ,A.STK_CD  ' +
      '      ,(SELECT %s FROM STK_MST WHERE STK_CD = A.STK_CD) AS STK_NM ' +
      '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.BS_TP) AS BS_TP ' +
      '      ,A.REMN_QTY ' +
      '      ,A.ORD_PRC  ' +
      '  FROM ORD A      ' +
      //'      ,ACNT_MST B ' +
      '      ,(SELECT B1.* FROM ACNT_MST B1, USER_MST C1 WHERE B1.USER_ID = C1.USER_ID %s ) B ' +
      ' WHERE A.ACNT_NO = B.ACNT_NO ' +
      '   AND A.COND_TP <> %s       ' +
      '   AND A.REMN_QTY > 0        ' +
      '   AND A.API_TP = %s         ' +
      '   AND A.ORD_TP = %s         ' +
      ' ORDER BY B.USER_NM DESC, A.STK_CD DESC ',
      [sStk,
       QuotedStr('BS_TP'),
       sUserTp,
       QuotedStr('1'),
       QuotedStr('V'), // 'R'
       QuotedStr('05') ]);
    fnSqlOpen(dbNoCntrR, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmPresent.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = '매수' then
      Canvas.Font.Color := clRed
    else
      Canvas.Font.Color := clBlue;

    if DataCol = 1 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPresent.gdNclrListRDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = '매수' then
      Canvas.Font.Color := clRed
    else
      Canvas.Font.Color := clBlue;

    if DataCol = 3 then
      DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPresent.gdMitRDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = '매수' then
      Canvas.Font.Color := clRed
    else
      Canvas.Font.Color := clBlue;

    if DataCol = 2 then
      DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPresent.cbxAutoClick(Sender: TObject);
begin
  inherited;
  if cbxAuto.Checked then begin
    tmAutoSearch.Enabled := False;
    case cbInterval.ItemIndex of
      0 : tmAutoSearch.Interval :=  3000; // 30초마다
      1 : tmAutoSearch.Interval :=  6000; //  1분마다
      2 : tmAutoSearch.Interval := 12000; //  2분마다
      3 : tmAutoSearch.Interval := 30000; //  5분마다
      4 : tmAutoSearch.Interval := 60000; // 10분마다
    end;
    tmAutoSearch.Enabled := True;
  end else begin
    tmAutoSearch.Enabled := False;
  end;
end;

procedure TfmPresent.tmAutoSearchTimer(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmPresent.chUserTpClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

end.
