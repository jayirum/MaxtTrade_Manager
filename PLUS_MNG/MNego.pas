unit MNego;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList,
//  Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsribbon, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav, RzLstBox,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmNego = class(TfmBasic)
    pnLeft: TRzSizePanel;
    RzPanel5: TRzPanel;
    RzPanel6: TRzPanel;
    gdMain: TDBGridEh;
    gdUser: TDBGridEh;
    dsPart: TDataSource;
    edFind: TRzEdit;
    btnFind: TbsSkinSpeedButton;
    dbMainACNTNO: TStringField;
    dbMainUSERNM: TStringField;
    dbMainUSERID: TStringField;
    dbMainKOA: TFloatField;
    dbMainKOCS: TFloatField;
    dbMainKOCB: TFloatField;
    dbMainKOPS: TFloatField;
    dbMainKOPB: TFloatField;
    dbMainEA: TFloatField;
    dbMainCLA: TFloatField;
    dbMainACNTTP: TStringField;
    dsUser: TDataSource;
    edUserID: TkcRzDBEdit;
    dbMainKOA_CAL: TStringField;
    dbMainKOCS_CAL: TStringField;
    dbMainKOCB_CAL: TStringField;
    dbMainKOPS_CAL: TStringField;
    dbMainKOPB_CAL: TStringField;
    dbMainEA_CAL: TStringField;
    dbMainCLA_CAL: TStringField;
    dbUser: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edUserIDChange(Sender: TObject);
    procedure dbMainCalcFields(DataSet: TDataSet);
    procedure gdMainDblClick(Sender: TObject);
    procedure gdUserDblClick(Sender: TObject);
    procedure gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
    procedure MainWher(sData : String);
  public
    { Public declarations }
    procedure MainTableOpen(sWhere : String='');
    procedure UserTableOpen(sWhere : String='');
  end;

var
  fmNego: TfmNego;

implementation

uses StdUtils, MMastDB, MDelay, MNegoCmsn;

{$R *.dfm}

{ TfmNego }

procedure TfmNego.btnFindClick(Sender: TObject);
var
  sWhere : String;
begin
  inherited;
//  sWhere := Format(' AND A.USER_NM LIKE %s', [QuotedStr('%' + edFind.Text + '%')]);
  sWhere := ' AND ' + StrReplace(Get_INIFile(_Find_FileName, 'FINDSQL', 'USER_A'), '<X>', edFind.Text);

  UserTableOpen(sWhere);
end;

procedure TfmNego.btnExcelClick(Sender: TObject);
begin
  inherited;
  Export_Excel(gdMain);
end;

procedure TfmNego.gdMainDblClick(Sender: TObject);
var
  sRslt : BOOLEAN;
begin
  inherited;
  sRslt := fmNegoCmsn_Run(dbMain.FieldByName('USERID').AsString,dbMain.FieldByName('USERNM').AsString,dbMain.FieldByName('ACNTNO').AsString,dbMain.FieldByName('ACNTTP').AsString);

  if sRslt then MainWher(dbMain.FieldByName('USERID').AsString); 
end;

procedure TfmNego.gdUserDblClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmNego.gdUserTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdUser, dbUser, ACol);
end;

