unit MAcntMake;

interface

uses
  Windows, Classes, Forms, Controls, StdCtrls, ExtCtrls, SysUtils, ADODB,
  DB, DBAccess, MemDS, Dialogs, Messages,
//  Variants, Graphics,
// BusinessSkinForm_1042
  BusinessSkinForm, bsSkinCtrls, bsMessages,
// Raize
  RzPanel, VCL_Helper;

type
  TfmAcntMake = class(TForm)
    bsSkinMessage: TbsSkinMessage;
    bsBusinessSkinForm: TbsBusinessSkinForm;
    rgAcntTp: TbsSkinRadioGroup;
    btnFilter: TbsSkinButton;
    btnClose: TbsSkinButton;
    dbTemp: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
  private
    { Private declarations }
    function AcntMakeProc(sData: String): Boolean;
    function AcntMake(sType : String): String;

    // ����
    function AcntMakeProcMerge: Boolean;
    function AcntMakeMerge: String;
  public
    { Public declarations }
  end;

var
  fmAcntMake: TfmAcntMake;
  function fmAcntMake_Run(sUserID:String; sUserNM:String): Boolean;

implementation

uses StdUtils, MMastDB;

{$R *.dfm}

var
  _Result: Boolean = True;
  _UserID: String;
  _UserNM: String;

function fmAcntMake_Run(sUserID:String; sUserNM:String): Boolean;
begin
  Application.CreateForm(TfmAcntMake, fmAcntMake);
  try
    _UserID := sUserID;
    _UserNM := sUserNM;
    fmAcntMake.ShowModal;
  finally
    Result := _Result;
    fmAcntMake.Free;
  end;
end;

procedure TfmAcntMake.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmAcntMake.btnFilterClick(Sender: TObject);
var
  sRslt : Boolean;
begin

  {����
  if rgAcntTp.ItemIndex = -1 then
  begin
    bsSkinMessage.MessageDlg2('TYPE�� �����ϼ���!', '����', mtError, [mbOK], 0);
    Exit;
  end;
  }

  sRslt := AcntMakeProcMerge();  //���� AcntMakeProc(intTostr(rgAcntTp.ItemIndex));

  _Result := sRslt;

  if sRslt then  Close;
end;

procedure TfmAcntMake.FormCreate(Sender: TObject);
begin
  SetADOConn(fmAcntMake);
end;

procedure TfmAcntMake.FormShow(Sender: TObject);
//var
//  sSql : String;
begin
  {����
  sSql := 'SELECT ACNT_TP_DEFAULT FROM CORP_MST';
  Uni_Open(dbTemp, sSql);

  PartComp_Open(rgAcntTp, Format('@|CODE_VALUE_NM, CODE_VALUE|CODE_MST|WHERE CODE_ID = %s AND CODE_DISP = %s',
                                 [QuotedStr('ACNT_TP'), QuotedStr('Y')]), '��ü����', '0' );

  rgAcntTp.ItemIndex := StrToInt(dbTemp.FieldByName('ACNT_TP_DEFAULT').AsString);
  }
  btnFilterClick(sender);
end;

function TfmAcntMake.AcntMakeMerge: String;
var
//  sWhere,
  sSp, sSql: String;
  iSeq: integer;
