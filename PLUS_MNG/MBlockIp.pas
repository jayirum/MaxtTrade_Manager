unit MBlockIp;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, DBCtrls, Mask, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsMessages, bsRibbon,
// Raize, kcRaize
  RzPanel, RzEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, RzDBEdit, RzDBNav,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmBlockIp = class(TfmBasic)
    RzPanel4: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    gdMain: TDBGridEh;
    edIp: TkcRzDBEdit;
    mmMsg: TRzDBMemo;
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    edFind: TRzEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure bsSkinLabel1Click(Sender: TObject);
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

procedure TfmBlockIp.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmBlockIp);
end;

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

  with DataSet do begin
    sMsg := '';
    // 필수입력값 체크
    if FieldByName('UIP_IP').IsNull then sMsg := '차단IP';

    if sMsg <> '' then begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;
  end;
end;

procedure TfmBlockIp.MainTableOpen;
var
  sSql: String;
begin
  try
    Delay_Show();

    sSql := Format(
      'SELECT IP_SEQ   ' +
      '      ,UIP_IP   ' +
      '      ,UIP_BIGO ' +
      '  FROM USER_BLOCK_IP ',
      [_sMainWhere]);
  fnSqlOpen(dbMain, sSql);
  finally
    Delay_Hide;
  end;
end;

procedure TfmBlockIp.bsSkinLabel1Click(Sender: TObject);
var
  sFind: String;
begin
  inherited;
  _sMainWhere := '';
  sFind := Trim(edFind.Text);

  if sFind <> '' then begin
    sFind := '%' + sFind + '%';
    _sMainWhere := Format(
      ' WHERE (UIP_IP LIKE %s OR UIP_BIGO LIKE %s) ',
      [QuotedStr(sFind),
       QuotedStr(sFind) ]);
    MainTableOpen;
  end;
end;

end.
