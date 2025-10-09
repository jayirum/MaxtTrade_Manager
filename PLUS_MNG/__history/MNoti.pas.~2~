unit MNoti;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, RzButton, RzRadChk, DBCtrls, RzDBChk, ComCtrls,
  bsSkinTabs, LbButton, PacketStruct, UniDAC_Helper, RzDTP, RzDBDTP;

type
  TfmNoti = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    edFind: TRzEdit;
    gdMain: TDBGridEh;
    pcNoti: TbsSkinPageControl;
    bsSkinTabSheet1: TbsSkinTabSheet;
    edTitle: TkcRzDBEdit;
    moBody: TRzDBMemo;
    cbNotiTp: TkcRzDBComboBox;
    ckAllNoti: TRzCheckBox;
    btnFind: TbsSkinSpeedButton;
    edUserID: TkcRzDBEdit;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    ckNoticeYn: TRzDBCheckBox;
    bsSkinLabel4: TbsSkinLabel;
    dtStart: TkcRzDateTimeEdit;
    dtEnd: TkcRzDateTimeEdit;
    cbFindTp: TkcRzComboBox;
    ckTopYn: TRzDBCheckBox;
    bsSkinLabel6: TbsSkinLabel;
    edEndDt: TRzDBDateTimePicker;
    dbMainNOTICE_SEQ: TIntegerField;
    dbMainTOP_YN: TStringField;
    dbMainUSER_ID: TStringField;
    dbMainNOTICE_DT: TStringField;
    dbMainNOTICE_TM: TStringField;
    dbMainNOTICE_TP: TStringField;
    dbMainNOTICE_TITLE: TStringField;
    dbMainNOTICE_BODY: TMemoField;
    dbMainNOTICE_YN: TStringField;
    dbMainEND_DT: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure btnFindClick(Sender: TObject);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure dbMainAfterCancel(DataSet: TDataSet);
    procedure dbMainAfterEdit(DataSet: TDataSet);
    procedure ckAllNotiClick(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmNoti: TfmNoti;
  _sWhere : String;

implementation

uses StdUtils, MMastDB, MDelay, MUserFind;

{$R *.dfm}

{ TfmSample }

procedure TfmNoti.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmNoti.btnFilterClick(Sender: TObject);
var
  sSql, sUid, swhere : String;
begin
  inherited;

  if cbFindTp.ItemIndex <> 0 then
  begin
    if cbFindTp.ItemIndex = 1 then sUid := '전체공지'
    else sUid := edFind.Text;

    swhere := Format(' AND USER_ID = %s', [QuotedStr(sUid)]);
  end;

  _sWhere := Format(' WHERE NOTICE_DT BETWEEN %s AND %s ' + swhere , [QuotedStr(StrReplace(dtStart.Text,'-','')), QuotedStr(StrReplace(dtEnd.Text,'-',''))]);

  MainTableOpen;

end;

procedure TfmNoti.btnFindClick(Sender: TObject);
var
  sRslt : String;
begin
  inherited;
  sRslt := UserFind_Run;
  edUserID.Text := sRslt;
end;

procedure TfmNoti.btnInsertClick(Sender: TObject);
begin


  edTitle.SetFocus;
  inherited;
end;

procedure TfmNoti.ckAllNotiClick(Sender: TObject);
begin
  inherited;
  if dbMain.State in [dsInsert] then
  begin
    if ckAllNoti.Checked then
    begin
      btnFind.Enabled := False;
      edUserID.Text := '전체공지';
    end
    else
    begin
      edUserID.Text := '';
      btnFind.Enabled := True;
    end;
  end;

end;

procedure TfmNoti.dbMainAfterCancel(DataSet: TDataSet);
begin
  inherited;
  btnFind.Enabled := False;
end;

procedure TfmNoti.dbMainAfterEdit(DataSet: TDataSet);
begin
  inherited;
    btnFind.Enabled := False;
end;

procedure TfmNoti.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if ckAllNoti.Checked then btnFind.Enabled := False
  else btnFind.Enabled   := True;

  with DataSet do
  begin
    FieldByName('NOTICE_TP').AsString := '01';
    FieldByName('NOTICE_YN').AsString := 'Y';
    FieldByName('TOP_YN').AsString    := 'N';
    FieldByName('END_DT').AsDateTime  := Date + 7;
  end;
end;

procedure TfmNoti.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg, sId, sValue, sTmp, sNotiTp: String;
  NM002 : TNM002;
begin
  inherited;

	with DataSet do
  begin
    sMsg := '';
    // 필수입력값 체크
    if (Not ckAllNoti.Checked) and (FieldByName('USER_ID').AsString = '') then sMsg := '회원ID';
    if FieldByName('NOTICE_TITLE').AsString = ''                          then sMsg := '제목';
    if FieldByName('NOTICE_BODY').AsString = ''                           then sMsg := '내용';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

    if state in [dsEdit] then
    begin
      if FieldByName('USER_ID').OldValue <> FieldByName('USER_ID').NewValue then
      begin
        FieldByName('USER_ID').AsString := FieldByName('USER_ID').OldValue;
      end;
    end;

    if state in [dsInsert] then
    begin
      btnFind.Enabled := False;

      if ckAllNoti.Checked then FieldByName('USER_ID').AsString := '전체공지';

      FieldByName('NOTICE_DT').AsString := NowDate;
      FieldByName('NOTICE_TM').AsString := NowMSecTime;

      if bsMsgYesNo('입력하신 공지사항을 바로 회원들에게 통보하시겠습니까?') then
      begin
        if ckAllNoti.Checked then sId := '@ALLUSER'
        else sId := edUserID.Text;

        sTmp := StrReplace(moBody.Text, #13#10, '\n');

        if FieldByName('NOTICE_TP').AsString = '01' then sNotiTp := '00'
        else sNotiTp := '01';

        FillChar(NM002, SizeOf(NM002), ' ');
        StrToArr(NumToStr(SizeOf(NM002)), NM002.GT_HEADER.LENGTH);
        StrToArr('NM002',                 NM002.GT_HEADER.PACKET_CD);
        StrToArr(sId,                     NM002.GT_HEADER.USER_ID);
        StrToArr('0',                     NM002.GT_HEADER.ACNT_TP);
        StrToArr('0000',                  NM002.GT_HEADER.ERR_CODE);
        StrToArr(NowMSecTime,             NM002.GT_HEADER.TM);
        StrToArr(sNotiTp,                 NM002.NOTI_TP);
        StrToArr(edTitle.Text,            NM002.NOTI_TITEL);
        StrToArr(sTmp,                    NM002.NOTI_DATA);

        sValue := RecordToStr(NM002, SizeOf(NM002));
        MastDB.iwNotiClient.DataToSend := sValue + __EOL;

        bsMsgInfo('통보완료!');
      end;
    end;
  end;


end;

procedure TfmNoti.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmNoti.FormShow(Sender: TObject);
begin
  inherited;
  pcNoti.ActivePageIndex := 0;

  dtStart.Date := TextToDate(__Trade_DT); //NowDate(True);
  dtEnd.Date   := TextToDate(__Trade_DT); //NowDate(True);

  PartTableOpen(cbNotiTp, '공지분류');
	PartTableOpen(TComponent(gdMain.Columns[2]), '공지분류');

  MainTableOpen;

end;

procedure TfmNoti.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    Canvas.Font.Color := clBlack;
    if FieldByName('NOTICE_TP').AsString = '03' then Canvas.Font.Color := clRed
    else if FieldByName('NOTICE_TP').AsString = '01' then Canvas.Font.Color := clBlue;

    if DataCol = 2 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmNoti.MainTableOpen;
var
  sSql :String;
begin
  try
    Delay_Show();
    sSql := 'SELECT NOTICE_SEQ                    '+
            '      ,TOP_YN                        '+
            '      ,USER_ID                       '+
            '      ,NOTICE_DT                     '+
            '      ,NOTICE_TM                     '+
            '      ,NOTICE_TP                     '+
            '      ,NOTICE_TITLE                  '+
            '      ,NOTICE_BODY                   '+
            '      ,NOTICE_YN                     '+
            '      ,END_DT                        '+
            'FROM NOTICE_MST                      '+
            _sWhere +
            'ORDER BY TOP_YN DESC, NOTICE_DT DESC ';

    Uni_Open(dbMain, sSql);
     
  finally
    Delay_Hide;
  end;
end;

end.
