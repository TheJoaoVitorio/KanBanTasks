unit uCategoriasController;

interface

uses
  uCategoriaVO,
  Datasnap.DBClient,System.Generics.Collections,
  FireDAC.Stan.Error,FireDAC.DatS,FireDAC.Comp.UI,
  System.SysUtils, System.Classes, Data.DB,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.DApt, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,


  uInstanceController;

type
  TCategoriasController = class
    private
    public
      class function GetTodasCategorias : TObjectLIst<TCategoriaVO>;
  end;

implementation

{ TCategoriasController }

class function TCategoriasController.GetTodasCategorias: TObjectLIst<TCategoriaVO>;
var
  vQuery     : TFDQuery;
  vCategoria : TCategoriaVO;
begin

  Result := TObjectList<TCategoriaVO>.Create;

  try
    vQuery := TFDQuery.Create(nil);
    try

      with vQuery do
      begin
        Connection := TInstanceController.GetInstance().Connection.GetConnection;
        SQL.Text   := 'SELECT * FROM CATEGORIES';
        Open;

        while not Eof do
        begin
          vCategoria := TCategoriaVO.Create;
          with vCategoria do begin
            ID              := FieldByName('ID').AsInteger;
            NomeCategoria   := FieldByName('CATEGORY').AsString;
            Color           := FieldByName('COLOR').AsString;
            PathImage       := FieldByName('PATH_IMAGE').AsString;
          end;

          Result.Add(vCategoria);

          Next;
        end;
      end;

    except
      on E:Exception do
        raise Exception.Create('Erro ao buscar as categorias!');
    end;
  finally
    if Assigned(vQuery) then vQuery.Free;
  end;

end;

end.
