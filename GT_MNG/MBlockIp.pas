unit MBlockIp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, DBCtrls;

type
  TfmBlockIp = class(TfmBasic)
    RzPanel4: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    gdMain: TDBGridEh;
    kcRzDBEdit1: TkcRzDBEdit;
    dbMainIP_SEQ: TIntegerField;
    dbMainUIP_IP: TStringField;
    dbMainUIP_BIGO: TStringField;
    MoMsg: TRzDBMemo;
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmBlockIp: TfmBlockIp;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmBlockIp.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmBlockIp.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg: String;
begin
  inherited;

	with DataSet do
  begin
  	sMsg := '';
  	// 필수입력값 체크
    if FieldByName('UIP_IP').IsNull          then sMsg := '차단IP';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

  end;
end;

procedure TfmBlockIp.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := 'SELECT IP_SEQ      '+
            '      ,UIP_IP      '+
            '      ,UIP_BIGO    '+
            'FROM USER_BLOCK_IP ';
    Uni_Open(dbMain, sSql);

  finally
    Delay_Hide;
  end;

end;

end.
