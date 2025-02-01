unit frCardTask;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TFrameCardTask = class(TFrame)
    rtCardContainer: TRectangle;
    rtCardButtonEdit: TRectangle;
    rtCardContent: TRectangle;
    imgCardEditTask: TImage;
    lblCardTitleTask: TLabel;
    lboxCardBadgeTypeTask: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
