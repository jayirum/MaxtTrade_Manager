unit MAccount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, VCL_Helper, MBasic, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, StdCtrls, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, RzCmboBx, RzDBCmbo, bsSkinCtrls, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, bsSkinShellCtrls, ComCtrls, bsSkinTabs;

type
  TfmAccount = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    edFind: TRzEdit;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel6: TRzPanel;
    rgType: TbsSkinRadioGroup;
    RzPanel4: TRzPanel;
    gdMain: TDBGridEh;
    lbxPart: TRzListBox;
    pgMain: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    bsSkinTabSheet2: TbsSkinTabSheet;
    bsSkinSpeedButton2: TbsSkinSpeedButton;
    pnUser: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    bsSkinLabel6: TbsSkinLabel;
    bsSkinLabel7: TbsSkinLabel;
    edUserID: TkcRzDBEdit;
    edUser_Nm: TkcRzDBEdit;
    cbUser_Grade: TkcRzDBComboBox;
    cbUserPart: TkcRzDBComboBox;
    edRegNo: TkcRzDBEdit;
    edReg_Dt: TkcRzDBDateTimeEdit;
    bsSkinLabel8: TbsSkinLabel;
    cbServerIP: TkcRzDBComboBox;
    bsSkinLabel9: TbsSkinLabel;
    edPass: TkcRzDBEdit;
    bsSkinLabel10: TbsSkinLabel;
    edPartnerId: TkcRzDBEdit;
    bsSkinLabel11: TbsSkinLabel;
    edPartnerNick: TkcRzDBEdit;
    bsSkinLabel12: TbsSkinLabel;
    bsSkinLabel13: TbsSkinLabel;
    bsSkinLabel14: TbsSkinLabel;
    bsSkinLabel15: TbsSkinLabel;
    edTelNo: TkcRzDBEdit;
    edHpNo: TkcRzDBEdit;
    edAddr1: TkcRzDBEdit;
    edAddr2: TkcRzDBEdit;
    bsSkinLabel16: TbsSkinLabel;
    edEmail: TkcRzDBEdit;
    bsSkinLabel17: TbsSkinLabel;
    edUserBank: TkcRzDBEdit;
    bsSkinLabel18: TbsSkinLabel;
    edUserAcnt: TkcRzDBEdit;
    bsSkinLabel19: TbsSkinLabel;
    edAcntNm: TkcRzDBEdit;
    bsSkinLabel20: TbsSkinLabel;
    cbEmailYn: TkcRzDBComboBox;
    bsSkinLabel21: TbsSkinLabel;
    cbSmsYn: TkcRzDBComboBox;
    RzPanel2: TRzPanel;
    bsSkinLabel22: TbsSkinLabel;
    edMngid: TkcRzDBEdit;
    RzPanel3: TRzPanel;
    bsSkinLabel23: TbsSkinLabel;
    edPassM: TkcRzDBEdit;
    bsSkinLabel24: TbsSkinLabel;
    cbAcntStat: TkcRzDBComboBox;
    RzPanel8: TRzPanel;
    DBGridEh1: TDBGridEh;
    dbAcnt: TUniQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
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
  fmAccount: TfmAccount;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmAccount.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmAccount.btnFilterClick(Sender: TObject);
begin
	if edFind.Text = '' then _sMainWhere := ''
  else
  	_sMainWhere := StrReplace(__Find_User, '<X>', edFind.Text);

  inherited;
end;

procedure TfmAccount.btnInsertClick(Sender: TObject);
begin
  Case pgMain.ActivePageIndex of
    0 : begin
          AppendWork(dbMain);
          edUserID.SetFocus;
        end;
    1 : begin
//          AppendWork(dbMain);
          bsMsgInfo('주문계좌는 추가 불가능합니다.');
        end;
  end;
end;

procedure TfmAccount.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;

	with DataSet do
  begin
    FieldByName('REG_DT').AsDateTime := Date;
  end;
end;

