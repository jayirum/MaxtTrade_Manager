unit MPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MBasic, bsMessages, DB, MemDS, DBAccess, Uni, ImgList,
  BusinessSkinForm, bsSkinCtrls, RzDBNav, bsribbon, ExtCtrls, RzPanel, StdCtrls,
  RzLstBox, RzSplit, NxColumns, NxDBColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxDBGrid, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, RzCmboBx, RzDBCmbo, kcRaizeCtrl, Mask, RzEdit,
  RzDBEdit, GridsEh, DBAxisGridsEh, DBGridEh, UniDAC_Helper;

type
  TfmPart = class(TfmBasic)
    pnLeft: TRzSizePanel;
    lbxPart: TRzListBox;
    RzPanel2: TRzPanel;
    gdMain: TDBGridEh;
    dbMainPART_SEQ: TIntegerField;
    dbMainPART_TP: TStringField;
    dbMainPART_CD: TStringField;
    dbMainPART_NM: TStringField;
    procedure FormShow(Sender: TObject);
    procedure dbMainAfterInsert(DataSet: TDataSet);
    procedure lbxPartClick(Sender: TObject);
    procedure dbMainBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MainTableOpen;
    procedure queryWhere;
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
  sSql := 'SELECT * FROM PART_MST' + _Where;
  Uni_Open(dbMain, sSql);
end;

procedure TfmPart.queryWhere;
begin
  _Where := Format(' WHERE PART_TP = %s', [QuotedStr(lbxPart.Items[lbxPart.ItemIndex])]);
end;

end.
