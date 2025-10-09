unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, bsDialogs, bsMessages, ImgList, bsPngImageList, bsSkinData, Math,
  ExtActns, WinInet,
  bsSkinHint, BusinessSkinForm, bsSkinCtrls, StdCtrls, jpeg, ExtCtrls, VCLUnZip,
  ShellApi;

type
  TfmMain = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinData: TbsSkinData;
    bsSkinHint: TbsSkinHint;
    bsCompressedSkinList: TbsCompressedSkinList;
    bsResourceStrData: TbsResourceStrData;
    bsPngImageList24: TbsPngImageList;
    bsPngImageList16: TbsPngImageList;
    bsSkinMessage: TbsSkinMessage;
    bsSelectSkinDialog: TbsSelectSkinDialog;
    bsSkinPanel2: TbsSkinPanel;
    pnCorp: TbsSkinStatusPanel;
    pnTel: TbsSkinStatusPanel;
    Panel1: TPanel;
    imgLogo: TImage;
    lbName: TLabel;
    pgMeter: TbsSkinGauge;
    VCLUnZip: TVCLUnZip;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure VCLUnZipUnZipComplete(sender: TObject; FileCount: Integer);
    procedure VCLUnZipStartUnZip(Sender: TObject; FileIndex: Integer;
      var FName: string; var Skip: Boolean);
    procedure VCLUnZipTotalPercentDone(Sender: TObject; Percent: Integer);
  private
    procedure Exe_Client(sSvrNo, AParam: string);
    procedure Run_Update;
    procedure GT_Update(sURL: String);
    procedure URL_OnDownloadProgress(Sender: TDownLoadURL; Progress,
      ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
      var Cancel: Boolean);
    { Private declarations }
  public
    { Public declarations }
    procedure GT_UpZip;
  end;

var
  fmMain: TfmMain;
  procedure RunAsAdmin(const FileName, Params: string);

implementation

uses StdUtils;

{$R *.dfm}

var
  __UPD_CORP_NM  : String; // 업데이트파일/LOGIN 하단 업체명
  __UPD_CORP_MSG : String; // 업데이트파일/LOGIN 하단 메세지
  __HTS_VER      : String; // HTS Version (YJM : 사용하는곳 없음)

  _UpdateDir,
  _ZipFile: String;

  _VerList,
  _InfoList: TStringList;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmMain.FormCreate(Sender: TObject);
