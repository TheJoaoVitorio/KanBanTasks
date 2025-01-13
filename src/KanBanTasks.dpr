program KanBanTasks;

uses
  System.StartUpCopy,
  FMX.Forms,
  FHome in 'forms\FHome.pas' {Home},
  frItemCategory in 'frames\frItemCategory.pas' {FrameItemCategory: TFrame},
  uFuntions in 'commons\uFuntions.pas',
  uInstanceController in 'connection\uInstanceController.pas',
  uConnection in 'connection\uConnection.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THome, Home);
  Application.Run;
end.
