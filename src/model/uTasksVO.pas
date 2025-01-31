unit uTasksVO;

interface

type
  TTasksVO = class
    private
      FIDStatus: Integer;
      FisTechnical: Boolean;
      FID: Integer;
      FisConcept: Boolean;
      FNomeTask: Integer;
      FisFrontEnd: Boolean;
      FisDesign: Boolean;
      FIDCategoria: Integer;
    public
      property ID         : Integer  read FID           write FID;
      property IDStatus   : Integer  read FIDStatus     write FIDStatus;
      property IDCategoria: Integer  read FIDCategoria  write FIDCategoria;
      property NomeTask   : Integer  read FNomeTask     write FNomeTask;
      property isConcept  : Boolean  read FisConcept    write FisConcept;
      property isDesign   : Boolean  read FisDesign     write FisDesign;
      property isFrontEnd : Boolean  read FisFrontEnd   write FisFrontEnd;
      property isTechnical: Boolean  read FisTechnical  write FisTechnical;
  end;

implementation

end.
