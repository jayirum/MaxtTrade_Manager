unit MUserFind;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Mask, ImgList,
//  Messages, Variants, Graphics, Dialogs,
// BusinessSkinForm_1042
  BusinessSkinForm, bsMessages, bsSkinCtrls,
// Raize, kcRaize
  RzPanel, RzEdit,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh;

type
  TfmUserFind = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    pnFind: TRzPanel;
    RzPanel1: TRzPanel;
    gdUser: TDBGridEh;
    edFind: TRzEdit;
    bsSkinLabel1: TbsSkinLabel;
    dsMain: TDataSource;
    btnFilter: TbsSkinSpeedButton;
    imgBtn: TImageList;
    dbMain: TADOQuery;
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFilterClick(Sender: TObject);
    procedure gdUserDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen;
  end;

var
  fmUserFind: TfmUserFind;
  function UserFind_Run:String;

implementation

uses
  stdUtils, MMastDB, MDelay;

{$R *.dfm}

var
  _Result: String='';
  _Where : String='';

function UserFind_Run: String;
begin
  Result := '';

  Application.CreateForm(TfmUserFind, fmUserFind);
  try
    fmUserFind.ShowModal;
   finally
    Result := _Result;
    fmUserFind.Free;
  end;
end;

procedure TfmUserFind.btnFilterClick(Sender: TObject);
begin
  _Where := ' WHERE ' + Format('(%s)', [StrReplace(_Find_User, '<X>', edFind.Text)]);
  MainTableOpen;
end;

procedure TfmUserFind.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then btnFilter.ButtonClick;
end;

procedure TfmUserFind.FormCreate(Sender: TObject);
begin
  SetADOConn(fmUserFind);
end;

procedure TfmUserFind.gdUserDblClick(Sender: TObject);
begin
  _Result := dbMain.FieldByName('USER_ID').AsString;
  Close;
end;

procedure TfmUserFind.MainTableOpen;
var
  sSql, sGrade : String;
begin
  if Not _Supervisor then begin
    if _Where = '' then sGrade := ' WHERE USER_GRADE <> 7 '
                   else sGrade := '   AND USER_GRADE <> 7 '
  end;

  sSql :=
    'SELECT USER_ID  ' +
    '      ,USER_NM  ' +
    '  FROM USER_MST ' +
    _Where +
    sGrade;

  fnSqlOpen(dbMain, sSql);
end;

end.
