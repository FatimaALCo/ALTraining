page 50100 "LOW My page Item"
{
    ApplicationArea = All;
    Caption = 'My page Item';
    PageType = List;
    SourceTable = "Low My Item";
    UsageCategory = Lists;
    // DeleteAllowed= true;
    // InsertAllowed=true;
    // ModifyAllowed=true;  

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Vender No."; Rec."Vender No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vender No. field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field(SystemId; Rec.SystemId)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SystemId field.';
                    Editable = false; // I dont know what is Sytem Id but here we put editable or not
                    Enabled = true;
                }

            }
        }
    }
}
