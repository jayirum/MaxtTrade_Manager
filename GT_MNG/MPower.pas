unit MPower;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel;

type
  TfmPower = class(TfmBasic)
    gdMain: TDBGridEh;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    edFind: TRzEdit;
    dbUser: TUniQuery;
    dbUserUSER_NM: TStringField;
    dbUserUSER_ID: TStringField;
    dsUser: TDataSource;
    btnCrea: TbsSkinSpeedButton;
    edUserID: TkcRzDBEdit;
    btnAdd: TbsSkinSpeedButton;
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnCreaClick(Sender: TObject);
    procedure edUserIDChange(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure gdUserDblClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
    procedure PowerAdd;
    procedure InsertQuery(sId, sNm : String);
    procedure SelectQuery;
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
    procedure TableAdd;
  end;

var
  fmPower: TfmPower;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmPower.btnAddClick(Sender: TObject);
begin
  inherited;
  if dbUser.RecordCount = 0 then Exit;
  TableAdd;
end;

procedure TfmPower.btnCreaClick(Sender: TObject);
begin
  if dbUser.RecordCount = 0 then Exit;
  PowerAdd;
end;

procedure TfmPower.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmPower.btnFilterClick(Sender: TObject);
begin
  inherited;
  SelectQuery;
end;

procedure TfmPower.btnFindClick(Sender: TObject);
var
  sWhere : String;
begin
  inherited;
//    sWhere := Format(' WHERE USER_NM LIKE %s', [QuotedStr('%' + edFind.Text + '%')]);
//    sWhere := ' WHERE ' + StrReplace(__Find_User, '<X>', edFind.Text);
    sWhere := Format(' WHERE USER_GRADE IN (%s,%s) AND (%s)', [QuotedStr('8'),QuotedStr('6'), StrReplace(__Find_User, '<X>', edFind.Text)]);

    UserTableOpen(sWhere);
end;

procedure TfmPower.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmPower.edUserIDChange(Sender: TObject);
begin
  inherited;
//  SelectQuery;
end;

procedure TfmPower.FormShow(Sender: TObject);
begin
  inherited;

//	_sMainWhere := '';
//
//  with rgType do
//  begin
//  	Tag := 1;
//  	ItemIndex := 0;
//  	Tag := 0;
//  end;
//
//  _sMainWhere := 'USER_GRADE = ' + QuotedStr(IntToStr(rgType.ItemIndex));
//
//	PartTableOpen(lbxPart, '회원분류', '[전체]', 'ALL');
//	PartTableOpen(cbUserPart, '회원분류');
//	PartTableOpen(TComponent(gdMain.Columns[3]), '회원분류');
//
//  // sType = '@|Item, Value|TableName|'
//	PartTableOpen(cbServerIP, '@|SERVER_NM, FRONT_IP|MT_SERVER_MASTER');
//	PartTableOpen(rgType, Format('@|VALUE_NM, CODE_VALUE|HT_CODE_MASTER|WHERE CODE_ID = %s ORDER BY CODE_VALUE', [QuotedStr('USER_GRADE')]), '[전체]', '0');
end;

procedure TfmPower.gdUserDblClick(Sender: TObject);
begin
  inherited;
  SelectQuery;
end;

procedure TfmPower.InsertQuery(sId, sNm: String);
var
  sSql : String;
begin
  sSql := Format( 'INSERT INTO POWER_MST        '+
                  '(USER_ID    ,                '+
                  'FORM_ID     ,                '+
                  'FORM_NM     ,                '+
                  'POWER_SHOW  ,                '+
                  'POWER_INSERT,                '+
                  'POWER_EDIT  ,                '+
                  'POWER_DELETE,                '+
                  'POWER_FILTER,                '+
                  'POWER_EXCEL ,                '+
                  'POWER_PRINT ,                '+
                  'POWER_ETC)                   '+
                  'VALUES                       '+
                  '(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s) ' ,
                  [QuotedStr(dbUser.FieldByName('USER_ID').AsString),
                   QuotedStr(sId),
                   QuotedStr(sNm),
                   QuotedStr('Y'),
                   QuotedStr('Y'),
                   QuotedStr('Y'),
                   QuotedStr('Y'),
                   QuotedStr('Y'),
                   QuotedStr('Y'),
                   QuotedStr('Y'),
                   QuotedStr('Y')]);

  Uni_Open(MastDB.dbExec, sSql);

  sSql := Format('UPDATE POWER_MST SET POWER_SHOW = %s WHERE FORM_ID = %s AND USER_ID = %s ',
                 [QuotedStr('N'),
                  QuotedStr('9000'),
                  QuotedStr(dbUser.FieldByName('USER_ID').AsString)]);

  Uni_Open(MastDB.dbExec, sSql);
end;

procedure TfmPower.MainTableOpen;
begin

end;

procedure TfmPower.PowerAdd;
var
  sSql : String;
begin
  sSql := Format(' DELETE FROM POWER_MST WHERE USER_ID = %s ', [QuotedStr(dbUser.FieldByName('USER_ID').AsString)]);
  Uni_Open(dbPart, sSql);

  sSql := 'SELECT FORM_ID, FORM_NM FROM FORM_MST';
  Uni_Open(dbPart, sSql);

  with dbPart do
  begin
    DisableControls;
    First;
    while Not Eof do
    begin
      InsertQuery(FieldByName('FORM_ID').AsString, FieldByName('FORM_NM').AsString);

      Next;
    end;
    EnableControls;
  end;

  SelectQuery;

end;

procedure TfmPower.SelectQuery;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := Format( 'SELECT '+
                    'USER_ID,      '+
                    'FORM_ID,      '+
                    'FORM_NM,      '+
                    'POWER_SHOW,   '+
                    'POWER_INSERT, '+
                    'POWER_EDIT,   '+
                    'POWER_DELETE, '+
                    'POWER_FILTER, '+
                    'POWER_EXCEL,  '+
                    'POWER_PRINT,  '+
                    'POWER_ETC     '+
                    'FROM POWER_MST '+
                    'WHERE USER_ID = %s '
                    ,[QuotedStr(dbUser.FieldByName('USER_ID').AsString)]);

    Uni_Open(dbMain, sSql);

  finally
    Delay_Hide;
  end;
end;

procedure TfmPower.TableAdd;
var
  sSql : String;
begin
  sSql := Format( 'SELECT A.FORM_ID, A.FORM_NM               '+
                  'FROM FORM_MST A                           '+
                  'WHERE NOT EXISTS(SELECT FORM_ID           '+
                  '                 FROM POWER_MST           '+
                  '                 WHERE USER_ID = %s       '+
                  '                 AND FORM_ID = A.FORM_ID) ',
                  [QuotedStr(dbUser.FieldByName('USER_ID').AsString)]);
  Uni_Open(dbPart, sSql);

  with dbPart do
  begin
    DisableControls;
    First;

    if dbPart.RecordCount > 0 then
    begin
      while Not Eof do
      begin
        InsertQuery(FieldByName('FORM_ID').AsString, FieldByName('FORM_NM').AsString);

        Next;
      end;
    end;

    EnableControls;
  end;

  SelectQuery;

end;

procedure TfmPower.UserTableOpen(sWhere: String);
var
  sSql : String;
begin
  sSql := 'SELECT USER_NM, USER_ID '+
          'FROM USER_MST           '+
          sWhere;
  Uni_Open(dbUser, sSql);
end;

end.
