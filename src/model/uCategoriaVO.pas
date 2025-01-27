unit uCategoriaVO;

interface

type
  TCategoriaVO = class
    private
      FID: Integer;
      FNomeCategoria: String;
      FColor: String;
      FPathImage: String;
      FisActive: Boolean;
    public
      property ID              : Integer read FID            write FID;
      property NomeCategoria   : String  read FNomeCategoria write FNomeCategoria;
      property Color           : String  read FColor         write FColor;
      property PathImage       : String  read FPathImage     write FPathImage;
      property isActive        : Boolean read FisActive      write FisActive;
  end;

implementation

end.
