unit uChatServer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdBaseComponent, IdComponent, IdTCPServer, IdThreadMgr,
  IdThreadMgrDefault, StdCtrls, ComCtrls, IdAntiFreezeBase, IdAntiFreeze,
  ExtCtrls, bsSkinCtrls;

type
  TfrmChatServer = class(TForm)
    IdTCPServer1: TIdTCPServer;
    IdThreadMgrDefault1: TIdThreadMgrDefault;
    IdAntiFreeze1: TIdAntiFreeze;
    lbUserList: TListBox;
    bsSkinPanel1: TbsSkinPanel;
    RichEdit1: TRichEdit;
    edtMsg: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure IdTCPServer1Execute(AThread: TIdPeerThread);
    procedure edtMsgKeyPress(Sender: TObject; var Key: Char);
    procedure IdTCPServer1Connect(AThread: TIdPeerThread);
    procedure IdTCPServer1Disconnect(AThread: TIdPeerThread);
    procedure lbUserListClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ClientList : TList;
    procedure prLogin(AThread: TIdPeerThread; slMsg: TStringList);
    procedure prMsg(AThread: TIdPeerThread; slMsg: TStringList);
    procedure prTalk(AThread: TIdPeerThread; slMsg: TStringList);
  public
    { Public declarations }
  end;

type
  TClientInfo = class(TObject)
  public
    UserID : string;
  end;

var
  frmChatServer: TfrmChatServer;

implementation

{$R *.dfm}

const
  LF = #10;
  CR = #13;
  RS = #30; // record separator
  NoticeAll = 'Notice to all';
var
  gsSelectedUser : string = '';

procedure TfrmChatServer.edtMsgKeyPress(Sender: TObject; var Key: Char);
var
  i : integer;
  sStr : string;
  Client : TClientInfo;
  IdPeerThread : TIdPeerThread;
begin
  if Key = #13 then begin
    Key := #0; // Key Press 소리가 나지 않도록 함

    sStr := Trim(edtMsg.Text);
    if sStr = '' then Exit;

    if lbUserList.Items.Count = 1 then begin
      ShowMessage('접속한 고객이 없습니다.');
      Exit;
    end;

    if gsSelectedUser = '' then begin
      ShowMessage('고객을 먼저 선택하세요.');
      Exit;
    end;

    ClientList := IdTCPServer1.Threads.LockList;
    try
      if ClientList.Count = 0 then Exit;
      for i:=0 to ClientList.Count-1 do begin // 모든 Client에 메시지 전송

        IdPeerThread := TIdPeerThread(ClientList.Items[i]);
        Client := Pointer(IdPeerThread.Data);
        //if Client.UserID <> gsSelectedUser then Continue;
        if (Client.UserID = gsSelectedUser) or (gsSelectedUser = NoticeAll) then begin
          try
            IdPeerThread.Connection.WriteLn(sStr);
          except
            IdPeerThread.Stop;
          end;
        end;
      end;
    finally
      IdTCPServer1.Threads.UnlockList;
    end;

    RichEdit1.Paragraph.Alignment := taLeftJustify;
    RichEdit1.Lines.Add(sStr);
    SendMessage(RichEdit1.Handle, WM_VSCROLL, SB_BOTTOM, 0);

    edtMsg.Text := '';
  end;
end;

procedure TfrmChatServer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmChatServer.FormCreate(Sender: TObject);
begin
  IdTCPServer1.DefaultPort := 20202; // 환경파일에서 읽어올것
  IdTCPServer1.Active := True;

//   gsSelectedUser := NoticeAll;
//   lbUserList.Items.IndexOf(NoticeAll);
end;

procedure TfrmChatServer.FormDestroy(Sender: TObject);
begin
  IdTCPServer1.Active := False;
end;

procedure TfrmChatServer.FormShow(Sender: TObject);
begin
  lbUserList.Items.Add(NoticeAll);
  lbUserList.ItemIndex := 0;
  lbUserListClick(Sender);
  edtMsg.SetFocus;
end;

procedure TfrmChatServer.IdTCPServer1Disconnect(AThread: TIdPeerThread);
var
  Client : TClientInfo;
begin
  Client := Pointer(AThread.Data);
  if Client = nil then Exit;
  AThread.Data := nil;
  Client.Free;
end;

procedure TfrmChatServer.IdTCPServer1Connect(AThread: TIdPeerThread);
var
  Client : TClientInfo;
begin
  Client := TClientInfo.Create;
  AThread.Data := Client;
end;

procedure TfrmChatServer.IdTCPServer1Execute(AThread: TIdPeerThread);
var
  sStr : string;
  slMsg : TStringList;
  Client : TClientInfo;
