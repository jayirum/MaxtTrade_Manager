unit MArtcOpt;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, ImgList, Dialogs, Graphics,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsMessages,
// Raize, kcRaize
  RzEdit, RzDBEdit, RzCmboBx, kcRaizeCtrl,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh;

type
  TfmArtcOpt = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    dsMain: TDataSource;
    imgBtn: TImageList;
    dbMain: TADOQuery;
    pnFilter: TbsSkinPanel;
    bsSkinLabel8: TbsSkinLabel;
    btnClose: TbsSkinSpeedButton;
    bsSkinPanel1: TbsSkinPanel;
    btnBP_Y: TbsSkinSpeedButton;
    btnBP_N: TbsSkinSpeedButton;
    edNmBP: TkcRzEdit;
    bsSkinPanel2: TbsSkinPanel;
    btnYM_Y: TbsSkinSpeedButton;
    btnYM_N: TbsSkinSpeedButton;
    edNmYM: TkcRzEdit;
    bsSkinPanel3: TbsSkinPanel;
    btnURO_Y: TbsSkinSpeedButton;
    btnURO_N: TbsSkinSpeedButton;
    edNmURO: TkcRzEdit;
    bsSkinPanel4: TbsSkinPanel;
    btnNQ_Y: TbsSkinSpeedButton;
    btnNQ_N: TbsSkinSpeedButton;
    edNmNQ: TkcRzEdit;
    bsSkinPanel5: TbsSkinPanel;
    btnJY_Y: TbsSkinSpeedButton;
    btnJY_N: TbsSkinSpeedButton;
    edNmJY: TkcRzEdit;
    bsSkinPanel6: TbsSkinPanel;
    btnGC_Y: TbsSkinSpeedButton;
    btnGC_N: TbsSkinSpeedButton;
    edNmGC: TkcRzEdit;
    bsSkinPanel7: TbsSkinPanel;
    btnES_Y: TbsSkinSpeedButton;
    btnES_N: TbsSkinSpeedButton;
    edNmES: TkcRzEdit;
    bsSkinPanel8: TbsSkinPanel;
    btnCL_Y: TbsSkinSpeedButton;
    btnCL_N: TbsSkinSpeedButton;
    edNmCL: TkcRzEdit;
    edBP: TkcRzEdit;
    edCL: TkcRzEdit;
    edES: TkcRzEdit;
    edGC: TkcRzEdit;
    edJY: TkcRzEdit;
    edNQ: TkcRzEdit;
    edURO: TkcRzEdit;
    edYM: TkcRzEdit;
    edUser: TkcRzEdit;
    bsSkinPanel9: TbsSkinPanel;
    btnHSI_Y: TbsSkinSpeedButton;
    btnHSI_N: TbsSkinSpeedButton;
    edNmHSI: TkcRzEdit;
    edHSI: TkcRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnBP_YClick(Sender: TObject);
    procedure btnBP_NClick(Sender: TObject);
    procedure btnCL_YClick(Sender: TObject);
    procedure btnCL_NClick(Sender: TObject);
    procedure btnES_YClick(Sender: TObject);
    procedure btnES_NClick(Sender: TObject);
    procedure btnGC_YClick(Sender: TObject);
    procedure btnGC_NClick(Sender: TObject);
    procedure btnJY_YClick(Sender: TObject);
    procedure btnJY_NClick(Sender: TObject);
    procedure btnNQ_YClick(Sender: TObject);
    procedure btnNQ_NClick(Sender: TObject);
    procedure btnURO_YClick(Sender: TObject);
    procedure btnURO_NClick(Sender: TObject);
    procedure btnYM_YClick(Sender: TObject);
    procedure btnYM_NClick(Sender: TObject);
  private
    { Private declarations }
    function RowCntCheck(sCd:String):Boolean;
    procedure prUpdateArtc(sCd, sUseYN : String);
    procedure prArtcUseYN(sArtcYN, sYN: string; const edArtcNm, edArtc: TkcRzEdit; const btnY,
      btnN: TbsSkinSpeedButton);
  public
    { Public declarations }
    procedure MainTableOpen;
  end;

var
  fmArtcOpt: TfmArtcOpt;
  function fmArtcOpt_Run(sUserID, sUserNM : String):BOOLEAN;

implementation

uses
  stdUtils, MMastDB, MDelay;

{$R *.dfm}

var
  _UserID, _UserNM : String;
  _Result : BOOLEAN=FALSE;

