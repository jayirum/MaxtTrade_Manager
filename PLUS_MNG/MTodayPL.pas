unit MTodayPL;

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
  TfmTodayPL = class(TfmBasic)
    gdMain: TDBGridEh;
    chUserTp: TbsSkinCheckRadioBox;
    tmAutoSearch: TThreadedTimer;
    bsSkinStdLabel1: TbsSkinStdLabel;
    bsSkinStdLabel2: TbsSkinStdLabel;
    bsSkinStdLabel3: TbsSkinStdLabel;
    cbxAuto: TbsSkinCheckRadioBox;
    cbxPosQty: TbsSkinCheckRadioBox;
    cbxAvgPrc: TbsSkinCheckRadioBox;
    cbxClrPL: TbsSkinCheckRadioBox;
    cbxCmsn: TbsSkinCheckRadioBox;
    cbxEvaPL: TbsSkinCheckRadioBox;
    bsSkinPanel1: TbsSkinPanel;
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
    cbInterval: TkcRzComboBox;
    pnCnt: TRzPanel;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbxPosQtyClick(Sender: TObject);
    procedure cbxAvgPrcClick(Sender: TObject);
    procedure cbxClrPLClick(Sender: TObject);
    procedure cbxCmsnClick(Sender: TObject);
    procedure cbxEvaPLClick(Sender: TObject);
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
    procedure ShowOpt(iOpt:integer; TF:Boolean);
    procedure ShowArtc(iArtc:integer; TF:Boolean);
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmTodayPL: TfmTodayPL;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

const
  giArtc = 20; // Artc ����
  giOpt  =  5; // ���ÿɼ� ����
  giStartCol = 20; // Opt, Artc �÷� ������ ��ġ
var
  arrArtc : array [1..giArtc] of boolean;
  arrOpt  : array [1..giOpt] of boolean;

procedure TfmTodayPL.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmTodayPL.cbxAutoClick(Sender: TObject);
begin
  inherited;
  if cbxAuto.Checked then begin
    tmAutoSearch.Enabled := False;
    case cbInterval.ItemIndex of
      0 : tmAutoSearch.Interval :=  3000; // 30�ʸ���
      1 : tmAutoSearch.Interval :=  6000; //  1�и���
      2 : tmAutoSearch.Interval := 12000; //  2�и���
      3 : tmAutoSearch.Interval := 30000; //  5�и���
      4 : tmAutoSearch.Interval := 60000; // 10�и���
    end;
    tmAutoSearch.Enabled := True;
  end else begin
    tmAutoSearch.Enabled := False;
  end;
end;

procedure TfmTodayPL.cbxPosQtyClick(Sender: TObject);
begin
  ShowOpt(1, cbxPosQty.Checked);
end;

procedure TfmTodayPL.cbxAvgPrcClick(Sender: TObject);
begin
  ShowOpt(2, cbxAvgPrc.Checked);
end;

procedure TfmTodayPL.cbxClrPLClick(Sender: TObject);
begin
  ShowOpt(3, cbxClrPL.Checked);
end;

procedure TfmTodayPL.cbxCmsnClick(Sender: TObject);
begin
  ShowOpt(4, cbxCmsn.Checked);
end;

procedure TfmTodayPL.cbxEvaPLClick(Sender: TObject);
begin
  ShowOpt(5, cbxEvaPL.Checked);
end;

procedure TfmTodayPL.ShowOpt(iOpt:integer; TF:Boolean);
var
  i : integer;
begin
  with gdMain do
    for i:=1 to giArtc do
      if (TF = True) and (arrArtc[i] = True) then
        Columns[giStartCol+((i-1)*giOpt)+iOpt].Visible := True
      else
        Columns[giStartCol+((i-1)*giOpt)+iOpt].Visible := False;

  arrOpt[iOpt] := TF;
end;

procedure TfmTodayPL.ShowArtc(iArtc:integer; TF:Boolean);
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

procedure TfmTodayPL.cbxDayFClick(Sender: TObject);
begin
  ShowArtc(1, cbxDayF.Checked);
end;

procedure TfmTodayPL.cbxNightFClick(Sender: TObject);
begin
  ShowArtc(2, cbxNightF.Checked);
end;

