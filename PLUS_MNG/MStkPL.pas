unit MStkPL;

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
  MBasic, ThdTimer, RzButton, RzRadChk, Mask;

type
  TfmStkPL = class(TfmBasic)
    gdMain: TDBGridEh;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    pnCnt: TRzPanel;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    cbxDayF: TbsSkinCheckRadioBox;
    cbxNightF: TbsSkinCheckRadioBox;
    cbxDayOp: TbsSkinCheckRadioBox;
    cbxURO: TbsSkinCheckRadioBox;
    cbxCL: TbsSkinCheckRadioBox;
    cbxGC: TbsSkinCheckRadioBox;
    cbxES: TbsSkinCheckRadioBox;
    cbxAD: TbsSkinCheckRadioBox;
    cbxBP: TbsSkinCheckRadioBox;
    cbxJY: TbsSkinCheckRadioBox;
    cbxNQ: TbsSkinCheckRadioBox;
    cbxYM: TbsSkinCheckRadioBox;
    cbxSCN: TbsSkinCheckRadioBox;
    cbxHSI: TbsSkinCheckRadioBox;
    cbxNK: TbsSkinCheckRadioBox;
    cbxDAX: TbsSkinCheckRadioBox;
    cbxNG: TbsSkinCheckRadioBox;
    cbxCD: TbsSkinCheckRadioBox;
    cbxSI: TbsSkinCheckRadioBox;
    cbxHG: TbsSkinCheckRadioBox;
    cbUserGrade: TkcRzComboBox;
    cbUserPart: TkcRzComboBox;
    cbPartner: TkcRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure tmAutoSearchTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    // YJM
  private
    { Private declarations }
    procedure ShowArtc(iArtc:integer; TF:Boolean);
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmStkPL: TfmStkPL;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

const
  giArtc = 20; // Artc 개수
  giOpt  =  2; // 선택옵션 개수
  giStartCol = 19; // Opt, Artc 컬럼 시작전 위치
var
  arrArtc : array [1..giArtc] of boolean;
  arrOpt  : array [1..giOpt] of boolean;

procedure TfmStkPL.ShowArtc(iArtc:integer; TF:Boolean);
var
  i : integer;
begin
  with gdMain do
    for i:=1 to giOpt do
      if (TF = True) and (arrOpt[i] = True) then
        Columns[giStartCol+((iArtc-1)*giOpt)+i].Visible := True
      else
        Columns[giStartCol+((iArtc-1)*giOpt)+i].Visible := False;

  arrArtc[iArtc] := TF;
end;

procedure TfmStkPL.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmStkPL.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmStkPL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Set_CFGFile('fmUserStkPL', 'GD_DAYF'   , BoolToStrInt(cbxDayF.Checked  )); // 국선 (주)
  Set_CFGFile('fmUserStkPL', 'GD_NIGHTF' , BoolToStrInt(cbxNightF.Checked)); // 국선 (야)
  Set_CFGFile('fmUserStkPL', 'GD_DAYOP'  , BoolToStrInt(cbxDayOp.Checked )); // 국옵 (주)

  Set_CFGFile('fmUserStkPL', 'GD_URO' , BoolToStrInt(cbxURO.Checked ));  // 유로FX
  Set_CFGFile('fmUserStkPL', 'GD_CL'  , BoolToStrInt(cbxCL.Checked  ));  // 크루드오일
  Set_CFGFile('fmUserStkPL', 'GD_GC'  , BoolToStrInt(cbxGC.Checked  ));  // 골드
  Set_CFGFile('fmUserStkPL', 'GD_NG'  , BoolToStrInt(cbxNG.Checked  ));  // 천연가스
  Set_CFGFile('fmUserStkPL', 'GD_ES'  , BoolToStrInt(cbxES.Checked  ));  // S＆P500
  Set_CFGFile('fmUserStkPL', 'GD_AD'  , BoolToStrInt(cbxAD.Checked  ));  // 호주달러
  Set_CFGFile('fmUserStkPL', 'GD_BP'  , BoolToStrInt(cbxBP.Checked  ));  // B파운드
  Set_CFGFile('fmUserStkPL', 'GD_JY'  , BoolToStrInt(cbxJY.Checked  ));  // 엔화
  Set_CFGFile('fmUserStkPL', 'GD_NQ'  , BoolToStrInt(cbxNQ.Checked  ));  // 나스닥
  Set_CFGFile('fmUserStkPL', 'GD_YM'  , BoolToStrInt(cbxYM.Checked  ));  // 다우지수
  Set_CFGFile('fmUserStkPL', 'GD_SCN' , BoolToStrInt(cbxSCN.Checked ));  // 차이나A50
  Set_CFGFile('fmUserStkPL', 'GD_HSI' , BoolToStrInt(cbxHSI.Checked ));  // 항셍지수
  Set_CFGFile('fmUserStkPL', 'GD_NK'  , BoolToStrInt(cbxNK.Checked  ));  // 니케이225
  Set_CFGFile('fmUserStkPL', 'GD_DAX' , BoolToStrInt(cbxDAX.Checked ));  // 독일닥스
  Set_CFGFile('fmUserStkPL', 'GD_CD'  , BoolToStrInt(cbxCD.Checked  ));  // 캐나다달러
  Set_CFGFile('fmUserStkPL', 'GD_SI'  , BoolToStrInt(cbxSI.Checked  ));  // 실버
  Set_CFGFile('fmUserStkPL', 'GD_HG'  , BoolToStrInt(cbxHG.Checked  ));  // 구리

  inherited;
