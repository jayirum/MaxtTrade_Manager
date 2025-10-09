unit MPLClsList;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Math, Dialogs, ImgList, Graphics,
//  Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsRibbon, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav, RzLstBox, RzDBEdit,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmPLClsList = class(TfmBasic)
    gdMain: TDBGridEh;
    rgClsPLAcntTp: TbsSkinRadioGroup;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    pnClsPL: TRzPanel;
    chUserTp: TbsSkinCheckRadioBox;
    cbUser: TbsSkinCheckRadioBox;
    cbUserGrade: TkcRzComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure chUserTpClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure cbUserClick(Sender: TObject);
    procedure rgClsPLAcntTpClick(Sender: TObject);
    procedure cbUserGradeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmPLClsList: TfmPLClsList;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmPLClsList }

procedure TfmPLClsList.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPLClsList.cbUserClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmPLClsList.chUserTpClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmPLClsList.rgClsPLAcntTpClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmPLClsList.cbUserGradeChange(Sender: TObject);
begin
  inherited;
//  if (not cbUser.Checked) or (cbUserGrade.ItemIndex = 0) then Exit;
  MainTableOpen;
end;

procedure TfmPLClsList.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('CLR_PL_SUM'  )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('CMSN_SUM'    )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('NET_PL_SUM'  )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('RSLT_IN_AMT' )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('RSLT_OUT_AMT')).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('KSF_PL'      )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('KSF_CMSN'    )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('KSO_PL'      )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('KSO_CMSN'    )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('GF_PL'       )).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('GF_CMSN'     )).DisplayFormat := FORMAT_AMT;
  end;
end;

procedure TfmPLClsList.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;

  with DataSet do begin
//    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmPLClsList.dbMainBeforePost(DataSet: TDataSet);
//var
//  sMsg: String;
begin
  inherited;

  with DataSet do begin
//    sMsg := '';
//    // �ʼ��Է°� üũ
//    if FieldByName('REG_DT').IsNull          then sMsg := '�������';
//    if FieldByName('CONN_PWD').AsString = '' then sMsg := '��й�ȣ';
//    if FieldByName('FRONT_IP').AsString = '' then sMsg := '����IP';
//    if FieldByName('USER_NM').AsString = ''  then sMsg := 'ȸ����';
//    if FieldByName('USERID').AsString = ''   then sMsg := 'ȸ��ID';
//
//    if sMsg <> '' then
//    begin
//      bsMsgError(sMsg + '��(��) �ݵ�� �Է��ϼž� �մϴ�');
//      Abort;
//    end;
  end;
end;

procedure TfmPLClsList.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmPLClsList);
end;

procedure TfmPLClsList.FormShow(Sender: TObject);
begin
  inherited;
  if _Supervisor then cbUserGrade.Visible := True;

  PartTableOpen(cbUserGrade, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), 'ȸ�����', '0');
  cbUserGrade.ItemIndex := 0;

  dtStart.Date := TextToDate(_Trade_DT) -7;
  dtEnd.Date   := TextToDate(_Trade_DT) -1;
end;

