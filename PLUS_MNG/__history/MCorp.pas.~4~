unit MCorp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, RzSpnEdt, RzDBSpin, UniDAC_Helper;

type
  TfmCorp = class(TfmBasic)
    pnMain: TRzPanel;
    RzGroupBox1: TRzGroupBox;
    bsSkinLabel10: TbsSkinLabel;
    bsSkinLabel11: TbsSkinLabel;
    edCorpNm: TkcRzDBEdit;
    edCorpTel: TkcRzDBEdit;
    RzGroupBox2: TRzGroupBox;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    edBankNm: TkcRzDBEdit;
    edAcntNo: TkcRzDBEdit;
    bsSkinLabel4: TbsSkinLabel;
    edAcntNm: TkcRzDBEdit;
    RzGroupBox3: TRzGroupBox;
    ipyn: TbsSkinLabel;
    bsSkinLabel6: TbsSkinLabel;
    edMngAcptUseYn: TkcRzDBComboBox;
    bsSkinLabel1: TbsSkinLabel;
    RzGroupBox4: TRzGroupBox;
    bsSkinLabel7: TbsSkinLabel;
    bsSkinLabel8: TbsSkinLabel;
    edGujaAmt1: TkcRzDBEdit;
    edMinAmt1: TkcRzDBEdit;
    bsSkinLabel9: TbsSkinLabel;
    edMaxCnt1: TkcRzDBEdit;
    RzGroupBox5: TRzGroupBox;
    bsSkinLabel12: TbsSkinLabel;
    bsSkinLabel13: TbsSkinLabel;
    edGujaAmt2: TkcRzDBEdit;
    edMinAmt2: TkcRzDBEdit;
    bsSkinLabel14: TbsSkinLabel;
    edMaxCnt2: TkcRzDBEdit;
    edHisDay: TRzDBSpinEdit;
    edNotiDay: TRzDBSpinEdit;
    bsSkinLabel15: TbsSkinLabel;
    edDupYn: TkcRzDBComboBox;
    bsSkinLabel16: TbsSkinLabel;
    cbVirtuarOrd: TkcRzDBComboBox;
    bsSkinLabel17: TbsSkinLabel;
    bsSkinLabel18: TbsSkinLabel;
    RzDBSpinEdit1: TRzDBSpinEdit;
    RzDBSpinEdit2: TRzDBSpinEdit;
    bsSkinLabel5: TbsSkinLabel;
    cbOverngtSame: TkcRzDBComboBox;
    dbMainCORP_SEQ: TIntegerField;
    dbMainCORP_NM: TStringField;
    dbMainCORP_TEL: TStringField;
    dbMainCORP_BIGO: TStringField;
    dbMainBANK_NM: TStringField;
    dbMainBANK_ACNT_NO: TStringField;
    dbMainBANK_ACNT_NM: TStringField;
    dbMainDUP_YN: TStringField;
    dbMainCNTR_RT: TFloatField;
    dbMainGUJA_AMT_1: TFloatField;
    dbMainGUJA_MAX_CNT_1: TIntegerField;
    dbMainGUJA_MIN_AMT_1: TFloatField;
    dbMainGUJA_AMT_2: TFloatField;
    dbMainGUJA_MAX_CNT_2: TIntegerField;
    dbMainGUJA_MIN_AMT_2: TFloatField;
    dbMainHIS_KEEP_DAY: TIntegerField;
    dbMainNOTICE_KEEP_DAY: TIntegerField;
    dbMainCURR_TRADE_DT: TStringField;
    dbMainMNG_ACPT_USE_YN: TStringField;
    dbMainHYB_HOGA_NO: TIntegerField;
    dbMainHYB_TIME_CONDITION: TIntegerField;
    dbMainVIRTUAL_ORD: TIntegerField;
    dbMainOVERNGT_YN: TStringField;
    bsSkinLabel19: TbsSkinLabel;
    edCorpBigo: TkcRzDBEdit;
    RzPanel3: TRzPanel;
    bsSkinLabel20: TbsSkinLabel;
    cbGujaTp: TkcRzDBComboBox;
    dbMainGUJA_TP: TStringField;
    bsSkinLabel21: TbsSkinLabel;
    RzDBSpinEdit3: TRzDBSpinEdit;
    dbMainPL_DISP_DAY: TIntegerField;
    bsSkinLabel22: TbsSkinLabel;
    bsSkinLabel23: TbsSkinLabel;
    edOpPrcMin: TkcRzDBEdit;
    edOpPrcMax: TkcRzDBEdit;
    dbMainOP_PRC_MIN: TFloatField;
    dbMainOP_PRC_MAX: TFloatField;
    procedure FormShow(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmCorp: TfmCorp;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmCorp.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('OP_PRC_MIN')).DisplayFormat     := '#0.##';
    TFloatField(FieldByName('OP_PRC_MAX')).DisplayFormat     := '#0.##';
  end;
end;

procedure TfmCorp.dbMainBeforePost(DataSet: TDataSet);
var
  sSql : String;
