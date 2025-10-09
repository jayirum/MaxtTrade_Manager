unit MNegoCmsn;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, ImgList, Dialogs,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsMessages,
// Raize, kcRaize
  RzEdit, RzDBEdit, RzCmboBx, kcRaizeCtrl,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh;

type
  TfmNegoCmsn = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    bsSkinLabel25: TbsSkinLabel;
    bsSkinLabel1: TbsSkinLabel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    edAcntNo: TkcRzEdit;
    edUserId: TkcRzEdit;
    gdMain: TDBGridEh;
    dsMain: TDataSource;
    bsSkinLabel4: TbsSkinLabel;
    edUserNm: TkcRzEdit;
    edArtcCd: TkcRzDBEdit;
    edBsTp: TkcRzDBEdit;
    btnDelete: TbsSkinSpeedButton;
    btnSave: TbsSkinSpeedButton;
    imgBtn: TImageList;
    btnClose: TbsSkinSpeedButton;
    edNego: TkcRzEdit;
    dbMain: TADOQuery;
    Panel1: TPanel;
    btnSaveAll: TbsSkinSpeedButton;
    btnDeleteAll: TbsSkinSpeedButton;
    edNegoAll: TkcRzEdit;
    bsSkinLabel6: TbsSkinLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edNegoClick(Sender: TObject);
    procedure edNegoKeyPress(Sender: TObject; var Key: Char);
    procedure edNegoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure gdMainCellClick(Column: TColumnEh);
    procedure btnSaveAllClick(Sender: TObject);
    procedure btnDeleteAllClick(Sender: TObject);
  private
    { Private declarations }
    function RowCntCheck:Boolean;
  public
    { Public declarations }
    procedure MainTableOpen;
  end;

var
  fmNegoCmsn: TfmNegoCmsn;
  function fmNegoCmsn_Run(sUserID, sUserNM, sAcntNo, sAcntTp : String):BOOLEAN;

implementation

uses
  stdUtils, MMastDB, MDelay;

{$R *.dfm}

var
  _UserID, _UserNM, _AcntNO, _AcntTP : String;
  _Result : BOOLEAN=FALSE;

function fmNegoCmsn_Run(sUserID, sUserNM, sAcntNo, sAcntTp : String):BOOLEAN;
begin
  Application.CreateForm(TfmNegoCmsn, fmNegoCmsn);
  try
    _UserID := sUserID;
    _UserNM := sUserNM;
    _AcntNO := sAcntNo;
    _AcntTP := sAcntTp;

    fmNegoCmsn.ShowModal;
  finally
    RESULT := _Result;
    fmNegoCmsn.Free; // TODO : Close로 대체하고 Close 이벤트에 Action := caFree 추가
  end;
end;

procedure TfmNegoCmsn.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmNegoCmsn.btnDeleteClick(Sender: TObject);
var
  sSql, sRslt : String;
begin
  sSql := Format(
    'DELETE FROM NEGO_CMSN ' +
    ' WHERE ACNT_NO = %s ' +
    '   AND ARTC_CD = %s ' +
    '   AND BS_TP   = %s ',
    [QuotedStr(_AcntNO),
     QuotedStr(dbMain.FieldByName('ARTC_CD').AsString),
     QuotedStr(dbMain.FieldByName('BS_TP').AsString)]);

  sRslt := fnSqlOpen(MastDB.dbSQL, sSql);

  if sRslt = '' then begin
    bsSkinMessage.MessageDlg2('미적용 완료!!', '확인', mtInformation, [mbOK], 0);
  end;

  MainTableOpen;
end;

procedure TfmNegoCmsn.btnSaveClick(Sender: TObject);
var
  sSql, sRslt : String;
