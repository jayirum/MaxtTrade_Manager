unit MSysLog;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, MemDS, DBAccess, DBCtrls, Dialogs, ImgList,
//  Mask, Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, RzPanel, bsRibbon, RzDBNav, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmSysLog = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    gdMain: TDBGridEh;
    RzDBMemo1: TRzDBMemo;
    RzDBMemo2: TRzDBMemo;
    bsSkinLabel2: TbsSkinLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmSysLog: TfmSysLog;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmSysLog.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmSysLog.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;

  with DataSet do begin
//    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmSysLog.dbMainBeforePost(DataSet: TDataSet);
//var
//  sMsg: String;
begin
  inherited;

{	with DataSet do
  begin
  	sMsg := '';
  	// �ʼ��Է°� üũ
    if FieldByName('REG_DT').IsNull          then sMsg := '�������';
    if FieldByName('CONN_PWD').AsString = '' then sMsg := '��й�ȣ';
    if FieldByName('FRONT_IP').AsString = '' then sMsg := '����IP';
    if FieldByName('USER_NM').AsString = ''  then sMsg := 'ȸ����';
    if FieldByName('USERID').AsString = ''   then sMsg := 'ȸ��ID';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '��(��) �ݵ�� �Է��ϼž� �մϴ�');
      Abort;
    end;
  end;}
end;

procedure TfmSysLog.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmSysLog.edUserIDChange(Sender: TObject);
begin
  inherited;

//  if edUserID.Text = '' then Exit;
//
//  pnUser.Caption := Format('ȸ���� [%s]', [dbMain.FieldByName('USER_NM').AsString]);
end;

procedure TfmSysLog.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmSysLog);
end;

procedure TfmSysLog.FormShow(Sender: TObject);
begin
  inherited;

//  _sMainWhere := '';
//
//  with rgType do
//  begin
//    Tag := 1;
//    ItemIndex := 0;
//    Tag := 0;
//  end;
//
//  _sMainWhere := 'USER_GRADE = ' + QuotedStr(IntToStr(rgType.ItemIndex));
//
//	PartTableOpen(lbxPart, 'ȸ���з�', '[��ü]', 'ALL');
//	PartTableOpen(cbUserPart, 'ȸ���з�');
//	PartTableOpen(TComponent(gdMain.Columns[3]), 'ȸ���з�');
//
//  // sType = '@|Item, Value|TableName|'
//	PartTableOpen(cbServerIP, '@|SERVER_NM, FRONT_IP|MT_SERVER_MASTER');
//	PartTableOpen(rgType, Format('@|VALUE_NM, CODE_VALUE|HT_CODE_MASTER|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE')]), '[��ü]', '0');
end;

procedure TfmSysLog.lbxPartClick(Sender: TObject);
begin
  inherited;

//  with rgType do
//  begin
//    Tag := 1;
//    ItemIndex := 0;
//    Tag := 0;
//  end;
//
//  if lbxPart.ItemIndex = 0 then _sMainWhere := ''
//  else _sMainWhere := 'PART_CODE = ' + lbxPart.Values[lbxPart.ItemIndex];
//
//  MainTableOpen;
end;

procedure TfmSysLog.MainTableOpen;
begin
//  with dbMain do
//  begin
//   try
//      Delay_Show();
//
//      Close;
//      SQL.Text := 'SELECT               ' +
//                  '   USERID,            ' +
//                  '   USER_NM,           ' +
//                  '   CONN_YN,           ' +
//                  '   FRONT_IP,          ' +
//                  '   REG_NO,            ' +
//                  '   CONN_PWD,          ' +
//                  '   USER_GRADE,        ' +
//                  '   USER_BANK,         ' +
//                  '   USER_BANK_ACNT,    ' +
//                  '   USER_BANK_ACNT_NM, ' +
//                  '   MNG_ID,            ' +
//                  '   MNG_IP,            ' +
//                  '   PARTNER_ID,        ' +
//                  '   PARTNER_NICK_NM,   ' +
//                  '   NICK_NM,           ' +
//                  '   REG_DT,            ' +
//                  '   POST_NO,           ' +
//                  '   ADDR_1,            ' +
//                  '   ADDR_2,            ' +
//                  '   EMAIL,             ' +
//                  '   TEL_NO,            ' +
//                  '   HP_NO,             ' +
//                  '   EMAIL_YN,          ' +
//                  '   SMS_YN,            ' +
//                  '   CLIENT_IP,         ' +
//                  '   LAST_LOGON_DT,     ' +
//                  '   LAST_LOGON_TM,     ' +
//                  '   LAST_LOGON_IP,     ' +
//                  '   ACNT_STAT,         ' +
//                  '   PART_CODE          ' +
//                  ' FROM                 ' +
//                  '   HT_USER_MASTER A   ';
//
//      if _sMainWhere <> '' then SQL.Add('WHERE ' + _sMainWhere);
//
//      Open;
//    finally
//      Delay_Hide;
//    end;
//  end;
end;

procedure TfmSysLog.rgTypeClick(Sender: TObject);
begin
  inherited;
//  if rgType.Tag = 0 then
//  begin
//    if rgType.ItemIndex = 0 then _sMainWhere := ''
//    else _sMainWhere := 'USER_GRADE = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);
//
//    MainTableOpen;
//
//   lbxPart.ItemIndex := 0;
//  end;
end;

end.