begin
  sSql := Format(
    'SELECT COUNT(*) AS CNT ' +
    '  FROM ACNT_MST ' +
    ' WHERE USER_ID = %s ',
    [QuotedStr(_UserID)]);
  fnSqlOpen(MastDB.dbExec, sSql);

  if MastDB.dbExec.FieldByName('CNT').AsInteger > 0 then begin
    bsSkinMessage.MessageDlg2('���°� �̹� �ֽ��ϴ�!', '����', mtError, [mbOK], 0);
    Result := '9999';
    Exit;
  end;

  sSp := 'EXEC PP_ACNT_SEQNO ';
  fnSqlOpen(MastDB.dbExec, sSp);

  with MastDB.dbExec do begin
    iSeq := FieldByName('RESULT_CODE').AsInteger;
  end;

  sSql := Format(
    'INSERT INTO ACNT_MST ( ' +
    '   ACNT_NO     ' +
    '  ,ACNT_TP     ' +
    '  ,USER_ID     ' +
    '  ,USER_NM     ' +
    '  ,ACNT_PWD    ' +
    '  ,API_TP      ' +
    '  ,ACNT_STATE  ' +
    '  ,MINAMT_GUJA ' +    //�ּұݾ� CORP_MST�� �⺻�� ����
    '  ,NEGO_DUP_YN ' +    //�ߺ����Ӱ��ɿ��� CORP_MST�� �⺻�� ����
    ' ) VALUES (    ' +
    ' %s,%s,%s,%s,%s,%s,%s,%s,%s ) ',
    [QuotedStr(Copy(NowDate, 3, 4) + '0' + numTostr(iSeq, 6)),  // ACNT_NO
     QuotedStr('0'),                                            // ACNT_TP
     QuotedStr(_UserID),                                        // USERID
     QuotedStr(_UserNM),                                        // USER_NM
     QuotedStr('1111'),                                         // ACNT_PWD
     '(SELECT API_TP_DEFAULT FROM CORP_MST)',                   // API_TP
     QuotedStr('1'),                                            // ACNT_STATE
     '(SELECT GUJA_MIN_AMT_1 FROM CORP_MST)',                   // MINAMT_GUJA
     '(SELECT DUP_YN FROM CORP_MST)'                            // NEGO_DUP_YN
     ]);

  Result := fnSqlOpen(MastDB.dbExec, sSql);
end;

function TfmAcntMake.AcntMakeProc(sData: String): Boolean;
var
  sSql, sRslt : String;
  bSucc: Boolean;
