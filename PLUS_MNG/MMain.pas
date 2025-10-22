unit MMain;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils,
  Dialogs, Messages, ImgList, Menus, TypInfo, 
//  DB, DBAccess, MemDS, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsDialogs, bsMessages, bsPngImageList, bsSkinMenus, bsRibbon,
  bsSkinData, bsSkinHint, bsSkinCtrls,
// Raize, kcRaize
  RzLstBox, kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEh, RzButton, RzRadChk, RzLabel, RzPanel, RzRadGrp;

type
  TfmMain = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinData: TbsSkinData;
    bsSkinHint: TbsSkinHint;
    bsResourceStrData: TbsResourceStrData;
    bsSkinPopupMenu: TbsSkinPopupMenu;
    Windows: TMenuItem;
    N4: TMenuItem;
    Cascade1: TMenuItem;
    ileVertical1: TMenuItem;
    ileHorizontal1: TMenuItem;
    N2: TMenuItem;
    CloseAll2: TMenuItem;
    bsPngImageList24: TbsPngImageList;
    bsPngImageList16: TbsPngImageList;
    bsSkinMessage: TbsSkinMessage;
    pmRibbon: TbsSkinPopupMenu;
    N6: TMenuItem;
    Showlayeredborders1: TMenuItem;
    N1: TMenuItem;
    Selectskin2: TMenuItem;
    bsSelectSkinsFromFoldersDialog: TbsSelectSkinsFromFoldersDialog;
    bsSkinStatusBar1: TbsSkinStatusBar;
    pnCorp: TbsSkinStatusPanel;
    bsRibbon1: TbsRibbon;
    bsPage1: TbsRibbonPage;
    btnUser: TbsSkinSpeedButton;
    btnNego: TbsSkinSpeedButton;
    bsSkinMDITabsBar: TbsSkinMDITabsBar;
    bsPage2: TbsRibbonPage;
    bsPage3: TbsRibbonPage;
    bsRibbonPage4: TbsRibbonPage;
    bsRibbonDivider4: TbsRibbonDivider;
    bsSelectSkinDialog: TbsSelectSkinDialog;
    Shape1: TShape;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    btnPart: TbsSkinSpeedButton;
    pnUserName: TbsSkinStatusPanel;
    pnLocalIP: TbsSkinStatusPanel;
    pnOption: TbsSkinStatusPanel;
    btnAcnt: TbsSkinSpeedButton;
    bsCompressedSkinList: TbsCompressedSkinList;
    btnArtc: TbsSkinSpeedButton;
    btnCorpMst: TbsSkinSpeedButton;
    btnGujaMst: TbsSkinSpeedButton;
    bsRibbonDivider1: TbsRibbonDivider;
    bsRibbonDivider2: TbsRibbonDivider;
    btnStk: TbsSkinSpeedButton;
    btnNoti: TbsSkinSpeedButton;
    btnOrdDetail: TbsSkinSpeedButton;
    btnNclr: TbsSkinSpeedButton;
    bsRibbonDivider3: TbsRibbonDivider;
    btnNoCntrOrd: TbsSkinSpeedButton;
    btnExchRt: TbsSkinSpeedButton;
    btnInOut: TbsSkinSpeedButton;
    btnPLList: TbsSkinSpeedButton;
    bsRibbonDivider5: TbsRibbonDivider;
    bsRibbonDivider6: TbsRibbonDivider;
    btnRealConn: TbsSkinSpeedButton;
    btnLossCut: TbsSkinSpeedButton;
    btnOverNgt: TbsSkinSpeedButton;
    btnHybrid: TbsSkinSpeedButton;
    bsRibbonDivider7: TbsRibbonDivider;
    btnBlockIp: TbsSkinSpeedButton;
    bsPage0: TbsRibbonPage;
    btnMngIp: TbsSkinSpeedButton;
    N3: TMenuItem;
    bsRibbonDivider8: TbsRibbonDivider;
    btnPLClsList: TbsSkinSpeedButton;
    btnLogList: TbsSkinSpeedButton;
    btnBatchScl: TbsSkinSpeedButton;
    btnPresent: TbsSkinSpeedButton;
    btnPower: TbsSkinSpeedButton;
    btnRealPL: TbsSkinSpeedButton;
    bsRibbonDivider9: TbsRibbonDivider;
    btnRealF: TbsSkinSpeedButton;
    btnRealGF: TbsSkinSpeedButton;
    cbxNotiRepeat: TRzCheckBox;
    cbxInOutRetry: TRzCheckBox;
    rbtNotiLocation: TRzRadioGroup;
    btnBank: TbsSkinSpeedButton;
    bsRibbonDivider10: TbsRibbonDivider;
    btnUserArtc: TbsSkinSpeedButton;
    btnOvApprove: TbsSkinSpeedButton;
    btnUserOv: TbsSkinSpeedButton;
    btnOvStatus: TbsSkinSpeedButton;
    btnUserStkPL: TbsSkinSpeedButton;
    btnStkPL: TbsSkinSpeedButton;
    bsRibbonDivider11: TbsRibbonDivider;
    bsRibbonDivider12: TbsRibbonDivider;
    btnConnIP: TbsSkinSpeedButton;
    btnRedoData: TbsSkinSpeedButton;
    btnTodayPL: TbsSkinSpeedButton;
    btnChatServer: TbsSkinSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bsRibbon1Buttons2Click(Sender: TObject);
    procedure bsRibbon1Buttons1Click(Sender: TObject);
    procedure bsSkinSpeedButton3Click(Sender: TObject);
    procedure bsRibbon1Buttons0Click(Sender: TObject);
    procedure pnOptionDblClick(Sender: TObject);
    procedure btnPowerClick(Sender: TObject);
    procedure pnLocalIPDblClick(Sender: TObject);
    procedure btnPartClick(Sender: TObject);
    procedure btnUserClick(Sender: TObject);
    procedure btnAcntClick(Sender: TObject);
    procedure btnArtcClick(Sender: TObject);
    procedure btnCorpMstClick(Sender: TObject);
    procedure btnGujaMstClick(Sender: TObject);
    procedure btnStkClick(Sender: TObject);
    procedure btnNotiClick(Sender: TObject);
    procedure btnNegoClick(Sender: TObject);
    procedure btnOrdDetailClick(Sender: TObject);
    procedure btnNclrClick(Sender: TObject);
    procedure btnNoCntrOrdClick(Sender: TObject);
    procedure btnExchRtClick(Sender: TObject);
    procedure btnInOutClick(Sender: TObject);
    procedure btnPLListClick(Sender: TObject);
    procedure btnRealConnClick(Sender: TObject);
    procedure btnLossCutClick(Sender: TObject);
    procedure btnOverNgtClick(Sender: TObject);
    procedure btnHybridClick(Sender: TObject);
    procedure btnBlockIpClick(Sender: TObject);
    procedure btnMngIpClick(Sender: TObject);
    procedure btnPLClsListClick(Sender: TObject);
    procedure btnLogListClick(Sender: TObject);
    procedure btnBatchSclClick(Sender: TObject);
    procedure btnPresentClick(Sender: TObject);
    procedure btnRealPLClick(Sender: TObject);
    procedure btnRealFClick(Sender: TObject);
    procedure btnRealGFClick(Sender: TObject);
    procedure Showlayeredborders1Click(Sender: TObject);
    procedure Selectskin2Click(Sender: TObject);
    procedure rbtNotiLocationClick(Sender: TObject);
    procedure btnBankClick(Sender: TObject);
    procedure btnUserArtcClick(Sender: TObject);
    procedure btnOvApproveClick(Sender: TObject);
    procedure btnOvStatusClick(Sender: TObject);
    procedure btnUserOvClick(Sender: TObject);
    procedure btnStkPLClick(Sender: TObject);
    procedure btnUserStkPLClick(Sender: TObject);
    procedure btnConnIPClick(Sender: TObject);
    procedure btnRedoDataClick(Sender: TObject);
    procedure btnTodayPLClick(Sender: TObject);
    procedure btnChatServerClick(Sender: TObject);
  private
    { Private declarations }
    procedure Power_Exec;
    procedure Power_Open(sUserID: String);
    procedure Exe_ChatManager;
    procedure Exe_update(sSvrNo, sURL, sFileName, sVerCheck, sMsgP: String);
  protected
    procedure WndProc(var Message: TMessage); override;
  public
    { Public declarations }
    function Check_FormCreate(sFormName: String): Boolean;
    function bsMsgYesNo(sMsg: String; sTitle: String='Ȯ��'): Boolean;
  end;