end;

procedure TfmStkPL.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmStkPL);
end;

procedure TfmStkPL.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if _Supervisor then cbUserGrade.Visible := True;
  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), '회원등급', '0');
  cbUserGrade.ItemIndex := 0;

  PartTableOpen(cbUserPart, '회원분류', '[전체]', 'ALL');
  PartTableOpen(cbUserPart, '회원분류');

  PartTableOpen(cbPartner, '@|DISTINCT PARTNER_NICK_NM + '''','''' + PARTNER_NM, PARTNER_ID|USER_MST|WHERE ISNULL(PARTNER_NM,'''') <> '''' ', '[없음]', 'ALL');
//  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('ACNT_TP'));

  dtStart.Date := TextToDate(_Trade_DT) -7;
  dtEnd.Date   := TextToDate(_Trade_DT);

  for i:=1 to giArtc do arrArtc[i] := False;
  for i:=1 to giOpt  do arrOpt[i]  := True;

  arrArtc[ 1] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_DAYF'  , _TRUE));
  arrArtc[ 2] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NIGHTF', _TRUE));
  arrArtc[ 3] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_DAYOP' , _TRUE));
  arrArtc[ 4] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_URO'   , _TRUE));  // 유로FX
  arrArtc[ 5] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_CL'    , _TRUE));  // 크루드오일
  arrArtc[ 6] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_GC'    , _TRUE));  // 골드
  arrArtc[ 7] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_ES'    , _TRUE));  // S＆P500
  arrArtc[ 8] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_AD'    , _TRUE));  // 호주달러
  arrArtc[ 9] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_BP'    , _TRUE));  // B파운드
  arrArtc[10] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_JY'    , _TRUE));  // 엔화
  arrArtc[11] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NQ'    , _TRUE));  // 나스닥
  arrArtc[12] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_YM'    , _TRUE));  // 다우지수
  arrArtc[13] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_SCN'   , _TRUE));  // 차이나A50
  arrArtc[14] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_HSI'   , _TRUE));  // 항셍지수
  arrArtc[15] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NK'    , _TRUE));  // 니케이225
  arrArtc[16] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_DAX'   , _TRUE));  // 독일닥스
  arrArtc[17] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NG'    , _TRUE));  // 천연가스
  arrArtc[18] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_CD'    , _TRUE));  // 캐나다달러
  arrArtc[19] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_SI'    , _TRUE));  // 실버
  arrArtc[20] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_HG'    , _TRUE));  // 구리

  cbxDayF.Checked   := arrArtc[ 1];
  cbxNightF.Checked := arrArtc[ 2];
  cbxDayOp.Checked  := arrArtc[ 3];
  cbxURO.Checked    := arrArtc[ 4];
  cbxCL.Checked     := arrArtc[ 5];
  cbxGC.Checked     := arrArtc[ 6];
  cbxES.Checked     := arrArtc[ 7];
  cbxAD.Checked     := arrArtc[ 8];
  cbxBP.Checked     := arrArtc[ 9];
  cbxJY.Checked     := arrArtc[10];
  cbxNQ.Checked     := arrArtc[11];
  cbxYM.Checked     := arrArtc[12];
  cbxSCN.Checked    := arrArtc[13];
  cbxHSI.Checked    := arrArtc[14];
  cbxNK.Checked     := arrArtc[15];
  cbxDAX.Checked    := arrArtc[16];
  cbxNG.Checked     := arrArtc[17];
  cbxCD.Checked     := arrArtc[18];
  cbxSI.Checked     := arrArtc[19];
  cbxHG.Checked     := arrArtc[20];
