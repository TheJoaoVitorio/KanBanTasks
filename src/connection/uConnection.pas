unit uConnection;

interface

uses
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait;

type
  TConnection = class
    private
      Connection : TFDConnection;
      Query      : TFDQuery;
      DriverLink: TFDPhysSQLiteDriverLink;
    public
      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
      procedure ConfigConnection;

      function GetConnection : TFDConnection;
      function GetQuery      : TFDQuery;
  end;

implementation

{ TConnection }

procedure TConnection.AfterConstruction;
begin
    inherited;
    if not Assigned(Connection) then
    begin
        Connection := TFDConnection.Create(nil);

        ConfigConnection;
    end;

    if not Assigned(Query) then
      Query := TFDQuery.Create(nil);

end;

procedure TConnection.BeforeDestruction;
begin
    inherited;

    if Assigned(Connection) then
      FreeAndNil(Connection);

    if Assigned(Query) then
      FreeAndNil(Query);
end;

procedure TConnection.ConfigConnection;
begin
    with Connection.Params do begin
      DriverID := 'SQLite';
      Username := '';
      Password := '';
      Add('Port=');
      Database := '';
    end;

    if not Assigned(DriverLink) then
    begin
      DriverLink := TFDPhysSQLiteDriverLink.Create(nil);
      // Configura o caminho da DLL do SQLite
      DriverLink.VendorLib := ExtractFilePath(ParamStr(0)) +
                              'dll\' +
                              'SQLite3.dll';
    end;
end;

function TConnection.GetConnection: TFDConnection;
begin
    Result := Connection;
end;

function TConnection.GetQuery: TFDQuery;
begin
    Query.Connection := Connection;
    Result := Query;
end;

end.