var
  fmMain: TfmMain;

implementation

uses StdUtils, PacketStruct, PacketThread, MBasic, MUser, MMastDB, MLogin, MPart,
  MNego, MInOut, MCorp, MStk, MNoti, MOrdDetail, MNclr, MNoCntrOrd, MArtc,
  MInOutList, GTNoti, MPLList, MRealConn, MLossCut, MBank, MTodayPL,
  MOverNgt, MHybrid, MBlockIp, MMngIp, MDBTool, MPLClsList, MLogList, MBatchScl,
  MPresent, MPower, MRealPL, MUserArtc, MOvApprove, MOvStatus, MUserOv, //GTUpdate,
  MStkPL, MUserStkPL, MConnIP, uChatClientM,
  MExchRt;
 // MScL, MAccount,

{$R *.dfm}

procedure TfmMain.bsRibbon1Buttons0Click(Sender: TObject);
begin
  if bsSelectSkinDialog.Execute( bsSkinData.SkinIndex) then
    bsSkinData.SkinIndex := bsSelectSkinDialog.SelectedSkinIndex;
end;

procedure TfmMain.bsRibbon1Buttons1Click(Sender: TObject);
begin
  bsBusinessSkinForm.Cascade;
end;

procedure TfmMain.bsRibbon1Buttons2Click(Sender: TObject);
begin
  bsBusinessSkinForm.CloseAll;
