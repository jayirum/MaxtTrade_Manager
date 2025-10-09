unit MNclr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, UniDAC_Helper, math;

type
  TfmNclr = class(TfmBasic)
    gdMain: TDBGridEh;
    dbMainUSER_NM: TStringField;
    dbMainACNT_NO: TStringField;
    dbMainSTK_CD: TStringField;
    dbMainACNT_TP: TStringField;
    dbMainARTC_CD: TStringField;
    dbMainBS_TP: TStringField;
    dbMainNCLR_POS_QTY: TIntegerField;
    dbMainAVG_PRC: TFloatField;
    dbMainNCNTR_QTY: TIntegerField;
    dbMainTRADE_DT: TStringField;
    dbMainNCLR_POS_TM: TStringField;
    dbMainSYS_DT: TStringField;
    dbMainAPI_TP: TStringField;
    dbMainLOSSCUT_AMT: TFloatField;
    dbMainOVERNGT_QTY: TIntegerField;
    dbMainOVERNGT_TP: TStringField;
    dbMainOVERNGT_AMT: TFloatField;
    pnNclr: TRzPanel;
    dbMainTOTCNT: TIntegerField;
    dbMainDOT_CNT: TIntegerField;
    dbMainAVGPRC: TStringField;
    chUserTp: TbsSkinCheckRadioBox;
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure chUserTpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmNclr: TfmNclr;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmNclr.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmNclr.chUserTpClick(Sender: TObject);
begin
  inherited;
  btnFilter.ButtonClick;
end;

procedure TfmNclr.dbMainCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do
  begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('AVGPRC').AsString  := FormatFloat(FormatDotCnt(iCnt+3), FieldByName('AVG_PRC').AsFloat);
  end;
end;

procedure TfmNclr.FormShow(Sender: TObject);
begin
  inherited;

  PartTableOpen(TComponent(gdMain.Columns[3]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('BS_TP')]));

//  MainTableOpen;

end;

procedure TfmNclr.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 3 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmNclr.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmNclr.MainTableOpen;
var
  sSql, sUserTp : String;
begin
  try
    Delay_Show();

    if chUserTp.Checked then sUserTp := ' AND B1.USER_GRADE = 2 '
    else sUserTp := '';

    sSql := Format('SELECT   B.USER_NM		     AS USER_NM       '+
            '        ,A.ACNT_NO        AS ACNT_NO       '+
            '        ,A.STK_CD         AS STK_CD        '+
            '        ,A.ACNT_TP        AS ACNT_TP       '+
            '        ,A.ARTC_CD        AS ARTC_CD       '+
            '        ,A.BS_TP          AS BS_TP         '+
            '        ,A.NCLR_POS_QTY   AS NCLR_POS_QTY  '+
            '        ,A.AVG_PRC        AS AVG_PRC       '+
            '        ,A.NCNTR_QTY      AS NCNTR_QTY     '+
            '        ,A.TRADE_DT       AS TRADE_DT      '+
            '        ,A.NCLR_POS_TM    AS NCLR_POS_TM   '+
            '        ,A.SYS_DT         AS SYS_DT        '+
            '        ,A.API_TP         AS API_TP        '+
            '        ,A.LOSSCUT_AMT    AS LOSSCUT_AMT   '+
            '        ,A.OVERNGT_QTY    AS OVERNGT_QTY   '+
            '        ,A.OVERNGT_TP     AS OVERNGT_TP    '+
            '        ,A.OVERNGT_AMT    AS OVERNGT_AMT   '+
            '        ,COUNT(1) OVER()  AS TOTCNT        '+
            '        ,(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT '+
            'FROM NCLR_POS A,                           '+
            '     (SELECT A1.* FROM ACNT_MST A1, USER_MST B1 WHERE A1.USER_ID = B1.USER_ID %s ) B '+
            'WHERE A.ACNT_NO = B.ACNT_NO                ',
             [sUserTp]);

    Uni_Open(dbMain, sSql);

    if dbMain.RecordCount > 0 then pnNclr.Caption := dbMain.FieldByName('TOTCNT').AsString + ' °Ç'
    else pnNclr.Caption := '0 °Ç';

  finally
    Delay_Hide;
  end;
end;

end.
