program GT_UPDATE;

uses
  Forms,
  UMain in 'UMain.pas' {fmMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'GTS UPDATE';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
