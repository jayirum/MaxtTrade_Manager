unit MNoCntrOrd;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Dialogs, ImgList, Graphics,
//  Mask, math, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsMessages, bsribbon,
// Raize, kcRaize
  RzPanel, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzEdit, RzLstBox, RzDBNav,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmNoCntrOrd = class(TfmBasic)
    gdMain: TDBGridEh;
    pnNoCntrOrd: TRzPanel;
    chUserTp: TbsSkinCheckRadioBox;
    btnOrdCancel: TbsSkinSpeedButton;
    btnOrdCancelAll: TbsSkinSpeedButton;
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
    procedure btnOrdCancelAllClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmNoCntrOrd: TfmNoCntrOrd;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmNoCntrOrd.btnOrdCancelClick(Sender: TObject);
var
  sSql, sOrdNo : String;
begin
  inherited;
  with dbMain do begin
    if RecordCount = 0 then Exit;
    sOrdNo := dbMain.FieldByName('ORD_NO').AsString;
  end;

  sSql := Format('UPDATE ORD SET CNCL_QTY = ORD_QTY, REMN_QTY = 0 WHERE ORD_NO = %s; ', [sOrdNo]);
  fnSqlOpen(MastDB.dbExec, sSql);
end;

procedure TfmNoCntrOrd.btnOrdCancelAllClick(Sender: TObject);
var
  sSql, sUser : String;
begin
  inherited;
  with dbMain do begin
    if RecordCount = 0 then Exit;
    sUser := FieldByName('USER_ID').AsString;
  end;

  sSql := Format('UPDATE ORD SET CNCL_QTY = ORD_QTY, REMN_QTY = 0 WHERE USER_ID = %s; ', [QuotedStr(sUser)]);
  fnSqlOpen(MastDB.dbExec, sSql);
end;

procedure TfmNoCntrOrd.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmNoCntrOrd.chUserTpClick(Sender: TObject);
begin
  inherited;
  btnFilter.ButtonClick;
end;

procedure TfmNoCntrOrd.dbMainCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('ORDPRC').AsString := FormatFloat(FormatDotCnt(iCnt), FieldByName('ORD_PRC').AsFloat);
  end;
end;

procedure TfmNoCntrOrd.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmNoCntrOrd);
end;

procedure TfmNoCntrOrd.FormShow(Sender: TObject);
begin
  inherited;

  PartTableOpen(TComponent(gdMain.Columns[6]), CodeFormat('BS_TP'));
  PartTableOpen(TComponent(gdMain.Columns[4]), CodeFormat('ACNT_TP'));
  PartTableOpen(TComponent(gdMain.Columns[7]), CodeFormat('ORD_TP'));
  PartTableOpen(TComponent(gdMain.Columns[8]), CodeFormat('COND_TP'));
  PartTableOpen(TComponent(gdMain.Columns[9]), CodeFormat('ACPT_TP'));

//  MainTableOpen;
end;

procedure TfmNoCntrOrd.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
    with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
      if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
                                             else Canvas.Font.Color := clBlue;

      if DataCol = 6 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
    end;
end;

procedure TfmNoCntrOrd.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmNoCntrOrd.MainTableOpen;
var
  sSql, sResult, sUserTp : String;
begin
  try
    Delay_Show();

    if _Supervisor then begin
      if chUserTp.Checked then sUserTp := Format(' AND B.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                          else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND B.USER_GRADE = 2 '
                          else sUserTp := ' AND B.USER_GRADE <> 7 ';
    end;
    //if chUserTp.Checked then sUserTp := ' AND B.USER_GRADE = 2 '
    //else sUserTp := '';

    sSql := Format(
      'SELECT  B.USER_NM        ' +
      '       ,A.ORD_NO         ' +
      '       ,A.API_SEQ        ' +
      '       ,A.ORG_ORD_NO     ' +
      '       ,A.API_ORD_NO     ' +
      '       ,A.API_ORG_ORD_NO ' +
      '       ,A.ACNT_TP        ' +
      '       ,A.ACNT_NO        ' +
      '       ,A.USER_ID        ' +
      '       ,A.STK_CD         ' +
      '       ,A.ARTC_CD        ' +
      '       ,A.BS_TP          ' +
      '       ,A.ORD_TP         ' +
      '       ,A.COND_TP        ' +
      '       ,A.ACPT_TP        ' +
      '       ,A.ORD_PRC        ' +
      '       ,A.SL_TP          ' +
      '       ,A.ORD_QTY        ' +
      '       ,A.RJCT_QTY       ' +
      '       ,A.MDFY_QTY       ' +
      '       ,A.CNCL_QTY       ' +
      '       ,A.CNTR_QTY       ' +
      '       ,A.REMN_QTY       ' +
      '       ,A.API_RJCT_CD    ' +
      '       ,A.API_RJCT_MSG   ' +
      '       ,A.TRADE_DT       ' +
      '       ,A.ORD_TM         ' +
      '       ,A.CNFM_TM        ' +
      '       ,A.API_TM         ' +
      '       ,A.SYS_DT         ' +
      '       ,A.CLIENT_IP      ' +
      '       ,A.API_TP         ' +
      '       ,A.MNG_ID         ' +
      '       ,COUNT(1) OVER() AS TOTCNT ' +
      '       ,(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT ' +
      '  FROM ORD A,     ' +
      '       USER_MST B ' +
      ' WHERE A.REMN_QTY > 0           ' +
      '   AND A.ACPT_TP <> %s          ' +
      '   AND A.USER_ID = B.USER_ID %s ',
      [QuotedStr('X'),
       sUserTp]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnNoCntrOrd.Caption := dbMain.FieldByName('TOTCNT').AsString + ' °Ç'
                    else pnNoCntrOrd.Caption := '0 °Ç';
  finally
    Delay_Hide;
  end;
end;

end.