function fmArtcOpt_Run(sUserID, sUserNM : String):BOOLEAN;
begin
  Application.CreateForm(TfmArtcOpt, fmArtcOpt);
  try
    _UserID := sUserID;
    _UserNM := sUserNM;

    fmArtcOpt.ShowModal;
  finally
    RESULT := _Result;
    fmArtcOpt.Free; // TODO : Close로 대체하고 Close 이벤트에 Action := caFree 추가
  end;
end;

procedure TfmArtcOpt.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmArtcOpt.FormCreate(Sender: TObject);
begin
  SetADOConn(fmArtcOpt);
end;

procedure TfmArtcOpt.FormShow(Sender: TObject);
begin
  edUser.Text := _UserNM + ' - ' + _UserID;

  MainTableOpen;
end;

procedure TfmArtcOpt.prArtcUseYN(sArtcYN, sYN:string; const edArtcNm, edArtc:TkcRzEdit; const btnY, btnN:TbsSkinSpeedButton);
begin
  if sArtcYN = 'N' then begin
      edArtc.Text  := '주문불가';
      edArtc.Color := $00F0F0FF;
      edArtcNm.Enabled := False;
      btnY.Enabled := False;
      btnN.Enabled := False;
  end else begin
    if sYN = 'Y' then begin
      edArtc.Text  := '주문가능';
      edArtc.Color := clWhite;
      btnY.Enabled := False;
      btnN.Enabled := True;
    end else begin
      edArtc.Text  := '주문불가';
      edArtc.Color := $00F0F0FF;
      btnY.Enabled := True;
      btnN.Enabled := False;
    end;
  end;
end;

procedure TfmArtcOpt.MainTableOpen;
var
  i : integer;
  sSql, sResult, sArtcCD, sArtcYN, sUseYN : String;
begin
  sSql := Format(
    'SELECT B.USER_ID ' +
    '      ,A.ARTC_CD ' +
    '      ,A.ARTC_NM ' +
    '      ,ISNULL(A.ARTC_USE_YN, ''N'') ARTC_YN' +
    '      ,ISNULL(B.ARTC_USE_YN, ''N'') ARTC_USE_YN ' +
    '  FROM ARTC_MST  A LEFT OUTER JOIN ' +
    '       NEGO_ARTC B ON A.ARTC_CD = B.ARTC_CD AND B.USER_ID = %s ' +
    ' WHERE A.ACNT_TP = %s ', //AND A.ARTC_USE_YN = %s ',
    [QuotedStr(_UserID),
     QuotedStr('2') ]);
     //QuotedStr('Y') ]);
  sResult := fnSqlOpen(dbMain, sSql);

  if sResult = '' then begin
    with dbMain do begin
      for i:=0 to RecordCount-1 do begin
        sArtcCD := FieldByName('ARTC_CD').AsString;
        sArtcYN := FieldByName('ARTC_YN').AsString;
        sUseYN  := FieldByName('ARTC_USE_YN').AsString;

        if sArtcCD = 'BP'  then prArtcUseYN(sArtcYN, sUseYN, edNmBP,  edBP,  btnBP_Y,  btnBP_N)  else
        if sArtcCD = 'CL'  then prArtcUseYN(sArtcYN, sUseYN, edNmCL,  edCL,  btnCL_Y,  btnCL_N)  else
        if sArtcCD = 'ES'  then prArtcUseYN(sArtcYN, sUseYN, edNmES,  edES,  btnES_Y,  btnES_N)  else
        if sArtcCD = 'GC'  then prArtcUseYN(sArtcYN, sUseYN, edNmGC,  edGC,  btnGC_Y,  btnGC_N)  else
        if sArtcCD = 'HSI' then prArtcUseYN(sArtcYN, sUseYN, edNmHSI, edHSI, btnHSI_Y, btnHSI_N) else
        if sArtcCD = 'JY'  then prArtcUseYN(sArtcYN, sUseYN, edNmJY,  edJY,  btnJY_Y,  btnJY_N)  else
        if sArtcCD = 'NQ'  then prArtcUseYN(sArtcYN, sUseYN, edNmNQ,  edNQ,  btnNQ_Y,  btnNQ_N)  else
        if sArtcCD = 'URO' then prArtcUseYN(sArtcYN, sUseYN, edNmURO, edURO, btnURO_Y, btnURO_N) else
        if sArtcCD = 'YM'  then prArtcUseYN(sArtcYN, sUseYN, edNmYM,  edYM,  btnYM_Y,  btnYM_N);

        Next;
      end;
    end;
  end;
