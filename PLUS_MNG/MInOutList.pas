unit MInOutList;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList, Graphics,
//  Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsRibbon, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBNav, RzCmboBx, RzDBCmbo, RzSplit, RzDBEdit, RzLstBox,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// LbButton
  LbButton,
// User Unit
  MBasic;

type
  TfmInOutList = class(TfmBasic)
    gdMain: TDBGridEh;
    RzPanel6: TRzPanel;
    rgType: TbsSkinRadioGroup;
    pnInOut: TRzPanel;
    bsSkinLabel1: TbsSkinLabel;
    edUser: TRzEdit;
    dtStart: TkcRzDateTimeEdit;
    rgAcntTp: TbsSkinRadioGroup;
    chUserTp: TbsSkinCheckRadioBox;
    dtEnd: TkcRzDateTimeEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edUserKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure chUserTpClick(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure dbMainAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmInOutList: TfmInOutList;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmInOutList.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmInOutList.chUserTpClick(Sender: TObject);
begin
  inherited;
  btnFilter.ButtonClick;
end;

procedure TfmInOutList.edUserKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmInOutList.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmInOutList);
end;

procedure TfmInOutList.FormShow(Sender: TObject);
begin
  inherited;

  dtStart.Date := TextToDate(_Trade_DT); //Now;
  dtEnd.Date   := TextToDate(_Trade_DT); //Now;

  PartTableOpen(rgType, CodeFormat('IO_TP', 'ORDER BY CODE_VALUE'), '[전체]', '0');
  PartTableOpen(TComponent(gdMain.Columns[2]), CodeFormat('IO_TP'));
  PartTableOpen(TComponent(gdMain.Columns[4]), CodeFormat('RSLT_TP'));
  PartTableOpen(TComponent(gdMain.Columns[18]), CodeFormat('ACNT_TP'));

  rgType.ItemIndex := 0;
end;

procedure TfmInOutList.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do begin
    if FieldByName('IO_TP').AsString = '1' then Canvas.Font.Color := clRed
                                           else Canvas.Font.Color := clBlue;
    if DataCol = 2 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmInOutList.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmInOutList.MainTableOpen;
var
  sSql, sResult, sUserTp, sUser, sAcntTp, sIoTp, sWhere : String;
begin
  try
    Delay_Show();

    if edUser.Text <> ''      then sUser   := Format(' AND (USER_ID LIKE %s OR USER_NM LIKE %s) ', [QuotedStr('%'+edUser.Text+'%'), QuotedStr('%'+edUser.Text+'%')]);
    if rgAcntTp.ItemIndex > 0 then sAcntTp := Format(' AND ACNT_TP = %s ', [QuotedStr(IntToStr(rgAcntTp.ItemIndex-1))]);
    if rgType.ItemIndex > 0   then sIoTp   := Format(' AND IO_TP = %s ', [QuotedStr(rgType.Values[rgType.ItemIndex])]);

    sWhere := sUser + sAcntTp + sIoTp;

    if _Supervisor then begin
      if chUserTp.Checked then sUserTp := Format(' AND B1.USER_GRADE IN (%s,%s) ', [QuotedStr('2'),QuotedStr('7')])
                          else sUserTp := '';
    end else begin
      if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
                          else sUserTp := ' AND B1.USER_GRADE <> 7 ';
    end;
    //if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
    //                    else sUserTp := '';

    sSql := Format(
      'SELECT  USER_ID           ' +
      '       ,USER_NM           ' +
      '       ,IO_TP             ' +
      '       ,ACNT_NO           ' +
      '       ,RSLT_TP           ' +
      '       ,RQST_AMT          ' +
      '       ,RSLT_AMT          ' +
      '       ,RSLT_MNG_ID       ' +
      '       ,RQST_SYS_DT       ' +
      '       ,RQST_TM           ' +
      '       ,RSLT_SYS_DT       ' +
      '       ,RSLT_TM           ' +
      '       ,USER_BANK         ' +
      '       ,USER_BANK_ACNT    ' +
      '       ,USER_BANK_ACNT_NM ' +
      '       ,MNG_YN            ' +
      '       ,(SELECT BANK_NM FROM BANK_MST WHERE BANK_CD = A.BANK_CD) AS DEPOSIT_BANK ' +
      '       ,RJCT_MSG          ' +
      '       ,ACNT_TP           ' +
      '       ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM (SELECT A1.*, B1.BANK_CD FROM INOUT A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) A '+
      ' WHERE RSLT_TRADE_DT BETWEEN %s AND %s ' +
      sWhere +
      ' ORDER BY RQST_SYS_DT, RQST_TM ',
      [sUserTp,
       QuotedStr(StrReplace(dtStart.Text, '-', '')),
       QuotedStr(StrReplace(dtEnd.Text, '-', '')) ]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnInOut.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
                    else pnInOut.Caption := '0 건';
  finally
    Delay_Hide;
  end;
end;

procedure TfmInOutList.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin
    TFloatField(FieldByName('RQST_AMT')).DisplayFormat := FORMAT_AMT;
    TFloatField(FieldByName('RSLT_AMT')).DisplayFormat := FORMAT_AMT;
  end;
end;

end.
