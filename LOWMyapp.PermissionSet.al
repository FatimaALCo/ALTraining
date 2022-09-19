permissionset 50100 "LOW My app"
{
    Assignable = true;
    Caption = 'My Low app', MaxLength = 30;
    Permissions =
        table "Low My Item" = X,
        tabledata "Low My Item" = RMID;
}
