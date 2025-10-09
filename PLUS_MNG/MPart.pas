unit MPart;

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
  TfmPart = class(TfmBasic)
    pnLeft: TRzSizePanel;
    lbxPart: TRzListBox;
    RzPanel2: TRzPanel;
    gdMain: TDBGridEh;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbxPartClick(Sender: TObject);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure dbMainBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
    procedure queryWhere;
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmPart: TfmPart;

implementation

{$R *.dfm}

uses
  stdUtils, MMastDB;

var
  _Where : String;

procedure TfmPart.dbMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('PART_TP').AsString := lbxPart.Items[lbxPart.ItemIndex];
end;

procedure TfmPart.dbMainBeforePost(DataSet: TDataSet);
begin
  inherited;
  if (DataSet.FieldByName('PART_CD').AsString = '') or (DataSet.FieldByName('PART_NM').AsString = '') then DataSet.Cancel;
end;

procedure TfmPart.FormCreate(Sender: TObject);
begin
  inherited;
  SetADOConn(fmPart);
end;

procedure TfmPart.FormShow(Sender: TObject);
begin
  inherited;

  lbxPart.ItemIndex := 0;
  queryWhere;

  MainTableOpen;
end;

procedure TfmPart.lbxPartClick(Sender: TObject);
begin
  inherited;
  queryWhere;
  MainTableOpen;
end;

procedure TfmPart.MainTableOpen;
var
  sSql : String;
begin
  sSql := 'SELECT * FROM PART_MST ' + _Where;
  fnSqlOpen(dbMain, sSql);
end;

procedure TfmPart.queryWhere;
begin
  _Where := Format(' WHERE PART_TP = %s', [QuotedStr(lbxPart.Items[lbxPart.ItemIndex])]);
end;

end.
