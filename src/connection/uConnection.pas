unit uConnection;

interface

uses
  FireDAC.Stan.Error,FireDAC.DatS,FireDAC.Comp.UI,
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
      FDWaitCursor: TFDGUIxWaitCursor;

      procedure AfterConstruction; override;
      procedure BeforeDestruction; override;
    public
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

    FDWaitCursor := TFDGUIxWaitCursor.Create(nil);
    FDWaitCursor.Provider := 'Console';
    FDWaitCursor.ScreenCursor := TFDGUIxScreenCursor.gcrHourGlass;

end;

procedure TConnection.BeforeDestruction;
begin
    inherited;

    if Assigned(Connection) then
      FreeAndNil(Connection);

    if Assigned(Query) then
      FreeAndNil(Query);

    if Assigned(FDWaitCursor) then
        FreeAndNil(FDWaitCursor);
end;

procedure TConnection.ConfigConnection;
begin
    try
      with Connection.Params do begin
        DriverID := 'SQLite';
        Username := 'root';
        Password := '';
        Database := ExtractFilePath(ParamStr(0)) +
                                'data\' +
                                'kanbandata.db' ;
      end;
    except
      on E:Exception do
        raise Exception.Create('Erro ao procurar o path do banco de dados');
    end;

    if not Assigned(DriverLink) then
    begin
      DriverLink := TFDPhysSQLiteDriverLink.Create(nil);
      DriverLink.VendorLib := ExtractFilePath(ParamStr(0)) +
                              'dll\' +
                              'SQLite3.dll';
    end;
end;

function TConnection.GetConnection: TFDConnection;
begin
    Connection.Connected := True;
    Result := Connection;
end;

function TConnection.GetQuery: TFDQuery;
begin
    Query.Connection := Connection;
    Result := Query;
end;

end.
