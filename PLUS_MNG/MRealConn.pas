unit MRealConn;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav, RzLstBox,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmRealConn = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    edFind: TRzEdit;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel6: TRzPanel;
    rgType: TbsSkinRadioGroup;
    RzPanel4: TRzPanel;
    pnUser: TRzPanel;
    bsSkinLabel4: TbsSkinLabel;
    gdMain: TDBGridEh;
    lbxPart: TRzListBox;
    RzPanel2: TRzPanel;
    cbCheckAll: TbsSkinCheckRadioBox;
    edUserID: TkcRzDBEdit;
    MoMsg: TRzMemo;
    btnLogOut: TbsSkinSpeedButton;
    bsSkinLabel3: TbsSkinLabel;
    edtitle: TRzEdit;
    btnRefresh: TbsSkinSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure gdMainTitleClick(Column: TColumnEh);
    procedure cbCheckAllClick(Sender: TObject);
    procedure btnLogOutClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnRefreshClick(Sender: TObject);
  private
    { Private declarations }
    procedure CheckAll(iData : Integer);
    procedure LogOutProc(sTitle : String; sMsg : String);
    procedure HtsRefresh;
    function fnCheckSelectedUser: Boolean;
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmRealConn: TfmRealConn;

implementation

uses StdUtils, MMastDB, MDelay, PacketStruct;

{$R *.dfm}

{ TfmSample }
var
  _bAllCheck: Boolean=False;
  _sFind : String='';

procedure TfmRealConn.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmRealConn.btnFilterClick(Sender: TObject);
begin
  if edFind.Text = '' then _sMainWhere := ''
                      else _sMainWhere := StrReplace(_Find_UserNm, '<X>', edFind.Text);

  rgType.ItemIndex := 0;

  MainTableOpen;

  edFind.Clear;
end;

function TfmRealConn.fnCheckSelectedUser: Boolean;
begin
  Result := True;
  if (dbMain.FieldByName('USER_ID').AsString = '') or
     (dbMain.FieldByName('CHECK_TF').AsInteger = 0) then begin
    Result := False;
    bsMsgError('선택한 회원이 없습니다.');
  end;
end;

procedure TfmRealConn.btnLogOutClick(Sender: TObject);
var
  iTCnt : Integer;
begin
  iTCnt := 0;

  if not fnCheckSelectedUser then Exit;

  if bsMsgYesNo('선택한 회원을 강제종료 시키겠습니까?', '강제종료') then begin
    with dbMain do begin
      DisableControls;
      First;

      while Not Eof do begin
        Edit;

        if FieldByName('CHECK_TF').AsInteger = 1 then begin
          LogOutProc(edtitle.Text ,MoMsg.Text);
          Inc(iTCnt);
          Post;
        end;

        Next;
      end;
      EnableControls;
      bsMsgInfo(' ' + intTostr(iTCnt) + ' 명 로그아웃 되었습니다.');
      MainTableOpen;
    end;
  end;
end;

procedure TfmRealConn.btnRefreshClick(Sender: TObject);
var
  iTCnt : Integer;
begin
  iTCnt := 0;

  if not fnCheckSelectedUser then Exit;

  if bsMsgYesNo('선택한 회원의 HTS를 갱신하겠습니까?', 'HTS 갱신') then begin
    with dbMain do begin
      DisableControls;
      First;

        while Not Eof do begin
          Edit;

          if FieldByName('CHECK_TF').AsInteger = 1 then begin
            HtsRefresh; // 갱신 프로세스
            Inc(iTCnt);
            Post;
          end;

          Next;
        end;
        EnableControls;
        bsMsgInfo(' ' + intTostr(iTCnt) + ' 명 갱신 되었습니다.');
        MainTableOpen;
    end;
  end;
end;

procedure TfmRealConn.cbCheckAllClick(Sender: TObject);
var
  iValue : Integer;
begin
  inherited;
  if cbCheckAll.Checked then iValue := 1
                        else iValue := 0;

  CheckAll(iValue);
end;

procedure TfmRealConn.CheckAll(iData: Integer);
var
  iKey: String;
begin
  with dbMain do begin
    iKey := FieldByName('LOGIN_TM').asString;
    DisableControls;
    First;
    while Not Eof do begin
      Edit;
      FieldByName('CHECK_TF').AsInteger := iData;
      Post;

      Next;
    end;

    Locate('LOGIN_TM', iKey, []);
    EnableControls;
  end;
end;

procedure TfmRealConn.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmRealConn.edUserIDChange(Sender: TObject);
begin
  inherited;
  if edUserID.Text = '' then Exit;

  pnUser.Caption := Format('회원명 [%s]', [dbMain.FieldByName('USER_NM').AsString]);
end;

procedure TfmRealConn.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmRealConn);
end;

