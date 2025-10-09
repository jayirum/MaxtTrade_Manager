unit MOrdDetail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, RzButton, RzRadChk, UniDAC_Helper, Math;

type
  TfmOrdDetail = class(TfmBasic)
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    gdUser: TDBGridEh;
    RzPanel6: TRzPanel;
    btnFind: TbsSkinSpeedButton;
    edFind: TRzEdit;
    dsUser: TDataSource;
    RzPanel1: TRzPanel;
    RzSizePanel1: TRzSizePanel;
    RzPanel2: TRzPanel;
    gdOrd: TDBGridEh;
    RzPanel3: TRzPanel;
    RzPanel4: TRzPanel;
    RzDBNavigator1: TRzDBNavigator;
    pnCntr: TRzPanel;
    pnOrd: TRzPanel;
    RzDBNavigator2: TRzDBNavigator;
    bsSkinLabel45: TbsSkinLabel;
    bsSkinLabel1: TbsSkinLabel;
    dbOrd: TUniQuery;
    dsOrd: TDataSource;
    dtOrdDt: TkcRzDateTimeEdit;
    btnCntrExcel: TbsSkinSpeedButton;
    btnOrdExcel: TbsSkinSpeedButton;
    rgOrdAcntTp: TbsSkinRadioGroup;
    dbUser: TUniQuery;
    dbMainCNTR_NO: TIntegerField;
    dbMainAPI_CNTR_NO: TStringField;
    dbMainSTK_CD: TStringField;
    dbMainARTC_CD: TStringField;
    dbMainACNT_TP: TStringField;
    dbMainACNT_NO: TStringField;
    dbMainUSER_ID: TStringField;
    dbMainBS_TP: TStringField;
    dbMainCNTR_QTY: TIntegerField;
    dbMainCNTR_PRC: TFloatField;
    dbMainCLR_PL: TFloatField;
    dbMainCLR_PL_F: TFloatField;
    dbMainCMSN_AMT: TFloatField;
    dbMainCMSN_AMT_F: TFloatField;
    dbMainEXCH_RT: TFloatField;
    dbMainCLR_TP: TStringField;
    dbMainBF_NCLR_POS_QTY: TIntegerField;
    dbMainAF_NCLR_POS_QTY: TIntegerField;
    dbMainBF_NET_ACNT_AMT: TFloatField;
    dbMainAF_NET_ACNT_AMT: TFloatField;
    dbMainORD_NO: TIntegerField;
    dbMainAPI_ORD_NO: TStringField;
    dbMainORD_PRC: TFloatField;
    dbMainORD_QTY: TIntegerField;
    dbMainORD_TP: TStringField;
    dbMainPARTNER_ID: TStringField;
    dbMainTRADE_DT: TStringField;
    dbMainCNTR_TM: TStringField;
    dbMainAPI_CNTR_TM: TStringField;
    dbMainSYS_DT: TStringField;
    dbMainCLENT_IP: TStringField;
    dbMainAPI_TP: TStringField;
    dbMainMNG_ID: TStringField;
    dbMainDOT_CNT: TIntegerField;
    dbMainCNTRPRC: TStringField;
    dbMainCLRPLF: TStringField;
    dbMainCMSNAMTF: TStringField;
    dbOrdORD_NO: TIntegerField;
    dbOrdAPI_SEQ: TIntegerField;
    dbOrdORG_ORD_NO: TIntegerField;
    dbOrdAPI_ORD_NO: TStringField;
    dbOrdAPI_ORG_ORD_NO: TStringField;
    dbOrdACNT_TP: TStringField;
    dbOrdACNT_NO: TStringField;
    dbOrdUSER_ID: TStringField;
    dbOrdSTK_CD: TStringField;
    dbOrdARTC_CD: TStringField;
    dbOrdBS_TP: TStringField;
    dbOrdORD_TP: TStringField;
    dbOrdCOND_TP: TStringField;
    dbOrdACPT_TP: TStringField;
    dbOrdORD_PRC: TFloatField;
    dbOrdSL_TP: TStringField;
    dbOrdORD_QTY: TIntegerField;
    dbOrdRJCT_QTY: TIntegerField;
    dbOrdMDFY_QTY: TIntegerField;
    dbOrdCNCL_QTY: TIntegerField;
    dbOrdCNTR_QTY: TIntegerField;
    dbOrdREMN_QTY: TIntegerField;
    dbOrdAPI_RJCT_CD: TStringField;
    dbOrdAPI_RJCT_MSG: TStringField;
    dbOrdTRADE_DT: TStringField;
    dbOrdORD_TM: TStringField;
    dbOrdCNFM_TM: TStringField;
    dbOrdAPI_TM: TStringField;
    dbOrdSYS_DT: TStringField;
    dbOrdCLIENT_IP: TStringField;
    dbOrdAPI_TP: TStringField;
    dbOrdMNG_ID: TStringField;
    dbOrdDOT_CNT: TIntegerField;
    dbOrdORDPRC: TStringField;
    edUserID: TkcRzDBEdit;
    tmOpen: TTimer;
    dbMainORDPRC: TStringField;
    dbMainBFAVGPRC: TStringField;
    dbMainAFAVGPRC: TStringField;
    dbMainBF_AVG_PRC: TFloatField;
    dbMainAF_AVG_PRC: TFloatField;
    dbUserUSER_NM: TStringField;
    dbUserUSER_ID: TStringField;
    dbMainTOTCNT: TIntegerField;
    dbOrdTOTCNT: TIntegerField;
    dtCntrDt: TkcRzDateTimeEdit;
    rgCntrAcntTp: TbsSkinRadioGroup;
    gdCntr: TDBGridEh;
    dbMainUSER_NM: TStringField;
    chUserTp: TbsSkinCheckRadioBox;
    procedure btnExcelClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure dtCntrDtChange(Sender: TObject);
    procedure dtOrdDtChange(Sender: TObject);
    procedure btnCntrExcelClick(Sender: TObject);
    procedure btnOrdExcelClick(Sender: TObject);
    procedure rgCntrAcntTpClick(Sender: TObject);
    procedure rgOrdAcntTpClick(Sender: TObject);
    procedure dbOrdAfterOpen(DataSet: TDataSet);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure gdCntr1TitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure dbOrdCalcFields(DataSet: TDataSet);
    procedure edUserIDChange(Sender: TObject);
    procedure tmOpenTimer(Sender: TObject);
    procedure dbMainAfterOpen(DataSet: TDataSet);
    procedure gdCntr1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure gdOrdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure btnFilterClick(Sender: TObject);
    procedure gdOrdTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdCntrTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
    procedure gdCntrDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
    procedure UserTableOpen(sWhere : String='');
    procedure OrdTableOpen;
  end;