procedure TfmTodayPL.cbxDayOpClick(Sender: TObject);
begin
  ShowArtc(3, cbxDayOp.Checked);
end;

procedure TfmTodayPL.cbxUROClick(Sender: TObject);
begin
  ShowArtc(4, cbxURO.Checked);
end;

procedure TfmTodayPL.cbxCLClick(Sender: TObject);
begin
  ShowArtc(5, cbxCL.Checked);
end;

procedure TfmTodayPL.cbxGCClick(Sender: TObject);
begin
  ShowArtc(6, cbxGC.Checked);
end;

procedure TfmTodayPL.cbxESClick(Sender: TObject);
begin
  ShowArtc(7, cbxES.Checked);
end;

procedure TfmTodayPL.cbxADClick(Sender: TObject);
begin
  ShowArtc(8, cbxAD.Checked);
end;

procedure TfmTodayPL.cbxBPClick(Sender: TObject);
begin
  ShowArtc(9, cbxBP.Checked);
end;

procedure TfmTodayPL.cbxJYClick(Sender: TObject);
begin
  ShowArtc(10, cbxJY.Checked);
end;

procedure TfmTodayPL.cbxNQClick(Sender: TObject);
begin
  ShowArtc(11, cbxNQ.Checked);
end;

procedure TfmTodayPL.cbxYMClick(Sender: TObject);
begin
  ShowArtc(12, cbxYM.Checked);
end;

procedure TfmTodayPL.cbxSCNClick(Sender: TObject);
begin
  ShowArtc(13, cbxSCN.Checked);
end;

procedure TfmTodayPL.cbxHSIClick(Sender: TObject);
begin
  ShowArtc(14, cbxHSI.Checked);
end;

procedure TfmTodayPL.cbxNKClick(Sender: TObject);
begin
  ShowArtc(15, cbxNK.Checked);
end;

procedure TfmTodayPL.cbxDAXClick(Sender: TObject);
begin
  ShowArtc(16, cbxDAX.Checked);
end;

procedure TfmTodayPL.cbxNGClick(Sender: TObject);
begin
  ShowArtc(17, cbxNG.Checked);
end;

procedure TfmTodayPL.cbxCDClick(Sender: TObject);
begin
  ShowArtc(18, cbxCD.Checked);
end;

procedure TfmTodayPL.cbxSIClick(Sender: TObject);
begin
  ShowArtc(19, cbxSI.Checked);
end;

procedure TfmTodayPL.cbxHGClick(Sender: TObject);
begin
  ShowArtc(20, cbxHG.Checked);
end;

