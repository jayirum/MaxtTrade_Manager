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
  giArtc = 20; // Artc ����
  giOpt  =  2; // ���ÿɼ� ����
  giStartCol = 19; // Opt, Artc �÷� ������ ��ġ
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
  Set_CFGFile('fmUserStkPL', 'GD_DAYF'   , BoolToStrInt(cbxDayF.Checked  )); // ���� (��)
  Set_CFGFile('fmUserStkPL', 'GD_NIGHTF' , BoolToStrInt(cbxNightF.Checked)); // ���� (��)
  Set_CFGFile('fmUserStkPL', 'GD_DAYOP'  , BoolToStrInt(cbxDayOp.Checked )); // ���� (��)

  Set_CFGFile('fmUserStkPL', 'GD_URO' , BoolToStrInt(cbxURO.Checked ));  // ����FX
  Set_CFGFile('fmUserStkPL', 'GD_CL'  , BoolToStrInt(cbxCL.Checked  ));  // ũ������
  Set_CFGFile('fmUserStkPL', 'GD_GC'  , BoolToStrInt(cbxGC.Checked  ));  // ���
  Set_CFGFile('fmUserStkPL', 'GD_NG'  , BoolToStrInt(cbxNG.Checked  ));  // õ������
  Set_CFGFile('fmUserStkPL', 'GD_ES'  , BoolToStrInt(cbxES.Checked  ));  // S��P500
  Set_CFGFile('fmUserStkPL', 'GD_AD'  , BoolToStrInt(cbxAD.Checked  ));  // ȣ�ִ޷�
  Set_CFGFile('fmUserStkPL', 'GD_BP'  , BoolToStrInt(cbxBP.Checked  ));  // B�Ŀ��
  Set_CFGFile('fmUserStkPL', 'GD_JY'  , BoolToStrInt(cbxJY.Checked  ));  // ��ȭ
  Set_CFGFile('fmUserStkPL', 'GD_NQ'  , BoolToStrInt(cbxNQ.Checked  ));  // ������
  Set_CFGFile('fmUserStkPL', 'GD_YM'  , BoolToStrInt(cbxYM.Checked  ));  // �ٿ�����
  Set_CFGFile('fmUserStkPL', 'GD_SCN' , BoolToStrInt(cbxSCN.Checked ));  // ���̳�A50
  Set_CFGFile('fmUserStkPL', 'GD_HSI' , BoolToStrInt(cbxHSI.Checked ));  // �׼�����
  Set_CFGFile('fmUserStkPL', 'GD_NK'  , BoolToStrInt(cbxNK.Checked  ));  // ������225
  Set_CFGFile('fmUserStkPL', 'GD_DAX' , BoolToStrInt(cbxDAX.Checked ));  // ���ϴڽ�
  Set_CFGFile('fmUserStkPL', 'GD_CD'  , BoolToStrInt(cbxCD.Checked  ));  // ĳ���ٴ޷�
  Set_CFGFile('fmUserStkPL', 'GD_SI'  , BoolToStrInt(cbxSI.Checked  ));  // �ǹ�
  Set_CFGFile('fmUserStkPL', 'GD_HG'  , BoolToStrInt(cbxHG.Checked  ));  // ����

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
  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), 'ȸ�����', '0');
  cbUserGrade.ItemIndex := 0;

  PartTableOpen(cbUserPart, 'ȸ���з�', '[��ü]', 'ALL');
  PartTableOpen(cbUserPart, 'ȸ���з�');

  PartTableOpen(cbPartner, '@|DISTINCT PARTNER_NICK_NM + '''','''' + PARTNER_NM, PARTNER_ID|USER_MST|WHERE ISNULL(PARTNER_NM,'''') <> '''' ', '[����]', 'ALL');
