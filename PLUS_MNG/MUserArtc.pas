unit MUserArtc;

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
  TfmUserArtc = class(TfmBasic)
    gdMain: TDBGridEh;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    edFind: TRzEdit;
    dsUser: TDataSource;
    tmOpen: TTimer;
    cbArtc: TkcRzComboBox;
    dbUser: TADOQuery;
    bsRibbonDivider1: TbsRibbonDivider;
    cbUse: TkcRzComboBox;
    bsSkinLabel1: TbsSkinLabel;
    btnArtcSearch: TbsSkinSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure btnArtcSearchClick(Sender: TObject);
  private
    { Private declarations }
    procedure UserArtcTableOpen;
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
  end;

var
  fmUserArtc: TfmUserArtc;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

procedure TfmUserArtc.MainTableOpen;
begin
// override
end;

procedure TfmUserArtc.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmUserArtc.btnFilterClick(Sender: TObject);
begin
//  inherited;
  UserArtcTableOpen;
end;

procedure TfmUserArtc.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmUserArtc.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmUserArtc);
end;

procedure TfmUserArtc.FormShow(Sender: TObject);
begin
  inherited;
  PartTableOpen(cbArtc, Format('@|ARTC_NM, ARTC_CD|ARTC_MST|WHERE ACNT_TP = %s AND ARTC_USE_YN = %s', [QuotedStr('2'), QuotedStr('Y')]), 'ÀüÃ¼', '0');

  cbArtc.ItemIndex := 0;
end;

procedure TfmUserArtc.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdUser, dbUser, ACol);
end;

procedure TfmUserArtc.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmUserArtc.gdUserDblClick(Sender: TObject);
begin
  inherited;
  UserArtcTableOpen;
end;

procedure TfmUserArtc.btnFindClick(Sender: TObject);
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

procedure TfmUserArtc.UserTableOpen(sWhere: String);
var
  sSql : String;
begin
  sSql :=
    'SELECT A.USER_NM, A.USER_ID ' +
    '  FROM USER_MST A, ' +
    '       (SELECT DISTINCT USER_ID FROM NEGO_ARTC) B ' +
    sWhere +
    ' AND A.USER_ID = B.USER_ID ' +
  fnSqlOpen(dbUser, sSql);
end;

procedure TfmUserArtc.UserArtcTableOpen;
var
  sSql, sUse : String;
begin
  try
    Delay_Show();

    sSql := Format(
      'SELECT B.USER_NM     ' +
      '      ,A.USER_ID     ' +
      '      ,C.ARTC_NM     ' +
      '      ,A.ARTC_CD     ' +
      '      ,A.ARTC_USE_YN ' +
      '  FROM NEGO_ARTC A,  ' +
      '       USER_MST  B,  ' +
      '       ARTC_MST  C   ' +
      ' WHERE A.USER_ID = B.USER_ID ' +
      '   AND A.ARTC_CD = C.ARTC_CD ' +
      '   AND A.USER_ID = %s ', 
      [QuotedStr(dbUser.FieldByName('USER_ID').AsString) ]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmUserArtc.btnArtcSearchClick(Sender: TObject);
var
  sSql, sUse, sArtc : String;
begin
  try
    Delay_Show();

    if cbArtc.ItemIndex = 0 then sArtc := ''
                            else sArtc := Format(' AND A.ARTC_CD = %s ', [QuotedStr(cbArtc.Value)]);

    if cbUse.ItemIndex = 0 then sUse := ''
                           else sUse := Format(' AND A.ARTC_USE_YN = %s ', [QuotedStr(cbUse.Value)]);

    sSql :=
      'SELECT B.USER_NM     ' +
      '      ,A.USER_ID     ' +
      '      ,C.ARTC_NM     ' +
      '      ,A.ARTC_CD     ' +
      '      ,A.ARTC_USE_YN ' +
      '  FROM NEGO_ARTC A,  ' +
      '       USER_MST  B,  ' +
      '       ARTC_MST  C   ' +
      ' WHERE A.USER_ID = B.USER_ID ' +
      '   AND A.ARTC_CD = C.ARTC_CD ' +
      sArtc +
      sUse;
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