procedure TfmTodayPL.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmTodayPL.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Set_CFGFile('fmTodayPL', 'GD_POS_QTY', BoolToStrInt(cbxPosQty.Checked)); // ����
  Set_CFGFile('fmTodayPL', 'GD_AVG_PRC', BoolToStrInt(cbxAvgPrc.Checked)); // ��Դܰ�
  Set_CFGFile('fmTodayPL', 'GD_CLR_PL' , BoolToStrInt(cbxClrPL.Checked )); // ��������
  Set_CFGFile('fmTodayPL', 'GD_CMSN'   , BoolToStrInt(cbxCmsn.Checked  )); // ������
  Set_CFGFile('fmTodayPL', 'GD_EVA_PL' , BoolToStrInt(cbxEvaPL.Checked )); // �򰡼���

  Set_CFGFile('fmTodayPL', 'GD_DAYF'   , BoolToStrInt(cbxDayF.Checked  )); // ���� (��)
  Set_CFGFile('fmTodayPL', 'GD_NIGHTF' , BoolToStrInt(cbxNightF.Checked)); // ���� (��)
  Set_CFGFile('fmTodayPL', 'GD_DAYOP'  , BoolToStrInt(cbxDayOp.Checked )); // ���� (��)

  Set_CFGFile('fmTodayPL', 'GD_URO' , BoolToStrInt(cbxURO.Checked ));  // ����FX
  Set_CFGFile('fmTodayPL', 'GD_CL'  , BoolToStrInt(cbxCL.Checked  ));  // ũ������
  Set_CFGFile('fmTodayPL', 'GD_GC'  , BoolToStrInt(cbxGC.Checked  ));  // ���
  Set_CFGFile('fmTodayPL', 'GD_NG'  , BoolToStrInt(cbxNG.Checked  ));  // õ������
  Set_CFGFile('fmTodayPL', 'GD_ES'  , BoolToStrInt(cbxES.Checked  ));  // S��P500
  Set_CFGFile('fmTodayPL', 'GD_AD'  , BoolToStrInt(cbxAD.Checked  ));  // ȣ�ִ޷�
  Set_CFGFile('fmTodayPL', 'GD_BP'  , BoolToStrInt(cbxBP.Checked  ));  // B�Ŀ��
  Set_CFGFile('fmTodayPL', 'GD_JY'  , BoolToStrInt(cbxJY.Checked  ));  // ��ȭ
  Set_CFGFile('fmTodayPL', 'GD_NQ'  , BoolToStrInt(cbxNQ.Checked  ));  // ������
  Set_CFGFile('fmTodayPL', 'GD_YM'  , BoolToStrInt(cbxYM.Checked  ));  // �ٿ�����
  Set_CFGFile('fmTodayPL', 'GD_SCN' , BoolToStrInt(cbxSCN.Checked ));  // ���̳�A50
  Set_CFGFile('fmTodayPL', 'GD_HSI' , BoolToStrInt(cbxHSI.Checked ));  // �׼�����
  Set_CFGFile('fmTodayPL', 'GD_NK'  , BoolToStrInt(cbxNK.Checked  ));  // ������225
  Set_CFGFile('fmTodayPL', 'GD_DAX' , BoolToStrInt(cbxDAX.Checked ));  // ���ϴڽ�
  Set_CFGFile('fmTodayPL', 'GD_CD'  , BoolToStrInt(cbxCD.Checked  ));  // ĳ���ٴ޷�
  Set_CFGFile('fmTodayPL', 'GD_SI'  , BoolToStrInt(cbxSI.Checked  ));  // �ǹ�
  Set_CFGFile('fmTodayPL', 'GD_HG'  , BoolToStrInt(cbxHG.Checked  ));  // ����

  inherited;
end;

procedure TfmTodayPL.FormCreate(Sender: TObject);
var
  i : integer;
begin
  SetADOConn(fmTodayPL);

  for i:=1 to giArtc do arrArtc[i] := False;
  for i:=1 to giOpt  do arrOpt[i]  := False;

  arrOpt[1] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_POS_QTY', _TRUE)); // ����
  arrOpt[2] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_AVG_PRC', _TRUE)); // ��Դܰ�
  arrOpt[3] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_CLR_PL' , _TRUE)); // ��������
  arrOpt[4] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_CMSN'   , _TRUE)); // ������
  arrOpt[5] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_EVA_PL' , _TRUE)); // �򰡼���

  arrArtc[ 1] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_DAYF'  , _TRUE));
  arrArtc[ 2] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_NIGHTF', _TRUE));
  arrArtc[ 3] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_DAYOP' , _TRUE));
  arrArtc[ 4] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_URO'   , _TRUE));  // ����FX
  arrArtc[ 5] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_CL'    , _TRUE));  // ũ������
  arrArtc[ 6] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_GC'    , _TRUE));  // ���
  arrArtc[ 7] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_ES'    , _TRUE));  // S��P500
  arrArtc[ 8] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_AD'    , _TRUE));  // ȣ�ִ޷�
  arrArtc[ 9] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_BP'    , _TRUE));  // B�Ŀ��
  arrArtc[10] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_JY'    , _TRUE));  // ��ȭ
  arrArtc[11] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_NQ'    , _TRUE));  // ������
  arrArtc[12] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_YM'    , _TRUE));  // �ٿ�����
  arrArtc[13] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_SCN'   , _TRUE));  // ���̳�A50
  arrArtc[14] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_HSI'   , _TRUE));  // �׼�����
  arrArtc[15] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_NK'    , _TRUE));  // ������225
  arrArtc[16] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_DAX'   , _TRUE));  // ���ϴڽ�
  arrArtc[17] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_NG'    , _TRUE));  // õ������
  arrArtc[18] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_CD'    , _TRUE));  // ĳ���ٴ޷�
  arrArtc[19] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_SI'    , _TRUE));  // �ǹ�
  arrArtc[20] := StrToBool(Get_CFGFile('fmTodayPL', 'GD_HG'    , _TRUE));  // ����

  cbxPosQty.Checked := arrOpt[1];
  cbxAvgPrc.Checked := arrOpt[2];
  cbxClrPL.Checked  := arrOpt[3];
  cbxCmsn.Checked   := arrOpt[4];
  cbxEvaPL.Checked  := arrOpt[5];

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