end;

procedure TfmMain.btnUserClick(Sender: TObject);
begin
  Form_Create(TfmUser, fmUser, 3);
end;

procedure TfmMain.btnAcntClick(Sender: TObject);
begin
  Form_Create(TfmInOut, fmInout, 3);
end;

procedure TfmMain.btnUserArtcClick(Sender: TObject);
begin
  Form_Create(TfmUserArtc, fmUserArtc, 3);
end;

procedure TfmMain.btnOvApproveClick(Sender: TObject);
begin
  Form_Create(TfmOvApprove, fmOvApprove, 3);
end;

procedure TfmMain.btnOvStatusClick(Sender: TObject);
begin
  Form_Create(TfmOvStatus, fmOvStatus, 3);
end;

procedure TfmMain.btnUserOvClick(Sender: TObject);
begin
  Form_Create(TfmUserOv, fmUserOv, 3);
end;

procedure TfmMain.btnNegoClick(Sender: TObject);
begin
  Form_Create(TfmNego, fmNego, 3);
end;

procedure TfmMain.btnNotiClick(Sender: TObject);
begin
  Form_Create(TfmNoti, fmNoti, 3);
end;

procedure TfmMain.btnRealConnClick(Sender: TObject);
begin
  Form_Create(TfmRealConn, fmRealConn, 3);
end;

procedure TfmMain.btnHybridClick(Sender: TObject);
begin
  Form_Create(TfmHybrid, fmHybrid, 3);
end;

procedure TfmMain.btnRealPLClick(Sender: TObject);
begin
  Form_Create(TfmRealPL, fmRealPL, 3);
end;

procedure TfmMain.btnBlockIpClick(Sender: TObject);
begin
  Form_Create(TfmBlockIp, fmBlockIp, 3);
end;

procedure TfmMain.btnOrdDetailClick(Sender: TObject);
begin
  Form_Create(TfmOrdDetail, fmOrdDetail, 3);
end;

procedure TfmMain.btnNclrClick(Sender: TObject);
begin
  Form_Create(TfmNclr, fmNclr, 3);
end;

procedure TfmMain.btnNoCntrOrdClick(Sender: TObject);
begin
  Form_Create(TfmNoCntrOrd, fmNoCntrOrd, 3);