begin
  if RowCntCheck then begin
    sSql := Format(
      ' INSERT INTO NEGO_CMSN ( ' +
      '  ACNT_NO, ' +
      '  ARTC_CD, ' +
      '  BS_TP, ' +
      '  USER_ID, ' +
      '  ACNT_TP, ' +
      '  NEGO_AMTRT ' +
      ' ) VALUES ( ' +
      '  %s, %s, %s, %s, %s, %g )',
      [QuotedStr(edAcntNo.Text),
       QuotedStr(dbMain.FieldByName('ARTC_CD').AsString),
       QuotedStr(dbMain.FieldByName('BS_TP').AsString),
       QuotedStr(edUserId.Text),
       QuotedStr(_AcntTP),
       strToFloat(edNego.Text)]);

    sRslt := fnSqlOpen(MastDB.dbExec, sSql);
    if sRslt = '' then begin
      _Result := TRUE;
      bsSkinMessage.MessageDlg2('등록완료!', '확인', mtInformation, [mbOK], 0);
    end;
  end else begin
    sSql := Format(
      'UPDATE NEGO_CMSN    ' +
      '   SET NEGO_AMTRT = %g ' +
      ' WHERE ACNT_NO = %s ' +
      '   AND ARTC_CD = %s ' +
      '   AND BS_TP   = %s ',
      [strToFloat(edNego.Text),
       QuotedStr(edAcntNo.Text),
       QuotedStr(dbMain.FieldByName('ARTC_CD').AsString),
       QuotedStr(dbMain.FieldByName('BS_TP').AsString)]);

    sRslt := fnSqlOpen(MastDB.dbExec, sSql);

    if sRslt = '' then begin
      _Result := TRUE;
      bsSkinMessage.MessageDlg2('수정완료!', '확인', mtInformation, [mbOK], 0);
    end;
  end;

  MainTableOpen;
end;

procedure TfmNegoCmsn.btnSaveAllClick(Sender: TObject);
var
  sSql, sRslt : String;
begin
  sSql := Format(
    'DELETE FROM NEGO_CMSN WHERE ACNT_NO = %s ',
    [QuotedStr(_AcntNO) ]);
  sRslt := fnSqlOpen(MastDB.dbExec, sSql);

  if sRslt = '' then begin
    sSql := Format(
      'INSERT INTO NEGO_CMSN ( ' +
      '       ACNT_NO ' +
      '      ,ARTC_CD ' +
      '      ,BS_TP   ' +
      '      ,USER_ID ' +
      '      ,ACNT_TP ' +
      '      ,NEGO_AMTRT ) ' +
      'SELECT %s      ' +
      '      ,ARTC_CD ' +
      '      ,BS_TP   ' +
      '      ,CMSN_TP ' +
      '      ,ACNT_TP ' +
      '      ,CMSN_AMTRT ' +
      ' FROM ARTC_MST ',
      [QuotedStr(edAcntNo.Text) ]);
    sRslt := fnSqlOpen(MastDB.dbExec, sSql);

    if sRslt = '' then begin
      _Result := TRUE;
      bsSkinMessage.MessageDlg2('일괄적용 완료!', '확인', mtInformation, [mbOK], 0);
    end;
  end;

  MainTableOpen;
end;

procedure TfmNegoCmsn.btnDeleteAllClick(Sender: TObject);
var
  sSql, sRslt : String;
begin
  sSql := Format(
    'DELETE FROM NEGO_CMSN ' +
    ' WHERE ACNT_NO = %s   ',
    [QuotedStr(_AcntNO) ]);
  sRslt := fnSqlOpen(MastDB.dbSQL, sSql);

  if sRslt = '' then begin
    _Result := TRUE;
    bsSkinMessage.MessageDlg2('일괄 미적용 완료!!', '확인', mtInformation, [mbOK], 0);
  end;

  MainTableOpen;
end;

procedure TfmNegoCmsn.edNegoClick(Sender: TObject);
begin
  edNego.Text := '';
end;

procedure TfmNegoCmsn.edNegoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then btnSave.ButtonClick;
end;

