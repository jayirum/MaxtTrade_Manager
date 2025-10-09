unit MLogin;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, jpeg, Dialogs, Messages,
//  DBClient, Variants, Graphics, ComCtrls,
// BusinessSkinForm_1042
  BusinessSkinForm, bsMessages, bsSkinCtrls, bsSkinTabs, bsSkinExCtrls,
// Raize, kcRaize
  RzLabel, RzPanel, RzEdit, RzRadChk, RzButton, RzRadGrp, kcRaizeCtrl;

type
  TfmLogin = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    bsSkinPanel2: TbsSkinPanel;
    pnCorp: TbsSkinStatusPanel;
    pnTel: TbsSkinStatusPanel;
    Panel1: TPanel;
    bsSkinDivider1: TbsSkinDivider;
    edID: TkcRzEdit;
    edPass: TkcRzEdit;
    btnLogin: TbsSkinSpeedButton;
    btnClose: TbsSkinSpeedButton;
    chIDSave: TRzCheckBox;
    imgLogo: TImage;
    Image1: TImage;
    Label1: TLabel;
    dbSQL: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure edPassKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure pnCorpDblClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure imgLogoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    function Get_Login(sID, sPass: String): Boolean;
  public
    { Public declarations }
  end;

var
  fmLogin: TfmLogin;
  function fnLogin_Run: Boolean;

implementation

uses StdUtils, MMain, MMastDB;

{$R *.dfm}

{ TfmLogin }

const
  _iTotal = 5;

var
  _Result: Boolean=False;
  _iCnt: Word=0;

function fnLogin_Run: Boolean;
begin
  Result := False;

  fmLogin := TfmLogin.Create(Application);
  try
    fmLogin.ShowModal;
  finally
    Result := _Result;
    fmLogin.Free;
  end;
end;

procedure TfmLogin.FormShow(Sender: TObject);
var
  iCnt : integer;
//  sID,
  sFile, sSql : String;
begin
//  edID.Text := 'GTRADE';
//  edPass.Text := '123123';
  edID.Text := 'ADMIN';      // TODO : 중요, 운영환경에서 삭제할것
  edPass.Text := 'ADMIN1228';

  sSql := 'SELECT CORP_NM, CORP_TEL FROM CORP_MST ';

  with dbSQL do begin
    if fnSqlOpen(dbSQL, sSql) = '' then begin
      pnTel.Caption := Format(' %s   Tel.%s', [FieldByName('CORP_NM').AsString, FieldByName('CORP_TEL').AsString]);
    end;
  end;

  edID.SetFocus;

  sFile := ExtractFilePath(ParamStr(0)) + 'IMG\GT_LOGO.BMP';

  chIDSave.Checked := StrToBool(Get_CFGFile('LOGIN', 'IDSAVE', '0'));
  if chIDSave.Checked then begin
    edID.Text := Get_CFGFile('LOGIN', 'USERID', '', True);
    edPass.SetFocus;
  end;

  if FileExists(sFile) then imgLogo.Picture.LoadFromFile(sFile);
end;

function TfmLogin.Get_Login(sID, sPass: String): Boolean;
var
  iCnt : integer;
//  sPc001,
  sSQL, sGrade, sTmp, sNm: String;
begin
  Result := False;
  _Supervisor := False;

  sSQL := 'SELECT CURR_TRADE_DT, CORP_NM FROM CORP_MST ';
  if fnSqlOpen(dbSQL, sSQL) = '' then begin
    _Trade_DT := dbSQL.FieldByName('CURR_TRADE_DT').AsString;
    _Corp_NM  := dbSQL.FieldByName('CORP_NM').AsString;
  end;

  sGrade := '';
  sSQL := Format(
    'SELECT USER_GRADE ' +
    '      ,USER_NM  ' +
    '  FROM USER_MST ' +
    ' WHERE USER_ID  = %s ' +
    '   AND USER_PWD = %s ',
    [QuotedStr(sID),
     QuotedStr(sPass) ]);
  if fnSqlOpen(dbSQL, sSQL) = '' then begin
    sGrade := dbSQL.FieldByName('USER_GRADE').AsString;
    sNm    := dbSQL.FieldByName('USER_NM').AsString;
//    G_USER_NM    := sNm;
    //G_USER_GRADE := sGrade;
  end;

  if sGrade = '' then begin
    inc(_iCnt);
    bsSkinMessage.MessageDlg2(Format('로그인 비밀번호 %d회 오류 (%d회중 %d회 남았습니다)', [_iCnt, _iTotal, _iTotal-_iCnt]), '오류', mtError, [mbOK], 0);

    edID.SetFocus;

    if _iTotal = _iCnt then begin
      bsSkinMessage.MessageDlg2('[로그인 불가] 슈퍼바이져에게 연락바랍니다.', '오류', mtError, [mbOK], 0);
      Application.Terminate;
    end;

    Exit;
  end else begin
    _Login_ID    := sID;
    _Login_Pwd   := sPass;
