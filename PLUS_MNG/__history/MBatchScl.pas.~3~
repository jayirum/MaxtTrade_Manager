unit MBatchScl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzLstBox, bsSkinCtrls, VCL_Helper, MBasic, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, GridsEh, DBAxisGridsEh, DBGridEh,
  RzDBEdit, kcRaizeCtrl, StdCtrls, RzCmboBx, RzDBCmbo, RzSplit, Mask, RzEdit,
  bsMessages, DB, MemDS, DBAccess, Uni, ImgList, BusinessSkinForm, RzDBNav,
  bsribbon, ExtCtrls, RzPanel, NxColumnClasses, NxColumns, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid, NxGrid_Helper;

type
  TfmBatchScl = class(TfmBasic)
    gdMain: TNextGrid;
    NxTextColumn43: TNxTextColumn;
    NxTextColumn57: TNxTextColumn;
    NxTextColumn58: TNxTextColumn;
    NxTextColumn59: TNxTextColumn;
    NxTextColumn60: TNxTextColumn;
    NxTextColumn66: TNxTextColumn;
    NxTextColumn1: TNxTextColumn;
    NxComboBoxColumn1: TNxComboBoxColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    btnApply: TbsSkinButton;
    procedure FormShow(Sender: TObject);
    procedure btnExcelClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnApplyClick(Sender: TObject);
  private
    { Private declarations }
    function TimeDisp(sTm : String): String;
    function ReplaceCheck(sTm: String): String;

    function GridTimeCheck: Boolean;
  public
    { Public declarations }
    procedure MainTableOpen; override;
  end;

var
  fmBatchScl: TfmBatchScl;

implementation

uses StdUtils, MMastDB, MDelay;

{$R *.dfm}

{ TfmSample }

procedure TfmBatchScl.btnApplyClick(Sender: TObject);
var
  i : Integer;
  sSql : String;
begin
  if Not GridTimeCheck then
  begin
    bsMsgError('시간포맷 오류');
    Exit;
  end;

  with gdMain do
  begin
    sSql := Format('UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '+
                   'UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '+
                   'UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '+
                   'UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '+
                   'UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '+
                   'UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '+
                   'UPDATE BATCH_SCL SET START_TM = %s WHERE BS_CD = %s; '
                   ,[QuotedStr(ReplaceCheck(CellToStr(2, 0))), QuotedStr('I01'),
                     QuotedStr(ReplaceCheck(CellToStr(5, 0))), QuotedStr('E21'),
                     QuotedStr(ReplaceCheck(CellToStr(6, 0))), QuotedStr('E11'),
                     QuotedStr(ReplaceCheck(CellToStr(5, 1))), QuotedStr('E22'),
                     QuotedStr(ReplaceCheck(CellToStr(5, 2))), QuotedStr('E23'),
                     QuotedStr(ReplaceCheck(CellToStr(6, 2))), QuotedStr('E12'),
                     QuotedStr(ReplaceCheck(CellToStr(5, 3))), QuotedStr('E24')]);

    Uni_Open(dbMain, sSQl);

    for i := 0 to RowCount - 1 do
    begin

      sSql := Format('UPDATE BATCH_SCL SET START_TM = %s, USE_YN = %s WHERE BS_CD = %s; '+
                     'UPDATE BATCH_SCL SET START_TM = %s, USE_YN = %s WHERE BS_CD = %s; '
                     ,[QuotedStr(ReplaceCheck(CellToStr(3, i))), QuotedStr(CellToStr(8, i)), QuotedStr(CellToStr(9, i)),
                       QuotedStr(ReplaceCheck(CellToStr(4, i))), QuotedStr(CellToStr(8, i)), QuotedStr(CellToStr(10, i))]);

      Uni_Open(dbMain, sSQl);

    end;

  end;
end;

procedure TfmBatchScl.btnExcelClick(Sender: TObject);
begin
  inherited;
//  Export_Excel(gdMain);
end;

procedure TfmBatchScl.btnPostClick(Sender: TObject);
var
  i : Integer;
  sSql : String;
begin
  btnApply.SetFocus;
  btnApply.ButtonClick;
end;

procedure TfmBatchScl.FormShow(Sender: TObject);
begin
  inherited;

  gdMain.SetFocus;

end;

function TfmBatchScl.GridTimeCheck: Boolean;
var
  iCol, iRow: Integer;
  sValue: String;
begin
  Result := True;

  with gdMain do
  begin
    for iRow := 0 to RowCount - 1 do
    begin
      for iCol := 2 to 6 do
      begin
        sValue := CellToStr(iCol, iRow);

        if (sValue <> '') and (ReplaceCheck(sValue) = '') then
        begin
          Result := False;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TfmBatchScl.MainTableOpen;
var
  sSql : String;
  i, j, iAdd : Integer;
