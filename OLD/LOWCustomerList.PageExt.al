pageextension 50100 LOWCustomerList extends "Customer List"
{
    layout
    {
        modify("Responsibility Center")
        {
            Visible = false;
        }
        modify("Location Code")
        {
            Visible = false;
        }
        addafter(Name)
        {
            field(LOWCustomerPostingGroup; Rec."Customer Posting Group")
            {
                ApplicationArea = All;
                ToolTip = 'we have added this one';
            }
        }
    }
    actions
    {
        addbefore("Sales Journal")
        {
            action(LOWGetCleCount) // here we type the name of action with LOW extension
            {
                ApplicationArea = All;
                Caption = 'Count customer ledeger entry';// the action name will show
                Image = Statistics;
                ToolTip = 'This actions counts customer ledeger entry';


                trigger OnAction()
                begin
                    GetCleCount();
                end;
            }
        }

    }

    // trigger OnOpenPage();
    // begin
    //     Message('App published: Hello world');
    // end;

    var
        CustLedgerEntry: Record "Cust. Ledger Entry";
    // myint: integer;
    // Myname: code[20];

    local procedure GetCleCount()

    begin

        CustLedgerEntry.reset();
        CustLedgerEntry.SetRange("Customer No.", Rec."No.");
        CustLedgerEntry.SetRange(Open, true);
        Message(Format(CustLedgerEntry.count()));


    end;


}