var
  fmOrdDetail: TfmOrdDetail;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmOrdDetail.btnCntrExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdCntr);
end;

procedure TfmOrdDetail.btnOrdExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdOrd);
end;

procedure TfmOrdDetail.btnExcelClick(Sender: TObject);
begin
  inherited;
//  Export_Excel(gdMain);
end;

procedure TfmOrdDetail.btnFilterClick(Sender: TObject);
begin
  inherited;
  OrdTableOpen;
end;

procedure TfmOrdDetail.btnFindClick(Sender: TObject);
var
  sWhere, sUserTp : String;
begin
  inherited;
  if chUserTp.Checked then sUserTp := ' USER_GRADE = 2 AND '
  else sUserTp := '';

//    sWhere := Format(' WHERE USER_NM LIKE %s', [QuotedStr('%' + edFind.Text + '%')]);
//  sWhere := ' WHERE ' + StrReplace(__Find_User, '<X>', edFind.Text);
  sWhere := Format(' WHERE %s (%s)', [sUserTp, StrReplace(__Find_User, '<X>', edFind.Text)]);

  UserTableOpen(sWhere);
end;

procedure TfmOrdDetail.dbMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
//  dbMain.DB_Format('CNTR_NO', '###0');
//  dbMain.DB_Format('ORD_NO', '###0');
end;

