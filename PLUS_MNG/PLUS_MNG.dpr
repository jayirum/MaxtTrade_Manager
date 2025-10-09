program PLUS_MNG;

uses
  Forms,
  MBasic in '..\..\..\GTLIB\CommonUnit\MBasic.pas' {fmBasic},
  VCL_Helper in '..\..\..\GTLIB\PAS\VCL_Helper.pas',
  StdUtils in '..\..\..\GTLIB\CommonUnit\StdUtils.pas',
  GTUpdate in '..\..\..\GTLIB\CommonUnit\GTUpdate.pas' {fmUpdate},
  GTNoti in '..\..\..\GTLIB\CommonUnit\GTNoti.pas' {fmGTNoti},
  NxGrid_Helper in '..\..\..\GTLIB\CommonUnit\NxGrid_Helper.pas',
  PacketStruct in '..\..\..\GTLIB\CommonUnit\PacketStruct.pas',
  PacketThread in '..\..\..\GTLIB\CommonUnit\PacketThread.pas',
  MAccount in 'MAccount.pas' {fmAccount},
  MAcntMake in 'MAcntMake.pas' {fmAcntMake},
  MArtc in 'MArtc.pas' {fmArtc},
  MBank in 'MBank.pas' {fmBank},
  MBatchScl in 'MBatchScl.pas' {fmBatchScl},
  MBlockIp in 'MBlockIp.pas' {fmBlockIp},
  MCorp in 'MCorp.pas' {fmCorp},
  MDBTool in 'MDBTool.pas' {fmDbTool},
  MDelay in 'MDelay.pas' {fmDelay},
  MExchRt in 'MExchRt.pas' {fmExchRt},
  MHybrid in 'MHybrid.pas' {fmHybrid},
  MInOut in 'MInOut.pas' {fmInOut},
  MInOutList in 'MInOutList.pas' {fmInOutList},
  MLogin in 'MLogin.pas' {fmLogin},
  MLogList in 'MLogList.pas' {fmLogList},
  MLossCut in 'MLossCut.pas' {fmLossCut},
  MMain in 'MMain.pas' {fmMain},
  MMastDB in 'MMastDB.pas' {MastDB: TDataModule},
  MMngIp in 'MMngIp.pas' {fmMngIp},
  MNclr in 'MNclr.pas' {fmNclr},
  MNego in 'MNego.pas' {fmNego},
  MArtcOpt in 'MArtcOpt.pas' {fmArtcOpt},
  MNoCntrOrd in 'MNoCntrOrd.pas' {fmNoCntrOrd},
  MNoti in 'MNoti.pas' {fmNoti},
  MOrdDetail in 'MOrdDetail.pas' {fmOrdDetail},
  MConnIP in 'MConnIP.pas' {fmConnIP},
  MOverNgt in 'MOverNgt.pas' {fmOverNgt},
  MPart in 'MPart.pas' {fmPart},
  MPLClsList in 'MPLClsList.pas' {fmPLClsList},
  MPLList in 'MPLList.pas' {fmPLList},
  MPower in 'MPower.pas' {fmPower},
  MPresent in 'MPresent.pas' {fmPresent},
  MRealConn in 'MRealConn.pas' {fmRealConn},
  MUserStkPL in 'MUserStkPL.pas' {fmUserStkPL},
  MScL in 'MScL.pas' {fmScL},
  MStk in 'MStk.pas' {fmStk},
  MUser in 'MUser.pas' {fmUser},
  MUserArtc in 'MUserArtc.pas' {fmUserArtc},
  MUserDetail in 'MUserDetail.pas' {fmUserDetail},
  MUserFilter in 'MUserFilter.pas' {fmUserFilter},
  MUserFind in 'MUserFind.pas' {fmUserFind},
  MUserOv in 'MUserOv.pas' {fmUserOv},
  MOvStatus in 'MOvStatus.pas' {fmOvStatus},
  MRealPL in 'MRealPL.pas' {fmRealPL},
  MTodayPL in 'MTodayPL.pas' {fmTodayPL},
  MStkPL in 'MStkPL.pas' {fmStkPL},
  MOvList in 'MOvList.pas' {fmOvList},
  MNegoCmsn in 'MNegoCmsn.pas' {fmNegoCmsn},
  MOvApprove in 'MOvApprove.pas' {fmOvApprove},
  uChatClientM in '..\..\..\GTLIB\CommonUnit\uChatClientM.pas' {frmChatClientM};

{$R *.res}

begin
  Application.Initialize;
//  Application.MainFormOnTaskbar := True;
  Application.Title := 'GTS Management';
  Application.CreateForm(TfmMain, fmMain);
  Application.Run;
end.
