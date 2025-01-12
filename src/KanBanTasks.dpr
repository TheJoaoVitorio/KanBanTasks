program KanBanTasks;

uses
  System.StartUpCopy,
  FMX.Forms,
  FHome in 'forms\FHome.pas' {Home};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THome, Home);
  Application.Run;
end.