procedure TfmOrdDetail.dbMainCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do
  begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('CNTRPRC').AsString  := FormatFloat(FormatDotCnt(iCnt), FieldByName('CNTR_PRC').AsFloat);
    FieldByName('CLRPLF').AsString   := FormatFloat(FormatDotCnt(iCnt), FieldByName('CLR_PL_F').AsFloat);
    FieldByName('CMSNAMTF').AsString := FormatFloat(FormatDotCnt(iCnt), FieldByName('CMSN_AMT_F').AsFloat);
    FieldByName('ORDPRC').AsString   := FormatFloat(FormatDotCnt(iCnt), FieldByName('ORD_PRC').AsFloat);
    FieldByName('BFAVGPRC').AsString   := FormatFloat(FormatDotCnt(iCnt+3), FieldByName('BF_AVG_PRC').AsFloat);
    FieldByName('AFAVGPRC').AsString   := FormatFloat(FormatDotCnt(iCnt+3), FieldByName('AF_AVG_PRC').AsFloat);
  end;
end;

procedure TfmOrdDetail.dbOrdAfterOpen(DataSet: TDataSet);
begin
  inherited;
  with DataSet do
  begin
    TFloatField(FieldByName('ORD_PRC')).DisplayFormat := __FORMAT_AMTUSD;

  end;
end;

procedure TfmOrdDetail.dbOrdCalcFields(DataSet: TDataSet);
var
  iCnt : Integer;
begin
  inherited;
  with DataSet do
  begin
    iCnt := FieldByName('DOT_CNT').AsInteger;
    FieldByName('ORDPRC').AsString  := FormatFloat(FormatDotCnt(iCnt), FieldByName('ORD_PRC').AsFloat);
  end;
end;

procedure TfmOrdDetail.dtCntrDtChange(Sender: TObject);
begin
  inherited;
//  MainTableOpen;
//  OrdTableOpen;
end;

procedure TfmOrdDetail.dtOrdDtChange(Sender: TObject);
begin
  inherited;
//  OrdTableOpen;
end;

procedure TfmOrdDetail.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmOrdDetail.edUserIDChange(Sender: TObject);
begin
  inherited;
//  if edUserID.Text = '' then Exit;
//
//  tmOpen.Enabled := False;
//  tmOpen.Enabled := True;

end;

procedure TfmOrdDetail.FormShow(Sender: TObject);
begin
  inherited;
    dtCntrDt.Date := TextToDate(__Trade_DT); //Now;
    dtOrdDt.Date  := TextToDate(__Trade_DT); //Now;
end;

procedure TfmOrdDetail.gdCntr1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;

