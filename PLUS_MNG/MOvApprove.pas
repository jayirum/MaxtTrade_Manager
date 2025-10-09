unit MOvApprove;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList, Graphics,
//  Math, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsSkinBoxCtrls, bsSkinCtrls, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, RzDBNav,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmOvApprove = class(TfmBasic)
    gdMain: TDBGridEh;
    bsRibbonDivider1: TbsRibbonDivider;
    btnOvCancel: TbsSkinSpeedButton;
    btnCancel: TbsSkinSpeedButton;
    pnCnt: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnOvCancelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure prOvCancel(sRsltTp: String);
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmOvApprove: TfmOvApprove;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmOvApprove }

procedure TfmOvApprove.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmOvApprove.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmOvApprove);
end;

procedure TfmOvApprove.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmOvApprove.FormShow(Sender: TObject);
begin
  inherited;
  PartTableOpen(TComponent(gdMain.Columns[4]), Format('@|STK_NM, STK_CD|STK_MST|WHERE STK_ID = %s', [QuotedStr('STK_ID')]));

  MainTableOpen;
end;

procedure TfmOvApprove.MainTableOpen;
var
  sSql, sResult : String;
begin
  try
    Delay_Show();
    sSql := Format(
      'SELECT A.USER_ID       ' +
      '      ,C.USER_NM       ' +
      '      ,D.ACNT_AMT + D.CLR_PL - D.CMSN AS ACNT_BALANCT ' + // ∞Ë¡¬¿‹æ◊
      '      ,D.LEVERAGE      ' +
      '      ,B.STK_CD        ' +
      '      ,A.RQST_TRADE_DT ' +
      '      ,A.RQST_TM       ' +
      '      ,A.RSLT_TP       ' +
      '      ,B.OVERNGT_QTY   ' +
      '      ,B.AVG_PRC       ' +
      '      ,CASE WHEN D.ACNT_TP = %s THEN ((B.AVG_PRC - F.CNTR_PRC) * B.NCLR_POS_QTY / E.TICK_SIZE * E.TICK_VALUE / D.LEVERAGE) ' +
      '            WHEN D.ACNT_TP = %s THEN ((B.AVG_PRC - F.CNTR_PRC) * B.NCLR_POS_QTY / E.TICK_SIZE * E.TICK_VALUE / D.LEVERAGE) * (-1) END AS POS_PL ' + // ∆Ú∞°º’¿Õ
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM OVERNGT_HIS A, ' +
      '       NCLR_POS    B, ' +
      '       USER_MST    C, ' +
      '       ACNT_MST    D, ' +
      '       ARTC_MST    E, ' +
      '       CURR_PRC    F  ' +
      ' WHERE A.ACNT_NO = B.ACNT_NO ' +
      '   AND A.USER_ID = C.USER_ID ' +
      '   AND A.ACNT_NO = D.ACNT_NO ' +
      '   AND A.ARTC_CD = E.ARTC_CD ' +
      '   AND B.STK_CD  = F.STK_CD  ' +
      '   AND A.RSLT_TP = %s ',
      [QuotedStr('1'),
       QuotedStr('2'),
       QuotedStr('0') ]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' ∞«'
                    else pnCnt.Caption := '0 ∞«';
  finally
    Delay_Hide;
  end;
end;

procedure TfmOvApprove.btnOvCancelClick(Sender: TObject);
begin
  prOvCancel('1');
end;

procedure TfmOvApprove.btnCancelClick(Sender: TObject);
begin
  prOvCancel('2');
end;

Procedure TfmOvApprove.prOvCancel(sRsltTp: String);
var
  sSql, sResult : String;
begin
  with dbMain do begin
    try
      Delay_Show();
      sSql := Format(
        'UPDATE OVERNGT_HIS  ' +
        '   SET RSLT_TP = %s ' +
        ' WHERE USER_ID = %s ' +
        '   AND ARTC_CD = %s ' +
        '   AND RQST_TRADE_DT = %s ' +
        '   AND RQST_TM = %s ' ,
        [QuotedStr(sRsltTp),
         QuotedStr(dbMain.FieldByName('USER_ID').AsString),
         QuotedStr(dbMain.FieldByName('ARTC_CD').AsString),
         QuotedStr(dbMain.FieldByName('RQST_TRADE_DT').AsString),
         QuotedStr(dbMain.FieldByName('RQST_TM').AsString) ]);
      fnSqlOpen(dbMain, sSql);
    finally
      Delay_Hide;
    end;
  end;
end;

end.
