unit FHome;

interface

uses
  FMX.Ani,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

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
    lboxCategories: TListBox;
    crAddCategory: TCircle;
    imgAddCategory: TImage;
    StyleBook1: TStyleBook;
    lyMenuSplitter: TLayout;
    rtMenuSplitterContainer: TRectangle;
    rtMenuSplitterContent: TRectangle;
    Rectangle3: TRectangle;
    crCloseSplitter: TCircle;
    imgCloseSplitter: TImage;
    ListBox1: TListBox;
    crAddCategorieSplitter: TCircle;
    imgAddCategorieSplitter: TImage;
    rtMenuSplitterHeaderClose: TRectangle;
    rtButtonAddNewCategorieSplitter: TRectangle;
    lblAddNewCategorieSplitter: TLabel;
    rtButtonsThemes: TRectangle;
    rtButtonDarkTheme: TRectangle;
    rtButtonLightTheme: TRectangle;
    imgButtonDarkTheme: TImage;
    lblButtonDarkTheme: TLabel;
    imgButtonLightTheme: TImage;
    lblButtonLightTheme: TLabel;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgChangeThemeClick(Sender: TObject);
    procedure crNavMenuClick(Sender: TObject);
    procedure crCloseSplitterClick(Sender: TObject);
    procedure rtButtonAddNewCategorieSplitterMouseEnter(Sender: TObject);
    procedure rtButtonAddNewCategorieSplitterMouseLeave(Sender: TObject);
    procedure rtButtonLightThemeClick(Sender: TObject);
    procedure rtButtonDarkThemeClick(Sender: TObject);

  private
    procedure DefineTemaSistema(ATheme : String);
    procedure TemaLight;
    procedure TemaDark;
    procedure DefineCoresTextosLight;
    procedure DefineCoresTextosDark;
    procedure AnimateColorChange(Target: TFmxObject; FromColor, ToColor: TAlphaColor);
    procedure AjustaListBoxCategorias;
    procedure AjustaContainerAplicacao;
    procedure AnimateLayout(ALayout: TLayout; Show: Boolean);
    procedure AnimationFinish(Sender: TObject);
    procedure DefineThemeLightMenuSplitter;
    procedure DefineThemeDarkMenuSplitter;

  public
    procedure AddItemCategorias(AIdItem: Integer; AColorItem, APathImageItem: String);

  end;


var
  Theme: String = 'Dark';
  Home: THome;

implementation

uses
  frItemCategory , uFuntions;

{$R *.fmx}


// Simple Functions

procedure THome.AddItemCategorias(AIdItem: Integer; AColorItem, APathImageItem: String);
var
  AItemLbx : TListBoxItem;
  AFrame   : TFrameItemCategory;
  AColor   : TAlphaColor;
begin
    AColor :=  TFuntions.HexToAlphaColor(AColorItem);

    with AItemLbx do begin
      AItemLbx := TListBoxItem.Create(nil);

      Cursor     := crHandPoint;
      Tag        := AIdItem;
      Selectable := True;
      Parent     := lboxCategories;
      Height     := 48;
      Margins.Bottom := 10;
    end;


    with AFrame do begin
      AFrame := TFrameItemCategory.Create(nil);

      imgItemCategory.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\'+ APathImageItem) );
      crItemCategory.Fill.Color := AColor;

      Align   := TAlignLayout.Client;
      Parent  := AItemLbx;
      HitTest := True;
      crItemCategory.Margins.Bottom := 16;
    end;


    AItemLbx.Parent := lboxCategories;
    AItemLbx.AddObject(AFrame);

    lboxCategories.AddObject(AItemLbx);
end;


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


procedure THome.DefineThemeDarkMenuSplitter;
const
    ColorPrimaryDark: TAlphaColor = $FF191B1F;
    ColorSecondaryDark: TAlphaColor = $FF2A2D32;
    ColorNavMenu: TAlphaColor = $FF2A2D32;
    ColorGray : TAlphaColor = $FF353535;
