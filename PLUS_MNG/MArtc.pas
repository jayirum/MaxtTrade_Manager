unit MArtc;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, kcRaizeCtrl, bsMessages, bsRibbon,
// Raize
  RzPanel, RzEdit, RzDBEdit, RzLstBox, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav,
  VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  DBGridEhToolCtrls,
// User Unit
  MBasic;

type
  TfmArtc = class(TfmBasic)
    RzPanel4: TRzPanel;
    pnArtc: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    gdMain: TDBGridEh;
    bsSkinLabel8: TbsSkinLabel;
    bsSkinLabel9: TbsSkinLabel;
    edArtcNM: TkcRzDBEdit;
    bsSkinLabel1: TbsSkinLabel;
    bsSkinLabel10: TbsSkinLabel;
    bsSkinLabel11: TbsSkinLabel;
    bsSkinLabel12: TbsSkinLabel;
    edTickSize: TkcRzDBEdit;
    edTickValue: TkcRzDBEdit;
    edGujaCntrCnt: TkcRzDBEdit;
    edCmsnAmtrt: TkcRzDBEdit;
    edLosscutAmt: TkcRzDBEdit;
    edOverngtAmtDn: TkcRzDBEdit;
    cbArtcUseYn: TkcRzDBComboBox;
    cbCmsnTp: TkcRzDBComboBox;
    cbOverngtYn: TkcRzDBComboBox;
    bsSkinLabel7: TbsSkinLabel;
    edTickValueUsd: TkcRzDBEdit;
    bsSkinLabel13: TbsSkinLabel;
    edCmsnAmtrtUsd: TkcRzDBEdit;
    bsSkinLabel16: TbsSkinLabel;
    edArtcSort: TkcRzDBEdit;
    bsSkinLabel17: TbsSkinLabel;
    cbOrdState: TkcRzDBComboBox;
    btnAcntMake: TbsSkinButton;
    btnAcntMakeAll: TbsSkinButton;
    bsSkinLabel18: TbsSkinLabel;
    edExchRate: TkcRzDBEdit;
    btnExchRate: TbsSkinButton;
    btnExchRateAll: TbsSkinButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edArtcNMChange(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure btnExchRateClick(Sender: TObject);
    procedure btnExchRateAllClick(Sender: TObject);
    procedure btnAcntMakeClick(Sender: TObject);
    procedure btnAcntMakeAllClick(Sender: TObject);
  private
    procedure ChangeAcntMake(Gb: char);
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

procedure TfmArtc.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmArtc);
end;

procedure TfmArtc.FormShow(Sender: TObject);
begin
  inherited;

  PartTableOpen(cbCmsnTp,   CodeFormat('CMSN_TP', 'ORDER BY CODE_VALUE'));
  PartTableOpen(cbOrdState, CodeFormat('ORD_STATE', 'ORDER BY CODE_VALUE'));
  PartTableOpen(TComponent(gdMain.Columns[2]), CodeFormat('ORD_STATE', 'ORDER BY CODE_VALUE'));
  PartTableOpen(TComponent(gdMain.Columns[7]), CodeFormat('CMSN_TP', 'ORDER BY CODE_VALUE'));

  MainTableOpen;
end;

procedure TfmArtc.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql :=
      'SELECT ARTC_NM        ,' +
      '       ARTC_CD        ,' +
      '       ORD_STATE      ,' +
      '       TICK_SIZE      ,' +
      '       TICK_VALUE     ,' +
      '       OVERNGT_YN     ,' +
      '       OVERNGT_AMT    ,' +
      '       CMSN_TP        ,' +
      '       CMSN_AMTRT     ,' +
      '       LOSSCUT_AMT    ,' +
      '       GUJA_CNTR_CNT  ,' +
      '       ARTC_USE_YN    ,' +
      '       TICK_VALUE_USD ,' +
      '       CMSN_AMTRT_USD ,' +
      '       ARTC_SORT      ,' +
      '       DOT_CNT        ,' +
      '       ACNT_TP         ' +
//      '       TICK_SIZE_LOW  ,' +
//      '       TICK_VALUE_LOW ,' +
//      '       API_CLTL       ,' +
//      '       MKT_TP         ,' +
//      '       START_TM       ,' +
//      '       END_TM         ,' +
//      '       MTR_END_TM     ,' +
//      '       NOTI_1_YN      ,' +
//      '       NOTI_3_YN      ,' +
//      '       NOTI_5_YN      ,' +
//      '       NOTI_10_YN     ,' +
//      '       MONTH_GAP      ,' +
//      '       SAMEHOGA_AMT   ,' +
      '  FROM ARTC_MST        ' +
      ' ORDER BY ORD_SORT, ARTC_CD ';
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmArtc.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('TICK_VALUE')).DisplayFormat     := FORMAT_AMT;
    TFloatField(FieldByName('OVERNGT_AMT')).DisplayFormat    := FORMAT_AMT;
    TFloatField(FieldByName('LOSSCUT_AMT')).DisplayFormat    := FORMAT_AMT;
    TFloatField(FieldByName('CMSN_AMTRT')).DisplayFormat     := '#0.####';
    TFloatField(FieldByName('TICK_VALUE_USD')).DisplayFormat := '#0.##';
    TFloatField(FieldByName('CMSN_AMTRT_USD')).DisplayFormat := '#0.##';
  end;
