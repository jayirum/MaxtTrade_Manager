unit MArtc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, UniDAC_Helper;

type
  TfmArtc = class(TfmBasic)
    RzPanel4: TRzPanel;
    pnArtc: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    bsSkinLabel6: TbsSkinLabel;
    gdMain: TDBGridEh;
    bsSkinLabel8: TbsSkinLabel;
    bsSkinLabel9: TbsSkinLabel;
    edArtcNM: TkcRzDBEdit;
    bsSkinLabel1: TbsSkinLabel;
    bsSkinLabel10: TbsSkinLabel;
    bsSkinLabel11: TbsSkinLabel;
    bsSkinLabel12: TbsSkinLabel;
    edTickSize: TkcRzDBEdit;
    bsSkinLabel15: TbsSkinLabel;
    edTickSizeLow: TkcRzDBEdit;
    edTickValueLow: TkcRzDBEdit;
    edTickValue: TkcRzDBEdit;
    edGujaCntrCnt: TkcRzDBEdit;
    edCmsnAmtrt: TkcRzDBEdit;
    edLosscutAmt: TkcRzDBEdit;
    edOverngtAmtDn: TkcRzDBEdit;
    cbArtcUseYn: TkcRzDBComboBox;
    cbCmsnTp: TkcRzDBComboBox;
    cbOverngtYn: TkcRzDBComboBox;
    dbMainARTC_CD: TStringField;
    dbMainARTC_NM: TStringField;
    dbMainBS_TP: TStringField;
    dbMainTICK_SIZE: TFloatField;
    dbMainTICK_SIZE_LOW: TFloatField;
    dbMainTICK_VALUE: TFloatField;
    dbMainTICK_VALUE_LOW: TFloatField;
    dbMainTICK_VALUE_USD: TFloatField;
    dbMainARTC_USE_YN: TStringField;
    dbMainDOT_CNT: TIntegerField;
    dbMainAPI_CLTL: TFloatField;
    dbMainCMSN_TP: TStringField;
    dbMainCMSN_AMTRT: TFloatField;
    dbMainCMSN_AMTRT_USD: TFloatField;
    dbMainOVERNGT_YN: TStringField;
    dbMainOVERNGT_AMT: TFloatField;
    dbMainGUJA_CNTR_CNT: TIntegerField;
    dbMainLOSSCUT_AMT: TFloatField;
    dbMainMKT_TP: TStringField;
    dbMainSTART_TM: TStringField;
    dbMainEND_TM: TStringField;
    dbMainMTR_END_TM: TStringField;
    dbMainNOTI_1_YN: TStringField;
    dbMainNOTI_3_YN: TStringField;
    dbMainNOTI_5_YN: TStringField;
    dbMainNOTI_10_YN: TStringField;
    dbMainMONTH_GAP: TIntegerField;
    dbMainTICKSIZE: TStringField;
    dbMainTICKSIZELOW: TStringField;
    dbMainCMSNTP: TStringField;
    bsSkinLabel7: TbsSkinLabel;
    edTickValueUsd: TkcRzDBEdit;
    bsSkinLabel13: TbsSkinLabel;
    edCmsnAmtrtUsd: TkcRzDBEdit;
    bsSkinLabel14: TbsSkinLabel;
    edSamHogaAmt: TkcRzDBEdit;
    dbMainSAMEHOGA_AMT: TFloatField;
    dbMainACNT_TP: TStringField;
    kcRzDBEdit1: TkcRzDBEdit;
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure edArtcNMChange(Sender: TObject);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure kcRzDBEdit1Change(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmArtc: TfmArtc;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmArtc.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmArtc.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmArtc.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('TICK_VALUE')).DisplayFormat     := __FORMAT_AMT;
    TFloatField(FieldByName('TICK_VALUE_LOW')).DisplayFormat := __FORMAT_AMT;
    TFloatField(FieldByName('OVERNGT_AMT')).DisplayFormat    := __FORMAT_AMT;
    TFloatField(FieldByName('LOSSCUT_AMT')).DisplayFormat    := __FORMAT_AMT;
    TFloatField(FieldByName('CMSN_AMTRT')).DisplayFormat     := '#0.####';
    TFloatField(FieldByName('TICK_VALUE_USD')).DisplayFormat := '#0.##';
    TFloatField(FieldByName('CMSN_AMTRT_USD')).DisplayFormat := '#0.##';
  end;
