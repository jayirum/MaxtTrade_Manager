unit MUserStkPL;

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
  TfmUserStkPL = class(TfmBasic)
    gdMain: TDBGridEh;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    pnCnt: TRzPanel;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    chPL: TbsSkinCheckRadioBox;
    cbxDayF: TbsSkinCheckRadioBox;
    cbxNightF: TbsSkinCheckRadioBox;
    cbxDayOp: TbsSkinCheckRadioBox;
    cbxURO: TbsSkinCheckRadioBox;
    cbxCL: TbsSkinCheckRadioBox;
    cbxSCN: TbsSkinCheckRadioBox;
    cbxHSI: TbsSkinCheckRadioBox;
    cbxNK: TbsSkinCheckRadioBox;
    cbxGC: TbsSkinCheckRadioBox;
    cbxES: TbsSkinCheckRadioBox;
    cbxDAX: TbsSkinCheckRadioBox;
    cbxNG: TbsSkinCheckRadioBox;
    cbxAD: TbsSkinCheckRadioBox;
    cbxBP: TbsSkinCheckRadioBox;
    cbxCD: TbsSkinCheckRadioBox;
    cbxSI: TbsSkinCheckRadioBox;
    cbxJY: TbsSkinCheckRadioBox;
    cbxNQ: TbsSkinCheckRadioBox;
    cbxHG: TbsSkinCheckRadioBox;
    cbxYM: TbsSkinCheckRadioBox;
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
    procedure cbxDayFClick(Sender: TObject);
    procedure cbxNightFClick(Sender: TObject);
    procedure cbxDayOpClick(Sender: TObject);
    procedure cbxUROClick(Sender: TObject);
    procedure cbxCLClick(Sender: TObject);
    procedure cbxGCClick(Sender: TObject);
    procedure cbxESClick(Sender: TObject);
    procedure cbxADClick(Sender: TObject);
    procedure cbxBPClick(Sender: TObject);
    procedure cbxJYClick(Sender: TObject);
    procedure cbxNQClick(Sender: TObject);
    procedure cbxYMClick(Sender: TObject);
    procedure cbxSCNClick(Sender: TObject);
    procedure cbxHSIClick(Sender: TObject);
    procedure cbxNKClick(Sender: TObject);
    procedure cbxDAXClick(Sender: TObject);
    procedure cbxNGClick(Sender: TObject);
    procedure cbxCDClick(Sender: TObject);
    procedure cbxSIClick(Sender: TObject);
    procedure cbxHGClick(Sender: TObject);
    // YJM
  private
    { Private declarations }
    procedure ShowArtc(iArtc:integer; TF:Boolean);
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmUserStkPL: TfmUserStkPL;

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

procedure TfmUserStkPL.ShowArtc(iArtc:integer; TF:Boolean);
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

procedure TfmUserStkPL.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmUserStkPL.cbxDayFClick(Sender: TObject);
begin
  ShowArtc(1, cbxDayF.Checked);
end;

procedure TfmUserStkPL.cbxNightFClick(Sender: TObject);
begin
  ShowArtc(2, cbxNightF.Checked);
end;

procedure TfmUserStkPL.cbxDayOpClick(Sender: TObject);
begin
  ShowArtc(3, cbxDayOp.Checked);
end;

procedure TfmUserStkPL.cbxUROClick(Sender: TObject);
begin
  ShowArtc(4, cbxURO.Checked);
end;

procedure TfmUserStkPL.cbxCLClick(Sender: TObject);
begin
  ShowArtc(5, cbxCL.Checked);
end;

procedure TfmUserStkPL.cbxGCClick(Sender: TObject);
begin
  ShowArtc(6, cbxGC.Checked);
end;

procedure TfmUserStkPL.cbxESClick(Sender: TObject);
begin
  ShowArtc(7, cbxES.Checked);
end;

procedure TfmUserStkPL.cbxADClick(Sender: TObject);
begin
  ShowArtc(8, cbxAD.Checked);
end;

procedure TfmUserStkPL.cbxBPClick(Sender: TObject);
begin
  ShowArtc(9, cbxBP.Checked);
end;

procedure TfmUserStkPL.cbxJYClick(Sender: TObject);
begin
  ShowArtc(10, cbxJY.Checked);
end;

procedure TfmUserStkPL.cbxNQClick(Sender: TObject);
begin
  ShowArtc(11, cbxNQ.Checked);
end;

procedure TfmUserStkPL.cbxYMClick(Sender: TObject);
begin
  ShowArtc(12, cbxYM.Checked);
end;

