unit MNclr;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Dialogs, ImgList, Graphics,
//  Mask, math, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsRibbon, bsMessages,
// Raize, kcRaize
  RzDBNav, RzPanel, RzEdit, RzCmboBx, RzDBCmbo, RzSplit, RzDBEdit, RzLstBox,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic, RzRadGrp, Mask;

type
  TfmNclr = class(TfmBasic)
    gdMain: TDBGridEh;
    pnNclr: TRzPanel;
    chUserTp: TbsSkinCheckRadioBox;
    RzPanel4: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinLabel8: TbsSkinLabel;
    edUserId: TkcRzDBEdit;
    bsSkinLabel1: TbsSkinLabel;
    edUserNm: TkcRzDBEdit;
    edBsTp: TkcRzDBEdit;
    edStkNm: TkcRzDBEdit;
    edStkCd: TkcRzDBEdit;
    edCnt: TkcRzDBEdit;
    rbtPriceTp: TRzRadioGroup;
    bsRibbonDivider1: TbsRibbonDivider;
    bsSkinStdLabel1: TbsSkinStdLabel;
    btnOrdCancel: TbsSkinSpeedButton;
    edPrice: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure chUserTpClick(Sender: TObject);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnOrdCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmNclr: TfmNclr;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmNclr.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmNclr.chUserTpClick(Sender: TObject);
begin
  inherited;
  btnFilter.ButtonClick;
end;

procedure TfmNclr.dbMainCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('AVGPRC').AsString  := FormatFloat(FormatDotCnt(iCnt+3), FieldByName('AVG_PRC').AsFloat);
  end;
end;

procedure TfmNclr.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmNclr);
end;

procedure TfmNclr.FormShow(Sender: TObject);
begin
  inherited;
  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('BS_TP'));
//  MainTableOpen;
end;

procedure TfmNclr.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
                                           else Canvas.Font.Color := clBlue;

    if DataCol = 3 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmNclr.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmNclr.MainTableOpen;
var
  sSql, sResult, sUserTp : String;
begin
  try
    Delay_Show();

    if _Supervisor then begin
      if chUserTp.Checked then sUserTp := Format(' AND B1.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                          else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
                          else sUserTp := ' AND B1.USER_GRADE <> 7 ';
    end;
    //if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
    //else sUserTp := '';

    sSql := Format(
      'SELECT B.USER_ID      ' +
      '      ,B.USER_NM      ' +
      '      ,B.ACNT_AMT     ' + // 계좌잔액
      '      ,A.ACNT_NO      ' +
      '      ,A.STK_CD       ' +
      '      ,A.ACNT_TP      ' +
      '      ,A.ARTC_CD      ' +
      '      ,A.BS_TP        ' +
      '      ,A.NCLR_POS_QTY ' +
      '      ,A.AVG_PRC      ' +
      '      ,A.NCNTR_QTY    ' +
      '      ,A.TRADE_DT     ' +
      '      ,A.NCLR_POS_TM  ' +
      '      ,A.SYS_DT       ' +
      '      ,A.API_TP       ' +
      '      ,A.LOSSCUT_AMT  ' +
      '      ,A.OVERNGT_QTY  ' +
      '      ,A.OVERNGT_TP   ' +
      '      ,A.OVERNGT_AMT  ' +
      '      ,COUNT(1) OVER()  AS TOTCNT ' +
      '      ,(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT ' +
      '  FROM NCLR_POS A, ' +
      '       (SELECT A1.* FROM ACNT_MST A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) B ' +
      ' WHERE A.ACNT_NO = B.ACNT_NO ',
      [sUserTp]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnNclr.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
                    else pnNclr.Caption := '0 건';
  finally
    Delay_Hide;
  end;
end;

procedure TfmNclr.btnOrdCancelClick(Sender: TObject);
var
  sSql, sUserId, sStkId, sPrice : String;
begin
  inherited;

  sUserId := dbMain.FieldByName('USER_ID').AsString;
  sStkId  := dbMain.FieldByName('STK_ID').AsString;

  if sUserId = '' then begin
    bsMsgError('선택한 회원이 없습니다.');
    Exit;
  end;

  if rbtPriceTp.ItemIndex = 0 then begin
    sPrice := '(SELECT A1.NOW_PRC FROM CURR_PRC A1 WHERE A1.STK_ID = A.STK_ID)';
  end else begin
    sPrice := Trim(edPrice.Text);
    if sPrice = '' then begin
      bsMsgError('지정가 청산가격을 입력하세요.');
      edPrice.SetFocus;
      Exit;
    end;
  end;

  sSql := Format(
    'UPDATE NCLR_POS A ' +
    '   SET A.PRICE = %s ' + // TODO : A.PRICE 수정할것, 청산할 필드로 
    '  FROM ACNT_MST B ' +
    ' WHERE A.ACNT_NO = B.ACNT_NO AND A.USER_ID = %s AND A.STK_ID = %s; ',
    [sPrice,
     QuotedStr(sUserId),
     QuotedStr(sStkId) ]);
  fnSqlOpen(MastDB.dbExec, sSql);
end;

end.