end;

// TODO : dbMainAfterOpen 로 이전하여 테스트 할것
procedure TfmArtc.dbMainCalcFields(DataSet: TDataSet);
var
  iDotCnt : Integer;
begin
  inherited;
  with DataSet do begin
//    iDotCnt := FieldByName('DOT_CNT').AsInteger;
//    FieldByName('TICKSIZE').AsString  := FormatFloat(FormatDotCnt(iDotCnt), FieldByName('TICK_SIZE').AsFloat);
    //FieldByName('TICKSIZELOW').AsString  := FormatFloat(FormatDotCnt(iDotCnt), FieldByName('TICK_SIZE_LOW').AsFloat);
  end;
end;

procedure TfmArtc.dbMainBeforePost(DataSet: TDataSet);
var
  sSql  : String;
  dErRt : Double;
begin
  inherited;
  with DataSet do begin
    // 해외 계좌인 경우 환율 적용
    if FieldByName('ACNT_TP').AsString = '2' then begin
      sSql := 'SELECT TOP(1) ER_RT ' +
              '  FROM EXCH_RT      ' +
              ' ORDER BY TRADE_DT DESC, ER_TM DESC ';

      fnSqlOpen(dbPart, sSql);
      dErRt := dbPart.FieldByName('ER_RT').AsFloat;

      if FieldByName('CMSN_AMTRT_USD').OldValue <> FieldByName('CMSN_AMTRT_USD').NewValue then begin
        FieldByName('CMSN_AMTRT').AsFloat := TRUNC(FieldByName('CMSN_AMTRT_USD').AsFloat * dErRt);
      end;

      if FieldByName('TICK_VALUE_USD').OldValue <> FieldByName('TICK_VALUE_USD').NewValue then begin
        FieldByName('TICK_VALUE').AsFloat := TRUNC(FieldByName('TICK_VALUE_USD').AsFloat * dErRt);
      end;
    end;
  end;
end;

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

procedure TfmArtc.edArtcNMChange(Sender: TObject);
begin
  inherited;
  if edArtcNM.Text = '' then Exit;

  pnArtc.Caption := Format('품목명[%s]', [dbMain.FieldByName('ARTC_NM').AsString]);
end;

procedure TfmArtc.btnAcntMakeClick(Sender: TObject);
var
  sMsg, sSql, iRslt : string;
begin
  inherited;
  ChangeAcntMake('S');
end;

procedure TfmArtc.btnAcntMakeAllClick(Sender: TObject);
var
  sMsg : string;
begin
  inherited;
  ChangeAcntMake('A');
end;

procedure TfmArtc.ChangeAcntMake(Gb:char);
var
  sMsg, sSql, iRslt : string;
begin
  inherited;
  if Trim(cbOrdState.Text) = '' then Exit;

  if Gb = 'S' then sMsg := '현종목' else
  if Gb = 'A' then sMsg := '전종목';

  sMsg := Format(sMsg + ' 주문상태를 (%s)로 변경하시겠습니까?', [cbOrdState.Text]);
  if bsMsgYesNo(sMsg, '주문상태 변경') then begin
    with dbMain do begin

      if Gb = 'S' then begin
        sSql := Format('UPDATE ARTC_MST SET ORD_STATE = %s WHERE ARTC_CD = %s ',
                       [QuotedStr(cbOrdState.value),
                        QuotedStr(FieldByName('ARTC_CD').AsString)]);
      end else
      if Gb = 'A' then begin
        sSql := Format('UPDATE ARTC_MST SET ORD_STATE = %s ',
                       [QuotedStr(cbOrdState.value) ]);
      end;

      if fnSqlOpen(MastDB.dbExec, sSql) = '' then
        bsMsgInfo('처리 완료!')
      else
        bsMsgInfo('처리 실패!');

      MainTableOpen;
    end;
  end;
end;

procedure TfmArtc.btnExchRateClick(Sender: TObject);
var
  sMsg : string;
begin
  inherited;
  if Trim(edExchRate.Text) = '' then Exit;

  sMsg := Format('틱가치와 수수료를 (%s)환율로 변경하시겠습니까?', [edExchRate.Text]);
  if bsMsgYesNo(sMsg, '환율적용') then begin
  end;
end;

procedure TfmArtc.btnExchRateAllClick(Sender: TObject);
var
  sMsg : string;
begin
  inherited;
  if Trim(edExchRate.Text) = '' then Exit;

  sMsg := Format('전종목 틱가치와 수수료를 (%s)환율로 변경하시겠습니까?', [edExchRate.Text]);
  if bsMsgYesNo(sMsg, '환율적용') then begin
  end;
end;

end.