procedure TfmTodayPL.FormShow(Sender: TObject);
var
  i : integer;
begin
  inherited;
  if _Supervisor then cbUserGrade.Visible := True;
  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), '[��ü]', 'ALL');
  cbUserGrade.ItemIndex := 2;

  PartTableOpen(cbUserPart, 'ȸ���з�', '[��ü]', 'ALL');
  cbUserPart.ItemIndex := 0;

  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9'));

  for i:=11 to gdMain.Columns.Count-1 do
    if (i mod 5) = 3 then begin
      gdMain.Columns[i].DisplayFormat := '#,##0.000';
      gdMain.Columns[i].Footer.DisplayFormat := '#,##0.000';
    end else begin
      gdMain.Columns[i].DisplayFormat := FORMAT_AMT;
      gdMain.Columns[i].Footer.DisplayFormat := FORMAT_AMT;
    end;
end;

procedure TfmTodayPL.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    Canvas.Font.Color := clBlack;

    case DataCol of
      11 : begin
        if CompareValue(FieldByName('CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      14 : begin
        if CompareValue(FieldByName('NET_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('NET_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      24 : begin
        if CompareValue(FieldByName('KSF_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('KSF_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      29 : begin
        if CompareValue(FieldByName('KSO_DAY_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('KSO_DAY_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      34 : begin
        if CompareValue(FieldByName('KSO_NGT_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('KSO_NGT_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      39 : begin
        if CompareValue(FieldByName('URO_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('URO_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      44 : begin
        if CompareValue(FieldByName('CL_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('CL_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      49 : begin
        if CompareValue(FieldByName('GC_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('GC_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      54 : begin
        if CompareValue(FieldByName('NG_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('NG_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      59 : begin
        if CompareValue(FieldByName('ES_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('ES_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      64 : begin
        if CompareValue(FieldByName('AD_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('AD_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      69 : begin
        if CompareValue(FieldByName('BP_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('BP_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      74: begin
        if CompareValue(FieldByName('JY_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('JY_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      79 : begin
        if CompareValue(FieldByName('NQ_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('NQ_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      84 : begin
        if CompareValue(FieldByName('YM_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('YM_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      89 : begin
        if CompareValue(FieldByName('SCN_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('SCN_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      94 : begin
        if CompareValue(FieldByName('HSI_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('HSI_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      99 : begin
        if CompareValue(FieldByName('SSI_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('SSI_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      104 : begin
        if CompareValue(FieldByName('FDAX_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('FDAX_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      109 : begin
        if CompareValue(FieldByName('CD_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('CD_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      114 : begin
        if CompareValue(FieldByName('SI_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('SI_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
      119 : begin
        if CompareValue(FieldByName('HG_CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
        if CompareValue(FieldByName('HG_CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;
        DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
      end;
    end;
  end;
end;

procedure TfmTodayPL.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmTodayPL.MainTableOpen;
var
  iCnt : integer;
  sSql, sUserTp, sUserPart : String;
begin
  try
    Delay_Show();

    if _Supervisor then begin
      if cbUserGrade.ItemIndex <> 0 then sUserTp := Format(' AND B.USER_GRADE = %s ', [IntToStr(cbUserGrade.ItemIndex)]) else
      if chUserTp.Checked           then sUserTp := Format(' AND B.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                                    else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND B.USER_GRADE = 2 '
                          else sUserTp := ' AND B.USER_GRADE <> 7 ';
    end;

    if cbUserPart.ItemIndex = 0 then sUserPart := ''
                                else sUserPart := Format(' AND B.PART_CD = %s', [QuotedStr(cbUserPart.Values[cbUserPart.ItemIndex])]);

    sSql := Format(
      'SELECT UPPER(A.USER_ID) USER_ID ' + // ȸ��ID
      '      ,A.USER_NM USER_NM ' + // ȸ����
      '      ,A.ACNT_NO ACNT_NO ' + // ���¹�ȣ
      '      ,(SELECT USER_GRADE FROM USER_MST WHERE USER_ID = A.USER_ID) USER_GRADE ' + // ȸ�����
      '      ,(SELECT CASE WHEN (USER_REAL = ''1'' AND ADD_PORT = 1000) THEN ''Y'' ELSE '''' END FROM USER_MST WHERE USER_ID = A.USER_ID) USER_BLACK_A ' +  // ����
      '      ,(SELECT CASE WHEN USER_BLACK = ''1'' THEN ''Y'' ELSE '''' END FROM USER_MST WHERE USER_ID = A.USER_ID) USER_BLACK_B ' +
      '      ,A.LEVERAGE LEVERAGE ' +                      // ����
      '      ,ISNULL(SUM(C.NCLR_POS_QTY),0) CNT ' +        // ����
      '      ,(CASE WHEN A.CONN_YN = ''N'' THEN '''' ELSE ''Y'' END) CONN_YN ' + // ���� TOTO : �ʵ尡 �´��� Ȯ���Ұ�
      '      ,(CASE WHEN A.CONN_YN = ''N'' THEN 0 ELSE 1 END) CONN_CNT ' +
      '      ,ISNULL(SUM(B.CLR_PL),0) CLR_PL ' +           // �ѽ�������
      '      ,ISNULL(SUM(B.CMSN_AMT),0) CMSN ' +           // �Ѽ�����
      '      ,ISNULL(SUM((C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE),0) AVG_PRC ' + // ���򰡼���
//      '      ,ISNULL(SUM(B.AF_NET_ACNT_AMT),0) NET_PL ' +  // ������
      '      ,ISNULL(SUM(B.CLR_PL) - SUM(B.CMSN_AMT),0) NET_PL ' +
      '      ,(CASE WHEN ISNULL(SUM(B.CLR_PL) - SUM(B.CMSN_AMT),0) <> 0 THEN 1 ELSE 0 END) NET_CNT ' +
      '      ,ISNULL(A.BF_ACNT_AMT,0) BF_ACNT_AMT ' +      // �����ܾ�
//      '      ,ISNULL(A.ACNT_AMT,0) ACNT_AMT ' +            // �����ܾ�
      '      ,ISNULL(SUM(B.CLR_PL) - SUM(B.CMSN_AMT),0) + ISNULL(A.BF_ACNT_AMT,0) + ISNULL(F.IN_AMT,0) - ISNULL(F.OUT_AMT,0) ACNT_AMT ' +
      '      ,ISNULL(F.IN_AMT,0) IN_AMT     ' +            // �Աݾ�
      '      ,ISNULL(F.OUT_AMT,0) OUT_AMT   ' +            // ��ݾ�
      // �������� (�ְ�)
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''101'' THEN B.CNTR_QTY END),0) KSF_CNTR_QTY ' + // ����
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''101'' THEN C.AVG_PRC  END),0) KSF_AVG_PRC  ' + // ��մܰ�
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''101'' THEN B.CLR_PL   END),0) KSF_CLR_PL   ' + // ��������
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''101'' THEN B.CMSN_AMT END),0) KSF_CMSN_AMT ' + // ������
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''101'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) KSF_EVL_PL ' + // �򰡼���
      // �������� (�߰�)
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''201'' THEN B.CNTR_QTY END),0) KSO_DAY_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''201'' THEN C.AVG_PRC  END),0) KSO_DAY_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''201'' THEN B.CLR_PL   END),0) KSO_DAY_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''201'' THEN B.CMSN_AMT END),0) KSO_DAY_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''201'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) KSO_DAY_EVL_PL ' +
      // �����ɼ� (�ְ�)
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''301'' THEN B.CNTR_QTY END),0) KSO_NGT_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''301'' THEN C.AVG_PRC  END),0) KSO_NGT_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''301'' THEN B.CLR_PL   END),0) KSO_NGT_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''301'' THEN B.CMSN_AMT END),0) KSO_NGT_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''301'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) KSO_NGT_EVL_PL ' +
      // ����FX
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''URO'' THEN B.CNTR_QTY END),0) URO_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''URO'' THEN C.AVG_PRC  END),0) URO_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''URO'' THEN B.CLR_PL   END),0) URO_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''URO'' THEN B.CMSN_AMT END),0) URO_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''URO'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) URO_EVL_PL ' +
      // ũ������
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CL'' THEN B.CNTR_QTY END),0) CL_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CL'' THEN C.AVG_PRC  END),0) CL_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CL'' THEN B.CLR_PL   END),0) CL_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CL'' THEN B.CMSN_AMT END),0) CL_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CL'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) CL_EVL_PL ' +
      // ���
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''GC'' THEN B.CNTR_QTY END),0) GC_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''GC'' THEN C.AVG_PRC  END),0) GC_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''GC'' THEN B.CLR_PL   END),0) GC_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''GC'' THEN B.CMSN_AMT END),0) GC_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''GC'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) GC_EVL_PL ' +
      // õ������
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NG'' THEN B.CNTR_QTY END),0) NG_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NG'' THEN C.AVG_PRC  END),0) NG_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NG'' THEN B.CLR_PL   END),0) NG_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NG'' THEN B.CMSN_AMT END),0) NG_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NG'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) NG_EVL_PL ' +
      // S&P500
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''ES'' THEN B.CNTR_QTY END),0) ES_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''ES'' THEN C.AVG_PRC  END),0) ES_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''ES'' THEN B.CLR_PL   END),0) ES_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''ES'' THEN B.CMSN_AMT END),0) ES_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''ES'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) ES_EVL_PL ' +
      // ȣ�ִ޷�
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''AD'' THEN B.CNTR_QTY END),0) AD_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''AD'' THEN C.AVG_PRC  END),0) AD_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''AD'' THEN B.CLR_PL   END),0) AD_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''AD'' THEN B.CMSN_AMT END),0) AD_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''AD'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) AD_EVL_PL ' +
      // B�Ŀ��
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''BP'' THEN B.CNTR_QTY END),0) BP_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''BP'' THEN C.AVG_PRC  END),0) BP_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''BP'' THEN B.CLR_PL   END),0) BP_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''BP'' THEN B.CMSN_AMT END),0) BP_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''BP'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) BP_EVL_PL ' +
      // ��ȭ
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''JY'' THEN B.CNTR_QTY END),0) JY_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''JY'' THEN C.AVG_PRC  END),0) JY_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''JY'' THEN B.CLR_PL   END),0) JY_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''JY'' THEN B.CMSN_AMT END),0) JY_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''JY'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) JY_EVL_PL ' +
      // ������
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NQ'' THEN B.CNTR_QTY END),0) NQ_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NQ'' THEN C.AVG_PRC  END),0) NQ_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NQ'' THEN B.CLR_PL   END),0) NQ_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NQ'' THEN B.CMSN_AMT END),0) NQ_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''NQ'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) NQ_EVL_PL ' +
      // �ٿ�����
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''YM'' THEN B.CNTR_QTY END),0) YM_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''YM'' THEN C.AVG_PRC  END),0) YM_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''YM'' THEN B.CLR_PL   END),0) YM_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''YM'' THEN B.CMSN_AMT END),0) YM_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''YM'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) YM_EVL_PL ' +
      // ���̳�A50
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SCN'' THEN B.CNTR_QTY END),0) SCN_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SCN'' THEN C.AVG_PRC  END),0) SCN_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SCN'' THEN B.CLR_PL   END),0) SCN_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SCN'' THEN B.CMSN_AMT END),0) SCN_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SCN'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) SCN_EVL_PL ' +
      // �׼�����
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HSI'' THEN B.CNTR_QTY END),0) HSI_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HSI'' THEN C.AVG_PRC  END),0) HSI_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HSI'' THEN B.CLR_PL   END),0) HSI_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HSI'' THEN B.CMSN_AMT END),0) HSI_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HSI'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) HSI_EVL_PL ' +
      // ������225
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SSI'' THEN B.CNTR_QTY END),0) SSI_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SSI'' THEN C.AVG_PRC  END),0) SSI_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SSI'' THEN B.CLR_PL   END),0) SSI_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SSI'' THEN B.CMSN_AMT END),0) SSI_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SSI'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) SSI_EVL_PL ' +
      // ���ϴڽ�
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''FDAX'' THEN B.CNTR_QTY END),0) FDAX_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''FDAX'' THEN C.AVG_PRC  END),0) FDAX_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''FDAX'' THEN B.CLR_PL   END),0) FDAX_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''FDAX'' THEN B.CMSN_AMT END),0) FDAX_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''FDAX'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) FDAX_EVL_PL ' +
      // ĳ���ٴ޷�
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CD'' THEN B.CNTR_QTY END),0) CD_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CD'' THEN C.AVG_PRC  END),0) CD_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CD'' THEN B.CLR_PL   END),0) CD_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CD'' THEN B.CMSN_AMT END),0) CD_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''CD'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) CD_EVL_PL ' +
      // �ǹ�
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SI'' THEN B.CNTR_QTY END),0) SI_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SI'' THEN C.AVG_PRC  END),0) SI_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SI'' THEN B.CLR_PL   END),0) SI_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SI'' THEN B.CMSN_AMT END),0) SI_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''SI'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) SI_EVL_PL ' +
      // ����
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HG'' THEN B.CNTR_QTY END),0) HG_CNTR_QTY ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HG'' THEN C.AVG_PRC  END),0) HG_AVG_PRC  ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HG'' THEN B.CLR_PL   END),0) HG_CLR_PL   ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HG'' THEN B.CMSN_AMT END),0) HG_CMSN_AMT ' +
      '      ,ISNULL(SUM(CASE WHEN B.ARTC_CD = ''HG'' THEN ' +
      '          (C.AVG_PRC - E.CNTR_PRC) * C.NCLR_POS_QTY / D.TICK_SIZE * D.TICK_VALUE / A.LEVERAGE END),0) HG_EVL_PL ' +
//      '  FROM (SELECT * FROM ACNT_MST WHERE ACNT_AMT > 0 OR BF_ACNT_AMT > 0) A LEFT OUTER JOIN ' +
      '  FROM (SELECT * FROM ACNT_MST WHERE ACNT_AMT > 0) A LEFT OUTER JOIN ' +
      '       CNTR     B ON B.ACNT_NO = A.ACNT_NO %s %s LEFT OUTER JOIN ' +
      '       NCLR_POS C ON B.ACNT_NO = A.ACNT_NO LEFT OUTER JOIN ' +
      '       ARTC_MST D ON D.ARTC_CD = C.ARTC_CD LEFT OUTER JOIN ' +
      '       CURR_PRC E ON E.STK_CD  = C.STK_CD  LEFT OUTER JOIN ' +
      '       (SELECT ACNT_NO, RQST_TRADE_DT, RQST_TM ' +
      '              ,CASE WHEN IO_TP = ''1'' AND RSLT_TP = ''1'' THEN RSLT_AMT END IN_AMT  ' +
      '              ,CASE WHEN IO_TP = ''2'' AND RSLT_TP = ''1'' THEN RSLT_AMT END OUT_AMT ' +
      '          FROM INOUT ' +
      '         WHERE RSLT_AMT > 0 AND RQST_TRADE_DT = DBO.FP_TRADE_DT() ' +
      '        ) F ON F.ACNT_NO = A.ACNT_NO ' +
//      ' WHERE B.TRADE_DT = B.TRADE_DT %s %s ' +  // DBO.FP_TRADE_DT() or CONVERT(CHAR(8), GETDATE(), 112)
      ' GROUP BY B.TRADE_DT, A.USER_ID, A.USER_NM, A.ACNT_NO, USER_GRADE, A.LEVERAGE, A.CONN_YN, A.BF_ACNT_AMT, A.ACNT_AMT, B.TRADE_DT, F.IN_AMT, F.OUT_AMT ' +
      ' ORDER BY A.ACNT_NO ',
      [sUserTp,
       sUserPart ]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;

  iCnt := gdMain.Columns[7].Footer.SumValue;
  pnCnt.Caption := '�Ѱŷ�ȸ�� ( ' + IntToStr(iCnt) + ')';
end;

procedure TfmTodayPL.tmAutoSearchTimer(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

end.