begin
  Result := True;
  bSucc := True;
  //�����߰�
  if sData = '-1' then Exit;

  if sData = '0' then begin
    sSql := Format('SELECT COUNT(*) AS CNT FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(_UserID)]);
    fnSqlOpen(MastDB.dbSQL, sSql);

    if MastDB.dbSQL.FieldByName('CNT').AsInteger > 0 then begin
      bsSkinMessage.MessageDlg2('��ü���� �Ҽ� �����ϴ�!', '����', mtError, [mbOK], 0);
      Result := False;
      Exit;
    end;

    sSql := Format('SELECT CODE_VALUE FROM CODE_MST WHERE CODE_ID = %s AND CODE_DISP = %s', [quotedStr('ACNT_TP'),QuotedStr('Y')]);
    fnSqlOpen(MastDB.dbSQL, sSql);

    with MastDB.dbSQL do begin
      First;

      while Not Eof  do begin
        sRslt := AcntMake(FieldByName('CODE_VALUE').AsString);

        if sRslt <> '' then begin
            if sRslt = '9999' then
              Result := False
            else
              bsSkinMessage.MessageDlg2('���»��� ����!', '����', mtError, [mbOK], 0);

            bSucc := False;
            Break;
        end;

        Next;
      end;

      if bSucc then
        bsSkinMessage.MessageDlg2('���»��� �Ϸ�!', 'Ȯ��', mtInformation, [mbOK], 0);
    end;
  end else begin
    sRslt := AcntMake(sData);

    if sRslt = '' then begin
      bsSkinMessage.MessageDlg2('���»��� �Ϸ�!', 'Ȯ��', mtInformation, [mbOK], 0)
    end else begin
      if sRslt = '9999' then
        Result := False
      else
        bsSkinMessage.MessageDlg2('���»��� ����!', '����', mtError, [mbOK], 0);
    end;
  end;

//  sSql :=  Format('SELECT * FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(_UserID)]);
//  Uni_Open(dbTemp, sSql);
end;

function TfmAcntMake.AcntMakeProcMerge: Boolean;
var
  sSql, sRslt : String;
  bSucc: Boolean;
begin
  Result := True;
  bSucc := True;

  sSql := Format('SELECT COUNT(*) AS CNT FROM ACNT_MST WHERE USER_ID = %s', [QuotedStr(_UserID)]);
  fnSqlOpen(MastDB.dbSQL, sSql);

  if MastDB.dbSQL.FieldByName('CNT').AsInteger > 0 then begin
    bsSkinMessage.MessageDlg2('USERID �� �̹� �����մϴ�!', '����', mtError, [mbOK], 0);
    Result := False;
    Exit;
  end;

  sRslt := AcntMakeMerge();
  if sRslt <> '' then begin
    if sRslt = '9999' then
      Result := False
    else
      bsSkinMessage.MessageDlg2('���»��� ����!', '����', mtError, [mbOK], 0);

    bSucc := False;
  end;

  if bSucc then
    bsSkinMessage.MessageDlg2('���»��� �Ϸ�!', 'Ȯ��', mtInformation, [mbOK], 0);
end;

function TfmAcntMake.AcntMake(sType : String): String;
var
  sSp, sSql, sWhere : String;
  iSeq : integer;
begin
  sSql := Format(
    'SELECT COUNT(*) AS CNT          ' +
    '      ,B.CODE_VALUE_NM AS CD_NM ' +
    '  FROM ACNT_MST A, CODE_MST B   ' +
    ' WHERE A.ACNT_TP = B.CODE_VALUE ' +
    '   AND A.USER_ID = %s           ' +
    '   AND A.ACNT_TP = %s           ' +
    '   AND B.CODE_ID = %s           ' +
    ' GROUP BY B.CODE_VALUE_NM       ',
    [QuotedStr(_UserID),
     QuotedStr(sType),
     QuotedStr('ACNT_TP') ]);
  fnSqlOpen(MastDB.dbExec, sSql);

  if MastDB.dbExec.FieldByName('CNT').AsInteger > 0 then begin
    bsSkinMessage.MessageDlg2('['+ MastDB.dbExec.FieldByName('CD_NM').AsString +']' + ' ���°� �̹� �ֽ��ϴ�!', '����', mtError, [mbOK], 0);
    Result := '9999';
    Exit;
  end;

  sSp := 'EXEC PP_ACNT_SEQNO' ;
  fnSqlOpen(MastDB.dbExec, sSp);

  with MastDB.dbExec do begin
    iSeq := FieldByName('RESULT_CODE').AsInteger;
  end;

  if sType = '1' then sWhere := '(SELECT GUJA_MIN_AMT_1 FROM CORP_MST)' else
  if sType = '2' then sWhere := '(SELECT GUJA_MIN_AMT_2 FROM CORP_MST)';

  sSql := Format(
    ' INSERT INTO ACNT_MST ( ' +
    '   ACNT_NO     ' +
    '  ,ACNT_TP     ' +
    '  ,USER_ID     ' +
    '  ,USER_NM     ' +
    '  ,ACNT_PWD    ' +
    '  ,API_TP      ' +
    '  ,ACNT_STATE  ' +
    '  ,MINAMT_GUJA ' +    //�ּұݾ� CORP_MST�� �⺻�� ����
    '  ,NEGO_DUP_YN  ' +    //�ߺ����Ӱ��ɿ��� CORP_MST�� �⺻�� ����
    ' ) VALUES (    ' +
    ' %s,%s,%s,%s,%s,%s,%s,%s,(SELECT DUP_YN FROM CORP_MST)) ',
    [QuotedStr(Copy(NowDate, 3, 4) + sType + numTostr(iSeq, 6)),
     QuotedStr(sType),
     QuotedStr(_UserID),
     QuotedStr(_UserNM),
     QuotedStr('1111'),
     '(SELECT API_TP_DEFAULT FROM CORP_MST)',
     QuotedStr('1'),
     sWhere]);
  Result := fnSqlOpen(MastDB.dbExec, sSql);
end;

end.