procedure TfmPLClsList.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    Canvas.Font.Color := clBlack;
    if CompareValue(FieldByName('NET_PL_SUM').AsFloat, 0) > 0 then Canvas.Font.Color := clRed else
    if CompareValue(FieldByName('NET_PL_SUM').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;

    if DataCol = 4 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmPLClsList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmPLClsList.MainTableOpen;
var
  sSql, sAcntTp, sUserTp, sResult : String;
begin
  try
    Delay_Show();

    if _Supervisor then begin
      if cbUserGrade.ItemIndex <> 0 then sUserTp := Format(' AND B1.USER_GRADE = %s ', [IntToStr(cbUserGrade.ItemIndex)]) else
      if chUserTp.Checked           then sUserTp := Format(' AND B1.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                                    else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 ' else
                               sUserTp := ' AND B1.USER_GRADE <> 7 ';
    end;

    if rgClsPLAcntTp.ItemIndex <> 0 then
      sAcntTp := Format(' AND ACNT_TP = %s ', [QuotedStr(intTostr(rgClsPLAcntTp.ItemIndex))]);

    if cbUser.Checked then begin
      gdMain.Columns[0].Title.Caption := 'ȸ����';
      gdMain.Columns[0].FieldName     := 'USER_NM';

      sSql := Format(
        'SELECT USER_NM ' +                                     // ������
        '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP ' + // ���±���
        '      ,ISNULL(SUM(CLR_PL_SUM  ),0) AS CLR_PL_SUM   ' + // û�������
        '      ,ISNULL(SUM(CMSN_SUM    ),0) AS CMSN_SUM     ' + // ��������
        '      ,ISNULL(SUM(NET_PL_SUM  ),0) AS NET_PL_SUM   ' + // ��������
        '      ,ISNULL(SUM(RSLT_IN_AMT ),0) AS RSLT_IN_AMT  ' + // �Ա�ó����
        '      ,ISNULL(SUM(RSLT_OUT_AMT),0) AS RSLT_OUT_AMT ' + // ���ó����
        '      ,ISNULL(SUM(KSF_PL      ),0) AS KSF_PL       ' + // ������������
        '      ,ISNULL(SUM(KSF_CMSN    ),0) AS KSF_CMSN     ' + // ��������������
        '      ,ISNULL(SUM(KSO_PL      ),0) AS KSO_PL       ' + // �����ɼǼ���
        '      ,ISNULL(SUM(KSO_CMSN    ),0) AS KSO_CMSN     ' + // �����ɼǼ�����
        '      ,ISNULL(SUM(GF_PL       ),0) AS GF_PL        ' + // �ؿܼ�������
        '      ,ISNULL(SUM(GF_CMSN     ),0) AS GF_CMSN      ' + // �ؿܼ���������
        '      ,ISNULL(SUM(K_PL_SUM    ),0) AS K_PL_SUM     ' + // ���� ���� ��
        '      ,ISNULL(SUM(K_CMSN_SUM  ),0) AS K_CMSN_SUM   ' + // ���� ������ ��
        '      ,ISNULL(SUM(GF_PL_SUM   ),0) AS GF_PL_SUM    ' + // �ؿܼ��� ���� ��
        '      ,ISNULL(SUM(GF_CMSN_SUM ),0) AS GF_CMSN_SUM  ' + // �ؿܼ��� ������ ��
        '      ,COUNT(1) OVER()             AS TOTCNT       ' +
        '  FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A ' +
        ' WHERE TRADE_DT BETWEEN %s AND %s ' +
        sAcntTp +
        ' GROUP BY USER_NM, ACNT_TP ' +
        ' ORDER BY USER_NM ',
        [QuotedStr('ACNT_TP'),
         sUserTp,
         QuotedStr(StrReplace(dtStart.Text, '-', '')),
         QuotedStr(StrReplace(dtEnd.Text,   '-', ''))]);
    end else begin
      gdMain.Columns[0].Title.Caption := '������';
      gdMain.Columns[0].FieldName     := 'TRADE_DT';

      sSql := Format(
        'SELECT TRADE_DT ' +                                    // ������
        '      ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ACNT_TP) AS ACNT_TP ' + // ���±���
        '      ,ISNULL(SUM(CLR_PL_SUM  ),0) AS CLR_PL_SUM   ' + // û�������
        '      ,ISNULL(SUM(CMSN_SUM    ),0) AS CMSN_SUM     ' + // ��������
        '      ,ISNULL(SUM(NET_PL_SUM  ),0) AS NET_PL_SUM   ' + // ��������
        '      ,ISNULL(SUM(RSLT_IN_AMT ),0) AS RSLT_IN_AMT  ' + // �Ա�ó����
        '      ,ISNULL(SUM(RSLT_OUT_AMT),0) AS RSLT_OUT_AMT ' + // ���ó����
        '      ,ISNULL(SUM(KSF_PL      ),0) AS KSF_PL       ' + // ������������
        '      ,ISNULL(SUM(KSF_CMSN    ),0) AS KSF_CMSN     ' + // ��������������
        '      ,ISNULL(SUM(KSO_PL      ),0) AS KSO_PL       ' + // �����ɼǼ���
        '      ,ISNULL(SUM(KSO_CMSN    ),0) AS KSO_CMSN     ' + // �����ɼǼ�����
        '      ,ISNULL(SUM(GF_PL       ),0) AS GF_PL        ' + // �ؿܼ�������
        '      ,ISNULL(SUM(GF_CMSN     ),0) AS GF_CMSN      ' + // �ؿܼ���������
        '      ,ISNULL(SUM(K_PL_SUM    ),0) AS K_PL_SUM     ' + // ���� ���� ��
        '      ,ISNULL(SUM(K_CMSN_SUM  ),0) AS K_CMSN_SUM   ' + // ���� ������ ��
        '      ,ISNULL(SUM(GF_PL_SUM   ),0) AS GF_PL_SUM    ' + // �ؿܼ��� ���� ��
        '      ,ISNULL(SUM(GF_CMSN_SUM ),0) AS GF_CMSN_SUM  ' + // �ؿܼ��� ������ ��
        '      ,COUNT(1) OVER()             AS TOTCNT       ' +
        '  FROM (SELECT A1.* FROM ACNT_CLS A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A ' +
        ' WHERE TRADE_DT BETWEEN %s AND %s ' +
        sAcntTp +
        ' GROUP BY TRADE_DT, ACNT_TP ' +
        ' ORDER BY TRADE_DT DESC     ',
        [QuotedStr('ACNT_TP'),
         sUserTp,
         QuotedStr(StrReplace(dtStart.Text, '-', '')),
         QuotedStr(StrReplace(dtEnd.Text,   '-', ''))]);
    end;
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then begin
       pnClsPL.Caption := dbMain.FieldByName('TOTCNT').AsString + ' ��';
       pnClsPL.Caption := IntToStr(dbMain.RecordCount) + ' ��';
    end else begin
       pnClsPL.Caption := '0 ��';
       pnClsPL.Caption := '0 ��';
    end;
  finally
    Delay_Hide;
  end;
end;

end.
