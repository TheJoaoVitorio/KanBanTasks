unit uTasksVO;

interface

type
  TTasksVO = class
    private
      FIDStatus: Integer;
      FisTechnical: Boolean;
      FID: Integer;
      FisConcept: Boolean;
      FisFrontEnd: Boolean;
      FisDesign: Boolean;
      FStatusName: String;
      FNameCategory: String;
      FTaskName: String;
      FIDCategory: Integer;
      FTagName: String;
    FTagColor: String;
    public
      property ID           : Integer  read FID           write FID;
      property IDStatus     : Integer  read FIDStatus     write FIDStatus;
      property IDCategory   : Integer  read FIDCategory   write FIDCategory;
      property TaskName     : String   read FTaskName     write FTaskName;
      property TagName      : String   read FTagName      write FTagName;
      property TagColor     : String   read FTagColor     write FTagColor;
      property StatusName   : String   read FStatusName   write FStatusName;
      property NameCategory : String   read FNameCategory write FNameCategory;
      
  end;

implementation

end.
