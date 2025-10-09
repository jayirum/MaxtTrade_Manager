unit MDBTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel;

type
  TfmDbTool = class(TfmBasic)
    RzPanel4: TRzPanel;
    gdMain: TDBGridEh;
    moQuery: TRzMemo;
    btnSend: TbsSkinSpeedButton;
    btnRun: TbsSkinSpeedButton;
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    procedure QuerySend(sQuery : String);
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmDbTool: TfmDbTool;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmDbTool.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmDbTool.btnSendClick(Sender: TObject);
begin
  inherited;
  QuerySend(moQuery.Text);
end;

procedure TfmDbTool.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmDbTool.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  case Key of
  	VK_F9: btnSend.ButtonClick;

  end;
end;

procedure TfmDbTool.MainTableOpen;
begin
//  with dbMain do
//  begin
//  	try
//      Delay_Show();
//
//      Close;
//      SQL.Text := ' SELECT               ' +
//                  '   USERID,            ' +
//                  '   USER_NM,           ' +
//                  '   CONN_YN,           ' +
//                  '   FRONT_IP,          ' +
//                  '   REG_NO,            ' +
//                  '   CONN_PWD,          ' +
//                  '   USER_GRADE,        ' +
//                  '   USER_BANK,         ' +
//                  '   USER_BANK_ACNT,    ' +
//                  '   USER_BANK_ACNT_NM, ' +
//                  '   MNG_ID,            ' +
//                  '   MNG_IP,            ' +
//                  '   PARTNER_ID,        ' +
//                  '   PARTNER_NICK_NM,   ' +
//                  '   NICK_NM,           ' +
//                  '   REG_DT,            ' +
//                  '   POST_NO,           ' +
//                  '   ADDR_1,            ' +
//                  '   ADDR_2,            ' +
//                  '   EMAIL,             ' +
//                  '   TEL_NO,            ' +
//                  '   HP_NO,             ' +
//                  '   EMAIL_YN,          ' +
//                  '   SMS_YN,            ' +
//                  '   CLIENT_IP,         ' +
//                  '   LAST_LOGON_DT,     ' +
//                  '   LAST_LOGON_TM,     ' +
//                  '   LAST_LOGON_IP,     ' +
//                  '   ACNT_STAT,         ' +
//                  '   PART_CODE          ' +
//                  ' FROM                 ' +
//                  '   HT_USER_MASTER A   ';
//
//      if _sMainWhere <> '' then SQL.Add('WHERE ' + _sMainWhere);
//
//      Open;
//    finally
//      Delay_Hide;
//    end;
//  end;
end;

procedure TfmDbTool.QuerySend(sQuery: String);
var
  sRslt : String;
  i : Integer;
begin
  if sQuery = '' then Exit;

  sRslt := Uni_Open(dbMain, sQuery);

  if sRslt <> '' then bsMsgError(sRslt);

  for i := 0 to gdMain.Columns.Count - 1 do
  begin
    gdMain.Columns[i].Width := 100;
    gdMain.Columns[i].Alignment := taCenter;
  end;

end;

end.
