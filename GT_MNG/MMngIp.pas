unit MMngIp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, DBCtrls;

type
  TfmMngIp = class(TfmBasic)
    RzPanel4: TRzPanel;
    gdMain: TDBGridEh;
    bsSkinLabel2: TbsSkinLabel;
    kcRzDBEdit1: TkcRzDBEdit;
    bsSkinLabel5: TbsSkinLabel;
    MoMsg: TRzDBMemo;
    dbMainIP_SEQ: TIntegerField;
    dbMainMIP_IP: TStringField;
    dbMainMIP_BIGO: TStringField;
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmMngIp: TfmMngIp;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmMngIp.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmMngIp.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg: String;
begin
  inherited;

	with DataSet do
  begin
  	sMsg := '';
  	// 필수입력값 체크
    if FieldByName('MIP_IP').IsNull          then sMsg := '허용IP';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

  end;
end;

procedure TfmMngIp.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := 'SELECT IP_SEQ    '+
            '      ,MIP_IP    '+
            '      ,MIP_BIGO  '+
            'FROM MNG_ACPT_IP ';

    Uni_Open(dbMain, sSql);

  finally
    Delay_Hide;
  end;

end;

end.
