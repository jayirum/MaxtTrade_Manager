unit MConnIP;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, Dialogs, ImgList, Graphics,
//  Math, Messages, Variants,
// BusinessSkinForm_1042
  BusinessSkinForm, bsRibbon, bsSkinBoxCtrls, bsSkinCtrls, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzLstBox, RzDBNav,
  kcRaizeCtrl, VCL_Helper,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmConnIP = class(TfmBasic)
    bsRibbonDivider1: TbsRibbonDivider;
    pnCnt: TRzPanel;
    bsSkinLabel1: TbsSkinLabel;
    edMac: TRzEdit;
    gdMain: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
      Column: TColumnEh);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmConnIP: TfmConnIP;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmConnIP.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmConnIP);
end;

procedure TfmConnIP.gdMainTitleBtnClick(Sender: TObject; ACol: Integer;
  Column: TColumnEh);
begin
  inherited;
  SortData(gdMain, dbMain, ACol);
end;

procedure TfmConnIP.MainTableOpen;
var
  sSql, sResult, sMac, sUserTp, sWhere : String;
begin
  sMac := Trim(edMac.Text);
  if sMac <> '' then sMac := Format('AND (A.LOGIN_MAC LIKE %s) ', [QuotedStr('%'+sMac+'%')])
                else Exit;
  try
    Delay_Show();
    sSql := Format(
      'SELECT B.USER_ID      ' +
      '      ,B.USER_NM      ' +
      '      ,B.USER_NICK_NM ' +
      '      ,B.USER_GRADE   ' +
      '      ,A.LOGIN_DT     ' +
      '      ,A.LOGIN_TM     ' +
      '      ,A.LOGIN_IP     ' +
      '      ,A.LOGIN_MAC    ' +
      '      ,A.LOGIN_TP     ' +
      '      ,COUNT(1) OVER() AS TOTCNT ' +
      '  FROM LOGIN_HIS A, ' +
      '       USER_MST  B  ' +
      ' WHERE A.USER_ID = B.USER_ID  %s ' +
      ' ORDER BY A.LOGIN_DT, A.LOGIN_TM ' ,
      [QuotedStr(sMac) ]);
    sResult := fnSqlOpen(dbMain, sSql);

    if sResult = '' then pnCnt.Caption := dbMain.FieldByName('TOTCNT').AsString + ' °Ç'
                    else pnCnt.Caption := '0 °Ç';
  finally
    Delay_Hide;
  end;
end;

end.
