unit MDelay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, bsSkinCtrls;

type
  TfmDelay = class(TForm)
    pnMsg: TRzPanel;
    Image1: TImage;
    bsSkinSpeedButton3: TbsSkinSpeedButton;
    procedure bsSkinSpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmDelay: TfmDelay;
  procedure Delay_Show(sMsg: String = '');
  procedure Delay_Hide;

implementation

{$R *.dfm}

procedure Delay_Show(sMsg: String = '');
begin
  if not Assigned(fmDelay) then
    Application.CreateForm(TfmDelay, fmDelay);

  with fmDelay do
  begin
    if sMsg = '' then pnMsg.Caption := '자료를 읽고 있습니다.          잠시만 기다려주세요...'
    else pnMsg.Caption := sMsg;

    Show;
    BringToFront;
    Update;
    Application.ProcessMessages;
  end;
end;

procedure Delay_Hide;
begin
  fmDelay.Hide;
end;

procedure TfmDelay.bsSkinSpeedButton3Click(Sender: TObject);
begin
	Hide;
end;

end.