end;

procedure TfmMain.btnInOutClick(Sender: TObject);
begin
  Form_Create(TfmInOutList, fmInOutList, 3);
end;

procedure TfmMain.btnPLListClick(Sender: TObject);
begin
  Form_Create(TfmPLList, fmPLList, 3);
end;

procedure TfmMain.btnPLClsListClick(Sender: TObject);
begin
  Form_Create(TfmPLClsList, fmPLClsList, 3);
end;

procedure TfmMain.btnStkPLClick(Sender: TObject);
begin
  Form_Create(TfmStkPL, fmStkPL, 3);
end;

procedure TfmMain.btnTodayPLClick(Sender: TObject);
begin
  Form_Create(TfmTodayPL, fmTodayPL, 3);
end;

procedure TfmMain.btnUserStkPLClick(Sender: TObject);
begin
  Form_Create(TfmUserStkPL, fmUserStkPL, 3);
end;

procedure TfmMain.btnLossCutClick(Sender: TObject);
begin
  Form_Create(TfmLossCut, fmLossCut, 3);
end;

procedure TfmMain.btnOverNgtClick(Sender: TObject);
begin
  Form_Create(TfmOverNgt, fmOverNgt, 3);
end;

procedure TfmMain.btnLogListClick(Sender: TObject);
begin
  Form_Create(TfmLogList, fmLogList, 3);
end;

procedure TfmMain.btnPresentClick(Sender: TObject);
begin
  Form_Create(TfmPresent, fmPresent, 1);
end;

procedure TfmMain.btnChatServerClick(Sender: TObject);
begin
//  ChatClientM_Run;
  Exe_ChatManager;
end;

procedure TfmMain.btnConnIPClick(Sender: TObject);
begin
  Form_Create(TfmConnIP, fmConnIP, 0);
end;

procedure TfmMain.btnCorpMstClick(Sender: TObject);
begin
  Form_Create(TfmCorp, fmCorp, 0);
end;

procedure TfmMain.btnGujaMstClick(Sender: TObject);
begin
  Form_Create(TfmCorp, fmCorp, 0);
end;

procedure TfmMain.btnArtcClick(Sender: TObject);
begin
  Form_Create(TfmArtc, fmArtc, 3);
end;

procedure TfmMain.btnStkClick(Sender: TObject);
begin
  Form_Create(TfmStk, fmStk, 3);
end;

procedure TfmMain.btnExchRtClick(Sender: TObject);
begin
  Form_Create(TfmExchRt, fmExchRt, 0);
end;

procedure TfmMain.btnBatchSclClick(Sender: TObject);
begin
  Form_Create(TfmBatchScl, fmBatchScl, 0);
end;

procedure TfmMain.btnPartClick(Sender: TObject);
begin
  Form_Create(TfmPart, fmPart, 0);
end;

procedure TfmMain.btnBankClick(Sender: TObject);
begin
  Form_Create(TfmBank, fmBank, 0);
end;

procedure TfmMain.btnMngIpClick(Sender: TObject);
begin
  Form_Create(TfmMngIp, fmMngIp, 3);
end;

procedure TfmMain.btnPowerClick(Sender: TObject);
begin
  Form_Create(TfmPower, fmPower, 3);
end;

procedure TfmMain.btnRealFClick(Sender: TObject);
begin
  if bsMsgYesNo('�������� �ü������� ������Ͻðڽ��ϱ�?') then MastDB.PM001_Send('F', 'G_F_REAL_F');
end;

procedure TfmMain.btnRealGFClick(Sender: TObject);
begin
  if bsMsgYesNo('�ؿܼ��� �ü������� ������Ͻðڽ��ϱ�?') then MastDB.PM001_Send('F', 'G_F_REAL_GF');
end;

procedure TfmMain.btnRedoDataClick(Sender: TObject);
begin
  if bsMsgYesNo('����Ÿ ������� �Ͻðڽ��ϱ�?') then MastDB.PM001_Send('F', 'G_F_REAL_GF');
end;

