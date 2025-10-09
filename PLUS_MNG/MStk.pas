unit MStk;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Dialogs, ImgList,
//  Mask, Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit,RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, RzDBNav,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmStk = class(TfmBasic)
    gdMain: TDBGridEh;
    dbMainSTK_CD: TStringField;
    dbMainARTC_CD: TStringField;
    dbMainSTK_NM: TStringField;
    dbMainSTK_CLOSE_DT: TStringField;
    dbMainSTK_USE_YN: TStringField;
    dbMainAPI_STK_CD: TStringField;
    dbMainSTRIKE_PRC: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmStk: TfmStk;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmStk.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmStk.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmStk);
end;

procedure TfmStk.FormShow(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmStk.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmStk.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();
    sSql := Format(
      'SELECT STK_CD       ' +
      '      ,ARTC_CD      ' +
      '      ,STK_NM       ' +
      '      ,STK_CLOSE_DT ' +
      '      ,STK_USE_YN   ' +
      '      ,API_STK_CD   ' +
      '      ,STRIKE_PRC   ' +
      '  FROM STK_MST      ' +
      ' WHERE ARTC_CD IN (%s,%s) ',
      [QuotedStr('201'),
       QuotedStr('301')]);
    fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
