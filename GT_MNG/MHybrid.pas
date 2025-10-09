unit MHybrid;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, math;

type
  TfmHybrid = class(TfmBasic)
    pnFilter: TbsSkinPanel;
    bsSkinLabel1: TbsSkinLabel;
    edFind: TRzEdit;
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    RzPanel1: TRzPanel;
    RzPanel6: TRzPanel;
    rgType: TbsSkinRadioGroup;
    gdMain: TDBGridEh;
    lbxPart: TRzListBox;
    dbMainACNT_NO: TStringField;
    dbMainACNT_TP: TStringField;
    dbMainUSER_NM: TStringField;
    dbMainUSER_ID: TStringField;
    dbMainSTK_CD: TStringField;
    dbMainBS_TP: TStringField;
    dbMainAPI_TP: TStringField;
    dbMainACNT_AMT: TFloatField;
    dbMainCLR_PL: TFloatField;
    dbMainCMSN: TFloatField;
    dbMainNCLR_POS_QTY: TIntegerField;
    dbMainAVG_PRC: TFloatField;
    dbMainEVAPL: TFloatField;
    dbMainSUMPL: TFloatField;
    dbMainDOT_CNT: TIntegerField;
    dbMainAVGPRC: TStringField;
    dbMainAPITP: TStringField;
    edUserID: TkcRzDBEdit;
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure rgTypeClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnExcelClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
    function TC001_SEND(sOrdTp, sBsTp : String) : Boolean;
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmHybrid: TfmHybrid;

implementation

uses StdUtils, MMastDB, MDelay, PacketStruct;

{$R *.dfm}

{ TfmSample }

procedure TfmHybrid.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmHybrid.btnFilterClick(Sender: TObject);
var
  sFind : String;
begin
	if edFind.Text = '' then _sMainWhere := ''
  else
  begin
    sFind := '%' + edFind.Text + '%';
    _sMainWhere := Format(' AND (D.USER_NM LIKE %s OR D.USER_ID LIKE %s) ', [QuotedStr(sFind),QuotedStr(sFind)]);
  end;

  inherited;
end;

procedure TfmHybrid.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;

	with DataSet do
  begin
//    showmessage(FieldByName('APITP').AsString);
  end;
end;

procedure TfmHybrid.dbMainBeforePost(DataSet: TDataSet);
var
  sMsg, sApiTp, sBsTp, sOrdTp, sTpBNm, sTpANm : String;
  bRslt : Boolean;
begin
  inherited;

	with DataSet do
  begin
    if State in [dsEdit]  then
    begin
      if FieldByName('API_TP').AsString = 'R' then sTpBNm := '실주문'
      else sTpBNm := '가상주문';

      if FieldByName('APITP').AsString = 'R' then sTpANm := '실주문'
      else sTpANm := '가상주문';

    	if FieldByName('APITP').AsString <> FieldByName('API_TP').AsString then
      begin
        if bsMsgYesNo(Format('[%s] -> [%s] 전환 하시겠습니까?', [sTpBNm,sTpANm]), '사용자전환') then
        begin
          if (FieldByName('API_TP').AsString = 'R') and (FieldByName('APITP').AsString = 'V') then
          begin
            sOrdTp := '21';
            if FieldByName('BS_TP').AsString = 'B' then sBsTp := 'S'
            else if FieldByName('BS_TP').AsString = 'S' then sBsTp := 'B';
          end;

          if (FieldByName('API_TP').AsString = 'V') and (FieldByName('APITP').AsString = 'R') then
          begin
            sOrdTp := '22';
            sBsTp := FieldByName('BS_TP').AsString;
          end;

          bRslt := TC001_SEND(sOrdTp, sBsTp);
        end
        else FieldByName('APITP').AsString := FieldByName('API_TP').OldValue;

      end;
    end;
  end;
end;

procedure TfmHybrid.dbMainCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do
  begin
    iCnt := FieldByName('DOT_CNT').AsInteger;

    FieldByName('AVGPRC').AsString  := FormatFloat(FormatDotCnt(iCnt+1), FieldByName('AVG_PRC').AsFloat);
//    FieldByName('APITP').AsString := FieldByName('API_TP').AsString;
  end;
end;

procedure TfmHybrid.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
	if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmHybrid.FormShow(Sender: TObject);
