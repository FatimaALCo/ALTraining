table 50100 "Low My Item"
{
    Caption = 'Low My Item';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; No; Code[20])
        {
            Caption = 'No';
            DataClassification = CustomerContent;
        }
        field(2; "Vender No."; Code[20])
        {
            Caption = 'Vender No.';
            TableRelation = Vendor."No.";
            DataClassification = EndUserPseudonymousIdentifiers;
        }
        field(3; Comment; Text[250])
        {
            Caption = 'Comment';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; No, "Vender No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()

    begin

        SetDescription();

    end;



    trigger OnModify()

    begin

        SetDescription();

    end;



    local procedure SetDescription()

    var

        vendor: Record Vendor;

    begin

        if Rec.Comment = '' then
            if Vendor.Get(Rec."Vender No.") then
                Rec.Comment := Vendor.Name;

    end;
    // Local trigger OnValidate()

    //                 begin

    //                     if Rec."Item No." = 'A' then

    //                        Message('Hi');

    //                end;

}