procedure TfmUserStkPL.cbxSCNClick(Sender: TObject);
begin
  ShowArtc(13, cbxSCN.Checked);
end;

procedure TfmUserStkPL.cbxHSIClick(Sender: TObject);
begin
  ShowArtc(14, cbxHSI.Checked);
end;

procedure TfmUserStkPL.cbxNKClick(Sender: TObject);
begin
  ShowArtc(15, cbxNK.Checked);
end;

procedure TfmUserStkPL.cbxDAXClick(Sender: TObject);
begin
  ShowArtc(16, cbxDAX.Checked);
end;

procedure TfmUserStkPL.cbxNGClick(Sender: TObject);
begin
  ShowArtc(17, cbxNG.Checked);
end;

procedure TfmUserStkPL.cbxCDClick(Sender: TObject);
begin
  ShowArtc(18, cbxCD.Checked);
end;

procedure TfmUserStkPL.cbxSIClick(Sender: TObject);
begin
  ShowArtc(19, cbxSI.Checked);
end;

procedure TfmUserStkPL.cbxHGClick(Sender: TObject);
begin
  ShowArtc(20, cbxHG.Checked);
end;

procedure TfmUserStkPL.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmUserStkPL.FormClose(Sender: TObject; var Action: TCloseAction);
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

procedure TfmUserStkPL.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmUserStkPL);
end;

procedure TfmUserStkPL.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if _Supervisor then cbUserGrade.Visible := True;
  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), 'ȸ�����', '0');
  cbUserGrade.ItemIndex := 0;

  PartTableOpen(cbUserPart, 'ȸ���з�', '[��ü]', 'ALL');
  PartTableOpen(cbUserPart, 'ȸ���з�');

  PartTableOpen(cbPartner, '@|DISTINCT PARTNER_NICK_NM + '''','''' + PARTNER_NM, PARTNER_ID|USER_MST|ISNULL(PARTNER_NM,'''') <> '''' ', '[����]', 'ALL');

  dtStart.Date    := TextToDate(_Trade_DT) -7;
  dtEnd.Date      := TextToDate(_Trade_DT);

//  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('ACNT_TP'));

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

// TODO : ���������� �Ǹ� �ٸ� ȭ�鿡�� �����Ұ�
procedure TfmUserStkPL.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with TDBGridEh(Sender) do begin
    if DataCol > 2  then begin // ���ڰ� �÷�
      Canvas.Font.Color := clBlack;
      if StrToIntDef(Column.DisplayText,0) > 0 then Canvas.Font.Color := clRed else
      if StrToIntDef(Column.DisplayText,0) < 0 then Canvas.Font.Color := clBlue;
      DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
    end;
  end;
end;

procedure TfmUserStkPL.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmUserStkPL.MainTableOpen;
var
  sSql, sUserGrade, sUserPart, sPartner, sPL, sStart, sEnd : String;