end;

function TfmArtcOpt.RowCntCheck(sCd:String):Boolean;
var
  sSql : String;
begin
  Result := True;

  sSql := Format(
    'SELECT COUNT(*) AS CNT ' +
    '  FROM NEGO_ARTC    ' +
    ' WHERE USER_ID = %s ' +
    '   AND ARTC_CD = %s ',
    [QuotedStr(_UserID),
     QuotedStr(sCd) ]);
  fnSqlOpen(MastDB.dbSQL, sSql);

  if MastDB.dbSQL.FieldByName('CNT').AsInteger > 0 then
    Result := False;
end;

Procedure TfmArtcOpt.prUpdateArtc(sCd, sUseYN :String);
var
  sSql, sRslt, sMsg : String;
begin
  if sUseYN = 'Y' then sMsg := '거래가능 처리되었습니다.'
                  else sMsg := '거래불가 처리되었습니다.';

  if RowCntCheck(sCd) then begin
    sSql := Format(
      'INSERT INTO NEGO_ARTC (USER_ID, ARTC_CD, ARTC_USE_YN) ' +
      '               VALUES (%s, %s, %s) ',
      [QuotedStr(_UserID),
       QuotedStr(sCd),
       QuotedStr(sUseYN) ]);

    sRslt := fnSqlOpen(MastDB.dbExec, sSql);
    if sRslt = '' then begin
      _Result := TRUE;
      bsSkinMessage.MessageDlg2(sMsg, '확인', mtInformation, [mbOK], 0);
    end;
  end else begin
    sSql := Format(
      'UPDATE NEGO_ARTC ' +
      '   SET ARTC_USE_YN = %s ' +
      ' WHERE USER_ID = %s ' +
      '   AND ARTC_CD = %s ',
      [QuotedStr('N'),
       QuotedStr(_UserID),
       QuotedStr(sUseYN) ]);
    sRslt := fnSqlOpen(MastDB.dbExec, sSql);

    if sRslt = '' then begin
      _Result := TRUE;
      bsSkinMessage.MessageDlg2(sMsg, '확인', mtInformation, [mbOK], 0);
    end;
  end;

  MainTableOpen;
end;

procedure TfmArtcOpt.btnBP_YClick(Sender: TObject);
begin
  prUpdateArtc('BP', 'Y');
end;

procedure TfmArtcOpt.btnBP_NClick(Sender: TObject);
begin
  prUpdateArtc('BP', 'N');
end;

procedure TfmArtcOpt.btnCL_YClick(Sender: TObject);
begin
  prUpdateArtc('CL', 'Y');
end;

procedure TfmArtcOpt.btnCL_NClick(Sender: TObject);
begin
  prUpdateArtc('CL', 'N');
end;

procedure TfmArtcOpt.btnES_YClick(Sender: TObject);
begin
  prUpdateArtc('ES', 'Y');
end;

procedure TfmArtcOpt.btnES_NClick(Sender: TObject);
begin
  prUpdateArtc('ES', 'N');
end;

procedure TfmArtcOpt.btnGC_YClick(Sender: TObject);
begin
  prUpdateArtc('GC', 'Y');
end;

procedure TfmArtcOpt.btnGC_NClick(Sender: TObject);
begin
  prUpdateArtc('GC', 'N');
end;

procedure TfmArtcOpt.btnJY_YClick(Sender: TObject);
begin
  prUpdateArtc('JY', 'Y');
end;

procedure TfmArtcOpt.btnJY_NClick(Sender: TObject);
begin
  prUpdateArtc('JY', 'N');
end;

procedure TfmArtcOpt.btnNQ_YClick(Sender: TObject);
begin
  prUpdateArtc('NQ', 'Y');
end;

procedure TfmArtcOpt.btnNQ_NClick(Sender: TObject);
begin
  prUpdateArtc('NQ', 'N');
end;

procedure TfmArtcOpt.btnURO_YClick(Sender: TObject);
begin
  prUpdateArtc('URO', 'Y');
end;

procedure TfmArtcOpt.btnURO_NClick(Sender: TObject);
begin
  prUpdateArtc('URO', 'N');
end;

procedure TfmArtcOpt.btnYM_YClick(Sender: TObject);
begin
  prUpdateArtc('YM', 'Y');
end;

procedure TfmArtcOpt.btnYM_NClick(Sender: TObject);
begin
  prUpdateArtc('YM', 'N');
end;

end.
