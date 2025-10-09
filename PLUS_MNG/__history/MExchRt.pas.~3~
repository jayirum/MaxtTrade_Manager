unit MExchRt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, UniDAC_Helper;

type
  TfmExchRt = class(TfmBasic)
    RzPanel4: TRzPanel;
    bsSkinLabel3: TbsSkinLabel;
    edErrt: TkcRzDBEdit;
    gdMain: TDBGridEh;
    dbMainTRADE_DT: TDateTimeField;
    dbMainER_TM: TStringField;
    dbMainER_RT: TFloatField;
    dbMainMNG_ID: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure dbMainAfterEdit(DataSet: TDataSet);
    procedure btnInsertClick(Sender: TObject);
    procedure edErrtKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure dbMainAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmExchRt: TfmExchRt;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmExchRt.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmExchRt.btnInsertClick(Sender: TObject);
begin
  edErrt.SetFocus;
  inherited;
end;

procedure TfmExchRt.dbMainAfterEdit(DataSet: TDataSet);
begin
  inherited;
  edErrt.ReadOnly := True;
end;

procedure TfmExchRt.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  edErrt.ReadOnly := False;
end;

procedure TfmExchRt.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('ER_RT')).DisplayFormat := '#,##0.0';
  end;

end;

procedure TfmExchRt.dbMainAfterPost(DataSet: TDataSet);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmExchRt.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg, sSql : String;
  dErRt      : Double;
begin
  inherited;

	with DataSet do
  begin
  	sMsg := '';
  	// 필수입력값 체크
    if FieldByName('ER_RT').AsString = ''    then sMsg := '환율';

    if sMsg <> '' then
    begin
      bsMsgError(sMsg + '은(는) 반드시 입력하셔야 합니다');
      Abort;
    end;

    if State in [dsInsert] then
    begin
      FieldByName('TRADE_DT').AsDateTime := Date;
      FieldByName('ER_TM').AsString := NowMSecTime;
      FieldByName('MNG_ID').AsString := __Login_ID;

      dErRt := FieldByName('ER_RT').AsFloat;

      sSql := Format( 'UPDATE ARTC_MST SET TICK_VALUE = ROUND(TICK_VALUE_USD * %g, 0,1)     '+
                      '                   ,TICK_VALUE_LOW = ROUND(TICK_VALUE_USD * %g, 0,1) '+
                      '                   ,CMSN_AMTRT = ROUND(CMSN_AMTRT_USD * %g, 0,1)     '+
                      'WHERE ACNT_TP = %s                                                   ',
                      [dErRt,dErRt,dErRt,QuotedStr('2')]);
      Uni_Open(dbPart, sSql);
    end;
  end;
end;

procedure TfmExchRt.edErrtKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnPost.ButtonClick;
end;

procedure TfmExchRt.FormShow(Sender: TObject);
begin
  inherited;

  MainTableOpen;
end;

procedure TfmExchRt.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := 'SELECT TRADE_DT '+
            ',ER_TM          '+
            ',ER_RT          '+
            ',MNG_ID         '+
            'FROM EXCH_RT ORDER BY TRADE_DT DESC, ER_TM DESC';
    Uni_Open(dbMain, sSql);

  finally
    Delay_Hide;
  end;
end;

end.