begin
  inherited;

  PartTableOpen(TComponent(gdMain.Columns[2]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));
  PartTableOpen(TComponent(gdMain.Columns[4]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('BS_TP')]));
  PartTableOpen(TComponent(gdMain.Columns[8]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE <> %s', [QuotedStr('API_TP'),QuotedStr('H')]));
  PartTableOpen(TComponent(gdMain.Columns[9]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE <> %s', [QuotedStr('API_TP'),QuotedStr('H')]));
  PartTableOpen(rgType, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_DISP = %s ORDER BY CODE_VALUE', [QuotedStr('ACNT_TP'),QuotedStr('Y')]), '[전체]', '0');
  PartTableOpen(lbxPart, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_VALUE <> %s ORDER BY CODE_VALUE', [QuotedStr('API_TP'),QuotedStr('H')]), '[전체]', '0');

  with rgType do
  begin
    Tag := 1;
    ItemIndex := 0;
    Tag := 0;
  end;

end;

procedure TfmHybrid.gdMainDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
    with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
    begin
      if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
      else Canvas.Font.Color := clBlue;

      if DataCol = 4 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));

      Canvas.Font.Color := clBlack;
      if CompareValue(FieldByName('EVAPL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed
      else if CompareValue(FieldByName('EVAPL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;

      if DataCol = 7 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
    end;
end;

procedure TfmHybrid.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmHybrid.lbxPartClick(Sender: TObject);
var
  sCd : String;
begin
  inherited;

  with rgType do
  begin
  	Tag := 1;
  	ItemIndex := 0;
  	Tag := 0;
  end;

  if lbxPart.ItemIndex = 1 then sCd := 'R'
  else if lbxPart.ItemIndex = 2 then sCd := 'V';


  if lbxPart.ItemIndex = 0 then _sMainWhere := ''
  else _sMainWhere := Format(' AND A.API_TP = %s ', [QuotedStr(sCd)]);

  MainTableOpen;
end;

procedure TfmHybrid.MainTableOpen;
var
  sSql : String;
begin
  try
    Delay_Show();

    sSql := Format( 'SELECT CASE WHEN API_TP = %s THEN %s ELSE %s END AS APITP, '+
                    '       ACNT_NO,      '+
                    '       ACNT_TP,      '+
                    '       USER_NM,      '+
                    '       USER_ID,      '+
                    '       STK_CD,       '+
                    '       BS_TP,        '+
                    '       API_TP,       '+
                    '       ACNT_AMT,     '+
                    '       CLR_PL,       '+
                    '       CMSN,         '+
                    '       NCLR_POS_QTY, '+
                    '       AVG_PRC,      '+
                    '       CASE WHEN BS_TP = %s THEN (AVG_PRC - CNTR_PRC) * NCLR_POS_QTY * TICK '+
                    '            WHEN BS_TP = %s THEN (CNTR_PRC - AVG_PRC) * NCLR_POS_QTY * TICK END EVAPL, '+
                    '       (ACNT_AMT + CLR_PL - CMSN) AS SUMPL, '+
                    '       DOT_CNT '+
                    'FROM '+
                    '(SELECT  A.ACNT_NO '+
                    '        ,A.ACNT_TP '+
                    '        ,D.USER_NM '+
                    '        ,D.USER_ID '+
                    '        ,A.STK_CD  '+
                    '        ,A.BS_TP   '+
                    '        ,A.API_TP  '+
                    '        ,SUM(D.ACNT_AMT) AS ACNT_AMT '+
                    '        ,SUM(D.CLR_PL) AS CLR_PL     '+
                    '        ,SUM(D.CMSN) AS CMSN         '+
                    '        ,ISNULL(SUM(A.NCLR_POS_QTY), 0) AS NCLR_POS_QTY '+
                    '        ,ISNULL(SUM(C.CNTR_PRC),0) AS CNTR_PRC          '+
                    '        ,ISNULL(SUM(A.AVG_PRC),0) AS AVG_PRC            '+
                    '        ,CASE WHEN ((A.ARTC_CD = %s OR A.ARTC_CD = %s) AND (SUM(A.AVG_PRC) < 0)) '+
                    '              THEN SUM(B.TICK_VALUE_LOW / B.TICK_SIZE_LOW)   '+
                    '              ELSE SUM(B.TICK_VALUE / B.TICK_SIZE) END TICK  '+
                    '        ,B.DOT_CNT '+
                    'FROM NCLR_POS A, '+
                    '     ARTC_MST B, '+
                    '     CURR_PRC C, '+
                    '     ACNT_MST D  '+
                    'WHERE A.ARTC_CD = B.ARTC_CD '+
                    'AND (A.BS_TP = B.BS_TP OR B.BS_TP = %s) '+
                    'AND A.STK_CD = C.STK_CD   '+
                    'AND A.ACNT_NO = D.ACNT_NO '+
                    ' %s '+
                    ' GROUP BY A.ACNT_NO,      '+
                    '         A.ACNT_TP,       '+
                    '         D.USER_NM,       '+
                    '         D.USER_ID,       '+
                    '         A.STK_CD,        '+
                    '         A.BS_TP,         '+
                    '         A.API_TP,        '+
                    '         A.ARTC_CD,B.DOT_CNT) TMP   ',
                    [QuotedStr('R'),
                     QuotedStr('R'),
                     QuotedStr('V'),
                     QuotedStr('S'),
                     QuotedStr('B'),
                     QuotedStr('201'),
                     QuotedStr('301'),
                     QuotedStr('A'),
                     _sMainWhere]);

    Uni_Open(dbMain, sSql);

  finally
    Delay_Hide;
  end;

end;

procedure TfmHybrid.rgTypeClick(Sender: TObject);
begin
  inherited;
  if rgType.Tag = 0 then
  begin
    if rgType.ItemIndex = 0 then _sMainWhere := ''
    else _sMainWhere := ' AND A.ACNT_TP = ' + QuotedStr(rgType.Values[rgType.ItemIndex]);

    MainTableOpen;

	  lbxPart.ItemIndex := 0;
  end;
end;

function TfmHybrid.TC001_SEND(sOrdTp, sBsTp : String): Boolean;
var
  TC001 : TTC001;
  sValue : String;
begin

  with dbMain do
  begin
    FillChar(TC001, SizeOf(TC001), ' ');

    // Header --------------------------------------------------------------------
    StrToArr(NumToStr(SizeOf(TC001)),                       TC001.GT_HEADER.LENGTH);                    // Header + Data Length
    StrToArr('TC001',                                       TC001.GT_HEADER.PACKET_CD);                 // 패킷코드
    StrToArr(FieldByName('USER_ID').AsString,               TC001.GT_HEADER.USER_ID);                   // 사용자ID
    StrToArr(FieldByName('ACNT_TP').AsString,               TC001.GT_HEADER.ACNT_TP);                   // 1:국내파생, 2:해외파생, 3:국내현물
    StrToArr('0000',                                        TC001.GT_HEADER.ERR_CODE);                  // 성공:0000
    StrToArr(NowMSecTime,                                   TC001.GT_HEADER.TM);                        // Send Time HHNNSSZZZ

    // Data --------------------------------------------------------------
    StrToArr(FieldByName('STK_CD').AsString,                TC001.STK_CD);                              // 종목코드
    StrToArr(FieldByName('ACNT_NO').AsString,               TC001.ACNT_NO);                             // 계좌번호
    StrToArr('',                                            TC001.ACNT_PWD);                            // 계좌 비밀번호
    StrToArr('',                                            TC001.ORD_NO);                              // 주문번호
    StrToArr(sBsTp,                                         TC001.BS_TP);                               // 매도매수구분  S:매도 B:매수
    StrToArr(sOrdTp,                                        TC001.ORD_TP);                              // 주문유형 (CODE_MST 참조)
    StrToArr('0',                                           TC001.COND_TP);                             // 0:default, 1:MIT설정 2:MIT발동 3:SL발동
    DblToArr(0,                                             TC001.ORD_PRC);                             // 주문가격
    IntToArr(FieldByName('NCLR_POS_QTY').AsInteger,         TC001.ORD_QTY);                             // 주문수량
    DblToArr(0,                                             TC001.MIT_PRC);                             // MIT설정가격
    DblToArr(0,                                             TC001.SL_PRC);                              // SL설정가격
    StrToArr('',                                            TC001.SL_TP);                               // S:손절 P:익절
    IntToArr(0,                                             TC001.ORG_ORD_NO);                          // 원주문번호
    DblToArr(0,                                             TC001.ORG_ORD_PRC);                         // 원주문금액
    StrToArr(__Login_ID,                                    TC001.MNG_ID);                              // CLIENT/LOSSCUT/BATCH/MNG_ID(강제취소/청산)
    StrToArr('',                                            TC001.CLIENT_IP);                           // Client IP
    StrToArr('',                                            TC001.API_SEQ);                             // 1~199
    StrToArr('',                                            TC001.API_ORG_NO);                          // API원주문번호

    sValue := RecordToStr(TC001, SizeOf(TC001));
    MastDB.iwNotiClient.DataToSend := sValue + __EOL;
  end;

end;

end.
