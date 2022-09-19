page 50101 "LOWErroHandeling"
{
    Caption = 'ErroHandeling';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Documents;
    //SourceTable = "";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Input; Input)
                {
                    Caption = 'Input';
                    ToolTip = 'Input from User';
                    ApplicationArea = all;

                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(LOWCheckingInput)
            {
                Caption = 'Checking Input';
                ToolTip = 'Checking error handeling method';
                ApplicationArea = All;
                Image = ErrorLog;

                trigger OnAction()
                begin
                    If MyTryFunction() then
                        Message('everything is fine')
                    Else
                        Message('there is error!');
                end;
            }
        }
    }
    var
        Input: Integer;


    [TryFunction]
    local procedure MyTryFunction()
    var
        Result: Integer;
    begin
        Message('user entered this value %1', format(Input));
        Result := Input mod 2;
        Message('The result for this value %1', format(Result));

    end;
}




