// I could not create extention for customer list, error said that I have already extenstion for customer list
pageextension 50111 LOWCollectingErrorsExt extends "Company Information"

{
    Caption = 'CollectingErrors';
    actions
    {
        addfirst(processing)
        {
            // This action doesn't collect errors. Any procedure will stop on the first error that occurs,
            // and return the error.
            action(LOWPost)
            {
                ApplicationArea = All;
                Caption = 'LOWPost';
                ToolTip = 'LOWPost';
                Image = Post;
                trigger OnAction()
                var
                    i: Record Integer;  // here we define integer table , which has number as field

                begin
                    i.Number := -9;
                    Codeunit.Run(Codeunit::LOWDoPost, i);
                end;
            }

            // This action collects errors. The PostWithErrorCollect procedure continues on errors,
            // and displays the errors in a dialog to the user done.
            action(LOWPostWithErrorCollect)
            {

                Caption = 'LOWPostWithErrorCollect';
                ToolTip = 'LOWPostWithErrorCollect';
                Image = Post;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PostWithErrorCollect();
                end;
            }

            // This action collects errors. The PostWithErrorCollectCustomUI procedure continues on errors,
            // and displays error details in a list page when done.
            // This implementation illustrates how you could design your own UI for displaying and
            // troubleshooting errors.
            action(LOWPostWithErrorCollectCustomUI)
            {
                Caption = 'LOWPostWithErrorCollectCustomUI';
                ToolTip = 'LOWPostWithErrorCollectCustomUI';
                Image = Post;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    PostWithErrorCollectCustomUI();
                end;
            }
        }
    }

    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure PostWithErrorCollect()
    var
        i: Record Integer;
    begin
        i.Number := -9;
        Codeunit.Run(Codeunit::LOWDoPost, i);
        // After executing the codeunit, there will be collected errors,
        // and therefore an error dialog will be shown when exiting this procedure.
    end;

    // The ErrorBehavior attribute specifies the behavior of collectable errors inside the method scope.
    // Adding [ErrorBehavior(ErrorBehavior.Collect)] to a procedure makes it possible to collect
    // and handle errors that are raised in the scope of the procedure.
    [ErrorBehavior(ErrorBehavior::Collect)]
    procedure PostWithErrorCollectCustomUI()
    var
        i: Record Integer;
        errors: Record "Error Message" temporary;
        error: ErrorInfo;

    begin
        i.Number := -9;
        // By using Codeunit.Run, you ensure any changes to the database within
        // Codeunit::DoPost are rolled back in case of errors.
        if not Codeunit.Run(Codeunit::LOWDoPost, i) then begin
            // If Codeunit.Run fails, a non-collectible error was encountered,
            // add this to the list of errors.
            errors.ID := errors.ID + 1;
            errors.Description := GetLastErrorText();
            errors.Insert();
        end;

        // If there are collected errors, iterate through each of them and
        // add them to "Error Message" record.
        if HasCollectedErrors then
            foreach error in system.GetCollectedErrors() do begin
                errors.ID := errors.ID + 1;
                errors.Description := error.Message;
                errors.Validate("Record ID", error.RecordId);
                errors.Insert();
            end;

        // Clearing the collected errors will ensure the built-in error dialog
        // will not show, but instead show our own custom "Error Messages" page.
        ClearCollectedErrors();

        page.RunModal(page::"Error Messages", errors);
    end;
}






