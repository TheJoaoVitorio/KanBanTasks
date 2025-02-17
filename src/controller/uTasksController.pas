unit uTasksController;

interface

uses
  uTasksVO,
  Datasnap.DBClient,System.Generics.Collections,
  FireDAC.Stan.Error,FireDAC.DatS,FireDAC.Comp.UI,
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,


  uInstanceController;

type
  TTasksController = class
    private
    public
      class function GetTodasTasks   : TObjectList<TTasksVO>;
      class function GetBacklogTasks : TObjectList<TTasksVO>;
  end;

implementation

{ TTasksController }

class function TTasksController.GetBacklogTasks: TObjectList<TTasksVO>;
var
  vQuery : TFDQuery;
  vTaskVO: TTasksVO;
begin

  Result := TObjectList<TTasksVO>.Create;

  try

    vQuery := TFDQuery.Create(nil);

    try

      with vQuery do
      begin
        Connection := TInstanceController.GetInstance().Connection.GetConnection;
        SQL.Text   := 'SELECT '+
                      '  TASKS.ID, '+
                      '  TASKS.ID_CATEGORIES, '+
                      '  TASKS.ID_STATUS, '+
                      '  TASKS.TASK_NAME, '+
                      '  TAGS.TAG_NAME, '+
                      '  TAGS.TAG_COLOR, '+
                      '  CATEGORIES.CATEGORY, '+
                      '  STATUS_TASKS.STATUS_NAME '+
                      'FROM TASKS '+
                      'LEFT JOIN TAGS ON TAGS.ID = TASKS.ID_TAG '+
                      'LEFT JOIN CATEGORIES ON CATEGORIES.ID = TASKS.ID_CATEGORIES '+
                      'LEFT JOIN STATUS_TASKS ON STATUS_TASKS.ID  = TASKS.ID_STATUS '+
                      'WHERE STATUS_NAME = ''Backlog'' ';
        Open;


        while not Eof do
        begin
          vTaskVO := TTasksVO.Create;

          with vTaskVO do
          begin
            ID            := FieldByName('ID').AsInteger;
            IDCategory    := FieldByName('ID_CATEGORIES').AsInteger;
            IDStatus      := FieldByName('ID_STATUS').AsInteger;
            TaskName      := FieldByName('TASK_NAME').AsString;
            TagName       := FieldByName('TAG_NAME').AsString;
            TagColor      := FieldByName('TAG_COLOR').AsString;
            NameCategory  := FieldByName('CATEGORY').AsString;
            //StatusName    := FieldByName('STATUS_NAME').AsString;
          end;

        end;

      end;

    except
      on E:Exception do
        raise Exception.Create('Erro ao buscar as tarefas backlog!');
    end;

  finally
    if Assigned(vQuery) then vQuery.Free;
  end;

end;

class function TTasksController.GetTodasTasks: TObjectList<TTasksVO>;
var
  vQuery : TFDQuery;
  vTaskVO: TTasksVO;
begin

  Result := TObjectList<TTasksVO>.Create;

  try

    vQuery := TFDQuery.Create(nil);

    try

      with vQuery do
      begin
        Connection := TInstanceController.GetInstance().Connection.GetConnection;
        SQL.Text   := '';
        Open;


        while not Eof do
        begin
          vTaskVO := TTasksVO.Create;

        end;


      end;

    except
      on E:Exception do
        raise Exception.Create('Erro ao buscar as tarefas!');
    end;

  finally
    if Assigned(vQuery) then vQuery.Free;
  end;

end;

end.
