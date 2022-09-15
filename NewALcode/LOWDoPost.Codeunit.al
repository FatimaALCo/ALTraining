
codeunit 50101 LOWDoPost
{
    TableNo = Integer; // TableNo property changes the signature of the OnRun trigger of the codeunit

    trigger OnRun()
    begin
        if Number mod 2 <> 0 then
            Error(ErrorInfo.Create('Number should be equal', true, Rec, Rec.FieldNo(Number)));

        if Number <= 0 then
            Error(ErrorInfo.Create('Number should be larger than 0', true, Rec, Rec.FieldNo(Number)));

        if Number mod 3 = 0 then
            Error(ErrorInfo.Create('Number should not be divisible by 10', true, Rec, Rec.FieldNo(Number)));

        // Everything was valid, do the actual posting.
    end;
}

/*
setting the TableNo property changes the signature of the OnRun trigger of the codeunit to include 
a variable Record data type parameter (named Rec) for the specified table. 
For example, the following code sets the TableNo property in a codeunit to the Item table.

codeunit 50100 MyCodeunit {
  TableNo = Item;

    trigger OnRun()
    begin
        
    end;}
 The signature of the OnRun trigger is OnRun(var Rec : Record Item).*/
