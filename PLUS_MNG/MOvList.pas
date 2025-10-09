unit MOvList;

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
  TfmOvList = class(TfmBasic)
    bsRibbonDivider1: TbsRibbonDivider;
    pnCnt: TRzPanel;
    bsSkinLabel1: TbsSkinLabel;
    chUserTp: TbsSkinCheckRadioBox;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    edUser: TRzEdit;
    gdMain: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmOvList: TfmOvList;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmOvList.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmOvList.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmOvList);
end;

procedure TfmOvList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmOvList.FormShow(Sender: TObject);
begin
  inherited;
  dtStart.Date := TextToDate(_Trade_DT); //Now;
  dtEnd.Date   := TextToDate(_Trade_DT); //Now;

  PartTableOpen(TComponent(gdMain.Columns[2]), Format('@|STK_NM, STK_CD|STK_MST|WHERE STK_ID = %s', [QuotedStr('STK_ID')]));

  MainTableOpen;
end;

procedure TfmOvList.MainTableOpen;
var
  sSql, sResult, sUser, sUserTp, sWhere : String;
begin
  try
    if edUser.Text <> '' then sUser := Format(' AND (C.USER_ID LIKE %s OR C.USER_NM LIKE %s) ', [QuotedStr('%'+edUser.Text+'%'), QuotedStr('%'+edUser.Text+'%')]);

    if _Supervisor then begin
      if chUserTp.Checked then sUserTp := Format(' AND C.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                          else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND C.USER_GRADE = 2 '
                          else sUserTp := ' AND C.USER_GRADE <> 7 ';
    end;

    sWhere := sUser + sUserTp;

    Delay_Show();
    sSql := Format(
      'SELECT A.USER_ID       ' +
      '      ,C.USER_NM       ' +
      '      ,B.STK_CD        ' +
      '      ,A.RQST_TRADE_DT ' +
      '      ,A.RQST_TM       ' +
      '      ,A.OVERNGT_YN    ' +
      '      ,A.RSLT_TP       ' +
      '      ,A.RSLT_SYS_DT   ' +
      '      ,A.RQST_SYS_DT   ' +
      '      ,A.MNG_ID        ' +
      '      ,C.USER_GRADE    ' +
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
      '   AND A.RSLT_TP <> %s       ' +
      '   AND A.RQST_TRADE_DT BETWEEN %s AND %s ' +
      sWhere,
      [QuotedStr('0'),
       QuotedStr(StrReplace(dtStart.Text, '-', '')),
       QuotedStr(StrReplace(dtEnd.Text  , '-', '')) ]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' °Ç'
                    else pnCnt.Caption := '0 °Ç';
  finally
    Delay_Hide;
  end;
end;

end.
