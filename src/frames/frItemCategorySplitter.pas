unit frItemCategorySplitter;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation;

type
  TFramItemCategorySplitter = class(TFrame)
    crItemCategorySplitter: TCircle;
    imgItemCategorySplitter: TImage;
    Z: TLabel;
    imgEditCategorySplitter: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.fmx}

end.
