unit uInstanceController;

interface

uses
  uConnection, System.SysUtils, FireDAC.Stan.Def;


type
  TInstanceController = class
    private
      FConnection : TConnection;

      class var FInstance : TInstanceController;
      class procedure ReleaseInstance;
    public
      constructor Create;
      destructor Destroy; override;

      class function GetInstance : TInstanceController;

      property Connection : TConnection read FConnection write FConnection;
  end;

implementation

{ TInstanceController }

constructor TInstanceController.Create;
begin
    FConnection := TConnection.Create;
end;

destructor TInstanceController.Destroy;
begin
    FConnection.Free;
    inherited;
end;

class function TInstanceController.GetInstance: TInstanceController;
begin
    if not Assigned(Self.FInstance) then
    begin
      Self.FInstance := TInstanceController.Create();
    end;

    Result := Self.FInstance;
end;

class procedure TInstanceController.ReleaseInstance;
begin
    if FInstance <> nil then
    begin
      FInstance.Free;
      FInstance := nil;
    end;
end;


initialization

finalization
  TInstanceController.ReleaseInstance

end.
