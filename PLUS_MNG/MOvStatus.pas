unit MOvStatus;

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
  TfmOvStatus = class(TfmBasic)
    gdMain: TDBGridEh;
    bsRibbonDivider1: TbsRibbonDivider;
    btnOvCancel: TbsSkinSpeedButton;
    pnCnt: TRzPanel;
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure btnOvCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmOvStatus: TfmOvStatus;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmOvStatus.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmOvStatus.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmOvStatus);
end;

procedure TfmOvStatus.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmOvStatus.FormShow(Sender: TObject);
begin
  inherited;
  PartTableOpen(TComponent(gdMain.Columns[3]), Format('@|STK_NM, STK_CD|STK_MST|WHERE STK_CD = %s', [QuotedStr('STK_CD')]));
  PartTableOpen(TComponent(gdMain.Columns[4]), CodeFormat('BS_TP', 'ORDER BY CODE_VALUE'));

  MainTableOpen;
end;

procedure TfmOvStatus.MainTableOpen;
var
  sSql, sResult : String;
begin
  try
    Delay_Show();
    sSql := Format(
      'SELECT A.USER_ID ' +
      '      ,A.ARTC_CD ' +
      '      ,C.USER_NM ' +
      '      ,D.ACNT_AMT + D.CLR_PL - D.CMSN AS ACNT_BALANCT ' +                // ∞Ë¡¬¿‹æ◊
      '      ,B.STK_CD      ' +
      '      ,B.BS_TP       ' +
      '      ,B.OVERNGT_QTY ' +
      '      ,B.AVG_PRC     ' +
      '      ,CASE WHEN D.ACNT_TP = %s THEN ' +
      '             ((B.AVG_PRC - F.CNTR_PRC) * B.NCLR_POS_QTY / E.TICK_SIZE * E.TICK_VALUE / D.LEVERAGE) ' +
      '            WHEN D.ACNT_TP = %s THEN ' +
      '             ((B.AVG_PRC - F.CNTR_PRC) * B.NCLR_POS_QTY / E.TICK_SIZE * E.TICK_VALUE / D.LEVERAGE) * (-1) ' +
      '       END AS POS_PL ' +                                                 // ∆Ú∞°º’¿Õ
      '      ,D.LEVERAGE    ' +
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM OVERNGT  A, ' +
      '       NCLR_POS B, ' +
      '       USER_MST C, ' +
      '       ACNT_MST D, ' +
      '       ARTC_MST E, ' +
      '       CURR_PRC F  ' +
      ' WHERE A.ACNT_NO = B.ACNT_NO ' +
      '   AND A.USER_ID = C.USER_ID ' +
      '   AND A.ACNT_NO = D.ACNT_NO ' +
      '   AND A.ARTC_CD = E.ARTC_CD ' +
      '   AND B.STK_CD  = F.STK_CD  ' +
      '   AND A.OVERNGT_YN = %s ',
      [QuotedStr('1'), // ACNT_TP
       QuotedStr('2'), // ACNT_TP
       QuotedStr('Y') ]); // OVERNGT_YN
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' ∞«'
                    else pnCnt.Caption := '0 ∞«';
  finally
    Delay_Hide;
  end;
end;

procedure TfmOvStatus.btnOvCancelClick(Sender: TObject);
var
  sSql : String;
begin
  try
    Delay_Show();
    sSql := Format(
      'UPDATE OVERNGT ' +
      '   SET OVERNGT_YN = %s ' +
      ' WHERE USER_ID    = %s ' +
      '   AND ARTC_CD    = %s ',
      [QuotedStr('N'),
       QuotedStr(dbMain.FieldByName('USER_ID').AsString),
       QuotedStr(dbMain.FieldByName('ARTC_CD').AsString) ]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
