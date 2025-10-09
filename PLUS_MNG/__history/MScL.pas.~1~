unit MScL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, UniDAC_Helper;

type
  TfmScL = class(TfmBasic)
    pnScl: TRzPanel;
    pnUser: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    gdMain: TDBGridEh;
    edStartTm: TkcRzDBEdit;
    edJabNm: TkcRzDBEdit;
    cbUseYn: TkcRzDBComboBox;
    dbMainBS_CD: TStringField;
    dbMainARTC_CD: TStringField;
    dbMainMKT_TP: TStringField;
    dbMainNOTI_YN: TStringField;
    dbMainJOB_NM: TStringField;
    dbMainEXEC_NM: TStringField;
    dbMainSTART_TM: TStringField;
    dbMainEXEC_YN: TStringField;
    dbMainUSE_YN: TStringField;
    dbMainLAST_EXEC_DT: TStringField;
    dbMainLAST_EXEC_TM: TStringField;
    dbMainACNT_TP: TStringField;
    dbMainBIGO: TStringField;
    procedure FormShow(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure edJabNmChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmScL: TfmScL;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmScL.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmScL.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmScL.edJabNmChange(Sender: TObject);
begin
  inherited;
  pnUser.Caption := '[ ' + dbMain.FieldByName('JOB_NM').AsString + ' ]';
end;

procedure TfmScL.FormShow(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmScL.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := Format( 'SELECT BS_CD  , '+
                    'ARTC_CD     , '+
                    'MKT_TP      , '+
                    'NOTI_YN     , '+
                    'JOB_NM      , '+
                    'EXEC_NM     , '+
                    'START_TM    , '+
                    'EXEC_YN     , '+
                    'USE_YN      , '+
                    'LAST_EXEC_DT, '+
                    'LAST_EXEC_TM, '+
                    'ACNT_TP     , '+
                    'BIGO          '+
                    'FROM BATCH_SCL WHERE SUBSTRING(BS_CD,1,1) IN (%s,%s) ORDER BY ARTC_CD,MKT_TP ASC',
                    [QuotedStr('S'),
                     QuotedStr('E')]);
    Uni_Open(dbMain, sSql);

  finally
    Delay_Hide;
  end;
end;

end.