procedure TfmMain.pnOptionDblClick(Sender: TObject);
begin
  if InputBox('GT DB TOOLS', 'Password', '') = 'gtrade09' then begin
    Form_Create(TfmDbTool, fmDbTool, 3);
  end;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  TmpHWND: HWND;
begin
  if bsMsgYesNo('�����ڸ� ���� �Ͻðڽ��ϱ�? ') then begin
    Set_LoginTP(MastDB.dbSQL, _Login_ID, _Local_IP, 'O');

    if rbtNotiLocation.Buttons[0].Checked then _NotiLocation := 1
                                          else _NotiLocation := 2;

    if cbxNotiRepeat.Checked then _NotiRepeat := 1
                             else _NotiRepeat := 0;

    if cbxInOutRetry.Checked then _InOutRetry := 1
                             else _InOutRetry := 0;

    Set_CFGFile('NOTICE', 'POSITION', IntToStr(_NotiLocation));
    Set_CFGFile('NOTICE', 'RETRY', IntToStr(_NotiRepeat));
    Set_CFGFile('NOTICE', 'INOUT_RETRY', IntToStr(_InOutRetry));

    Set_CFGFile('GT_SKIN', 'INDEX', IntToStr(bsSkinData.SkinIndex));

    _DisConnected := True;

    MastDB.tmPolling.Enabled := False;
    MastDB.iwNotiClient.Disconnect;

    Application.ProcessMessages;

    TmpHWND := FindWindow(nil, PChar('ChatClientM'));
    if TmpHWND <> 0 then PostMessage(TmpHWND, WM_CLOSE, 0, 0);
  end else begin
    CanClose := False;
  end;
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  bLogin : Boolean;
//  bUpdateRun: Boolean;
//  sPc001: String;
  iServerNo : integer;
  sCallRun, sAppRun: String;
  sList: TStringList;
begin
  Application.ShowMainForm := False;

  _CFGServerIP := ExtractFilePath(ParamStr(0)) + 'GT_INF.CFG';

  _UPDATE_DNS1 := Get_CFGFile('UPDATE_SERVER', 'ADDRESS1', 'eclick.fxgolf.kr', True, _CFGServerIP);
  _UPDATE_DNS2 := Get_CFGFile('UPDATE_SERVER', 'ADDRESS2', 'eclick.fxgolf.kr', True, _CFGServerIP);

  _BASE_SERVERIP := Get_CFGFile('G_B_NOTI', 'IP', '', True, _CFGServerIP);
  _DefaultPort := StrToIntDef(Get_CFGFile('G_B_NOTI', 'PORT', '20200', True, _CFGServerIP), 20200);

  _NOTICE_WAV := True;
  _NOTICE_WAVFILE := ExtractFilePath(ParamStr(0)) +'SOUND\Confirm.wav';

  _NotiLocation := StrToIntDef(Get_CFGFile('NOTICE', 'POSITION', '2'), 2);
  if _NotiLocation = 1 then rbtNotiLocation.Buttons[0].Checked := True
                       else rbtNotiLocation.Buttons[1].Checked := True;

  _NotiRepeat := StrToIntDef(Get_CFGFile('NOTICE', 'RETRY', '0'), 0);
  if _NotiRepeat = 1 then cbxNotiRepeat.Checked := True
                     else cbxNotiRepeat.Checked := False;

  _InOutRetry := StrToIntDef(Get_CFGFile('NOTICE', 'INOUT_RETRY', '0'), 0);
  if _InOutRetry = 1 then cbxInOutRetry.Checked := True
                     else cbxInOutRetry.Checked := False;

// TODO : ���θ޴��� �����콺Ų���� ��ư�� ��Ų ����Ʈ �ٸ�, �ϳ��� ��ĥ��, FormClose�� ��Ų���忡 �ݿ��Ұ�
  bsSkinData.SkinIndex := StrToIntDef(Get_CFGFile('GT_SKIN', 'INDEX', '6'), 6);

  // App Update ----------------------------------------------------------------