begin
  try
    Delay_Show();

    if _Supervisor then
      if cbUserGrade.ItemIndex <> 0 then sUserGrade := Format(' AND B1.USER_GRADE = %s ', [IntToStr(cbUserGrade.ItemIndex)]);

    if cbUserPart.ItemIndex = 0 then sUserPart := ''
                                 else sUserPart := Format(' AND B1.PART_CD = %s ', [QuotedStr(cbUserPart.Values[cbUserPart.ItemIndex])]);

    if cbPartner.ItemIndex = 0 then sPartner := ''
                                else sPartner := Format(' AND B1.PART_CD = %s ', [QuotedStr(cbPartner.Values[cbPartner.ItemIndex])]);

    if chPL.Checked then sPL := ' WHERE (ACNT_AMT_TODAY > 0) OR (DT_CNT > 0) '
                    else sPL := '';

    sStart := StrReplace(dtStart.Text, '-', '');
    sEnd   := StrReplace(dtEnd.Text,   '-', '');

    sSql := Format(
      'SELECT AA.USER_NM USER_NM ' +
      '      ,AA.USER_ID USER_ID ' +
      '      ,AA.ACNT_NO ACNT_NO ' +
      '      ,ACNT_AMT_TODAY     ' + // �����ܾ�
      '      ,DT_CNT        ' +   // �ŷ��ϼ�
      '      ,CLR_PL        ' +   // �ѽ�������
//    '      ,CLR_PL_SUM    ' +   // �ѽ�������
      '      ,CMSN          ' +   // �Ѽ�����
      '      ,NET_PL        ' +   // ������
      '      ,RSLT_IN_AMT   ' +   // �Աݾ�
      '      ,RSLT_OUT_AMT  ' +   // ��ݾ�
      '      ,KSF_PL        ' +   // �������� (�ְ�)
      '      ,KSF_CMSN      ' +   //
      '      ,KSO_PL_DAY    ' +   // �����ɼ� (�ְ�)
      '      ,KSO_CMSN_DAY  ' +   //
      '      ,KSO_PL_NGT    ' +   // �����ɼ� (�߰�)
      '      ,KSO_CMSN_NGT  ' +   //
      '      ,URO_CLR_PL    ' +   // ���μ��� (TODO : �� Ʋ��)
      '      ,URO_CMSN      ' +   //
      '      ,CL_CLR_PL     ' +   // ũ������
      '      ,CL_CMSN       ' +   //
      '      ,GC_CLR_PL     ' +   // ���
      '      ,GC_CMSN       ' +   //
      '      ,NG_CLR_PL     ' +   // õ������
      '      ,NG_CMSN       ' +   //
      '      ,ES_CLR_PL     ' +   // E-Mini S&P
      '      ,ES_CMSN       ' +   //
      '      ,AD_CLR_PL     ' +   // ȣ�ִ޷�
      '      ,AD_CMSN       ' +   //
      '      ,BP_CLR_PL     ' +   // ������ �Ŀ��
      '      ,BP_CMSN       ' +   //
      '      ,JY_CLR_PL     ' +   // �Ϻ� ��
      '      ,JY_CMSN       ' +   //
      '      ,NQ_CLR_PL     ' +   // ������
      '      ,NQ_CMSN       ' +   //
      '      ,YM_CLR_PL     ' +   // �ٿ�����
      '      ,YM_CMSN       ' +   //
      '      ,SCN_CLR_PL    ' +   // �߱� A50
      '      ,SCN_CMSN      ' +   //
      '      ,HSI_CLR_PL    ' +   // �׻�����
      '      ,HSI_CMSN      ' +   //
      '      ,SSI_CLR_PL    ' +   // ������225
      '      ,SSI_CMSN      ' +   //
      '      ,FDAX_CLR_PL   ' +   // ���� DAX
      '      ,FDAX_CMSN     ' +   //
      '      ,CD_CLR_PL     ' +   // ĳ���� �޷�
      '      ,CD_CMSN       ' +   //
      '      ,SI_CLR_PL     ' +   // �ǹ�
      '      ,SI_CMSN       ' +   //
      '      ,HG_CLR_PL     ' +   // ����
      '      ,HG_CMSN       ' +   //
      'FROM (SELECT USER_NM ' +
      '           ,USER_ID  ' +
      '           ,ACNT_NO  ' +
//      '           ,SUM(CLR_PL_SUM  ) CLR_PL_SUM   ' + // �ѽ�������
      '           ,(SELECT MAX(ACNT_AMT_TODAY) FROM ACNT_CLS WHERE TRADE_DT = %s AND ACNT_NO = A.ACNT_NO) ACNT_AMT_TODAY ' +
      '           ,SUM(RSLT_IN_AMT) RSLT_IN_AMT   ' +
      '           ,SUM(RSLT_OUT_AMT) RSLT_OUT_AMT ' +
      '        FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s %s %s ) A ' +
      '      WHERE TRADE_DT BETWEEN %s AND %s     ' +
      '      GROUP BY USER_NM, USER_ID, ACNT_NO ) AA LEFT OUTER JOIN ' +
      '    (SELECT USER_NM ' +
      '           ,USER_ID ' +
      '           ,ACNT_NO ' +
      '           ,COUNT(TRADE_DT) DT_CNT ' +
      '           ,SUM(CLR_PL    ) CLR_PL ' +
      '           ,SUM(CMSN      ) CMSN   ' +
      '           ,SUM(NET_PL    ) NET_PL ' +
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
      '      GROUP BY USER_NM, USER_ID, ACNT_NO ' +
      '     ) BB                    ' +
      '  ON AA.USER_NM = BB.USER_NM ' +
      ' AND AA.USER_ID = BB.USER_ID ' +
      ' AND AA.ACNT_NO = BB.ACNT_NO ' +
      sPL +
//      'GROUP BY AA.USER_NM, AA.USER_ID, AA.ACNT_NO ' +
      'ORDER BY AA.USER_NM, AA.ACNT_NO ',
      [QuotedStr(sEnd),
       sUserGrade,
       sUserPart,
       sPartner,
       QuotedStr(sStart),
       QuotedStr(sEnd),
       sUserGrade,
       sUserPart,
       sPartner,
       QuotedStr(sStart),
       QuotedStr(sEnd) ]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmUserStkPL.tmAutoSearchTimer(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

end.
