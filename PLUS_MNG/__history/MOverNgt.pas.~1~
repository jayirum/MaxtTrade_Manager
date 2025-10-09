unit MOverNgt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, math;

type
  TfmOverNgt = class(TfmBasic)
    gdMain: TDBGridEh;
    pnCnt: TRzPanel;
    dbMainACNT_NO: TStringField;
    dbMainUSER_ID: TStringField;
    dbMainACNT_TP: TStringField;
    dbMainUSER_NM: TStringField;
    dbMainOVERNGT_YN: TStringField;
    dbMainACNT_AMT: TFloatField;
    dbMainCLR_PL: TFloatField;
    dbMainCMSN: TFloatField;
    dbMainNCLR_POS_QTY: TIntegerField;
    dbMainOVAMT: TFloatField;
    dbMainEVAPL: TFloatField;
    dbMainTOTEVAPL: TFloatField;
    dbMainTOTCNT: TIntegerField;
    rgOvSameTp: TbsSkinRadioGroup;
    procedure btnExcelClick(Sender: TObject);
    procedure rgOvSameTpClick(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmOverNgt: TfmOverNgt;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmOverNgt.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmOverNgt.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmOverNgt.MainTableOpen;
var
  sSql, sTp : String;
begin
  try
    Delay_Show();

    if rgOvSameTp.ItemIndex <> 0 then sTp := Format(' AND A.OVERNGT_YN = %s', [QuotedStr(IntToStr(rgOvSameTp.ItemIndex))]);


    sSql := Format( 'SELECT ACNT_NO,USER_ID,ACNT_TP,USER_NM    '+
                    ' ,(SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = OVERNGT_YN) AS OVERNGT_YN '+
                    '       ,MAX(ACNT_AMT) AS ACNT_AMT         '+
                    '       ,MAX(CLR_PL) AS CLR_PL             '+
                    '       ,MAX(CMSN) AS CMSN                 '+
                    '       ,SUM(NCLR_POS_QTY) AS NCLR_POS_QTY '+
                    '       ,CASE WHEN OVERNGT_YN = %s THEN SUM(SAMEAMT) ELSE SUM(OVAMT) END OVAMT '+
                    '       ,ISNULL(SUM(EVAPL),0) AS EVAPL     '+
                    '       ,ISNULL((MAX(SUMPL) + SUM(EVAPL)),0) AS TOTEVAPL '+
                    '       ,COUNT(1) OVER() AS TOTCNT         '+ 
                    'FROM                                      '+
                    '(SELECT ACNT_NO,USER_ID,USER_NM,ACNT_TP,OVERNGT_YN,  '+
                    '       ACNT_AMT,                          '+
                    '       CLR_PL,                            '+
                    '       CMSN,                              '+
                    '       NCLR_POS_QTY,                      '+
                    '       OVAMT,                             '+
                    '       SAMEAMT,                           '+
                    '       CASE WHEN BS_TP = %s THEN (AVG_PRC - CNTR_PRC) * NCLR_POS_QTY * TICK '+
                    '            WHEN BS_TP = %s THEN (CNTR_PRC - AVG_PRC) * NCLR_POS_QTY * TICK END EVAPL, '+
                    '       (ACNT_AMT + CLR_PL - CMSN) AS SUMPL '+
                    'FROM                                                                             '+
                    '(SELECT   A.ACNT_NO                                                              '+
                    '        ,A.ACNT_TP                                                               '+
                    '        ,A.USER_ID                                                               '+
                    '        ,A.USER_NM                                                               '+
                    '        ,A.OVERNGT_YN                                                            '+
                    '        ,B.BS_TP                                                                 '+
                    '        ,SUM(A.ACNT_AMT) AS ACNT_AMT                                             '+
                    '        ,SUM(A.CLR_PL) AS CLR_PL                                                 '+
                    '        ,SUM(A.CMSN) AS CMSN                                                     '+
                    '        ,ISNULL(SUM(B.NCLR_POS_QTY), 0) AS NCLR_POS_QTY                          '+
                    '        ,ISNULL(SUM(B.NCLR_POS_QTY*C.OVERNGT_AMT),0) AS OVAMT                    '+
                    '        ,ISNULL(SUM(B.NCLR_POS_QTY*C.SAMEHOGA_AMT),0) AS SAMEAMT                 '+
                    '        ,ISNULL(SUM(D.CNTR_PRC),0) AS CNTR_PRC                                   '+
                    '        ,ISNULL(SUM(B.AVG_PRC),0) AS AVG_PRC                                     '+
                    '        ,CASE WHEN ((B.ARTC_CD = %s OR B.ARTC_CD = %s) AND (SUM(B.AVG_PRC) < 0)) '+
                    '              THEN SUM(C.TICK_VALUE_LOW / C.TICK_SIZE_LOW)                       '+
                    '              ELSE SUM(C.TICK_VALUE / C.TICK_SIZE) END TICK                      '+
                    '        ,SUM(C.TICK_SIZE) AS TICK_SIZE                                           '+
                    '        ,SUM(C.TICK_SIZE_LOW) AS TICK_SIZE_LOW                                   '+
                    '        ,SUM(C.TICK_VALUE) AS TICK_VALUE                                         '+
                    '        ,SUM(C.TICK_VALUE_LOW) AS TICK_VALUE_LOW                                 '+
                    'FROM ACNT_MST A LEFT OUTER JOIN NCLR_POS B                                       '+
                    '     ON A.ACNT_NO = B.ACNT_NO                                                    '+
                    '     LEFT OUTER JOIN ARTC_MST C                                                  '+
                    '     ON B.ARTC_CD = C.ARTC_CD                                                    '+
                    '     AND (B.BS_TP = C.BS_TP OR C.BS_TP = %s)                                     '+
                    '     LEFT OUTER JOIN CURR_PRC D                                                  '+
                    '     ON B.STK_CD = D.STK_CD                                                      '+
                    'WHERE A.OVERNGT_YN IN (%s,%s)                                                    '+
                    sTp +
                    'GROUP BY  A.ACNT_NO                                                              '+
                    '        ,A.ACNT_TP                                                               '+
                    '        ,A.USER_ID                                                               '+
                    '        ,A.USER_NM                                                               '+
                    '        ,A.OVERNGT_YN                                                            '+
                    '        ,B.BS_TP                                                                 '+
                    '        ,B.ARTC_CD) TMP                                                          '+
                    ') TOTPL                                                                          '+
                    'GROUP BY ACNT_NO,USER_ID,ACNT_TP,USER_NM,OVERNGT_YN                              ',
                    [QuotedStr('OVERNGT_YN'),
                     QuotedStr('1'),
                     QuotedStr('S'),
                     QuotedStr('B'),
                     QuotedStr('201'),
                     QuotedStr('301'),
                     QuotedStr('A'),
                     QuotedStr('1'),
                     QuotedStr('2')]);

    Uni_Open(dbMain, sSql);

    PartTableOpen(TComponent(gdMain.Columns[2]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));

    if dbMain.RecordCount > 0 then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' °Ç'
    else pnCnt.Caption := '0 °Ç';

  finally
    Delay_Hide;
  end;
end;

procedure TfmOverNgt.rgOvSameTpClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

end.


