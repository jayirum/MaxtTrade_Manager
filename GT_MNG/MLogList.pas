unit MLogList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, bsSkinBoxCtrls, Math;

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
    dbUser: TUniQuery;
    dbUserUSER_NM: TStringField;
    dbUserUSER_ID: TStringField;
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
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure tmOpenTimer(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
    procedure LogTableOpen;
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
  if Not __Supervisor then
  begin
    sUserTp := ' USER_GRADE <> 7 AND '
  end
  else sUserTp := '';

  sWhere := Format(' WHERE %s (%s)', [sUserTp, StrReplace(__Find_User, '<X>', edFind.Text)]);

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

procedure TfmLogList.FormShow(Sender: TObject);
begin
  inherited;

  dtLogDt.Date := TextToDate(__Trade_DT);
  edStart.Text := '0000';
  edEnd.Text   := '2400';

  PartTableOpen(cbLogTp, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('LOG_TP')]), '전체선택', '0');
  PartTableOpen(TComponent(gdMain.Columns[3]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('LOG_TP')]));
  PartTableOpen(TComponent(gdMain.Columns[5]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('BS_TP')]));

  cbLogTp.ItemIndex := 0;

end;

procedure TfmLogList.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 5 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmLogList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
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
  with dbUser do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmLogList.LogTableOpen;
var
  sSql, sWhere : String;
begin

  try
    Delay_Show();

    if cbLogTp.Value = '0' then sWhere := ''
    else sWhere := Format(' AND LOG_TP = %s ', [QuotedStr(cbLogTp.Value)]);

    sSql := Format( 'SELECT        '+
                    ' ACNT_NO      '+
                    ',LOG_CLT_DT   '+
                    ',LOG_CLT_TM   '+
                    ',LOG_IP       '+
                    ',USER_ID      '+
                    ',USER_NM      '+
                    ',LOG_TP       '+
                    ',STK_CD       '+
                    ',BS_TP        '+
                    ',NOW_PRC      '+
                    ',ORD_PRC      '+
                    ',ORD_QTY      '+
                    ',HOGA_NO      '+
                    ',LOG_SVR_DT   '+
                    ',LOG_SVR_TM   '+
                    ',LOG_MSG      '+
                    ',COUNT(1) OVER() AS TOTCNT '+
                    'FROM USER_LOG '+
                    'WHERE USER_ID = %s '+
                    sWhere +
                    'AND LOG_SVR_DT = %s '+
                    'AND SUBSTRING(LOG_SVR_TM,1,5) BETWEEN %s AND %s ',
                    [QuotedStr(dbUser.FieldByName('USER_ID').AsString),
                     QuotedStr(StrReplace(dtLogDt.Text, '-', '')),
                     QuotedStr(edStart.EditText),
                     QuotedStr(edEnd.EditText)]);

    Uni_Open(dbMain, sSql);

    if dbMain.RecordCount > 0 then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
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
  sSql := 'SELECT USER_NM, USER_ID '+
          'FROM USER_MST           '+
          sWhere;
  Uni_Open(dbUser, sSql);
end;

end.
