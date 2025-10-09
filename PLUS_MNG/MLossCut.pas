unit MLossCut;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsRibbon, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, kcRaizeCtrl,
  RzDBNav, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmLossCut = class(TfmBasic)
    gdMain: TDBGridEh;
    pnCnt: TRzPanel;
    bsSkinLabel45: TbsSkinLabel;
    dtDt: TkcRzDateTimeEdit;
    chUserTp: TbsSkinCheckRadioBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure chUserTpClick(Sender: TObject);
    procedure dtDtChange(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmLossCut: TfmLossCut;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

procedure TfmLossCut.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmLossCut.chUserTpClick(Sender: TObject);
begin
  inherited;
  btnFilter.ButtonClick;
end;

procedure TfmLossCut.dtDtChange(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmLossCut.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmLossCut);
end;

procedure TfmLossCut.FormShow(Sender: TObject);
begin
  inherited;

  dtDt.Date := TextToDate(_Trade_DT);
end;

procedure TfmLossCut.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmLossCut.MainTableOpen;
var
  sSql, sUserTp, sResult : String;
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

    sSql := Format(
      'SELECT A.ACNT_NO  ' +
      '      ,A.TRADE_DT ' +
      '      ,A.USER_ID  ' +
      '      ,B.USER_NM  ' +
      '      ,A.ACNT_TP  ' +
      '      ,A.ACNT_AMT ' +
      '      ,A.ESTM_PL  ' +
      '      ,A.ESTM_AMT ' +
      '      ,A.TM       ' +
      '      ,A.NCLR_QTY ' +
      '      ,A.LEVERAGE ' +
      '      ,A.STK_CD   ' +
      '      ,A.BS_TP    ' +
      '      ,A.AVG_PRC  ' +
      '      ,A.CURR_PRC ' +
      '      ,A.CLR_PL   ' +
      '      ,A.CMSN     ' +
      '      ,A.SYS_DT   ' +
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM LOSSCUT_HIS A ' +
      '      ,USER_MST B    ' +
      ' WHERE A.USER_ID = B.USER_ID ' +
      '   AND A.TRADE_DT = %s %s ',
      [QuotedStr(StrReplace(dtDt.Text, '-', '')),
       sUserTp ]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' °Ç'
                    else pnCnt.Caption := '0 °Ç';
  finally
    Delay_Hide;
  end;
end;

end.
