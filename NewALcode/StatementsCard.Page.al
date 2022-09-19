page 50112 LOWStatementsCard
{
    PageType = Card;
    Caption = 'Statements Card';
    ApplicationArea = All;
    UsageCategory = Documents;
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(Input)
            {

                field(Difficulty; Difficulty)
                {
                    ApplicationArea = All;
                    Caption = 'Difficulty';
                    ToolTip = 'Difficulty';
                    trigger OnValidate()
                    begin
                        GetSuggestion()
                    end;

                }
            }
            group(Output)
            {

                field(Level; Level)
                {
                    ApplicationArea = All;
                    Caption = 'Level';
                    ToolTip = 'Level';
                    Editable = false;

                }
                field(Suggestion; Suggestion)
                {
                    ApplicationArea = All;
                    Caption = 'Suggestion';
                    ToolTip = 'Suggestion';
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(LOWTestMessage1)
            {//The Confirm function can be used in combination with an if statement.
                Caption = 'TestMessage1';
                ToolTip = 'Testing messageing method in the BC';
                Image = Excise;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TestMessage1();
                end;
            }
            action(LOWTestMessage2)
            {//f you want the No button to have the default focus, add false as a parameter.
                Caption = 'TestMessage2';
                ToolTip = 'Testing messageing method in the BC';
                Image = TestReport;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    TestMessage2();
                end;
            }
            action(LOWStrMenuFunction)
            {//The StrMenu function can be used to ask people for information and provide them with a selection of choices.
                Caption = 'Str MenuFunction';
                ToolTip = 'Testing messageing method in the BC';
                Image = TestReport;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    StrMenuFunction();
                end;
            }
        }
    }
    var
        Level: Text[30];
        Suggestion: Text[80];
        Difficulty: Integer;

    local procedure GetSuggestion()

    begin
        Level := '';
        Suggestion := '';

        case Difficulty of
            1 .. 5:
                begin
                    Level := 'Beginner';
                    Suggestion := 'Take e-Learning or remote training';
                end;
            6 .. 8:
                begin
                    Level := 'Intermediate';
                    Suggestion := 'Attend instructor-Led';
                end;
            9 .. 10:
                begin
                    Level := 'Advanced';
                    Suggestion := 'Attend instructor-Led and self study';
                end;
        end;
    end;

    var
        MyInt: Integer;
        TheValueOfTxt: Label 'The value of %1 is %2';

    local procedure TestMessage1()
    begin
        MyInt := 5; // here MyInt is string
        Message(TheValueOfTxt, 'MyInt', MyInt);
        Message('who run this code is  %1 with Company of %2', UserId, CompanyName);
        // Displays: The value of MyInt is 5
        if Confirm('Are you sure you want to delete?') then
            Message('OK')
        else
            Message('Not OK');
    end;

    local procedure TestMessage2()

    begin
        if Confirm('Are you sure you want to delete?', false) then
            Message('OK')
        else
            Message('Not Ok');
    end;

    local procedure StrMenuFunction()
    var
        Days: Text[50];
        Selection: Integer;
    begin
        Days := 'Monday,Tuesday,Wednesday,Thursday,Friday';
        Selection := StrMenu(Days, 1, 'Which day is today ?');
        Message('You selected %1.', Selection);

    end;

}