procedure TfmAccount.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg: String;
begin
  inherited;

	with DataSet do
  begin
  	sMsg := '';
  	// 필수입력값 체크
    if FieldByName('REG_DT').IsNull          then sMsg := '등록일자';
    if FieldByName('CONN_PWD').AsString = '' then sMsg := '비밀번호';
    if FieldByName('FRONT_IP').AsString = '' then sMsg := '접속IP';
    if FieldByName('USER_NM').AsString = ''  then sMsg := '회원명';
    if FieldByName('USERID').AsString = ''   then sMsg := '회원ID';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;
  end;
end;

procedure TfmAccount.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmAccount.edUserIDChange(Sender: TObject);
begin
  inherited;

//	if edUserID.Text = '' then Exit;

//  pnUser.Caption := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
end;

procedure TfmAccount.FormShow(Sender: TObject);
begin
  inherited;

	_sMainWhere := '';

  rgType.ItemIndex := 2;
//  _sMainWhere := 'USER_GRADE = ' + QuotedStr(IntToStr(rgType.ItemIndex));

	PartTableOpen(lbxPart, '회원분류', '[전체]', 'ALL');
//	PartTableOpen(cbUserPart, '회원분류');
//	PartTableOpen(TComponent(gdMain.Columns[3]), '회원분류');

  with dbAcnt do
  begin
    Close;
    SQL.Text := 'SELECT * FROM HT_ACNT_MASTER';

    open;

    First;

  end;

end;

procedure TfmAccount.lbxPartClick(Sender: TObject);
begin
  inherited;

  with rgType do
  begin
  	Tag := 1;
  	ItemIndex := 0;
  	Tag := 0;
  end;

  if lbxPart.ItemIndex = 0 then _sMainWhere := ''
  else _sMainWhere := 'PART_CODE = ' + lbxPart.Values[lbxPart.ItemIndex];

  MainTableOpen;
end;

procedure TfmAccount.MainTableOpen;
begin
  with dbMain do
  begin
  	try
      Delay_Show();
      
      Close;
      SQL.Text := ' SELECT               ' +
                  '   USERID,            ' +
                  '   USER_NM,           ' +
                  '   CONN_YN,           ' +
                  '   FRONT_IP,          ' +
                  '   REG_NO,            ' +
                  '   CONN_PWD,          ' +
                  '   USER_GRADE,        ' +
                  '   USER_BANK,         ' +
                  '   USER_BANK_ACNT,    ' +
                  '   USER_BANK_ACNT_NM, ' +
                  '   MNG_ID,            ' +
                  '   MNG_IP,            ' +
                  '   PARTNER_ID,        ' +
                  '   PARTNER_NICK_NM,   ' +
                  '   NICK_NM,           ' +
                  '   REG_DT,            ' +
                  '   POST_NO,           ' +
                  '   ADDR_1,            ' +
                  '   ADDR_2,            ' +
                  '   EMAIL,             ' +
                  '   TEL_NO,            ' +
                  '   HP_NO,             ' +
                  '   EMAIL_YN,          ' +
                  '   SMS_YN,            ' +
                  '   CLIENT_IP,         ' +
                  '   LAST_LOGON_DT,     ' +
                  '   LAST_LOGON_TM,     ' +
                  '   LAST_LOGON_IP,     ' +
                  '   ACNT_STAT,         ' +
                  '   PART_CODE          ' +
                  ' FROM                 ' +
                  '   HT_USER_MASTER A   ';

      if _sMainWhere <> '' then SQL.Add('WHERE ' + _sMainWhere);

      Open;
    finally
      Delay_Hide;
    end;
  end;
end;

procedure TfmAccount.rgTypeClick(Sender: TObject);
begin
  inherited;

  if rgType.Tag = 0 then
  begin
    if rgType.ItemIndex = 0 then _sMainWhere := ''
    else _sMainWhere := 'USER_GRADE = ' + QuotedStr(IntToStr(rgType.ItemIndex));

    MainTableOpen;

	  lbxPart.ItemIndex := 0;
  end;
end;

end.