begin
  Client := Pointer(AThread.Data);
  if Client = nil then Exit;

  sStr := AThread.Connection.ReadLn('', 5);
  if Trim(sStr) = '' then Exit;

  slMsg := TStringList.Create;
  try
    slMsg.Text := StringReplace(sStr, RS, CR, [rfReplaceAll]); // ';'로 문자열 자르기

    if LowerCase(slMsg.Strings[0]) = 'login' then prLogin(AThread, slMsg) else
    if LowerCase(slMsg.Strings[0]) = 'talk'  then prTalk(AThread, slMsg) else
    if LowerCase(slMsg.Strings[0]) = 'msg'   then prMsg(AThread, slMsg);

  finally
    slMsg.Free;
  end;
end;

procedure TfrmChatServer.lbUserListClick(Sender: TObject);
var
  sDir, sFileName, sFile : string;
begin
  gsSelectedUser := lbUserList.Items[lbUserList.ItemIndex];

  sDir := ExtractFilePath(ParamStr(0)) + 'ChatLog'; // TODO : Form Create로 이동하여 global 변수로 선언할것
  sFileName := ExtractFileName(ParamStr(0));

  if Not DirectoryExists(sDir) then ForceDirectories(sDir);

  sFile := Format('%s\%s.LOG', [sDir,
                                gsSelectedUser]);


  //if FileExists('ChatLog\'+gsSelectedUser+'.log') then begin
  if FileExists(sFile) then begin
    //    RichEdit1.Lines.LoadFromFile('ChatLog\'+gsSelectedUser+'.log');
    RichEdit1.Lines.LoadFromFile(sFile);
  end else begin
    RichEdit1.Clear;
    //RichEdit1.Lines.SaveToFile('ChatLog\'+Trim(gsSelectedUser)+'.log'); // TODO : 전체보내기 저장 로직 위치 다시 확인할것
    RichEdit1.Lines.SaveToFile(sFile); // TODO : 전체보내기 저장 로직 위치 다시 확인할것
  end;

  edtMsg.SetFocus;
end;

procedure TfrmChatServer.prLogin(AThread: TIdPeerThread; slMsg: TStringList);
var
  Client : TClientInfo;
begin
  Client := Pointer(AThread.Data);

  Client.UserID := slMsg.Strings[1];
  lbUserList.Items.Add(Client.UserID);
end;

procedure TfrmChatServer.prTalk(AThread: TIdPeerThread; slMsg: TStringList);
var
  i : integer;
  sStr : string;
  List : TList;
  IdPeerThread : TIdPeerThread;
  Client : TClientInfo;
begin
  RichEdit1.Paragraph.Alignment := taRightJustify;
  RichEdit1.Lines.Add('['+slMsg.Strings[1]+'] '+slMsg.Strings[3]);
  SendMessage(RichEdit1.Handle, WM_VSCROLL, SB_BOTTOM, 0);

  sStr := StringReplace(slMsg.Text, CR+LF, RS, [rfReplaceAll]);

  List := IdTCPServer1.Threads.LockList;
  try
    for i:=0 to List.Count-1 do begin
      IdPeerThread := TIdPeerThread(ClientList.Items[i]);
      IdPeerThread.Connection.WriteLn(sStr);

      Client := Pointer(TIdPeerThread(List.Items[i]).Data);
      if Client = nil then Continue;
      RichEdit1.Lines.SaveToFile('ChatLog\'+Trim(Client.UserID)+'.log');
    end;
  finally
    IdTCPServer1.Threads.UnlockList;
  end;
end;

procedure TfrmChatServer.prMsg(AThread: TIdPeerThread; slMsg: TStringList);
var
  i : integer;
  sStr : string;
  List : TList;
  Client : TClientInfo;
begin
  RichEdit1.Paragraph.Alignment := taRightJustify;
  RichEdit1.Lines.Add('['+slMsg.Strings[1]+'] '+slMsg.Strings[3]);
  SendMessage(RichEdit1.Handle, WM_VSCROLL, SB_BOTTOM, 0);

  RichEdit1.Lines.SaveToFile('ChatLog\'+Trim(gsSelectedUser)+'.log'); // TODO : 전체보내기 저장 로직 위치 다시 확인할것

  sStr := StringReplace(slMsg.Text, CR+LF, RS, [rfReplaceAll]);

  List := IdTCPServer1.Threads.LockList;
  try
    for i:=0 to List.Count-1 do begin
      Client := Pointer(TIdPeerThread(List.Items[i]).Data);

      if Client = nil then Continue;
      if Client.UserID <> slMsg.Strings[2] then Continue;

      TIdPeerThread(List.Items[i]).Connection.WriteLn(sStr);

      RichEdit1.Lines.SaveToFile('ChatLog\'+Trim(Client.UserID)+'.log');
    end;
  finally
    IdTCPServer1.Threads.UnlockList;
  end;
end;

end.