procedure TfmRealConn.FormShow(Sender: TObject);
begin
  inherited;
  if _Supervisor then PartTableOpen(rgType, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 9 ORDER BY CODE_VALUE'), '[전체]', '0')
                 else PartTableOpen(rgType, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 7 ORDER BY CODE_VALUE'), '[전체]', '0');

//  PartTableOpen(rgType, CodeFormat('USER_GRADE', 'AND CODE_VALUE < 6 ORDER BY CODE_VALUE'), '[전체]', '0');
  PartTableOpen(lbxPart, '@|SERVER_NM, SERVER_IP|SERVER_MST|ORDER BY SERVER_SEQ', '[전체]', '0');
  PartTableOpen(TComponent(gdMain.Columns[4]), '회원분류');
  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('USER_GRADE', 'ORDER BY CODE_VALUE'));
  PartTableOpen(TComponent(gdMain.Columns[5]), CodeFormat('ACNT_TP'));

  rgType.ItemIndex := 0;
end;

procedure TfmRealConn.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmRealConn.gdMainTitleClick(Column: TColumnEh);
var
  iValue: Integer;
begin
  inherited;
  if Column = gdMain.Columns[0] then
  begin
    if _bAllCheck then iValue := 0
                  else iValue := 1;

    CheckAll(iValue);

    _bAllCheck := Not _bAllCheck;
  end;
end;

procedure TfmRealConn.lbxPartClick(Sender: TObject);
begin
  inherited;

  if lbxPart.ItemIndex = 0 then _sFind := ''
                           else _sFind := Format(' AND B.SERVER_IP = %s', [QuotedStr(lbxPart.Values[lbxPart.ItemIndex])]);

  MainTableOpen;
end;

procedure TfmRealConn.LogOutProc(sTitle : String; sMsg : String);
var
  sValue, sTmp, sSql : String;
  NM002 : TNM002;
begin
  with dbMain do begin
    sTmp := StrReplace(sMsg, #13#10, '\n');

    FillChar(NM002, SizeOf(NM002), ' ');
    StrToArr(NumToStr(SizeOf(NM002)),         NM002.GT_HEADER.LENGTH);
    StrToArr('NM002',                         NM002.GT_HEADER.PACKET_CD);
    StrToArr(FieldByName('USER_ID').AsString, NM002.GT_HEADER.USER_ID);
    StrToArr(FieldByName('ACNT_TP').AsString, NM002.GT_HEADER.ACNT_TP);
    StrToArr('0000',                          NM002.GT_HEADER.ERR_CODE);
    StrToArr(NowMSecTime,                     NM002.GT_HEADER.TM);
    StrToArr('99',                            NM002.NOTI_TP);
    StrToArr(sTitle,                          NM002.NOTI_TITEL);
    StrToArr(sTmp,                            NM002.NOTI_DATA);

    sValue := RecordToStr(NM002, SizeOf(NM002));
    MastDB.iwNotiClient.DataToSend := sValue + _EOL;

    sSql := Format(
      'UPDATE ACNT_MST SET CONN_YN = %s WHERE USER_ID = %s AND ACNT_TP = %s',
      [QuotedStr('N'),
       QuotedStr(FieldByName('USER_ID').AsString),
       QuotedStr(FieldByName('ACNT_TP').AsString)]);
    fnSqlOpen(dbPower, sSql);
  end;
end;

procedure TfmRealConn.MainTableOpen;
var
  sSql, sWhere, sGrade : String;
begin
  if Not _Supervisor then sGrade := ' AND B.USER_GRADE <> 7 ';

  if _sMainWhere <> '' then sWhere := ' AND ' + _sMainWhere
                       else sWhere := '';

  try
    Delay_Show();

    sSql := Format(
      'SELECT 0 AS CHECK_TF ' +
      '      ,A.ACNT_NO     ' +
      '      ,A.ACNT_TP     ' +
      '      ,A.USER_ID     ' +
      '      ,A.USER_NM     ' +
      '      ,A.ACNT_STATE  ' +
      '      ,A.NEGO_DUP_YN ' +
      '      ,A.LOGIN_DT    ' +
      '      ,A.LOGIN_TM    ' +
      '      ,A.LOGIN_IP    ' +
      '      ,A.LOGIN_MAC   ' +
      '      ,B.USER_GRADE  ' +
      '      ,B.PART_CD     ' +
      '      ,B.SERVER_IP   ' +
      '      ,(SELECT MAX(HTS_VER) FROM LOGIN_HIS WHERE USER_ID = A.USER_ID) AS HTS_VER ' +
      '  FROM (SELECT DISTINCT A1.*, B1.LOGIN_MAC FROM ACNT_MST A1, LOGIN_HIS B1 WHERE A1.USER_ID = B1.USER_ID) A, ' +
      '       USER_MST B            ' +
      ' WHERE A.USER_ID = B.USER_ID ' +
      '   AND A.CONN_YN = %s        ' +
      _sFind +
      '%s'+
      sGrade,
      [QuotedStr('Y'),
       sWhere]);

    fnSqlOpen(dbMain, sSql);

    gdMain.Columns[0].Checkboxes := dbMain.RecordCount <> 0;
    cbCheckAll.Checked := False;
  finally
    Delay_Hide;
  end;
end;

procedure TfmRealConn.HtsRefresh;
var
  sValue : String;
  NR001  : TNR001;
begin
  with dbMain do begin
    FillChar(NR001, SizeOf(NR001), ' ');
    StrToArr(NumToStr(SizeOf(NR001)),         NR001.GT_HEADER.LENGTH);
    StrToArr('NR001',                         NR001.GT_HEADER.PACKET_CD);
    StrToArr(FieldByName('USER_ID').AsString, NR001.GT_HEADER.USER_ID);
    StrToArr(FieldByName('ACNT_TP').AsString, NR001.GT_HEADER.ACNT_TP);
    StrToArr('0000',                          NR001.GT_HEADER.ERR_CODE);
    StrToArr(NowMSecTime,                     NR001.GT_HEADER.TM);

    sValue := RecordToStr(NR001, SizeOf(NR001));
    MastDB.iwNotiClient.DataToSend := sValue + _EOL;
  end;
end;

procedure TfmRealConn.rgTypeClick(Sender: TObject);
begin
  inherited;

  if rgType.ItemIndex = 0 then _sFind := ''
                          else _sFind := ' AND B.USER_GRADE = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

  MainTableOpen;
end;

end.
