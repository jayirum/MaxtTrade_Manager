unit MBank;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Dialogs, ImgList,
//  Mask, Messages, Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsRibbon, bsMessages,
// Raize, kcRaize
  RzPanel, RzEdit, RzLstBox, RzDBEdit, RzCmboBx, RzDBCmbo, RzSplit, RzDBNav,
  kcRaizeCtrl,
// NextSuite
  NxColumns, NxDBColumns, NxScrollControl, NxCustomGridControl, NxCustomGrid,
  NxDBGrid,
// EhLib
  DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh,
  DBAxisGridsEh, DBGridEh,
// User Unit
  MBasic;

type
  TfmBank = class(TfmBasic)
    RzPanel2: TRzPanel;
    gdMain: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmBank: TfmBank;

implementation

{$R *.dfm}

uses
  stdUtils, MMastDB;

procedure TfmBank.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmBank);
end;

procedure TfmBank.FormShow(Sender: TObject);
begin
  inherited;
  MainTableOpen;
end;

procedure TfmBank.MainTableOpen;
var
  sSql : String;
begin
  sSql := 'SELECT * FROM BANK_MST ';
  fnSqlOpen(dbMain, sSql);
end;

end.
