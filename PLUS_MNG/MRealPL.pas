unit MRealPL;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Math, Dialogs, ImgList, Graphics,
//  Mask, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsMessages, bsSkinCtrls, VCL_Helper,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, RzDBNav,
  kcRaizeCtrl,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic, ThdTimer, RzButton, RzRadChk;

type
  TfmRealPL = class(TfmBasic)
    gdMain: TDBGridEh;
    chUserTp: TbsSkinCheckRadioBox;
    cbUserGrade: TkcRzComboBox;
    cbxAuto: TRzCheckBox;
    tmAutoSearch: TThreadedTimer;
    cbInterval: TkcRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure cbxAutoClick(Sender: TObject);
    procedure tmAutoSearchTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmRealPL: TfmRealPL;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmRealPL }

procedure TfmRealPL.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmRealPL.cbxAutoClick(Sender: TObject);
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

procedure TfmRealPL.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmRealPL.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmRealPL);
end;

procedure TfmRealPL.FormShow(Sender: TObject);
begin
  inherited;
  if _Supervisor then cbUserGrade.Visible := True;

  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), '회원등급', '0');
  cbUserGrade.ItemIndex := 0;

  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('ACNT_TP'));
end;

procedure TfmRealPL.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with TDBGridEh(Sender) do begin
    if (DataCol > 3) and (DataCol < 10)  then begin // 숫자값 컬럼
      Canvas.Font.Color := clBlack;
      if StrToIntDef(Column.DisplayText,0) > 0 then Canvas.Font.Color := clRed else
      if StrToIntDef(Column.DisplayText,0) < 0 then Canvas.Font.Color := clBlue;
      DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
    end;
  end;
end;

procedure TfmRealPL.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmRealPL.MainTableOpen;
var
  sSql, sUserTp : String;
begin
  try
    Delay_Show();

    if _Supervisor then begin
      if cbUserGrade.ItemIndex <> 0 then sUserTp := Format(' AND B1.USER_GRADE = %s ', [IntToStr(cbUserGrade.ItemIndex)]) else
      if chUserTp.Checked           then sUserTp := Format(' AND B1.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                                    else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
                          else sUserTp := ' AND B1.USER_GRADE <> 7 ';
    end;

    sSql := Format(
      'SELECT ACNT_NO ' +
      '      ,USER_NM ' +
      '      ,USER_ID ' +
      '      ,ACNT_TP ' +
      '      ,MAX(ACNT_AMT) AS ACNT_AMT ' +                                     // 잔액
      '      ,MAX(CMSN) AS CMSN         ' +                                     // 수수료
      '      ,MAX(LEVERAGE) AS LEVERAGE ' +                                     // 레버리지
      '      ,SUM(NCLR_POS_QTY) AS QTY  ' +                                     // 수량
      '      ,MAX(REALPL) AS REALPL     ' +                                     // 실현손익
      '      ,SUM(EVAPL) AS EVAPL       ' +                                     // 평가손익
      '      ,(MAX(ACNT_AMT) + MAX(REALPL) + SUM(EVAPL)) AS EVA_AMT ' +         // 평가잔액
      '  FROM (SELECT ACNT_NO      ' +
      '              ,ACNT_TP      ' +
      '              ,USER_NM      ' +
      '              ,USER_ID      ' +
      '              ,ACNT_AMT     ' +
      '              ,CLR_PL       ' +
      '              ,CMSN         ' +
      '              ,LEVERAGE     ' +
      '              ,NCLR_POS_QTY ' +
      '              ,CASE WHEN BS_TP = %s THEN (AVG_PRC - CNTR_PRC) * NCLR_POS_QTY * TICK           ' +
      '                    WHEN BS_TP = %s THEN (CNTR_PRC - AVG_PRC) * NCLR_POS_QTY * TICK END EVAPL ' +
      '              ,(ACNT_AMT + CLR_PL - CMSN) AS SUMPL                                            ' +
      '              ,(CLR_PL - CMSN) AS REALPL                                                      ' +
      '              ,(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = ARTC_CD) AS DOT_CNT       ' +
      '          FROM (SELECT A.ACNT_NO ' +
      '                      ,A.ACNT_TP ' +
      '                      ,D.USER_NM ' +
      '                      ,D.USER_ID ' +
      '                      ,A.STK_CD  ' +
      '                      ,A.BS_TP   ' +
      '                      ,SUM(D.ACNT_AMT) AS ACNT_AMT ' +
      '                      ,SUM(D.CLR_PL) AS CLR_PL     ' +
      '                      ,SUM(D.CMSN) AS CMSN         ' +
      '                      ,SUM(D.LEVERAGE) AS LEVERAGE ' +
      '                      ,ISNULL(SUM(A.NCLR_POS_QTY), 0) AS NCLR_POS_QTY ' +
      '                      ,ISNULL(SUM(C.CNTR_PRC),0) AS CNTR_PRC          ' +
      '                      ,ISNULL(SUM(A.AVG_PRC),0) AS AVG_PRC            ' +
//      '                      ,CASE WHEN ((A.ARTC_CD = %s OR A.ARTC_CD = %s) AND (SUM(A.AVG_PRC) < 0)) ' +
//      '                            THEN SUM(B.TICK_VALUE_LOW / B.TICK_SIZE_LOW)  ' +
//      '                            ELSE SUM(B.TICK_VALUE / B.TICK_SIZE) END TICK ' +
      '                      ,B.TICK_SIZE * B.TICK_VALUE / D.LEVERAGE TICK ' +
      '                  FROM NCLR_POS A, ' +
      '                       ARTC_MST B, ' +
      '                       CURR_PRC C, ' +
      '                       (SELECT A1.* FROM ACNT_MST A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) D ' +
      '                 WHERE A.ARTC_CD = B.ARTC_CD               ' +
      '                   AND (A.BS_TP = B.BS_TP OR B.BS_TP = %s) ' +
      '                   AND A.STK_CD = C.STK_CD                 ' +
      '                   AND A.ACNT_NO = D.ACNT_NO               ' +
      '                 GROUP BY A.ACNT_NO,     ' +
      '                          A.ACNT_TP,     ' +
      '                          D.USER_NM,     ' +
      '                          D.USER_ID,     ' +
      '                          A.STK_CD,      ' +
      '                          A.BS_TP,       ' +
      '                          A.ARTC_CD) TMP ' +
      '       ) MAIN     ' +
      ' GROUP BY ACNT_NO, USER_NM, USER_ID, ACNT_TP ',
      [QuotedStr('S'),
       QuotedStr('B'),
       QuotedStr('201'),
       QuotedStr('301'),
       sUserTp,
       QuotedStr('A')]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmRealPL.tmAutoSearchTimer(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

end.