//  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('ACNT_TP'));

  dtStart.Date := TextToDate(_Trade_DT) -7;
  dtEnd.Date   := TextToDate(_Trade_DT);

  for i:=1 to giArtc do arrArtc[i] := False;
  for i:=1 to giOpt  do arrOpt[i]  := True;

  arrArtc[ 1] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_DAYF'  , _TRUE));
  arrArtc[ 2] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NIGHTF', _TRUE));
  arrArtc[ 3] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_DAYOP' , _TRUE));
  arrArtc[ 4] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_URO'   , _TRUE));  // ����FX
  arrArtc[ 5] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_CL'    , _TRUE));  // ũ������
  arrArtc[ 6] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_GC'    , _TRUE));  // ���
  arrArtc[ 7] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_ES'    , _TRUE));  // S��P500
  arrArtc[ 8] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_AD'    , _TRUE));  // ȣ�ִ޷�
  arrArtc[ 9] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_BP'    , _TRUE));  // B�Ŀ��
  arrArtc[10] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_JY'    , _TRUE));  // ��ȭ
  arrArtc[11] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NQ'    , _TRUE));  // ������
  arrArtc[12] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_YM'    , _TRUE));  // �ٿ�����
  arrArtc[13] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_SCN'   , _TRUE));  // ���̳�A50
  arrArtc[14] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_HSI'   , _TRUE));  // �׼�����
  arrArtc[15] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NK'    , _TRUE));  // ������225
  arrArtc[16] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_DAX'   , _TRUE));  // ���ϴڽ�
  arrArtc[17] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_NG'    , _TRUE));  // õ������
  arrArtc[18] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_CD'    , _TRUE));  // ĳ���ٴ޷�
  arrArtc[19] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_SI'    , _TRUE));  // �ǹ�
  arrArtc[20] := StrToBool(Get_CFGFile('fmUserStkPL', 'GD_HG'    , _TRUE));  // ����

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
    if DataCol > 1  then begin // ���ڰ� �÷�
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
      '      ,CLR_PL_SUM     ' + // �ѽ�������
      '      ,BB.CMSN        ' + // �Ѽ�����
      '      ,NET_PL         ' + // ������
      '      ,ACNT_AMT_BF    ' + // �����ܾ�
      '      ,ACNT_AMT_TODAY ' + // �����ܾ�
      '      ,RSLT_IN_AMT    ' + // �Աݾ�
      '      ,RSLT_OUT_AMT   ' + // ��ݾ�
      '      ,YET_OUT_AMT    ' + // ��ó�� ��ݾ�
      '      ,KSF_PL         ' + // �������� (�ְ�)
      '      ,KSF_CMSN       ' + //
      '      ,KSO_PL_DAY     ' + // �����ɼ� (�ְ�)
      '      ,KSO_CMSN_DAY   ' + //
      '      ,KSO_PL_NGT     ' + // �����ɼ� (�߰�)
      '      ,KSO_CMSN_NGT   ' + //
      '      ,URO_CLR_PL     ' + // ���μ��� (TODO : �� Ʋ��)
      '      ,URO_CMSN       ' + //
      '      ,CL_CLR_PL      ' + // ũ������
      '      ,CL_CMSN        ' + //
      '      ,GC_CLR_PL      ' + // ���
      '      ,GC_CMSN        ' + //
      '      ,NG_CLR_PL      ' + // õ������
      '      ,NG_CMSN        ' + //
      '      ,ES_CLR_PL      ' + // E-Mini S&P
      '      ,ES_CMSN        ' + //
      '      ,AD_CLR_PL      ' + // ȣ�ִ޷�
      '      ,AD_CMSN        ' + //
      '      ,BP_CLR_PL      ' + // ������ �Ŀ��
      '      ,BP_CMSN        ' + //
      '      ,JY_CLR_PL      ' + // �Ϻ� ��
      '      ,JY_CMSN        ' + //
      '      ,NQ_CLR_PL      ' + // ������
      '      ,NQ_CMSN        ' + //
      '      ,YM_CLR_PL      ' + // �ٿ�����
      '      ,YM_CMSN        ' + //
      '      ,SCN_CLR_PL     ' + // �߱� A50
      '      ,SCN_CMSN       ' + //
      '      ,HSI_CLR_PL     ' + // �׻�����
      '      ,HSI_CMSN       ' + //
      '      ,SSI_CLR_PL     ' + // ������225
      '      ,SSI_CMSN       ' + //
      '      ,FDAX_CLR_PL    ' + // ���� DAX
      '      ,FDAX_CMSN      ' + //
      '      ,CD_CLR_PL      ' + // ĳ���� �޷�
      '      ,CD_CMSN        ' + //
      '      ,SI_CLR_PL      ' + // �ǹ�
      '      ,SI_CMSN        ' + //
      '      ,HG_CLR_PL      ' + // ����
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
