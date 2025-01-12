unit uFunctions;

interface

uses
  FMX.Ani,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.Layouts, FMX.ListBox;

type
  TFuntions = class
    private
    public
      class function HexToAlphaColor(const AHexColor : String) : TAlphaColor;

  end;

implementation

end.
