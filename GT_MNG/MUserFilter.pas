unit MUserFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, kcRaizeCtrl, bsMessages, BusinessSkinForm,
  bsSkinCtrls, Mask, RzEdit, ExtCtrls, RzPanel;

type
  TfmUserFilter = class(TForm)
    bsBusinessSkinForm: TbsBusinessSkinForm;
    bsSkinMessage: TbsSkinMessage;
    RzPanel1: TRzPanel;
    bsSkinLabel2: TbsSkinLabel;
    bsSkinLabel1: TbsSkinLabel;
    bsSkinLabel3: TbsSkinLabel;
    bsSkinLabel4: TbsSkinLabel;
    bsSkinLabel5: TbsSkinLabel;
    edUserID: TkcRzEdit;
    edUserNm: TkcRzEdit;
    edPartNick: TkcRzEdit;
    edPartId: TkcRzEdit;
    RzPanel2: TRzPanel;
    btnClear: TbsSkinButton;
    btnFilter: TbsSkinButton;
    btnClose: TbsSkinButton;
    cbUserGrade: TkcRzComboBox;
    bsSkinLabel6: TbsSkinLabel;
    bsSkinLabel7: TbsSkinLabel;
    cbUserPart: TkcRzComboBox;
    cbAcntStat: TkcRzComboBox;
    bsSkinLabel8: TbsSkinLabel;
    cbServerIp: TkcRzComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure btnFilterClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmUserFilter: TfmUserFilter;
  function UserFilter_Run: String;

implementation

uses MUser, MMastDB;

{$R *.dfm}

{ TfmUserFilter }

var
	_Result: String='';

function UserFilter_Run: String;
begin
	Result := '';

	fmUserFilter := TfmUserFilter.Create(Application);

  with fmUserFilter do
  begin
    try
      ShowModal;
	 	finally
    	Result := _Result;
    	Free;
    end;
  end;
end;

procedure TfmUserFilter.btnClearClick(Sender: TObject);
var
	i: Integer;
begin
	for i := 0 to ComponentCount - 1 do
	begin
    if Components[i].ClassType = TkcRzEdit then TRzEdit(Components[i]).Text := '';
    if Components[i].ClassType = TkcRzComboBox then TkcRzComboBox(Components[i]).ItemIndex := -1;
    
  end;
end;

procedure TfmUserFilter.btnCloseClick(Sender: TObject);
begin
  _Result := '';
  Close;
end;

procedure TfmUserFilter.btnFilterClick(Sender: TObject);
var
	sFilter: String;
begin
	sFilter := '';

  if edUserID.Text <> '' then
  	sFilter := sFilter + Format('USER_ID LIKE %s AND ',  [QuotedStr('%' + edUserID.Text + '%')]);
  if edUserNm.Text <> '' then
  	sFilter := sFilter + Format('USER_NM LIKE %s AND ', [QuotedStr('%' + edUserNm.Text + '%')]);
  if edPartId.Text <> '' then
    sFilter := sFilter + Format('PARTNER_ID LIKE %s AND ',  [QuotedStr('%' + edPartId.Text + '%')]);
  if edPartNick.Text <> '' then
    sFilter := sFilter + Format('PARTNER_NICK_NM LIKE %s AND ',  [QuotedStr('%' + edPartNick.Text + '%')]);
  if cbUserGrade.ItemIndex <> -1 then
    sFilter := sFilter + Format('USER_GRADE LIKE %s AND ', [QuotedStr('%' + cbUserGrade.Values[cbUserGrade.ItemIndex] + '%')]);
  if cbUserPart.ItemIndex <> -1 then
    sFilter := sFilter + Format('PART_CD LIKE %s AND ', [QuotedStr('%' + cbUserPart.Values[cbUserPart.ItemIndex] + '%')]);
//  if cbAcntStat.ItemIndex <> -1 then
//    sFilter := sFilter + Format('ACNT_STAT LIKE %s AND ', [QuotedStr('%' + cbAcntStat.Values[cbAcntStat.ItemIndex] + '%')]);
  if cbServerIp.ItemIndex <> -1 then
    sFilter := sFilter + Format('SERVER_IP LIKE %s AND ', [QuotedStr('%' + cbServerIp.Values[cbServerIp.ItemIndex] + '%')]);

  sFilter := sFilter + 'NOT USER_ID IS NULL';

	_Result := sFilter;
  Close;
end;

procedure TfmUserFilter.FormShow(Sender: TObject);
begin

   MastDB.cbDbCompCopy(fmuser.cbUser_Grade, cbUserGrade);
   MastDB.cbDbCompCopy(fmUser.cbUserPart, cbUserPart);
//   MastDB.cbDbCompCopy(fmUser.cbAcntStat2, cbAcntStat);
   MastDB.cbDbCompCopy(fmUser.cbServerIP, cbServerIp);

end;

end.