//  bUpdateRun := ParamCount > 2;
  iServerNo := 0;
  sCallRun := '';
  if ParamCount > 0 then begin
    iServerNo := StrToInt(ParamStr(1));
    sCallRun := ParamStr(2);
  end;

// Update ���� �ʰ� ���α׷� �����Ҷ� ���
  sCallRun := 'UPDATE_Y';

//  if Not bUpdateRun then begin
  if sCallRun = '' then begin // Client�� �ٷ� ������ ���
//    if AutoUpdate_Run(_UPDATE_DNS1, 'mng_info.inf', True, False) then Exit else // 1�� URL, mng_info.inf�� ������ ����
//    if AutoUpdate_Run(_UPDATE_DNS2, 'mng_info.inf') then Exit;                  // 2�� URL

    Exe_update('1', _UPDATE_DNS1, 'mng_info.inf', 'T', 'F');
    Application.Terminate;
    Exit;
  end else
  if sCallRun = 'UPDATE_N' then begin // update ���� �߻��� ���
    if iServerNo = 1 then begin
      Exe_update('2', _UPDATE_DNS2, 'mng_info.inf', 'T', 'T');
      Application.Terminate;
      Exit;
    end;

    MsgError('���ͳ� ���°� �Ҿ��մϴ�. ������ϼ���.. ( Update )');
    Application.Terminate;
    Exit;
//    end else begin
    // update�� ���� �ʾ��� ��� ���α׷� ����
//      bsMsgError('���ͳ� ���°� �Ҿ��մϴ�. ������ϼ���.. ( Update )');
//      Application.Terminate;
//      Exit;
//    end;
  end else
  if sCallRun = 'UPDATE_Y' then begin // update ���� �߻��� ���

{  end else begin
    if (sAppRun = 'UPDATE_RUN') then begin
      if FileExists(ExtractFilePath(ParamStr(0)) + 'VER_HIS.TXT') then begin
        sList := TStringList.Create;
        try
          sList.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'VER_HIS.TXT');
          bsSkinMessage.MessageDlg2(sList.Text, '������Ʈ', mtInformation, [mbOK], 0);
        finally
          FreeAndNil(sList);
        end;
      end;
    end; // TODO : ���� �߻��� ���α׷� ������ ��
  end;}
  //----------------------------------------------------------------------------

    MastDB := TMastDB.Create(Nil);

    bLogin := fnLogin_Run;
    if Not bLogin then begin
      Application.Terminate;
      Exit;
    end;

    MastDB.iwNotiClient.DataToSend := MastDB.PC001_Send + _EOL;

    bsRibbon1.Tabs[4].Visible := _Supervisor;

    Application.ShowMainForm := bLogin;
  end;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  Caption := '';

  Power_Exec;

  pnLocalIP.Caption := GetLocalIP;
  pnCorp.Caption := _Corp_NM;
end;

procedure TfmMain.pnLocalIPDblClick(Sender: TObject);
begin
//  bsSkinMessage.MessageDlg('DataBase: ' + MastDB.UniConnection.Server, mtInformation, [mbYes], 0);
  bsSkinMessage.MessageDlg('DataBase: ' + _DB_Server, mtInformation, [mbYes], 0);
end;

procedure TfmMain.Power_Exec;
var
  i, iTag: Integer;
  Comp: TComponent;
begin
  Power_Open(_Login_ID);

  for i := 1 to bsRibbon1.Tabs.Count - 1 do
     bsRibbon1.Tabs[i].Visible := False;

  for i := 0 to ComponentCount - 1 do begin
    Comp := Components[i];
    iTag := Comp.Tag;

    if iTag = 0 then Continue;

    ComponetEnabled(Comp, False);

    with MastDB.dbPower do begin
      First;

      //for j:=0 to RecordCount -1 do begin
      while not Eof do begin
        if iTag = FieldByName('FORM_ID').AsInteger then
          ComponetEnabled(Comp, FieldByName('POWER_SHOW').AsString = 'Y');

        case iTag of
          9000: if FieldByName('FORM_ID').AsInteger = 9000 then bsRibbon1.Tabs[4].Visible := FieldByName('POWER_SHOW').AsString = 'Y';
          9001: if FieldByName('FORM_ID').AsInteger = 9001 then bsRibbon1.Tabs[1].Visible := FieldByName('POWER_SHOW').AsString = 'Y';
          9002: if FieldByName('FORM_ID').AsInteger = 9002 then bsRibbon1.Tabs[2].Visible := FieldByName('POWER_SHOW').AsString = 'Y';
        end;

        Next;
      end;
    end;
  end;

  bsRibbon1.ActivePage := bsPage1;
