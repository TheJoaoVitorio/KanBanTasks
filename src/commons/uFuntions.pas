unit uFuntions;

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
      class function PegaIdListItem(Sender: TObject): Integer;
      class function HexToAlphaColor(const AHexColor : String) : TAlphaColor;
      class procedure AlterarCorDoIconDoFrameNoListBox(AListBox: TListBox; ACor: String);
      class procedure AlterarCorLabelDoFrameNoListBox(AListBox: TListBox;ANovaCor: TAlphaColor);

  end;

implementation

{ TFuntions }

class function TFuntions.PegaIdListItem(Sender : TObject) : Integer;
var
  item: TListBoxItem;
  parentControl: TFmxObject;
begin
  // Come�a pelo Sender (o componente clicado, no caso a imagem)
  parentControl := Sender as TFmxObject;


  // Navega pela hierarquia para encontrar o TListBoxItem pai
  while (parentControl <> nil) and not (parentControl is TListBoxItem) do
    parentControl := parentControl.Parent;


  // Se encontrou o TListBoxItem
  if parentControl is TListBoxItem then
  begin
    item := TListBoxItem(parentControl);
    Result := item.Tag;
  end


end;


class function TFuntions.HexToAlphaColor(const AHexColor: String): TAlphaColor;
begin
    if AHexColor.StartsWith('#') then
      Result := TAlphaColor(StrToInt('$' + Copy(AHexColor, 2, Length(AHexColor) - 1)))
    else
      Result := TAlphaColor(StrToInt('$' + AHexColor));
end;


class procedure TFuntions.AlterarCorLabelDoFrameNoListBox(AListBox: TListBox; ANovaCor: TAlphaColor);
var
  i, j, k: Integer;
  ListBoxItem: TListBoxItem;
  Frame: TFrame;
  LabelControl: TLabel;
begin
  // Percorrer todos os itens do ListBox
  for i := 0 to AListBox.Items.Count - 1 do
  begin
    if AListBox.ListItems[i] is TListBoxItem then
    begin
      ListBoxItem := TListBoxItem(AListBox.ListItems[i]);
      // Verificar os controles dentro do ListBoxItem
      for j := 0 to ListBoxItem.ControlsCount - 1 do
      begin
        // Verificar se o controle � um Frame
        if ListBoxItem.Controls[j] is TFrame then
        begin
          Frame := TFrame(ListBoxItem.Controls[j]);
          // Verificar os controles dentro do Frame
          for k := 0 to Frame.ControlsCount - 1 do
          begin
            if Frame.Controls[k] is TLabel then
            begin
              // Alterar a cor do Label
              LabelControl := TLabel(Frame.Controls[k]);
              LabelControl.TextSettings.FontColor := ANovaCor;
            end;
          end;
        end;
      end;
    end;
  end;
end;


class procedure TFuntions.AlterarCorDoIconDoFrameNoListBox(AListBox: TListBox; ACor: String);
var
  i, j, k: Integer;
  ListBoxItem: TListBoxItem;
  Frame: TFrame;
  ImageControl : TImage;
begin

  for i := 0 to AListBox.Items.Count - 1 do
  begin
    if AListBox.ListItems[i] is TListBoxItem then
    begin
      ListBoxItem := TListBoxItem(AListBox.ListItems[i]);
      // Verificar os controles dentro do ListBoxItem
      for j := 0 to ListBoxItem.ControlsCount - 1 do
      begin
        // Verificar se o controle � um Frame
        if ListBoxItem.Controls[j] is TFrame then
        begin
          Frame := TFrame(ListBoxItem.Controls[j]);
          // Verificar os controles dentro do Frame
          for k := 1 to Frame.ControlsCount - 1 do
          begin
            if Frame.Controls[k] is TImage then
            begin
              ImageControl := TImage(Frame.Controls[k]);

              if ACor = 'Dark' then
                ImageControl.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_PencilWhite_16.png' ))
              else if ACor = 'Light' then
                ImageControl.Bitmap.LoadFromFile( ExpandFileName(ExtractFilePath(ParamStr(0)) + '..\..\assets\icons8_PencilBlack_16.png' ));

            end;
          end;
        end;
      end;
    end;
  end;

end;

end.
