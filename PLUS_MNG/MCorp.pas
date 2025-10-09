unit MCorp;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit, RzSpnEdt, RzDBSpin, RzDBNav, RzCmboBx, RzDBCmbo, RzSplit,
  RzLstBox, RzDBEdit, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic, RzLabel;

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
    edMngAcptUseYn: TkcRzDBComboBox;
    RzGroupBox4: TRzGroupBox;
    bsSkinLabel7: TbsSkinLabel;
    bsSkinLabel8: TbsSkinLabel;
    edGujaAmt1: TkcRzDBEdit;
    edMinAmt1: TkcRzDBEdit;
    bsSkinLabel9: TbsSkinLabel;
    edMaxCnt1: TkcRzDBEdit;
    bsSkinLabel15: TbsSkinLabel;
    edDupYn: TkcRzDBComboBox;
    bsSkinLabel16: TbsSkinLabel;
    cbVirtuarOrd: TkcRzDBComboBox;
    bsSkinLabel17: TbsSkinLabel;
    seHybHogaNo: TRzDBSpinEdit;
    seHybTimeCcondition: TRzDBSpinEdit;
    bsSkinLabel5: TbsSkinLabel;
    cbOverngtSame: TkcRzDBComboBox;
    bsSkinLabel19: TbsSkinLabel;
    edCorpBigo: TkcRzDBEdit;
    RzPanel3: TRzPanel;
    bsSkinLabel20: TbsSkinLabel;
    cbGujaTp: TkcRzDBComboBox;
    bsSkinLabel21: TbsSkinLabel;
    sePlDispDay: TRzDBSpinEdit;
    bsSkinLabel22: TbsSkinLabel;
    bsSkinLabel23: TbsSkinLabel;
    edOpPrcMin: TkcRzDBEdit;
    edOpPrcMax: TkcRzDBEdit;
    bsSkinLabel24: TbsSkinLabel;
    sePartnerDispDay: TRzDBSpinEdit;
    bsSkinLabel25: TbsSkinLabel;
    cbInBankNm: TkcRzDBComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzGroupBox6: TRzGroupBox;
    bsSkinLabel26: TbsSkinLabel;
    cbCntrFRt: TRzDBSpinEdit;
    bsSkinLabel29: TbsSkinLabel;
    cbCntrGfRt: TRzDBSpinEdit;
    bsSkinLabel28: TbsSkinLabel;
    cbNullHogaYn: TkcRzDBComboBox;
    bsSkinLabel30: TbsSkinLabel;
    cbMitMktYn: TkcRzDBComboBox;
    bsSkinLabel31: TbsSkinLabel;
    cbFix_Mitsl: TkcRzDBComboBox;
    bsSkinLabel32: TbsSkinLabel;
    cbSlCancel: TkcRzDBComboBox;
    bsSkinLabel33: TbsSkinLabel;
    cbNowPrcCntr: TkcRzDBComboBox;
    bsSkinLabel34: TbsSkinLabel;
    cbRemnInitHoga: TkcRzDBComboBox;
    bsSkinLabel1: TbsSkinLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure dbMainBeforePost(DataSet: TDataSet);
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

procedure TfmCorp.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmCorp);
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
  sSql :=
     'SELECT CORP_SEQ           ' +
     '      ,CORP_NM            ' +
     '      ,CORP_TEL           ' +
     '      ,CORP_BIGO          ' +
     '      ,BANK_NM            ' +
     '      ,BANK_ACNT_NO       ' +
     '      ,BANK_ACNT_NM       ' +
     '      ,DUP_YN             ' +
     '      ,CNTR_RT            ' +
     '      ,GUJA_AMT_1         ' +
     '      ,GUJA_MAX_CNT_1     ' +
     '      ,GUJA_MIN_AMT_1     ' +
     '      ,GUJA_AMT_2         ' +
     '      ,GUJA_MAX_CNT_2     ' +
     '      ,GUJA_MIN_AMT_2     ' +
     '      ,HIS_KEEP_DAY       ' +
     '      ,NOTICE_KEEP_DAY    ' +
     '      ,CURR_TRADE_DT      ' +
     '      ,MNG_ACPT_USE_YN    ' +
     '      ,HYB_HOGA_NO        ' +
     '      ,HYB_TIME_CONDITION ' +
     '      ,VIRTUAL_ORD        ' +
     '      ,OVERNGT_YN         ' +
     '      ,GUJA_TP            ' +
     '      ,PL_DISP_DAY        ' +
     '      ,OP_PRC_MIN         ' +
     '      ,OP_PRC_MAX         ' +
     '      ,PARTNER_DISP_DAY   ' + // ��Ʈ�� ��ȸ �Ⱓ
     '      ,IN_BANKNM          ' + // �Աݽ� ������ ǥ��
     '      ,CNTR_F_RT          ' + // �����ְ� ü����
     '      ,CNTR_GF_RT         ' + // �ؿܼ���ü����
     '      ,NOWPRC_CNTR        ' + // ���簡ü��
     '      ,REMN_INIT_HOGA     ' + // �ܷ��ʱ�ȭȣ��
     '      ,NULLHOGA_YN        ' + // �����ֹ�ó��
     '      ,MIT_MKT_YN         ' + // �����ֹ� ���尡ó��
     '      ,FIX_MITSL          ' + // MIT/STOPLOSS �ִ� 1ƽó��
     '      ,SL_CANCEL          ' + // ��ž�ν��ߵ��� ���������
     '  FROM CORP_MST           ';
  fnSqlOpen(dbMain, sSql);

  PartTableOpen(cbVirtuarOrd,  CodeFormat('VIRTUAL_ORD', 'ORDER BY CODE_VALUE'));
  PartTableOpen(cbOverngtSame, CodeFormat('OVERNGT_SAME_TP', 'ORDER BY CODE_VALUE'));
  PartTableOpen(cbGujaTp,      CodeFormat('GUJA_TP', 'ORDER BY CODE_VALUE'));