end;

procedure TfmMain.Power_Open(sUserID: String);
begin
  with MastDB.dbPower do begin
    try
      Close;
      SQL.Text := Format('SELECT FORM_ID, POWER_SHOW FROM POWER_MST WHERE USER_ID = %s', [QuotedStr(sUserID)]);
      Open;
    except
    end;
  end;
end;

procedure TfmMain.rbtNotiLocationClick(Sender: TObject);
begin
  if rbtNotiLocation.Buttons[0].Checked then _NotiLocation := 1  // ���� �ϴ�
                                        else _NotiLocation := 2; // ���� �ϴ�
end;

procedure TfmMain.Selectskin2Click(Sender: TObject);
var
  i: Integer;
begin
  for i := 1 to Screen.FormCount - 1 do
    Screen.Forms[i].Close;
end;

procedure TfmMain.Showlayeredborders1Click(Sender: TObject);
begin
  if bsSelectSkinDialog.Execute( bsSkinData.SkinIndex) then
    bsSkinData.SkinIndex := bsSelectSkinDialog.SelectedSkinIndex;
end;

procedure TfmMain.bsSkinSpeedButton3Click(Sender: TObject);
begin
  Showlayeredborders1.Click;
//  if bsSelectSkinsFromFoldersDialog.Execute(ExtractFilePath(ParamStr(0))+'Skins', bsSelectSkinsFromFoldersDialog.SkinName, 'skn') then
//    bsSkinData.LoadFromCompressedFile(bsSelectSkinsFromFoldersDialog.FileName);
end;

function TfmMain.Check_FormCreate(sFormName: String): Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 0 to Screen.FormCount - 1 do begin
    if Screen.Forms[i].Name = sFormName then begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TfmMain.WndProc(var Message: TMessage);
var
  NC001 : TNC001;
  NC002 : TNC002;
  NL002 : TNL002;
  NB001 : TNB001;
  sPacket, sData, sTm, sMsg: String;
begin
  inherited;

  if Message.Msg = WM_USER_NOTI_DATA then begin // Real Packet
    sPacket := PChar(Message.LParam);
    sData   := PChar(Message.WParam);

    if sPacket = 'NC001' then begin
      StrToRecord(sData, NC001, SizeOf(NC001));
      sTm := ArrToStr(NC001.GT_HEADER.TM);