begin
    AnimateColorChange(rtMenuSplitterContainer, rtMenuSplitterContainer.Fill.Color, ColorPrimaryDark);
    rtMenuSplitterContainer.Stroke.Color := ColorGray;
    rtMenuSplitterContainer.Stroke.Thickness := 1;
    ;
    AnimateColorChange(crCloseSplitter, crCloseSplitter.Fill.Color, ColorNavMenu);
    crCloseSplitter.Stroke.Kind := TBrushKind.Solid;
    crCloseSplitter.Stroke.Color := ColorGray;
    crCloseSplitter.Stroke.Thickness := 0.3;

    AnimateColorChange(rtMenuSplitterContent, rtMenuSplitterContent.Fill.Color, ColorPrimaryDark);
    AnimateColorChange(rtButtonsThemes, rtButtonsThemes.Fill.Color, ColorPrimaryDark);
    rtButtonsThemes.Stroke.Color := ColorGray;
    rtButtonsThemes.Stroke.Thickness := 0.3;

    AnimateColorChange(rtButtonDarkTheme, rtButtonDarkTheme.Fill.Color, ColorPrimaryDark);
    rtButtonDarkTheme.Stroke.Kind  := TBrushKind.Solid;
    rtButtonDarkTheme.Stroke.Color := ColorGray;
    rtButtonDarkTheme.Stroke.Thickness := 0.3;
    AnimateColorChange(rtButtonLightTheme, rtButtonLightTheme.Fill.Color, ColorPrimaryDark);
    rtButtonLightTheme.Stroke.Kind := TBrushKind.None;

    imgAddCategorieSplitter.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Plus_MathWhite_16.png '));
    imgCloseSplitter.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\closeGreen_32.png' ));
    imgButtonDarkTheme.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_MoonGreen_Star.ico' ) );
    imgButtonLightTheme.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_SunGreen.ico' ) );

    lblAddNewCategorieSplitter.FontColor := TAlphaColors.White;
    lblButtonDarkTheme.FontColor         := TAlphaColors.White;
    lblButtonLightTheme.FontColor        := TAlphaColors.White;
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
    DefineThemeDarkMenuSplitter;
    DefineCoresTextosDark;
    imgNavMenu.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Menu_16.png'));
    imgAddCategory.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Plus_MathBlack_16.png'));
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
    DefineThemeLightMenuSplitter;
    DefineCoresTextosLight;
    imgNavMenu.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_MenuGreen_16.png'));
    imgAddCategory.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Plus_MathWhite_16.png'));
    imgChangeTheme.Bitmap.LoadFromFile(ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_MoonGreen_Star.ico'));
end;


procedure THome.DefineThemeLightMenuSplitter;
const
    ColorPrimaryLight: TAlphaColor = $FFEFFEFA;
    ColorSecondaryLight: TAlphaColor = $FFFEFEFE;
    ColorNavMenuLight: TAlphaColor = $FFE2FEF7;
    ColorGreen : TAlphaColor = $FF00FF7F;
begin
    AnimateColorChange(rtMenuSplitterContainer, rtMenuSplitterContainer.Fill.Color, ColorPrimaryLight);
    rtMenuSplitterContainer.Stroke.Color := ColorGreen;
    rtMenuSplitterContainer.Stroke.Thickness := 0.2
    ;
    AnimateColorChange(crCloseSplitter, crCloseSplitter.Fill.Color, ColorNavMenuLight);
    crCloseSplitter.Stroke.Kind := TBrushKind.Solid;
    crCloseSplitter.Stroke.Color := ColorGreen;
    crCloseSplitter.Stroke.Thickness := 0.3;

    AnimateColorChange(rtMenuSplitterContent, rtMenuSplitterContent.Fill.Color, ColorPrimaryLight);
    AnimateColorChange(rtButtonsThemes, rtButtonsThemes.Fill.Color, ColorPrimaryLight);
    rtButtonsThemes.Stroke.Color := ColorGreen;
    rtButtonsThemes.Stroke.Thickness := 0.3;

    AnimateColorChange(rtButtonDarkTheme, rtButtonDarkTheme.Fill.Color, ColorPrimaryLight);
    rtButtonDarkTheme.Stroke.Kind := TBrushKind.None;
    AnimateColorChange(rtButtonLightTheme, rtButtonLightTheme.Fill.Color, ColorPrimaryLight);
    rtButtonLightTheme.Stroke.Kind := TBrushKind.Solid;
    rtButtonLightTheme.Stroke.Color := ColorGreen;
    rtButtonLightTheme.Stroke.Thickness := 0.3;

    imgAddCategorieSplitter.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_Plus_MathWhite_16.png '));
    imgCloseSplitter.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\closeGreen_32.png' ));
    imgButtonDarkTheme.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_MoonGreen_Star.ico' ) );
    imgButtonLightTheme.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_SunGreen.ico' ) );

    lblAddNewCategorieSplitter.FontColor := ColorGreen;
    lblButtonDarkTheme.FontColor         := ColorGreen;
    lblButtonLightTheme.FontColor        := ColorGreen;
end;


procedure THome.AjustaListBoxCategorias;
var
  ItemHeight: Single;
  TotalItemsHeight: Single;
begin
    ItemHeight := 60;
    TotalItemsHeight := lboxCategories.Items.Count * ItemHeight;
    lboxCategories.Height := TotalItemsHeight;
end;


procedure THome.AjustaContainerAplicacao;
var
  ContainerWidth: Single;
  i: Integer;
begin
    ContainerWidth := rtMainContainer.Width / 4;

    for i := 0 to rtMainContainer.ControlsCount - 1 do // Ajusta a largura de cada container
    begin
        if rtMainContainer.Controls[i] is TRectangle then
        begin
          TRectangle(rtMainContainer.Controls[i]).Width := ContainerWidth;
                                                                                // Reposiciona os containers lado a lado
          TRectangle(rtMainContainer.Controls[i]).Position.X := i * ContainerWidth;
        end;
    end;

end;

// Events

procedure THome.FormCreate(Sender: TObject);
begin
    DefineTemaSistema('Dark');

    AddItemCategorias( 1 , 'FFC4DAFB', 'coderCategory.ico');
    AddItemCategorias( 2 , 'FFF7D7AF', 'booksCategory.ico');
    AddItemCategorias( 3 , 'FFFCF097', 'toolsCategory.ico');

    AddItemCategorias( 1 , 'FFC4DAFB', 'coderCategory.ico');
    AddItemCategorias( 2 , 'FFF7D7AF', 'booksCategory.ico');
    AddItemCategorias( 3 , 'FFFCF097', 'toolsCategory.ico');
end;

procedure THome.FormResize(Sender: TObject);
begin
    AjustaContainerAplicacao;

    AjustaListBoxCategorias;
end;


procedure THome.AnimateColorChange(Target: TFmxObject; FromColor, ToColor: TAlphaColor);
begin
    TAnimator.AnimateColor(Target, 'Fill.Color', ToColor, 0.5); // Dura��o de 0.5 segundos
end;


procedure THome.crCloseSplitterClick(Sender: TObject);
begin
    //lyMenuSplitter.Visible := False;
    AnimateLayout(lyMenuSplitter, False);
end;

procedure THome.crNavMenuClick(Sender: TObject);
begin
    AnimateLayout(lyMenuSplitter, True);
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


procedure THome.AnimationFinish(Sender: TObject);
var
  Animation: TFloatAnimation;
begin
  Animation := Sender as TFloatAnimation; // Obt�m a anima��o que disparou o evento
  if Assigned(Animation.Parent) and (Animation.StopValue = 0) then
    (Animation.Parent as TControl).Visible := False; // Oculta o controle

  Animation.DisposeOf; // Libera a anima��o
end;


procedure THome.AnimateLayout(ALayout: TLayout; Show: Boolean);
var
  Animation: TFloatAnimation;
begin

  Animation := TFloatAnimation.Create(ALayout);
  Animation.Parent := ALayout;
  Animation.PropertyName := 'Opacity';
  Animation.Duration := 0.1; // Dura��o em segundos

  if Show then
  begin
    Animation.StartValue := 0; // Come�a invis�vel
    Animation.StopValue := 1;  // Termina vis�vel
    ALayout.Opacity := 0;      // Define a opacidade inicial
    ALayout.Visible := True;   // Torna vis�vel antes de animar
  end
  else
  begin
    Animation.StartValue := 1; // Come�a vis�vel
    Animation.StopValue := 0;  // Termina invis�vel
  end;

  Animation.OnFinish := AnimationFinish;


  Animation.Start;
end;


procedure THome.rtButtonAddNewCategorieSplitterMouseEnter(Sender: TObject);
var
  ColorGreen : TAlphaColor;
begin
    ColorGreen := TFuntions.HexToAlphaColor('#FF00FF7F');
    lblAddNewCategorieSplitter.FontColor := ColorGreen ;
end;


procedure THome.rtButtonAddNewCategorieSplitterMouseLeave(Sender: TObject);
var
  ColorGreen : TAlphaColor;
begin
    ColorGreen := TFuntions.HexToAlphaColor('#FF00FF7F');
    if Theme = 'Dark' then
      lblAddNewCategorieSplitter.FontColor := TAlphaColors.White
    else if Theme = 'Light' then
      lblAddNewCategorieSplitter.FontColor := ColorGreen;

end;

procedure THome.rtButtonDarkThemeClick(Sender: TObject);
begin
    DefineTemaSistema('Dark');
    Theme := 'Dark';
end;

procedure THome.rtButtonLightThemeClick(Sender: TObject);
begin
    DefineTemaSistema('Light');
    Theme := 'Light';
end;

end.