end;

procedure TfmStkPL.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with TDBGridEh(Sender) do begin
    if DataCol > 1  then begin // 숫자값 컬럼
      Canvas.Font.Color := clBlack;
      if StrToIntDef(Column.DisplayText,0) > 0 then Canvas.Font.Color := clRed else
      if StrToIntDef(Column.DisplayText,0) < 0 then Canvas.Font.Color := clBlue;
      DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
    end;
  end;
end;

procedure TfmStkPL.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmStkPL.MainTableOpen;
var
  sSql, sUserGrade, sUserPart, sPartner, sStart, sEnd : String;
begin
  try
    Delay_Show();

    if _Supervisor then
      if cbUserGrade.ItemIndex <> 0 then sUserGrade := Format(' AND B1.USER_GRADE = %s ', [IntToStr(cbUserGrade.ItemIndex)]);

    if cbUserPart.ItemIndex = 0 then sUserPart := ''
                                 else sUserPart := Format(' AND B1.PART_CD = %s ', [QuotedStr(cbUserPart.Values[cbUserPart.ItemIndex])]);

    if cbPartner.ItemIndex = 0 then sPartner := ''
                                else sPartner := Format(' AND B1.PART_CD = %s ', [QuotedStr(cbPartner.Values[cbPartner.ItemIndex])]);


    sStart := StrReplace(dtStart.Text, '-', '');
    sEnd   := StrReplace(dtEnd.Text,   '-', '');

    sSql := Format(
      'SELECT AA.TRADE_DT    ' +
      '      ,CLR_PL_SUM     ' + // 총실현손익
      '      ,BB.CMSN        ' + // 총수수료
      '      ,NET_PL         ' + // 순손익
      '      ,ACNT_AMT_BF    ' + // 전일잔액
      '      ,ACNT_AMT_TODAY ' + // 금일잔액
      '      ,RSLT_IN_AMT    ' + // 입금액
      '      ,RSLT_OUT_AMT   ' + // 출금액
      '      ,YET_OUT_AMT    ' + // 미처리 출금액
      '      ,KSF_PL         ' + // 국내선물 (주간)
      '      ,KSF_CMSN       ' + //
      '      ,KSO_PL_DAY     ' + // 국내옵션 (주간)
      '      ,KSO_CMSN_DAY   ' + //
      '      ,KSO_PL_NGT     ' + // 국내옵션 (야간)
      '      ,KSO_CMSN_NGT   ' + //
      '      ,URO_CLR_PL     ' + // 유로선물 (TODO : 값 틀림)
      '      ,URO_CMSN       ' + //
      '      ,CL_CLR_PL      ' + // 크루드오일
      '      ,CL_CMSN        ' + //
      '      ,GC_CLR_PL      ' + // 골드
      '      ,GC_CMSN        ' + //
      '      ,NG_CLR_PL      ' + // 천연가스
      '      ,NG_CMSN        ' + //
      '      ,ES_CLR_PL      ' + // E-Mini S&P
      '      ,ES_CMSN        ' + //
      '      ,AD_CLR_PL      ' + // 호주달러
      '      ,AD_CMSN        ' + //
      '      ,BP_CLR_PL      ' + // 프랑스 파운드
      '      ,BP_CMSN        ' + //
      '      ,JY_CLR_PL      ' + // 일본 앤
      '      ,JY_CMSN        ' + //
      '      ,NQ_CLR_PL      ' + // 나스닥
      '      ,NQ_CMSN        ' + //
      '      ,YM_CLR_PL      ' + // 다우지수
      '      ,YM_CMSN        ' + //
      '      ,SCN_CLR_PL     ' + // 중국 A50
      '      ,SCN_CMSN       ' + //
      '      ,HSI_CLR_PL     ' + // 항생지수
      '      ,HSI_CMSN       ' + //
      '      ,SSI_CLR_PL     ' + // 니케이225
      '      ,SSI_CMSN       ' + //
      '      ,FDAX_CLR_PL    ' + // 독일 DAX
      '      ,FDAX_CMSN      ' + //
      '      ,CD_CLR_PL      ' + // 캐나다 달러
      '      ,CD_CMSN        ' + //
      '      ,SI_CLR_PL      ' + // 실버
      '      ,SI_CMSN        ' + //
      '      ,HG_CLR_PL      ' + // 구리
      '      ,HG_CMSN        ' + //
      'FROM (SELECT TRADE_DT ' +
      '            ,SUM(ACNT_AMT_BF   ) ACNT_AMT_BF    ' +
      '            ,SUM(ACNT_AMT_TODAY) ACNT_AMT_TODAY ' +
      '            ,SUM(CLR_PL_SUM    ) CLR_PL_SUM     ' +
      '            ,SUM(RSLT_IN_AMT   ) RSLT_IN_AMT    ' +
      '            ,SUM(RSLT_OUT_AMT  ) RSLT_OUT_AMT   ' +
      '            ,SUM(YET_OUT_AMT   ) YET_OUT_AMT    ' +
      '        FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s %s %s ) A ' +
      '      WHERE TRADE_DT BETWEEN %s AND %s ' +
      '      GROUP BY TRADE_DT) AA LEFT OUTER JOIN ' +
      '    (SELECT TRADE_DT           ' +
      '           ,SUM(CMSN  ) CMSN   ' +
      '           ,SUM(NET_PL) NET_PL ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''101 '' THEN CLR_PL END) KSF_PL       ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''101 '' THEN CMSN   END) KSF_CMSN     ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''201 '' THEN CLR_PL END) KSO_PL_DAY   ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''201 '' THEN CMSN   END) KSO_CMSN_DAY ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''301 '' THEN CLR_PL END) KSO_PL_NGT   ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''301 '' THEN CMSN   END) KSO_CMSN_NGT ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''URO '' THEN CLR_PL END) URO_CLR_PL   ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''URO '' THEN CMSN   END) URO_CMSN     ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''CL  '' THEN CLR_PL END) CL_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''CL  '' THEN CMSN   END) CL_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''GC  '' THEN CLR_PL END) GC_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''GC  '' THEN CMSN   END) GC_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''NG  '' THEN CLR_PL END) NG_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''NG  '' THEN CMSN   END) NG_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''ES  '' THEN CLR_PL END) ES_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''ES  '' THEN CMSN   END) ES_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''AD  '' THEN CLR_PL END) AD_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''AD  '' THEN CMSN   END) AD_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''BP  '' THEN CLR_PL END) BP_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''BP  '' THEN CMSN   END) BP_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''JY  '' THEN CLR_PL END) JY_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''JY  '' THEN CMSN   END) JY_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''NQ  '' THEN CLR_PL END) NQ_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''NQ  '' THEN CMSN   END) NQ_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''YM  '' THEN CLR_PL END) YM_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''YM  '' THEN CMSN   END) YM_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''SCN '' THEN CLR_PL END) SCN_CLR_PL   ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''SCN '' THEN CMSN   END) SCN_CMSN     ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''HSI '' THEN CLR_PL END) HSI_CLR_PL   ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''HSI '' THEN CMSN   END) HSI_CMSN     ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''SSI '' THEN CLR_PL END) SSI_CLR_PL   ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''SSI '' THEN CMSN   END) SSI_CMSN     ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''FDAX'' THEN CLR_PL END) FDAX_CLR_PL  ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''FDAX'' THEN CMSN   END) FDAX_CMSN    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''CD  '' THEN CLR_PL END) CD_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''CD  '' THEN CMSN   END) CD_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''SI  '' THEN CLR_PL END) SI_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''SI  '' THEN CMSN   END) SI_CMSN      ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''HG  '' THEN CLR_PL END) HG_CLR_PL    ' +
      '           ,SUM(CASE WHEN ARTC_CD = ''HG  '' THEN CMSN   END) HG_CMSN      ' +
      '       FROM (SELECT A1.* FROM ACNT_STK_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s %s %s ) A ' +
      '      WHERE TRADE_DT BETWEEN %s AND %s ' +
      '      GROUP BY TRADE_DT ' +
      '     ) BB ON AA.TRADE_DT = BB.TRADE_DT ' +
      ' ORDER BY AA.TRADE_DT DESC ' ,
      [sUserGrade,
       sUserPart,
       sPartner,
       QuotedStr(sStart),
       QuotedStr(sEnd),
       sUserGrade,
       sUserPart,
       sPartner,
       QuotedStr(sStart),
       QuotedStr(sEnd) ]);
//       sUserGrade, sUserPart, sPartner
  finally
    Delay_Hide;
  end;
end;

procedure TfmStkPL.tmAutoSearchTimer(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

end.
