/* What I learnt from this example was:
 after area(content) comes Group with name
 then field("fieldName";"FieldSource")
 if there is Sourcetable then FieldSuorce 
will be reptead with fieldName */
page 50111 LOWExpressionsCard
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    Caption = 'Expressions Card';
    //SourceTable = TableName;

    layout
    {
        area(Content)
        {
            group(Input)

            {
                Caption = 'Input';
                field(Value1; Value1)
                {
                    ApplicationArea = All;
                    ToolTip = 'Value1';
                    Caption = 'Value1';


                }

                field(Value2; Value2)
                {
                    ApplicationArea = All;
                    ToolTip = 'Value2';
                    Caption = 'Value2';


                }
            }
            group(Output)

            {
                Caption = 'Output';

                field(Result; Result)
                {
                    ApplicationArea = All;
                    ToolTip = 'Reult';
                    Caption = 'Reult';
                    Editable = false;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(LOWExecute)
            {
                Caption = 'Execute';
                ToolTip = 'Execute';
                Image = ExecuteBatch;
                ApplicationArea = All;


                trigger OnAction()
                begin
                    Execute();
                end;
            }
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
            action(LOWErrorHandeling) // should start with LOW, we should put the codeunit
            {
                ApplicationArea = All;
                Caption = 'ErrorHandeling';
                Image = ErrorLog;
                ToolTip = 'LOWErrorHandeling';
                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::LOWErrorHandeling);// in the trigger On Action we should always write Run and then name of codeunit
                end;
            }
        }
    }

    var
        Value1: Integer;
        Value2: Integer;
        Result: Boolean;

    local procedure Execute()

    begin
        Result := Value1 > Value2;
    end;

    local procedure CheckingValue()
    begin

        If Value1 > Value2 then
            message('Input1 is greater')
        else
            message('Input2 is greater')

    end;
}