// Welcome to your new AL extension.
// Remember that object names and IDs should be unique across all extensions.
// AL snippets start with t*, like tpageext - give them a try and happy coding!
// LOWCustomerListExt... first AL package then publish without debuging
// ctrl+alt+F to see page inspection?
// extenstion mangment to see verison of app and envoirment

pageextension 50100 LOWCustomerListExt extends "Customer List"
{
    trigger OnOpenPage();
    begin
        Message('App published: Hello world');
    end;
}