//    G_USER_ID    := sID;

    Set_LoginTP(dbSQL, sID, _Local_IP, 'I');

    if not ((sGrade = '8') or (sGrade = '9')) then begin
      bsSkinMessage.MessageDlg2('[로그인 불가] 회원는 관리자 프로그램을 이용하실 수 없습니다.', '오류', mtError, [mbOK], 0);
      Application.Terminate;

      Exit;
    end else begin
      if sGrade = '8' then begin  // Manager
        sSQL := 'SELECT MNG_ACPT_USE_YN FROM CORP_MST';
        if fnSqlOpen(dbSQL, sSQL) = '' then begin
          sTmp := dbSQL.FieldByName('MNG_ACPT_USE_YN').AsString;
        end;

        if Not (sTmp = 'N') then begin
          sSQL := Format('SELECT COUNT(1) AS CNT FROM MNG_ACPT_IP WHERE MIP_IP = %s', [QuotedStr(_Local_IP)]);
          if fnSqlOpen(dbSQL, sSQL) = '' then begin
            if dbSQL.FieldByName('CNT').AsInteger = 0 then begin
              bsSkinMessage.MessageDlg2(Format('[로그인 불가] 허용된 IP에서만 로그인이 가능합니다. (%s)', [_Local_IP]), '오류', mtError, [mbOK], 0);
              Application.Terminate;

              Exit;
            end;
          end;
        end;
      end;
    end;
  end;

  _Supervisor := sGrade = '9';

  fmMain.pnUserName.Caption := Format('Manager : %s (%s)', [sNm, sId]);

//  sPc001 := MastDB.PC001_Send;              //NOTI서버 패킷보내기 주석풀것!
//  MastDB.iwNotiClient.DataToSend := sPc001 + __EOL;

  if chIDSave.Checked then Set_CFGFile('LOGIN', 'USERID', edID.Text, True);
  Set_CFGFile('LOGIN', 'IDSAVE', BoolToStr(chIDSave.Checked));

  Result := True;
end;

procedure TfmLogin.btnCloseClick(Sender: TObject);
begin
  _Result := False;
  Close;
end;

procedure TfmLogin.btnLoginClick(Sender: TObject);
begin
  if (edID.Text = '') or (edPass.Text = '') then begin
    bsSkinMessage.MessageDlg2('관리자ID와 비밀번호를 입력하세요.', '오류', mtError, [mbOK], 0);
    Exit;
  end;

  _Result := Get_Login(edID.Text, edPass.Text);

  if _Result then begin
     Close;
     Exit;
  end;
end;

procedure TfmLogin.edPassKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then btnLogin.ButtonClick;
end;

procedure TfmLogin.imgLogoMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;
  SendMessage(Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0);
end;

procedure TfmLogin.pnCorpDblClick(Sender: TObject);
var
//  sNoti, sBiz,
  sText: String;
begin
  sText := UpperCase(InputBox('GT Solution', 'Password', ''));

  if sText = 'GTRADE09' then begin
    //sNoti := InputBox('Noti Server', 'IP|PORT', Format('%s|%d', [__Noti_IP,__Noti_Port]));

    //__Noti_IP   := Get_Delimiter(sNoti, 1);
    //__Noti_Port := StrToIntDef(Get_Delimiter(sNoti, 2), 20200);

    _BASE_SERVERIP := InputBox('Base Server', 'IP', _BASE_SERVERIP);
    _DefaultPort := StrToIntDef(InputBox('Base Server', 'PORT', IntToStr(_DefaultPort)), 20200);

    Set_CFGFile('G_B_NOTI', 'IP', _BASE_SERVERIP, True, _CFGServerIP);
    Set_CFGFile('G_B_NOTI', 'PORT', IntToStr(_DefaultPort), True, _CFGServerIP);

    _DisConnected := True;   //임시로직

    _DB_Server := '';
    MastDB.Connect_SQLDB;
  end else
  if sText = 'GTRADEWEB' then begin
    _UPDATE_DNS1 := InputBox('Update URL', 'Address1', _UPDATE_DNS1);
    _UPDATE_DNS2 := InputBox('Update URL', 'Address2', _UPDATE_DNS2);

    Set_CFGFile('UPDATE_SERVER', 'ADDRESS1', _UPDATE_DNS1, True, _CFGServerIP);
    Set_CFGFile('UPDATE_SERVER', 'ADDRESS2', _UPDATE_DNS2, True, _CFGServerIP);
  end else
  if sText = 'GT'then begin
    _POLLING_TIME  := StrToIntDef(InputBox('화면처리', 'Ping', IntToStr(_POLLING_TIME)), 60);

    if _POLLING_TIME < 30 then _POLLING_TIME := 30;

    //Set_CFGFile('MNG_OPTION', 'POLLING_TIME', IntToStr(_POLLING_TIME), False, __CFGServerIP);      // Polling Time
    Set_CFGFile('MNG_OPTION', 'POLLING_TIME', IntToStr(_POLLING_TIME), False);      // Polling Time

    with MastDB.tmPolling do begin
      Enabled  := False;
      Interval := _POLLING_TIME * 1000;
      Enabled  := True;
    end;
  end;
end;

end.