//      Noti_Show(sTm, '����ݿ�û', ArrToStr(NC001.NOTI_MSG), 'fmInOut', '', _NotiLocation);
      Noti_Show(sTm, '����ݿ�û', ArrToStr(NC001.NOTI_MSG), 'fmInOut', ExtractFilePath(ParamStr(0)) +'SOUND\�����.wav', _NotiLocation);
    end;

    if sPacket = 'NC002' then begin
      StrToRecord(sData, NC002, SizeOf(NC002));
      sTm := ArrToStr(NC002.GT_HEADER.TM);
      Noti_Show(sTm, '�������ս�û', ArrToStr(NC002.NOTI_MSG), 'fmOverNgt', ExtractFilePath(ParamStr(0)) +'SOUND\�������ս�û.wav', _NotiLocation);
    end;

    if sPacket = 'NL002' then begin // �ν����뺸
      StrToRecord(sData, NL002, SizeOf(NL002));
      sTm  := ArrToStr(NL002.GTN_HEADER.GT_HEADER.TM);
      sMsg := Format('[ %s ] �Բ��� �ν��� �Ǿ����ϴ�.', [ArrToStr(NL002.GTN_HEADER.GT_HEADER.USER_ID)]);

      Noti_Show(sTm, '�ν��� �뺸', sMsg, '', ExtractFilePath(ParamStr(0)) +'SOUND\�ν���.wav', _NotiLocation);
    end;

    if sPacket = 'NB001' then begin
      StrToRecord(sData, NB001, SizeOf(NB001));

      if ArrToStr(NB001.NOTI_TP) = '01' then sMsg := '�ֹ�/ü��ó�� ����' else
      if ArrToStr(NB001.NOTI_TP) = '02' then sMsg := '�������ȯ �뺸' else
      if ArrToStr(NB001.NOTI_TP) = '03' then sMsg := '�ֹ��ź� �뺸';

      sTm  := ArrToStr(NB001.GT_HEADER.TM);
      Noti_Show(sTm, sMsg, ArrToStr(NB001.NOTI_MSG), '', '', _NotiLocation);
    end;
  end else
  if Message.Msg = WM_USER_NOTI_RESULT then begin
    if PChar(Message.WParam) = 'fmInOut' then begin
      if Not Check_FormCreate('fmInOut') then begin
        Form_Create(TfmInOut , fmInOut, 3);
      end else begin
        with fmInOut do begin
          Show;
          TbsSkinSpeedButton(FindComponent('btnFilter')).ButtonClick;
        end;
      end;
    end;

    if PChar(Message.WParam) = 'fmOverNgt' then begin
      if Not Check_FormCreate('fmOverNgt') then begin
        Form_Create(TfmOverNgt , fmOverNgt, 3);
      end else begin
        with fmOverNgt do begin
          Show;
          TbsSkinSpeedButton(FindComponent('btnFilter')).ButtonClick;
        end;
      end;
    end;

    if PChar(Message.WParam) = 'fmHybrid' then begin
      if Not Check_FormCreate('fmHybrid') then begin
        Form_Create(TfmHybrid , fmHybrid, 3);
      end else begin
        with fmHybrid do begin
          Show;
          TbsSkinSpeedButton(FindComponent('btnFilter')).ButtonClick;
        end;
      end;
    end;
  end;
end;

function TfmMain.bsMsgYesNo(sMsg: String; sTitle: String='Ȯ��'): Boolean;
begin
  sMsg := StrReplace(sMsg, '\n', #13#10);
  Result := bsSkinMessage.MessageDlg2(sMsg, sTitle, mtConfirmation, [mbYes, mbNo], 0) = mrYes;
end;

procedure TfmMain.Exe_ChatManager;
var
  ProcessID : Cardinal;
  sPath, sProcessNm, sFileNm, sParam : string;
begin
  sPath := ExtractFilePath(ParamStr(0));
  sProcessNm := 'ChatManager.exe';
  sFileNm := sPath + sProcessNm;

  ProcessID := GetProcessID(sProcessNm);
  if ProcessID = 0 then begin
    sParam := Format('%s %s %s %s', [G_USER_ID, G_USER_NM, G_CHAT_IP, IntToStr(G_CHAT_PORT)]);
//    ShellExecute(Handle, 'open', PChar(sFileNm), PChar(sParam), nil, SW_SHOWNORMAL);
    RunAsAdmin(sFileNm, sParam);
  end else begin
    BringProcessToFront('ChatClientM');
  end;
end;

procedure TfmMain.Exe_update(sSvrNo, sURL, sFileName, sVerCheck, sMsgP: String);
var
  ProcessID : Cardinal;
  sPath, sProcessNm, sProgNm, sParam : string;
begin
  sPath := ExtractFilePath(ParamStr(0));
  sProcessNm := 'GT_UPDATE.exe';
  sProgNm := sPath + sProcessNm;

  ProcessID := GetProcessID(sProcessNm);
  if ProcessID = 0 then begin
    sParam := Format('%s %s %s %s %s', [sSvrNo, sURL, sFileName, sVerCheck, sMsgP]);
//    ShellExecute(Handle, 'open', PChar(sFileNm), PChar(sParam), nil, SW_SHOWNORMAL);
    RunAsAdmin(sProgNm, sParam);
  end else begin
    BringProcessToFront('GT_UPDATE');
  end;
end;

end.