procedure TfmNegoCmsn.edNegoKeyPress(Sender: TObject; var Key: Char);
begin
  if Key in ['0'..'9',#25,#08,#13,'.'] then
  else Key := #0;
end;

procedure TfmNegoCmsn.FormCreate(Sender: TObject);
begin
  SetADOConn(fmNegoCmsn);
end;

procedure TfmNegoCmsn.FormShow(Sender: TObject);
var
  sTpNm : String;
begin
  edAcntNo.Text := _AcntNO;
  edUserId.Text := _UserID;
  edUserNm.Text := _UserNM;

  if _AcntTP = '1' then
    sTpNm := '국내선물옵션)'
  else
    sTpNm := '해외선물)';

  fmNegoCmsn.Caption := '협의수수료(' + sTpNm;
  MainTableOpen;

  edNego.Text := dbMain.FieldByName('NEGO').AsString;

  PartComp_Open(TComponent(gdMain.Columns[0]), '@|ARTC_NM, ARTC_CD|ARTC_MST|');
  PartComp_Open(TComponent(gdMain.Columns[1]), CodeFormat('BS_TP'));
  PartComp_Open(TComponent(gdMain.Columns[2]), CodeFormat('CMSN_TP'));
end;

procedure TfmNegoCmsn.gdMainCellClick(Column: TColumnEh);
begin
  edNego.Text := dbMain.FieldByName('NEGO').AsString;
end;

procedure TfmNegoCmsn.MainTableOpen;
begin
  with dbMain do begin
      Close;
      SQL.Text := Format(
        'SELECT ARTC_CD ' +
        '      ,ARTC_NM ' +
        '      ,BS_TP   ' +
        '      ,CASE WHEN A.BS_TP = %s THEN %s ' +
        '            WHEN A.BS_TP = %s THEN %s ' +
        '            ELSE %s ' +
        '       END BSTP     ' +
        '      ,CMSN_TP      ' +
        '      ,CMSN_AMTRT   ' +
        '      ,CASE WHEN (SELECT COUNT(*) AS CNT ' +
        '                    FROM NEGO_CMSN       ' +
        '                   WHERE ACNT_NO = %s    ' +
        '                     AND ARTC_CD = A.ARTC_CD          ' +
        '                     AND BS_TP = A.BS_TP) > 0 THEN    ' +
        '                        (SELECT REPLACE(STR(B.NEGO_AMTRT,10,5),%s,%s) ' +
        '                           FROM NEGO_CMSN B           ' +
        '                          WHERE B.ARTC_CD = A.ARTC_CD ' +
        '                            AND B.BS_TP = A.BS_TP     ' +
        '                            AND B.ACNT_NO = %s)       ' +
        '            ELSE %s ' +
        '       END NEGO     ' +
        '  FROM ARTC_MST A   ',
       //' WHERE ACNT_TP = %s ' ,
       [QuotedStr('S'),
        QuotedStr('매도'),
        QuotedStr('B'),
        QuotedStr('매수'),
        QuotedStr('전체'),
        QuotedStr(_AcntNO),
        QuotedStr(' '),
        QuotedStr(''),
        QuotedStr(_AcntNO),
        QuotedStr('미적용')
        //QuotedStr(_AcntTP)
        ]);
      Open;
  end;
end;

function TfmNegoCmsn.RowCntCheck:Boolean;
var
//  sRslt,
  sSql, sQuery : String;
begin
  Result := True;

  sQuery := 'SELECT COUNT(*) AS CNT FROM NEGO_CMSN WHERE ACNT_NO = %s AND ARTC_CD = %s AND BS_TP = %s';
  sSql   := Format(sQuery,[QuotedStr(edAcntNo.Text),QuotedStr(dbMain.FieldByName('ARTC_CD').AsString),QuotedStr(dbMain.FieldByName('BS_TP').AsString)]);

  fnSqlOpen(MastDB.dbSQL, sSql);

  if MastDB.dbSQL.FieldByName('CNT').AsInteger > 0 then
    Result := False;  
end;

end.