end;

procedure TfmCorp.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('OP_PRC_MIN')).DisplayFormat := '#0.##';
    TFloatField(FieldByName('OP_PRC_MAX')).DisplayFormat := '#0.##';
  end;
end;

procedure TfmCorp.dbMainBeforePost(DataSet: TDataSet);
var
  sSql, sOld, sNew : String;
begin
  inherited;

  with DataSet do begin
    if State in [dsEdit] then begin
      sOld := FieldByName('DUP_YN').OldValue;
      sNew := FieldByName('DUP_YN').NewValue;
      if sOld <> sNew then begin
        sSql := Format('UPDATE ACNT_MST SET NEGO_DUP_YN = %s', [QuotedStr(sNew)]);
        fnSqlOpen(MastDB.dbExec, sSql);
      end;

      sOld := FieldByName('OVERNGT_YN').OldValue;
      sNew := FieldByName('OVERNGT_YN').NewValue;
      if sOld <> sNew then begin
        if bsMsgYesNo('OV/����ȣ�� ����� ȸ������ ��û���°� �ʱ�ȭ �˴ϴ�.\n\n�����Ͻðڽ��ϱ�?') then begin
          if sNew = '0' then sSql := Format('UPDATE ACNT_MST SET OVERNGT_YN = %s', [QuotedStr('0')]) else
          if sNew = '1' then sSql := Format('UPDATE ACNT_MST SET OVERNGT_YN = %s WHERE OVERNGT_YN = %s', [QuotedStr('0'),QuotedStr('2')]) else
          if sNew = '2' then sSql := Format('UPDATE ACNT_MST SET OVERNGT_YN = %s WHERE OVERNGT_YN = %s', [QuotedStr('0'),QuotedStr('1')]);

          if sNew <> '3' then
            fnSqlOpen(MastDB.dbExec, sSql);
        end else begin
          Cancel;
          Abort;
        end;
      end;

      sOld := FieldByName('GUJA_MIN_AMT_1').OldValue;
      sNew := FieldByName('GUJA_MIN_AMT_1').NewValue;
      if sOld <> sNew then begin
        if bsMsgYesNo('�����ּұݾ� ����� ����ȸ�����¿� �ϰ� ����˴ϴ�.\n\n�����Ͻðڽ��ϱ�?') then begin
          sSql := Format('UPDATE ACNT_MST SET MINAMT_GUJA = %s WHERE ACNT_TP = 1', [sNew]);
          fnSqlOpen(MastDb.dbExec, sSql);
        end else begin
          Cancel;
          Abort;
        end;
      end;

      sOld := FieldByName('GUJA_MIN_AMT_2').OldValue;
      sNew := FieldByName('GUJA_MIN_AMT_2').NewValue;
      if sOld <> sNew then begin
        if bsMsgYesNo('�ؿ��ּұݾ� ����� �ؿ�ȸ�����¿� �ϰ� ����˴ϴ�.\n\n�����Ͻðڽ��ϱ�?') then begin
          sSql := Format('UPDATE ACNT_MST SET MINAMT_GUJA = %s WHERE ACNT_TP = 2', [sNew]);
          fnSqlOpen(MastDb.dbExec, sSql);
        end else begin
          Cancel;
          Abort;
        end;
      end;
    end;
  end;
end;

end.