//  if gdSelected in State  then exit;

    with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
    begin
      if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
      else Canvas.Font.Color := clBlue;

      if DataCol = 5 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));

      Canvas.Font.Color := clBlack;
      if CompareValue(FieldByName('CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed
      else if CompareValue(FieldByName('CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;

      if DataCol = 8 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
    end;
end;

procedure TfmOrdDetail.gdCntr1TitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  //필드 sortitng
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmOrdDetail.gdCntrDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 5 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));

    Canvas.Font.Color := clBlack;
    if CompareValue(FieldByName('CLR_PL').AsFloat, 0) > 0 then Canvas.Font.Color := clRed
    else if CompareValue(FieldByName('CLR_PL').AsFloat, 0) < 0 then Canvas.Font.Color := clBlue;

    if DataCol = 8 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmOrdDetail.gdCntrTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  //필드 sortitng
  with dbMain do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmOrdDetail.gdOrdDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
  inherited;
  with TDBGridEh(Sender), TDBGridEh(Sender).DataSource.DataSet do
  begin
    if FieldByName('BS_TP').AsString = 'B' then Canvas.Font.Color := clRed
    else Canvas.Font.Color := clBlue;

    if DataCol = 6 then DefaultDrawColumnCell(Rect, DataCol, Column, TGridDrawState(State));
  end;
end;

procedure TfmOrdDetail.gdOrdTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbOrd do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmOrdDetail.gdUserDblClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
  OrdTableOpen;
end;

procedure TfmOrdDetail.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  with dbUser do
  begin
    if IndexFieldNames = Column.FieldName then IndexFieldNames := Column.FieldName + ' Desc'
    else IndexFieldNames := Column.FieldName
  end;
end;

procedure TfmOrdDetail.MainTableOpen;
var
  sSql, sAcntTp, sTm, sTableNm : String;
begin
  sTm := __Trade_DT;
  if sTm = StrReplace(dtCntrDt.Text, '-', '') then sTableNm := 'CNTR'
  else sTableNm := 'CNTR_HIS';
  //sTableNm := 'CNTR';
  try
     Delay_Show();

     sAcntTp := '';

     if rgCntrAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND ACNT_TP = %s', [QuotedStr(intTostr(rgCntrAcntTp.ItemIndex))]);

     sSql := Format('SELECT																																							'+
                    '			CNTR_NO						,                                                           '+
                    '			API_CNTR_NO       ,                                                           '+
                    '			STK_CD            ,                                                           '+
                    '			ARTC_CD           ,                                                           '+
                    '			ACNT_TP           ,                                                           '+
                    '			ACNT_NO           ,                                                           '+
                    '			USER_ID           ,                                                           '+
                    '			BS_TP             ,                                                           '+
                    '			CNTR_QTY          ,                                                           '+
                    '			CNTR_PRC          ,                                                           '+
                    '			CLR_PL            ,                                                           '+
                    '			CLR_PL_F          ,                                                           '+
                    '			CMSN_AMT          ,                                                           '+
                    '			CMSN_AMT_F        ,                                                           '+
                    '			EXCH_RT           ,                                                           '+
                    '			CLR_TP            ,                                                           '+
                    '			BF_NCLR_POS_QTY   ,                                                           '+
                    '			AF_NCLR_POS_QTY   ,                                                           '+
                    '     BF_AVG_PRC        ,                                                           '+
                    '     AF_AVG_PRC        ,                                                           '+
                    '			BF_NET_ACNT_AMT   ,                                                           '+
                    '			AF_NET_ACNT_AMT   ,                                                           '+
                    '			ORD_NO            ,                                                           '+
                    '			API_ORD_NO        ,                                                           '+
                    '			ORD_PRC           ,                                                           '+
                    '			ORD_QTY           ,                                                           '+
                    ' CASE WHEN COND_TP = 2 THEN %s ELSE (SELECT CODE_VALUE_NM FROM CODE_MST WHERE CODE_ID = %s AND CODE_VALUE = A.ORD_TP) END ORD_TP, '+
                    '			PARTNER_ID        ,                                                           '+
                    '			TRADE_DT          ,                                                           '+
                    '			CNTR_TM           ,                                                           '+
                    '			API_CNTR_TM       ,                                                           '+
                    '			SYS_DT            ,                                                           '+
                    '			CLENT_IP          ,                                                           '+
                    '			API_TP            ,                                                           '+
                    '			MNG_ID            ,                                                           '+
                    '			(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT,   '+
                    '     (SELECT USER_NM FROM USER_MST WHERE USER_ID = A.USER_ID) AS USER_NM,          '+
                    '     COUNT(1) OVER() AS TOTCNT                                                     '+
                    'FROM %s A                                                                          '+
                    'WHERE USER_ID = %s                                                                 '+
                    'AND TRADE_DT = %s                                                                  '+
                    sAcntTp,
                    [QuotedStr('예약주문'),
                     QuotedStr('ORD_TP'),
                     sTableNm,
                     QuotedStr(dbUser.FieldByName('USER_ID').AsString),
                     QuotedStr(StrReplace(dtCntrDt.Text, '-', ''))]);
     Uni_Open(dbMain, sSql);

     PartTableOpen(TComponent(gdCntr.Columns[4]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));
     PartTableOpen(TComponent(gdCntr.Columns[5]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('BS_TP')]));
     PartTableOpen(TComponent(gdCntr.Columns[13]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('CLR_TP')]));
//     PartTableOpen(TComponent(gdCntr.Columns[23]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ORD_TP')]));
     PartTableOpen(TComponent(gdCntr.Columns[27]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('API_TP')]));

     if dbMain.RecordCount > 0 then pnCntr.Caption := dbMain.FieldByName('TOTCNT').AsString + ' 건'
     else pnCntr.Caption := '0 건';

  finally
    Delay_Hide;
  end;
end;

procedure TfmOrdDetail.OrdTableOpen;
var
  sSql, sAcntTp, sTm, sTableNm : String;