begin
  inherited;
  with DataSet do
  begin
    if State in [dsEdit] then
    begin
      if FieldByName('DUP_YN').OldValue <> FieldByName('DUP_YN').NewValue then
      begin
        sSql := Format('UPDATE ACNT_MST SET NEGO_DUP_YN = %s', [QuotedStr(dbMain.FieldByName('DUP_YN').AsString)]);
        Uni_Open(MastDB.dbExec, sSql);
      end;

      if FieldByName('OVERNGT_YN').OldValue <> FieldByName('OVERNGT_YN').NewValue then
      begin
        if bsMsgYesNo('OV/동시호가 변경시 회원계좌 신청상태가 초기화 됩니다.\n\n변경하시겠습니까?') then
        begin
          if FieldByName('OVERNGT_YN').NewValue = '0' then sSql := Format('UPDATE ACNT_MST SET OVERNGT_YN = %s', [QuotedStr('0')])
          else if FieldByName('OVERNGT_YN').NewValue = '1' then sSql := Format('UPDATE ACNT_MST SET OVERNGT_YN = %s WHERE OVERNGT_YN = %s', [QuotedStr('0'),QuotedStr('2')])
          else if FieldByName('OVERNGT_YN').NewValue = '2' then sSql := Format('UPDATE ACNT_MST SET OVERNGT_YN = %s WHERE OVERNGT_YN = %s', [QuotedStr('0'),QuotedStr('1')]);

          if FieldByName('OVERNGT_YN').NewValue <> '3' then Uni_Open(MastDB.dbExec, sSql);
        end
        else
        begin
          Cancel;
          Abort;
        end;
      end;

      if FieldByName('GUJA_MIN_AMT_1').OldValue <> FieldByName('GUJA_MIN_AMT_1').NewValue then
      begin
        if bsMsgYesNo('국내최소금액 변경시 국내회원계좌에 일괄 적용됩니다.\n\n변경하시겠습니까?') then
        begin
          sSql := Format('UPDATE ACNT_MST SET MINAMT_GUJA = %s WHERE ACNT_TP = 1', [FieldByName('GUJA_MIN_AMT_1').NewValue]);
          Uni_Open(MastDb.dbExec, sSql);
        end
        else
        begin
          Cancel;
          Abort;
        end;
      end;

      if FieldByName('GUJA_MIN_AMT_2').OldValue <> FieldByName('GUJA_MIN_AMT_2').NewValue then
      begin
        if bsMsgYesNo('해외최소금액 변경시 해외회원계좌에 일괄 적용됩니다.\n\n변경하시겠습니까?') then
        begin
          sSql := Format('UPDATE ACNT_MST SET MINAMT_GUJA = %s WHERE ACNT_TP = 2', [FieldByName('GUJA_MIN_AMT_2').NewValue]);
          Uni_Open(MastDb.dbExec, sSql);
        end
        else
        begin
          Cancel;
          Abort;
        end;
      end;
      
    end;
  end;
  
end;

procedure TfmCorp.FormShow(Sender: TObject);
begin
  inherited;

  MainTableOpen;

end;

procedure TfmCorp.MainTableOpen;
var
  sSql : String;
begin
  sSql := 'SELECT              '+
          ' CORP_SEQ           '+
          ',CORP_NM            '+
          ',CORP_TEL           '+
          ',CORP_BIGO          '+
          ',BANK_NM            '+
          ',BANK_ACNT_NO       '+
          ',BANK_ACNT_NM       '+
          ',DUP_YN             '+
          ',CNTR_RT            '+
          ',GUJA_AMT_1         '+
          ',GUJA_MAX_CNT_1     '+
          ',GUJA_MIN_AMT_1     '+
          ',GUJA_AMT_2         '+
          ',GUJA_MAX_CNT_2     '+
          ',GUJA_MIN_AMT_2     '+
          ',HIS_KEEP_DAY       '+
          ',NOTICE_KEEP_DAY    '+
          ',CURR_TRADE_DT      '+
          ',MNG_ACPT_USE_YN    '+
          ',HYB_HOGA_NO        '+
          ',HYB_TIME_CONDITION '+
          ',VIRTUAL_ORD        '+
          ',OVERNGT_YN         '+
          ',GUJA_TP            '+
          ',PL_DISP_DAY        '+
          ',OP_PRC_MIN         '+
          ',OP_PRC_MAX         '+
          'FROM CORP_MST       ';
  Uni_Open(dbMain, sSql);

  PartTableOpen(cbVirtuarOrd, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('VIRTUAL_ORD')]));
  PartTableOpen(cbOverngtSame, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('OVERNGT_SAME_TP')]));
  PartTableOpen(cbGujaTp, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('GUJA_TP')]));

  edHisDay.Text := dbMain.FieldByName('HIS_KEEP_DAY').AsString;
  edNotiDay.Text := dbMain.FieldByName('NOTICE_KEEP_DAY').AsString;

end;

end.
