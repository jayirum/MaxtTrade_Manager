unit MStk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, UniDAC_Helper;

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
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
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

procedure TfmStk.FormShow(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmStk.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();
    sSql := Format( 'SELECT						'+
                    '	STK_CD        , '+
                    '	ARTC_CD       , '+
                    '	STK_NM        , '+
                    '	STK_CLOSE_DT  , '+
                    '	STK_USE_YN    , '+
                    '	API_STK_CD    , '+
                    '	STRIKE_PRC		  '+
                    'FROM STK_MST		  '+
                    'WHERE ARTC_CD IN (%s,%s)',
                    [QuotedStr('201'),
                     QuotedStr('301')]);
    Uni_Open(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