begin
  sTm := __Trade_DT;
  if sTm = StrReplace(dtCntrDt.Text, '-', '') then sTableNm := 'ORD'
  else sTableNm := 'ORD_HIS';

  try
    Delay_Show();

    sAcntTp := '';

    if rgCntrAcntTp.ItemIndex <> 0 then sAcntTp := Format(' AND ACNT_TP = %s', [QuotedStr(intTostr(rgCntrAcntTp.ItemIndex))]);

    sSql := Format( 'SELECT                                                                            '+
                    '			ORD_NO                                                                     , '+
                    '			API_SEQ                                                                    , '+
                    '			ORG_ORD_NO                                                                 , '+
                    '			API_ORD_NO                                                                 , '+
                    '			API_ORG_ORD_NO                                                             , '+
                    '			ACNT_TP                                                                    , '+
                    '			ACNT_NO                                                                    , '+
                    '			USER_ID                                                                    , '+
                    '			STK_CD                                                                     , '+
                    '			ARTC_CD                                                                    , '+
                    '			BS_TP                                                                      , '+
                    '			ORD_TP                                                                     , '+
                    '			COND_TP                                                                    , '+
                    '			ACPT_TP                                                                    , '+
                    '			ORD_PRC                                                                    , '+
                    '			SL_TP                                                                      , '+
                    '			ORD_QTY                                                                    , '+
                    '			RJCT_QTY                                                                   , '+
                    '			MDFY_QTY                                                                   , '+
                    '			CNCL_QTY                                                                   , '+
                    '			CNTR_QTY                                                                   , '+
                    '			REMN_QTY                                                                   , '+
                    '			API_RJCT_CD                                                                , '+
                    '			API_RJCT_MSG                                                               , '+
                    '			TRADE_DT                                                                   , '+
                    '			ORD_TM                                                                     , '+
                    '			CNFM_TM                                                                    , '+
                    '			API_TM                                                                     , '+
                    '			SYS_DT                                                                     , '+
                    '			CLIENT_IP                                                                  , '+
                    '			API_TP                                                                     , '+
                    '			MNG_ID                                                                     , '+
                    '			(SELECT TOP(1) DOT_CNT FROM ARTC_MST WHERE ARTC_CD = A.ARTC_CD) AS DOT_CNT , '+
                    '     COUNT(1) OVER() AS TOTCNT                                                    '+
                    'FROM %s A                                                                         '+
                    'WHERE USER_ID = %s                                                                '+
                    'AND TRADE_DT = %s                                                                 '+
                   sAcntTp,
                  [sTableNm,
                   QuotedStr(dbUser.FieldByName('USER_ID').AsString),
                   QuotedStr(StrReplace(dtCntrDt.Text, '-', ''))]);
    Uni_Open(dbOrd, sSql);

    PartTableOpen(TComponent(gdOrd.Columns[4]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACNT_TP')]));
    PartTableOpen(TComponent(gdOrd.Columns[6]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('BS_TP')]));
    PartTableOpen(TComponent(gdOrd.Columns[7]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ORD_TP')]));
    PartTableOpen(TComponent(gdOrd.Columns[8]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('COND_TP')]));
    PartTableOpen(TComponent(gdOrd.Columns[9]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('ACPT_TP')]));
    PartTableOpen(TComponent(gdOrd.Columns[11]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('SL_TP')]));
    PartTableOpen(TComponent(gdOrd.Columns[19]), Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s', [QuotedStr('API_TP')]));

    if dbOrd.RecordCount > 0 then pnOrd.Caption := dbOrd.FieldByName('TOTCNT').AsString + ' 건'
    else pnOrd.Caption := '0 건';

  finally
    Delay_Hide;
  end;
end;

procedure TfmOrdDetail.rgCntrAcntTpClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
  OrdTableOpen;
end;

procedure TfmOrdDetail.rgOrdAcntTpClick(Sender: TObject);
begin
  inherited;
  OrdTableOpen;
end;

procedure TfmOrdDetail.tmOpenTimer(Sender: TObject);
begin
  inherited;
  tmOpen.Enabled := False;

  MainTableOpen;
  OrdTableOpen;
end;

procedure TfmOrdDetail.UserTableOpen(sWhere: String ='');
var
  sSql : String;
begin
  sSql := 'SELECT USER_NM, USER_ID '+
          'FROM USER_MST           '+
          sWhere;
  Uni_Open(dbUser, sSql);
end;

end.
