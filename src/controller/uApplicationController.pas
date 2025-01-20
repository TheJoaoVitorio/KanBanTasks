unit uApplicationController;

interface

uses
  Datasnap.DBClient,System.Generics.Collections,
  FireDAC.Stan.Error,FireDAC.DatS,FireDAC.Comp.UI,
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,


  uInstanceController;


type
  TApplicationController = class
    private

    public
      class procedure UpdateThemeApplication(FTheme : String);
      class function GetThemeApplication : String;
  end;

implementation

{ TApplicationController }

class function TApplicationController.GetThemeApplication: String;
var
  FQuery: TFDQuery;
begin
  try
    try
      FQuery := TFDQuery.Create(nil);
      with FQuery do
      begin
        Connection := TInstanceController.GetInstance().Connection.GetConnection;
        SQL.Text := 'SELECT THEME FROM SYSTEM';
        Open;

        Result := FieldByName('THEME').AsString;
      end;
    except
      on E: Exception do
        raise Exception.CreateFmt('Erro ao buscar tema: %s', [E.Message]);
    end;
  finally
    FQuery.Free;
  end;
end;

class procedure TApplicationController.UpdateThemeApplication (FTheme : String);
var
  FQuery: TFDQuery;
begin
  try
    try
      FQuery := TFDQuery.Create(nil);
      with FQuery do
      begin
        Connection := TInstanceController.GetInstance().Connection.GetConnection;
        SQL.Text := 'UPDATE SYSTEM SET THEME = :NEW_THEME';

        ParamByName('NEW_THEME').AsString := FTheme;
        ExecSQL;
      end;
    except
      on E: Exception do
        raise Exception.CreateFmt('Erro ao buscar tema: %s', [E.Message]);
    end;
  finally
    FQuery.Free;
  end;
end;

end.
