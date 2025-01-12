unit FHome;

interface

uses
  FMX.Ani,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation;

type
  THome = class(TForm)
    rtContainerMaster: TRectangle;
    rtNavLeftContainer: TRectangle;
    rtMainContainer: TRectangle;
    rtBacklogContainer: TRectangle;
    rtInProgressContainer: TRectangle;
    rtCompletedContainer: TRectangle;
    rtInReviewContainer: TRectangle;
    rtBacklogHeader: TRectangle;
    Circle1: TCircle;
    lblBacklogTitle: TLabel;
    lblBacklogValue: TLabel;
    rtInProgressHeader: TRectangle;
    Circle2: TCircle;
    lblProgressTitle: TLabel;
    lblProgressValue: TLabel;
    rtCompletedHeader: TRectangle;
    Circle3: TCircle;
    lblCompletedTitle: TLabel;
    lblCompletedValue: TLabel;
    rtInReviewHeader: TRectangle;
    Circle4: TCircle;
    lblReviewTitle: TLabel;
    lblReviewValue: TLabel;
    rtNavLeftContent: TRectangle;
    crNavMenu: TCircle;
    imgNavMenu: TImage;
    imgChangeTheme: TImage;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgChangeThemeClick(Sender: TObject);
  private
    procedure TemaLight;
    procedure DefineCoresTextosLight;
    procedure DefineCoresTextosDark;
    procedure AnimateColorChange(Target: TFmxObject; FromColor, ToColor: TAlphaColor);

  public
    procedure DefineTemaSistema(ATheme : String);
    procedure TemaDark;
  end;


var
  Theme: String = 'Dark';
  Home: THome;

implementation

{$R *.fmx}

// Simple Functions

procedure THome.DefineTemaSistema(ATheme: String);
begin
    if      ATheme = 'Dark'  then TemaDark

    else if ATheme = 'Light' then TemaLight
end;


procedure THome.DefineCoresTextosLight;
begin
    lblBacklogTitle.FontColor := TAlphaColors.Black;
    lblBacklogValue.FontColor := TAlphaColors.Black;

    lblProgressTitle.FontColor := TAlphaColors.Black;
    lblProgressValue.FontColor := TAlphaColors.Black;

    lblCompletedTitle.FontColor := TAlphaColors.Black;
    lblCompletedValue.FontColor := TAlphaColors.Black;

    lblReviewTitle.FontColor := TAlphaColors.Black;
    lblReviewValue.FontColor := TAlphaColors.Black;
end;


procedure THome.DefineCoresTextosDark;
const
  Color : TAlphaColor = $FFFBFBFB;
begin
    lblBacklogTitle.FontColor := Color;
    lblBacklogValue.FontColor := Color;

    lblProgressTitle.FontColor := Color;
    lblProgressValue.FontColor := Color;

    lblCompletedTitle.FontColor := Color;
    lblCompletedValue.FontColor := Color;

    lblReviewTitle.FontColor := Color;
    lblReviewValue.FontColor := Color;
end;


procedure THome.TemaDark;
const
    ColorPrimaryDark: TAlphaColor = $FF191B1F;
    ColorSecondaryDark: TAlphaColor = $FF2A2D32;
    ColorNavMenu: TAlphaColor = $FF2A2D32;
begin
    AnimateColorChange(rtContainerMaster, rtContainerMaster.Fill.Color, ColorPrimaryDark);
    AnimateColorChange(rtNavLeftContainer, rtNavLeftContainer.Fill.Color, ColorPrimaryDark);
    AnimateColorChange(crNavMenu, crNavMenu.Fill.Color, ColorNavMenu);

    AnimateColorChange(rtMainContainer, rtMainContainer.Fill.Color, ColorSecondaryDark);
    AnimateColorChange(rtBacklogContainer, rtBacklogContainer.Fill.Color, ColorSecondaryDark);
    AnimateColorChange(rtInProgressContainer, rtInProgressContainer.Fill.Color, ColorSecondaryDark);
    AnimateColorChange(rtInReviewContainer, rtInReviewContainer.Fill.Color, ColorSecondaryDark);
    AnimateColorChange(rtCompletedContainer, rtCompletedContainer.Fill.Color, ColorSecondaryDark);

    DefineCoresTextosDark;

    imgNavMenu.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Menu_16.png'));
    imgChangeTheme.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Sun.ico'));
end;


procedure THome.TemaLight;
const
    ColorPrimaryLight: TAlphaColor = $FFEFFEFA;
    ColorSecondaryLight: TAlphaColor = $FFFEFEFE;
    ColorNavMenuLight: TAlphaColor = $FFE2FEF7;
begin
    AnimateColorChange(rtContainerMaster, rtContainerMaster.Fill.Color, ColorPrimaryLight);
    AnimateColorChange(rtNavLeftContainer, rtNavLeftContainer.Fill.Color, ColorPrimaryLight);
    AnimateColorChange(crNavMenu, crNavMenu.Fill.Color, ColorNavMenuLight);

    AnimateColorChange(rtMainContainer, rtMainContainer.Fill.Color, ColorSecondaryLight);
    AnimateColorChange(rtBacklogContainer, rtBacklogContainer.Fill.Color, ColorSecondaryLight);
    AnimateColorChange(rtInProgressContainer, rtInProgressContainer.Fill.Color, ColorSecondaryLight);
    AnimateColorChange(rtInReviewContainer, rtInReviewContainer.Fill.Color, ColorSecondaryLight);
    AnimateColorChange(rtCompletedContainer, rtCompletedContainer.Fill.Color, ColorSecondaryLight);

    DefineCoresTextosLight;

    imgNavMenu.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_MenuGreen_16.png'));
    imgChangeTheme.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_MoonGreen_Star.ico'));
end;




// Events

procedure THome.FormCreate(Sender: TObject);
begin
    DefineTemaSistema('Dark');
end;

procedure THome.FormResize(Sender: TObject);
var
  ContainerWidth: Single;
  i: Integer;
begin
  ContainerWidth := rtMainContainer.Width / 4;
  // Ajusta a largura de cada container
  for i := 0 to rtMainContainer.ControlsCount - 1 do
  begin
      if rtMainContainer.Controls[i] is TRectangle then
      begin
        TRectangle(rtMainContainer.Controls[i]).Width := ContainerWidth;
        // Reposiciona os containers lado a lado
        TRectangle(rtMainContainer.Controls[i]).Position.X := i * ContainerWidth;
      end;
  end;

end;


procedure THome.AnimateColorChange(Target: TFmxObject; FromColor, ToColor: TAlphaColor);
begin
    TAnimator.AnimateColor(Target, 'Fill.Color', ToColor, 0.5); // Dura��o de 0.5 segundos
end;


procedure THome.imgChangeThemeClick(Sender: TObject);
begin
    if Theme = 'Dark' then
    begin
        DefineTemaSistema('Light');
        Theme := 'Light';
    end

    else if Theme = 'Light' then
    begin
        DefineTemaSistema('Dark');
        Theme := 'Dark';
    end;

end;

end.
