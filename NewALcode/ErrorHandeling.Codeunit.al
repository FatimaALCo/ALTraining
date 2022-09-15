// If we want to capture some error we need to write in the codeunit
codeunit 50100 LOWErrorHandeling
{
    trigger OnRun()

    begin
        if MyTrymethod() then
            Message('Everything went well!')
        else
            Message('something went wrong (%1)', GetLastErrorText());

    end;

    [TryFunction] // we add attribute to the procedure
    local procedure MyTrymethod() //this procedure with this attribute return boolean
    begin
        Error('error occured during operation');
    end;
}