end;

procedure TfmArtc.dbMainBeforePost(DataSet: TDataSet);
var
  sSql  : String;
  dErRt : Double;
begin
  inherited;
  with DataSet do
  begin
    if FieldByName('ACNT_TP').AsString = '2' then
    begin
      sSql := 'SELECT TOP(1) ER_RT '+
              'FROM EXCH_RT '+
              'ORDER BY TRADE_DT DESC, ER_TM DESC ';

      Uni_Open(dbPart, sSql);
      dErRt := dbPart.FieldByName('ER_RT').AsFloat;

      if FieldByName('CMSN_AMTRT_USD').OldValue <> FieldByName('CMSN_AMTRT_USD').NewValue then
      begin
        FieldByName('CMSN_AMTRT').AsFloat := TRUNC(FieldByName('CMSN_AMTRT_USD').AsFloat * dErRt);
      end;
      if FieldByName('TICK_VALUE_USD').OldValue <> FieldByName('TICK_VALUE_USD').NewValue then
      begin
        FieldByName('TICK_VALUE').AsFloat := TRUNC(FieldByName('TICK_VALUE_USD').AsFloat * dErRt);
      end;
    end;
  end;
end;

procedure TfmArtc.dbMainCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do
  begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('TICKSIZE').AsString  := FormatFloat(FormatDotCnt(iCnt), FieldByName('TICK_SIZE').AsFloat);
    FieldByName('TICKSIZELOW').AsString  := FormatFloat(FormatDotCnt(iCnt), FieldByName('TICK_SIZE_LOW').AsFloat);

    if FieldByName('CMSN_TP').AsString = 'A' then  FieldByName('CMSNTP').AsString := '금액'
    else if FieldByName('CMSN_TP').AsString = 'R' then FieldByName('CMSNTP').AsString := '율';

  end;
end;

procedure TfmArtc.edArtcNMChange(Sender: TObject);
begin
  inherited;
  if edArtcNM.Text = '' then Exit;

  pnArtc.Caption := Format('품목명[%s]', [dbMain.FieldByName('ARTC_NM').AsString]);

end;

procedure TfmArtc.FormShow(Sender: TObject);
begin
  inherited;

  PartTableOpen(cbCmsnTp, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('CMSN_TP')]));
//  PartTableOpen(TComponent(gdMain.Columns[10]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('CMSN_TP')]));

  MainTableOpen;

end;

procedure TfmArtc.kcRzDBEdit1Change(Sender: TObject);
begin
  edTickValue.ReadOnly := dbMain.FieldByName('ACNT_TP').AsString = '2';
  edCmsnAmtrt.ReadOnly := dbMain.FieldByName('ACNT_TP').AsString = '2';

  edTickValueUsd.Enabled := dbMain.FieldByName('ACNT_TP').AsString = '2';
  edCmsnAmtrtUsd.Enabled := dbMain.FieldByName('ACNT_TP').AsString = '2';
end;

procedure TfmArtc.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := 'SELECT          '+
            ' ARTC_CD        '+
            ',ARTC_NM        '+
            ',BS_TP          '+
            ',TICK_SIZE      '+
            ',TICK_SIZE_LOW  '+
            ',TICK_VALUE     '+
            ',TICK_VALUE_LOW '+
            ',TICK_VALUE_USD '+
            ',ARTC_USE_YN    '+
            ',DOT_CNT        '+
            ',API_CLTL       '+
            ',CMSN_TP        '+
            ',CMSN_AMTRT     '+
            ',CMSN_AMTRT_USD '+
            ',OVERNGT_YN     '+
            ',OVERNGT_AMT    '+
            ',GUJA_CNTR_CNT  '+
            ',LOSSCUT_AMT    '+
            ',MKT_TP         '+
            ',START_TM       '+
            ',END_TM         '+
            ',MTR_END_TM     '+
            ',NOTI_1_YN      '+
            ',NOTI_3_YN      '+
            ',NOTI_5_YN      '+
            ',NOTI_10_YN     '+
            ',MONTH_GAP      '+
            ',SAMEHOGA_AMT   '+
            ',ACNT_TP        '+
            'FROM ARTC_MST   ';
    Uni_Open(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
