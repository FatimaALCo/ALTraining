page 50100 "LOW  MyPage"
{
    ApplicationArea = All;
    Caption = 'MyPage';
    PageType = List;
    SourceTable = "Low My Item";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
            }
        }
    }
}
