pageextension 50101 "HG Item List" extends "Item List"
{
    actions
    {
        addafter(CopyItem)
        {
            action("HG APIFunctions")
            {
                ApplicationArea = All;
                Image = Post;
                Caption = 'Get Items from API';
                RunObject = codeunit "HG API Functions";
            }
        }
        addafter(Category_Process)

        {
            actionref(APIFunctions_Promoted; "HG APIFunctions")
            {
            }

        }
    }
}
