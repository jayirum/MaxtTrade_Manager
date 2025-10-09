unit MLogList;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList, Graphics,
//  Math, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsSkinBoxCtrls, bsSkinCtrls, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, RzDBNav,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmLogList = class(TfmBasic)
    gdMain: TDBGridEh;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    edFind: TRzEdit;
    dsUser: TDataSource;
    edUserID: TkcRzDBEdit;
    tmOpen: TTimer;
    bsSkinLabel1: TbsSkinLabel;
    lbMsg: TbsSkinLabel;
    dtLogDt: TkcRzDateTimeEdit;
    edStart: TkcRzMaskEdit;
    edEnd: TkcRzMaskEdit;
    dbMainACNT_NO: TStringField;
    dbMainLOG_CLT_DT: TStringField;
    dbMainLOG_CLT_TM: TStringField;
    dbMainLOG_IP: TStringField;
    dbMainUSER_ID: TStringField;
    dbMainUSER_NM: TStringField;
    dbMainLOG_TP: TStringField;
    dbMainSTK_CD: TStringField;
    dbMainBS_TP: TStringField;
    dbMainNOW_PRC: TFloatField;
    dbMainORD_PRC: TFloatField;
    dbMainORD_QTY: TIntegerField;
    dbMainHOGA_NO: TIntegerField;
    dbMainLOG_SVR_DT: TStringField;
    dbMainLOG_SVR_TM: TStringField;
    dbMainLOG_MSG: TStringField;
    dbMainTOTCNT: TIntegerField;
    cbLogTp: TkcRzComboBox;
    pnCnt: TRzPanel;
    dbUser: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure tmOpenTimer(Sender: TObject);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
    procedure LogTableOpen;
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
  end;

var
  fmLogList: TfmLogList;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmLogList.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmLogList.btnFilterClick(Sender: TObject);
begin
  inherited;
  LogTableOpen;
end;

procedure TfmLogList.btnFindClick(Sender: TObject);
var
  sWhere, sUserTp : String;
begin
  if Not _Supervisor then sUserTp := ' USER_GRADE <> 7 AND '
                     else sUserTp := '';

  sWhere := Format(' WHERE %s (%s)', [sUserTp, StrReplace(_Find_User, '<X>', edFind.Text)]);

  UserTableOpen(sWhere);
end;

procedure TfmLogList.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmLogList.edUserIDChange(Sender: TObject);
begin
  inherited;
//  if edUserID.Text = '' then Exit;
//
//  tmOpen.Enabled := False;
//  tmOpen.Enabled := True;
end;

procedure TfmLogList.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmLogList);
end;

procedure TfmLogList.FormShow(Sender: TObject);
begin
  inherited;

  dtLogDt.Date := TextToDate(_Trade_DT);
  edStart.Text := '0000';
  edEnd.Text   := '2400';

  PartTableOpen(cbLogTp, CodeFormat('LOG_TP'), '전체선택', '0');
  PartTableOpen(TComponent(gdMain.Columns[3]), CodeFormat('LOG_TP'));
  PartTableOpen(TComponent(gdMain.Columns[5]), CodeFormat('BS_TP'));

  cbLogTp.ItemIndex := 0;
end;

procedure TfmLogList.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 5 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmLogList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmLogList.gdUserDblClick(Sender: TObject);
begin
  inherited;
  LogTableOpen;
end;

procedure TfmLogList.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdUser, dbUser, ACol);
end;

procedure TfmLogList.LogTableOpen;
var
  sSql, sResult, sWhere : String;
begin
  try
    Delay_Show();

    if cbLogTp.Value = '0' then sWhere := ''
                           else sWhere := Format(' AND LOG_TP = %s ', [QuotedStr(cbLogTp.Value)]);

    sSql := Format(
      'SELECT ACNT_NO    ' +
      '      ,LOG_CLT_DT ' +
      '      ,LOG_CLT_TM ' +
      '      ,LOG_IP     ' +
      '      ,USER_ID    ' +
      '      ,USER_NM    ' +
      '      ,LOG_TP     ' +
      '      ,STK_CD     ' +
      '      ,BS_TP      ' +
      '      ,NOW_PRC    ' +
      '      ,ORD_PRC    ' +
      '      ,ORD_QTY    ' +
      '      ,HOGA_NO    ' +
      '      ,LOG_SVR_DT ' +
      '      ,LOG_SVR_TM ' +
      '      ,LOG_MSG    ' +
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM USER_LOG     ' +
      ' WHERE USER_ID = %s ' +
      sWhere +
      '   AND LOG_SVR_DT = %s ' +
      '   AND SUBSTRING(LOG_SVR_TM,1,5) BETWEEN %s AND %s ',
      [QuotedStr(dbUser.FieldByName('USER_ID').AsString),
       QuotedStr(StrReplace(dtLogDt.Text, '-', '')),
       QuotedStr(edStart.EditText),
       QuotedStr(edEnd.EditText)]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
                    else pnCnt.Caption := '0 건';
  finally
    Delay_Hide;
  end;
end;

procedure TfmLogList.MainTableOpen;
begin
// override
end;

procedure TfmLogList.tmOpenTimer(Sender: TObject);
begin
  inherited;
  tmOpen.Enabled := False;

  LogTableOpen;
end;

procedure TfmLogList.UserTableOpen(sWhere: String);
var
  sSql : String;
begin
  sSql :=
    'SELECT USER_NM, USER_ID ' +
    '  FROM USER_MST ' +
    sWhere;
  fnSqlOpen(dbUser, sSql);
end;

end.
