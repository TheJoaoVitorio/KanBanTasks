program KanBanTasks;

uses
  System.StartUpCopy,
  FMX.Forms,
  FHome in 'forms\FHome.pas' {Home},
  frItemCategory in 'frames\frItemCategory.pas' {FrameItemCategory: TFrame},
  uFuntions in 'commons\uFuntions.pas',
  uInstanceController in 'connection\uInstanceController.pas',
  uConnection in 'connection\uConnection.pas',
  frItemCategorySplitter in 'frames\frItemCategorySplitter.pas' {FramItemCategorySplitter: TFrame},
  uApplicationController in 'controller\uApplicationController.pas',
  uCategoriasController in 'controller\uCategoriasController.pas',
  uCategoriaVO in 'model\uCategoriaVO.pas',
  uTasksVO in 'model\uTasksVO.pas',
  frCardTask in 'frames\frCardTask.pas' {FrameCardTask: TFrame},
  frBadge in 'frames\frBadge.pas' {FrameBadge: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(THome, Home);
  Application.Run;
end.
