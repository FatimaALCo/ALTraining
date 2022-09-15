page 50110 "LOW DataTypesCard"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Date Type Card'; // this will be the name of page we can search

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(LOWCheckingValue) // should start with LOW
            {
                ApplicationArea = All;
                Caption = 'Check value of two input';
                Image = Sales;
                ToolTip = 'Check if input 1 is larger than input 2';
                trigger OnAction()
                begin
                    CheckingValue();
                end;
            }

        }

    }
    trigger OnOpenPage(); // simicolon should put

    begin
        Message('The value of %1 is %2', 'YesOrNo', YesOrNo);
        // Message('The value of %1 is %2', 'Amount', Amount);
        Message('The value of %1 is %2', 'When Was It', "When Was It");
        Message('The value of %1 is %2', 'What Time', "What Time");
        Message('The value of %1 is %2', 'Description', Description);
        Message('The value of %1 is %2', 'Code Number', "Code Number");
        Message('The value of %1 is %2', 'Ch', Ch);
        Message('The value of %1 is %2', 'Color', Color);

    end;

    var

        Input1: integer;
        Input2: integer;
        Result: integer;

        LoopNo: Integer;
        YesOrNo: Boolean;
        Amount: Decimal;
        "When Was It": Date;
        "What Time": Time;
        Description: Text[30];
        "Code Number": Code[10];
        Ch: Char;
        Color: Option Red,Orange,Yellow,Green,Blue,Violet;

    local procedure CheckingValue()
    begin
        Input1 := 10;
        Input2 := 20;
        If Input1 > Input2 then
            message('Input1 is greater')
        else
            message('Input2 is greater')

    end;


}