procedure TfmNego.btnFilterClick(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmNego.dbMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  with DataSet do begin

    if FieldByName('KOA').AsString = '' then FieldByName('KOA_CAL').AsString := '미적용' else
       FieldByName('KOA_CAL').AsString := FloatToStr(FieldByName('KOA').AsFloat);

    if FieldByName('KOCS').AsString = '' then FieldByName('KOCS_CAL').AsString := '미적용' else
       FieldByName('KOCS_CAL').AsString := FloatToStr(FieldByName('KOCS').AsFloat);

    if FieldByName('KOCB').AsString = '' then FieldByName('KOCB_CAL').AsString := '미적용' else
       FieldByName('KOCB_CAL').AsString := FloatToStr(FieldByName('KOCB').AsFloat);

    if FieldByName('KOPS').AsString = '' then FieldByName('KOPS_CAL').AsString := '미적용' else
       FieldByName('KOPS_CAL').AsString := FloatToStr(FieldByName('KOPS').AsFloat);

    if FieldByName('KOPB').AsString = '' then FieldByName('KOPB_CAL').AsString := '미적용' else
       FieldByName('KOPB_CAL').AsString := FloatToStr(FieldByName('KOPB').AsFloat);

    if FieldByName('EA').AsString = '' then FieldByName('EA_CAL').AsString := '미적용' else
       FieldByName('EA_CAL').AsString := FormatFloat(FORMAT_AMT, FieldByName('EA').AsFloat);

    if FieldByName('CLA').AsString = '' then FieldByName('CLA_CAL').AsString := '미적용' else
       FieldByName('CLA_CAL').AsString := FormatFloat(FORMAT_AMT, FieldByName('CLA').AsFloat);
  end;
end;

procedure TfmNego.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = 13 then btnFind.ButtonClick;
end;

procedure TfmNego.edUserIDChange(Sender: TObject);
begin
  inherited;
//  MainWher(dbUser.FieldByName('USERID').AsString);
end;

procedure TfmNego.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmNego);
end;

procedure TfmNego.FormShow(Sender: TObject);
begin
  inherited;

//  MainTableOpen;
//  UserTableOpen;

  PartTableOpen(TComponent(gdMain.Columns[1]), CodeFormat('ACNT_TP'));
end;

procedure TfmNego.MainTableOpen(sWhere : String='');
var
  sSql : String;
begin
  sSql := Format(
    'SELECT A.ACNT_NO AS ACNTNO,                                                                                  ' +
    '       B.USER_NM AS USERNM,                                                                                  ' +
    '       A.USER_ID AS USERID,                                                                                  ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s) AS KOA,                 ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s AND BS_TP = %s) AS KOCS, ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s AND BS_TP = %s) AS KOCB, ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s AND BS_TP = %s) AS KOPS, ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s AND BS_TP = %s) AS KOPB, ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s) AS EA,                  ' +
    '       (SELECT NEGO_AMTRT FROM NEGO_CMSN WHERE ACNT_NO = A.ACNT_NO AND ARTC_CD = %s) AS CLA,                 ' +
    '       B.ACNT_TP AS ACNTTP                                                                                   ' +
    '  FROM NEGO_CMSN A,                                                                                          ' +
    '       ACNT_MST B                                                                                            ' +
    ' WHERE A.ACNT_NO = B.ACNT_NO                                                                                 ' +
    '   AND A.USER_ID = %s                                                                                        ' +
    ' GROUP BY A.ACNT_NO, B.USER_NM, A.USER_ID, B.ACNT_TP                                                         ' ,
    [QuotedStr('101'),
     QuotedStr('201'),
     QuotedStr('S'),
     QuotedStr('201'),
     QuotedStr('B'),
     QuotedStr('301'),
     QuotedStr('S'),
     QuotedStr('301'),
     QuotedStr('B'),
     QuotedStr('6E'),
     QuotedStr('CL'),
     QuotedStr('ucla') // TEST
     //QuotedStr(dbUser.FieldByName('USERID').AsString)
      ]);
  try
    Delay_Show();
    fnSqlOpen(dbMain, sSql);
//    PartTableOpen(TComponent(gdMain.Columns[1]), CodeFormat('ACNT_TP'));
  finally
    Delay_Hide;
  end;
end;

procedure TfmNego.MainWher(sData : String);
var
  sSql : String;
begin
  inherited;
  sSql := Format(' AND A.USER_ID = %s',[QuotedStr(sData)]);
  MainTableOpen(sSql);
end;

procedure TfmNego.UserTableOpen(sWhere : String='');
var
  sSql : String;
begin
  sSql := 'SELECT A.USER_NM AS USERNM,   ' +
          '       A.USER_ID AS USERID    ' +
          '  FROM ACNT_MST A,            ' +
          '       NEGO_CMSN B            ' +
          ' WHERE A.ACNT_NO = B.ACNT_NO  ' +
          '   AND A.USER_ID = B.USER_ID  ' +
          sWhere +
          ' GROUP BY A.USER_NM, A.USER_ID ';
  try
    Delay_Show();
    fnSqlOpen(dbUser, sSql);
  finally
    Delay_Hide;
  end;
end;

end.
