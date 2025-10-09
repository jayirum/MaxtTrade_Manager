unit MSysLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, DBCtrls;

type
  TfmSysLog = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    gdMain: TDBGridEh;
    RzDBMemo1: TRzDBMemo;
    RzDBMemo2: TRzDBMemo;
    bsSkinLabel2: TbsSkinLabel;
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

	with DataSet do
  begin
//    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmSysLog.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg: String;
begin
  inherited;

	with DataSet do
  begin
//  	sMsg := '';
//  	// 필수입력값 체크
//    if FieldByName('REG_DT').IsNull          then sMsg := '등록일자';
//    if FieldByName('CONN_PWD').AsString = '' then sMsg := '비밀번호';
//    if FieldByName('FRONT_IP').AsString = '' then sMsg := '접속IP';
//    if FieldByName('USER_NM').AsString = ''  then sMsg := '회원명';
//    if FieldByName('USERID').AsString = ''   then sMsg := '회원ID';
//
//    if sMsg <> '' then
//    begin
//      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
//      Abort;
//    end;
  end;
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

//	if edUserID.Text = '' then Exit;
//
//  pnUser.Caption := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
end;

procedure TfmSysLog.FormShow(Sender: TObject);
begin
  inherited;

//	_sMainWhere := '';
//
//  with rgType do
//  begin
//  	Tag := 1;
//  	ItemIndex := 0;
//  	Tag := 0;
//  end;
//
//  _sMainWhere := 'USER_GRADE = ' + QuotedStr(IntToStr(rgType.ItemIndex));
//
//	PartTableOpen(lbxPart, '회원분류', '[전체]', 'ALL');
//	PartTableOpen(cbUserPart, '회원분류');
//	PartTableOpen(TComponent(gdMain.Columns[3]), '회원분류');
//
//  // sType = '@|Item, Value|TableName|'
//	PartTableOpen(cbServerIP, '@|SERVER_NM, FRONT_IP|MT_SERVER_MASTER');
//	PartTableOpen(rgType, Format('@|VALUE_NM, CODE_VALUE|HT_CODE_MASTER|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE')]), '[전체]', '0');
end;

procedure TfmSysLog.lbxPartClick(Sender: TObject);
begin
  inherited;

//  with rgType do
//  begin
//  	Tag := 1;
//  	ItemIndex := 0;
//  	Tag := 0;
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
//  	try
//      Delay_Show();
//      
//      Close;
//      SQL.Text := ' SELECT               ' +
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
//	  lbxPart.ItemIndex := 0;
//  end;
end;

end.