begin
  Application.ShowMainForm := False;

  if ParamCount <> 5 then begin
    Application.Terminate;
    Exit;
  end;

  Application.ShowMainForm := True;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  SetWindowPos(handle, HWND_TOPMOST, Left, Top, Width, Height, SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
  Timer1.Enabled := True;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Run_Update;
end;

procedure TfmMain.Run_Update;
var
//  sServerIP,
  sServerNo, sURL, sFileName, sVerCheck, sMsgP,
  sInfoURL, sInfoFile, sOldFile, sMsg: String;
  dOldVer, dNewVer: Double;
begin
//  AutoUpdate_Run(sIP, sFileName: String; bVerCheck: Boolean=True; bMsg: Boolean=True): Boolean;

//  sServerIP := ExtractFilePath(ParamStr(0)) + 'GT_INF.CFG';
//  sURL := Get_CFGFile('UPDATE_SERVER', 'ADDRESS1', 'eclick.fxgolf.kr', True, sServerIP);
//  sFileName := 'mng_info.inf';
//  bVerCheck := True;
//  bMsg := False;

  sServerNo := ParamStr(1);
  sURL := ParamStr(2);
  sFileName := ParamStr(3);
  sVerCheck := ParamStr(4);
  sMsgP := ParamStr(5);

  if StrToIntDef(sServerNo, 0) < 1 then begin
    Exe_Client(sServerNo, 'UPDATE_N');
    Application.Terminate;
    Exit;
  end;

  sInfoURL   := Format('http://%s/update/mng/%s', [sURL, sFileName]); // TODO : 파라미터로 받아서 처리할것
  _UpdateDir := ExtractFilePath(ParamStr(0)) + 'UPDATE\';
  sInfoFile  := _UpdateDir + 'VER_INFO.INF';
  sOldFile   := ExtractFilePath(ParamStr(0)) + 'VER_INFO.INF';

  _VerList.Clear;
  _InfoList.Clear;

  if sVerCheck = 'F' then begin
    DeleteFile(sOldFile);
    Sleep(500);
  end;

  Application.ProcessMessages;

  if InfoDownloadToFile(sInfoURL, sInfoFile) then begin
    if FileExists(sOldFile)  then _VerList.LoadFromFile(sOldFile);
    if FileExists(sInfoFile) then _InfoList.LoadFromFile(sInfoFile);

    __UPD_CORP_NM  := _InfoList.Values['CORP_NM'];
    __UPD_CORP_MSG := _InfoList.Values['CORP_MSG'];

    if UpperCase(_InfoList.Values['NOTICE_SHOW']) = 'TRUE' then begin
      sMsg := StrReplace(_InfoList.Values['NOTICE_MSG'], '\n', #13#10);
      bsSkinMessage.MessageDlg2(sMsg, '긴급공지', mtInformation, [mbOK], 0);

      if UpperCase(_InfoList.Values['APP_RUN']) = 'FALSE' then begin
        Application.Terminate;
        Exit;
      end;
    end;

    dOldVer := StrToFloatDef(_VerList.Values['VERSION'], 0);
    dNewVer := StrToFloatDef(_InfoList.Values['VERSION'], 0);

    __HTS_VER := FloatToStr(dNewVer);

    if CompareValue(dOldVer, dNewVer) < 0 then begin
      Show;

      sInfoURL := _InfoList.Values['URLFILENAME'];

      pnCorp.Caption := ' ' + _InfoList.Values['NAME'];
      lbName.Caption := 'Download Files.. ' + sInfoURL;
      GT_Update(Format('http://%s/update/%s', [sURL, sInfoURL]));

      CopyFile(PChar(sInfoFile), PChar(sOldFile), False);
    //end else begin
    //  Close;
      sleep(500);
      //pgMeter.ProgressText := 'unZip...';
      GT_UpZip;
    end;
    Exe_Client(sServerNo, 'UPDATE_Y');
  end else begin
    if sMsgP = 'T' then
      bsSkinMessage.MessageDlg2('업데이트 정보파일을 다운로드 하지 못했습니다.', '오류', mtError, [mbOK], 0);

    Exe_Client(sServerNo, 'UPDATE_N');
    //Close;
  end;
  Application.Terminate;
end;

procedure TfmMain.GT_Update(sURL: String);
var
  DownloadURL: TDownloadURL;
begin
  DeleteUrlCacheEntry(PChar(sURL));

  DownloadURL := TDownloadURL.Create(nil);
  with DownloadURL do begin
    try
      _ZipFile := _UpdateDir + 'update_mng.ZIP';

      OnDownloadProgress := URL_OnDownloadProgress;

      URL := sURL;
      FileName := _ZipFile;

      ExecuteTarget(nil);
    finally
      FreeAndNil(DownloadURL);
    end;
  end;
end;

procedure TfmMain.URL_OnDownloadProgress(Sender: TDownLoadURL; Progress,
  ProgressMax: Cardinal; StatusCode: TURLDownloadStatus; StatusText: String;
  var Cancel: Boolean);
begin
  with pgMeter do begin
    ProgressText := '다운로드중.. ';
    MaxValue := ProgressMax;
    Value    := Progress;

    if (MaxValue = Value) and (Value > 0) then begin
      ProgressText := '다운로드 완료.. ';
    end;
  end;

  Application.ProcessMessages;
end;

procedure TfmMain.Exe_Client(sSvrNo, AParam:string);
var
  ProcessID : Cardinal;
  sPath, sProcessNm, sFileNm, sParam : string;
begin
  sPath := ExtractFilePath(ParamStr(0));
  sProcessNm := 'PLUS_MNG.exe';
  sFileNm := sPath + sProcessNm;

  ProcessID := GetProcessID(sProcessNm);
  if ProcessID = 0 then begin
    sParam := Format('%s %s', [sSvrNo, AParam]);
//    ShellExecute(Handle, 'open', PChar(sFileNm), PChar(sParam), nil, SW_SHOWNORMAL);
    RunAsAdmin(sFileNm, sParam);
  end else begin
    BringProcessToFront('PLUS_MNG');
  end;
end;

procedure TfmMain.VCLUnZipStartUnZip(Sender: TObject; FileIndex: Integer;
  var FName: string; var Skip: Boolean);
begin
  lbName.Caption := 'Extract Files.. ' + FName;
end;

procedure TfmMain.VCLUnZipTotalPercentDone(Sender: TObject; Percent: Integer);
begin
  with pgMeter do begin
    ProgressText := '압축 푸는중.. - ';

    MaxValue := 100;
    Value    := Percent;
  end;
end;

procedure TfmMain.VCLUnZipUnZipComplete(sender: TObject; FileCount: Integer);
begin
  pgMeter.ProgressText := '압축풀기 완료.. ';

//  Shellexecute(Handle, 'open', PChar(_UpdateDir + _InfoList.Values['COPY_FILENAME']), PChar(Application.ExeName), nil, SW_SHOWNORMAL);
//  Application.Terminate;
end;

procedure TfmMain.GT_UpZip;
var
  iResult : integer;
begin
  with VCLUnZip do begin
//    ZipName := _ZipFile;
    ZipName := ExtractFilePath(ParamStr(0)) + 'UPDATE\update_mng.ZIP';
    ReadZip;

    FilesList.Add(_InfoList.Values['COPY_FILENAME']);

//    DoAll := False;
    DoAll := True;
//    DestDir := ExtractFilePath(ParamStr(0)) + 'UPDATE';
    DestDir := ExtractFilePath(ParamStr(0));
    RecreateDirs := True;
    RetainAttributes := True;

    iResult := Unzip;
//    showMessage(Inttostr(iResult));
  end;
end;

procedure RunAsAdmin(const FileName, Params: string);
var
  sei: TShellExecuteInfo;
begin
  ZeroMemory(@sei, SizeOf(sei));
  sei.cbSize := SizeOf(TShellExecuteInfo);
  sei.fMask := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI;
  sei.Wnd := 0;
  sei.lpVerb := 'runas'; // 관리자 권한으로 실행
  sei.lpFile := PChar(FileName);
  sei.lpParameters := PChar(Params);
  sei.lpDirectory := nil;
  sei.nShow := SW_SHOWNORMAL;

  if not ShellExecuteEx(@sei) then
    ShowMessage('실행 실패: ' + SysErrorMessage(GetLastError));
end;

initialization
  _VerList := TStringList.Create;
  _InfoList := TStringList.Create;

finalization
  FreeAndNil(_InfoList);
  FreeAndNil(_VerList);

end.