begin
  iAdd := 0;

  Delay_Show();
  try
    sSQL := Format('SELECT ARTC_CD, ARTC_NM FROM ARTC_MST WHERE ACNT_TP = %s', [QuotedStr('2')]);

    Uni_Open(dbMain, sSQL);

    with dbMain, gdMain do
    begin
      DisableControls;
      First;
      BeginUpdate;
      ClearRows;

      AddRow(4);

      StrToCell(0, 0, '101');
      StrToCell(0, 1, '101');
      StrToCell(0, 2, '201');
      StrToCell(0, 3, '201');

      StrToCell(1, 0, 'KRX(선물)');
      StrToCell(1, 1, '야간선옵(야간선물)');
      StrToCell(1, 2, 'KRX(옵션)');
      StrToCell(1, 3, 'Eurex(야간옵션)');

      for i := 0 to RecordCount - 1 do
      begin
        AddRow(1);
        StrToCell(0, i+4, FieldByName('ARTC_CD').AsString);
        StrToCell(1, i+4, FieldByName('ARTC_NM').AsString);

        Next;
      end;

      sSql := 'SELECT A.BS_CD  , '+
              'A.ARTC_CD     ,   '+
              'A.MKT_TP      ,   '+
              'A.NOTI_YN     ,   '+
              'A.JOB_NM      ,   '+
              'A.EXEC_NM     ,   '+
              'A.START_TM    ,   '+
              'A.EXEC_YN     ,   '+
              'A.USE_YN      ,   '+
              'A.LAST_EXEC_DT,   '+
              'A.LAST_EXEC_TM,   '+
              'A.ACNT_TP     ,   '+
              'A.BIGO           '+
              'FROM BATCH_SCL A  ';

      Uni_Open(dbMain, sSql);

      for i := 0 to RecordCount - 1 do
      begin

        if FieldByName('BS_CD').AsString = 'I01' then
        begin
          StrToCell(2, 0, TimeDisp(FieldByName('START_TM').AsString));
//          StrToCell(2, 2, FieldByName('START_TM').AsString);
          Next;
          Continue;
        end;

//------------------------------------------------------------------------------ 만기일
        if FieldByName('BS_CD').AsString = 'E11' then
        begin
          StrToCell(6, 0, TimeDisp(FieldByName('START_TM').AsString));
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'E12' then
        begin
          StrToCell(6, 2, TimeDisp(FieldByName('START_TM').AsString));
          Next;
          Continue;
        end;

//------------------------------------------------------------------------------ 종가청산
        if FieldByName('BS_CD').AsString = 'E21' then
        begin
          StrToCell(5, 0, TimeDisp(FieldByName('START_TM').AsString));
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'E22' then
        begin
          StrToCell(5, 1, TimeDisp(FieldByName('START_TM').AsString));
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'E23' then
        begin
          StrToCell(5, 2, TimeDisp(FieldByName('START_TM').AsString));
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'E24' then
        begin
          StrToCell(5, 3, TimeDisp(FieldByName('START_TM').AsString));
          Next;
          Continue;
        end;
//------------------------------------------------------------------------------ 국내선물야간
        if FieldByName('BS_CD').AsString = 'E15' then
        begin
          StrToCell(4, 1, TimeDisp(FieldByName('START_TM').AsString));
          StrToCell(10, 1, FieldByName('BS_CD').AsString);
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'S14' then
        begin
          StrToCell(3, 1, TimeDisp(FieldByName('START_TM').AsString));
          StrToCell(9, 1, FieldByName('BS_CD').AsString);
          StrToCell(8, 1, FieldByName('USE_YN').AsString);
          Next;
          Continue;
        end;
//------------------------------------------------------------------------------ 옵션
        if FieldByName('BS_CD').AsString = 'S12' then
        begin
          StrToCell(3, 2, TimeDisp(FieldByName('START_TM').AsString));
          StrToCell(9, 2, FieldByName('BS_CD').AsString);
          StrToCell(8, 2, FieldByName('USE_YN').AsString);
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'E17' then
        begin
          StrToCell(4, 2, TimeDisp(FieldByName('START_TM').AsString));
          StrToCell(10, 2, FieldByName('BS_CD').AsString);
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'S15' then
        begin
          StrToCell(3, 3, TimeDisp(FieldByName('START_TM').AsString));
          StrToCell(9, 3, FieldByName('BS_CD').AsString);
          StrToCell(8, 3, FieldByName('USE_YN').AsString);
          Next;
          Continue;
        end;

        if FieldByName('BS_CD').AsString = 'E16' then
        begin
          StrToCell(4, 3, TimeDisp(FieldByName('START_TM').AsString));
          StrToCell(10, 3, FieldByName('BS_CD').AsString);
          Next;
          Continue;
        end;
//------------------------------------------------------------------------------
        for j := 0 to RowCount - 1 do
        begin
          if FieldByName('ARTC_CD').AsString = CellToStr(0, j) then
          begin
            if FieldByName('MKT_TP').AsString = '1' then
            begin
              StrToCell(3, j, TimeDisp(FieldByName('START_TM').AsString));
              StrToCell(9, j, FieldByName('BS_CD').AsString);
            end;

            if FieldByName('MKT_TP').AsString = '3' then
            begin
              StrToCell(4, j, TimeDisp(FieldByName('START_TM').AsString));
              StrToCell(10, j, FieldByName('BS_CD').AsString);
            end;


            StrToCell(8, j, FieldByName('USE_YN').AsString);

          end;


        end;

        Next;
      end;

      EndUpdate;
      EnableControls;


    end;
  finally
    Delay_Hide;
  end;
end;

function TfmBatchScl.ReplaceCheck(sTm: String): String;
var
  sHour, sMin: String;
begin
  Result := '';

  if Length(sTm) < 5 then Exit;

  sHour := Copy(sTm, 1, 2);
  sMin  := Copy(sTm, 4, 2);

  if (StrToIntDef(sHour, 24) >= 24) or (StrToIntDef(sMin, 60) >= 60) then
  begin
//    bsMsgError('시간포맷 오류');
    Exit;
  end;

  Result := sHour + sMin;
end;

function TfmBatchScl.TimeDisp(sTm: String): String;
begin
  Result := Copy(sTM, 1, 2) + ':' + Copy(sTM, 3, 2);
end;

end.
