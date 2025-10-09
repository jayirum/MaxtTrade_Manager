unit MUserFind;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh, ExtCtrls, RzPanel, bsMessages, BusinessSkinForm,
  bsSkinCtrls, StdCtrls, Mask, RzEdit, DB, MemDS, DBAccess, Uni, ImgList, UniDAC_Helper;

type
  TfmUserFind = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    pnFind: TRzPanel;
    RzPanel1: TRzPanel;
    gdUser: TDBGridEh;
    edFind: TRzEdit;
    bsSkinLabel1: TbsSkinLabel;
    dbMain: TUniQuery;
    dsMain: TDataSource;
    dbMainUSER_ID: TStringField;
    dbMainUSER_NM: TStringField;
    btnFilter: TbsSkinSpeedButton;
    imgBtn: TImageList;
    procedure edFindKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFilterClick(Sender: TObject);
    procedure gdUserDblClick(Sender: TObject);
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

procedure TfmUserFind.btnFilterClick(Sender: TObject);
begin
  _Where := ' WHERE ' + Format('(%s)', [StrReplace(__Find_User, '<X>', edFind.Text)]);
  MainTableOpen;
end;

procedure TfmUserFind.edFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then btnFilter.ButtonClick;
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
  if Not __Supervisor then
  begin
    if _Where = '' then sGrade := ' WHERE USER_GRADE <> 7 '
    else sGrade := ' AND USER_GRADE <> 7 '
  end;

  sSql := 'SELECT                                   '+
          '  USER_ID,                               '+
          '  USER_NM                                '+
          'FROM USER_MST                            '+
          _Where +
          sGrade;

  Uni_Open(dbMain, sSql);
end;

function UserFind_Run: String;
begin
	Result := '';

	fmUserFind := TfmUserFind.Create(Application);

  with fmUserFind do
  begin
    try
      ShowModal;
	 	finally
    	Result := _Result;
    	Free;
    end;
  end;
end;

end.
