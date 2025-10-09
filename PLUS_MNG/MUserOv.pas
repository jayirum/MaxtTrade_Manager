unit MUserOv;

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
  TfmUserOv = class(TfmBasic)
    gdMain: TDBGridEh;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    edFind: TRzEdit;
    dsUser: TDataSource;
    tmOpen: TTimer;
    dbUser: TADOQuery;
    bsRibbonDivider1: TbsRibbonDivider;
    btnOvCancel: TbsSkinSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnOvCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure UserOvTableOpen;
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
  end;

var
  fmUserOv: TfmUserOv;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmUserOv.MainTableOpen;
begin
// override
end;

procedure TfmUserOv.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmUserOv.btnFilterClick(Sender: TObject);
begin
//  inherited;
  UserOvTableOpen;
end;

procedure TfmUserOv.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmUserOv.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmUserOv);
end;

procedure TfmUserOv.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdUser, dbUser, ACol);
end;

procedure TfmUserOv.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmUserOv.gdUserDblClick(Sender: TObject);
begin
  inherited;
  UserOvTableOpen;
end;

procedure TfmUserOv.btnFindClick(Sender: TObject);
var
  sWhere, sUserTp, sUser : String;
begin
  if Not _Supervisor then sUserTp := ' A.USER_GRADE <> 7 '
                     else sUserTp := ' A.USER_GRADE = 7 ';

  sUser := Trim(edFind.Text);
  if sUser <> '' then
    sUser := Format(' AND (A.USER_ID LIKE %s OR A.USER_NM LIKE %s) ',
    [QuotedStr('%'+sUser+'%'),
     QuotedStr('%'+sUser+'%') ]);

  sWhere := Format(' WHERE %s (%s)', [sUserTp, sUser]);

  UserTableOpen(sWhere);
end;

procedure TfmUserOv.UserTableOpen(sWhere: String);
var
  sSql : String;
begin
  sSql :=
    'SELECT A.USER_NM, A.USER_ID ' +
    '  FROM USER_MST A, ' +
    '       (SELECT DISTINCT USER_ID FROM OVERNGT) B ' +
    sWhere +
    ' AND A.USER_ID = B.USER_ID ' +
  fnSqlOpen(dbUser, sSql);
end;

procedure TfmUserOv.UserOvTableOpen;
var
  sSql, sUse : String;
begin
  try
    Delay_Show();

    sSql := Format(
      'SELECT B.USER_NM    ' +
      '      ,A.USER_ID    ' +
      '      ,C.ACNT_AMT   ' +
      '      ,A.ARTC_CD    ' +
      '      ,A.OVERNGT_YN ' +
      '  FROM OVERNGT  A,  ' +
      '       USER_MST B,  ' +
      '       ACNT_MST C   ' +
      ' WHERE A.USER_ID = B.USER_ID ' +
      '   AND A.ACNT_CD = C.ACNT_CD ',
      [QuotedStr(dbUser.FieldByName('USER_ID').AsString) ]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmUserOv.btnOvCancelClick(Sender: TObject);
var
  sSql, sResult : String;
begin
  try
    Delay_Show();
    sSql := Format(
      'UPDATE OVERNGT ' +
      '   SET OVERNGT_YN = %s ' +
      ' WHERE USER_ID    = %s ' +
      '   AND ARTC_CD    = $s ',
      [QuotedStr('N'),
       QuotedStr(dbMain.FieldByName('USER_ID').AsString),
       QuotedStr(dbMain.FieldByName('ARTC_CD').AsString) ]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
