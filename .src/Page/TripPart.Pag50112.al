page 50112 "HG Trip Part"
{
    ApplicationArea = All;
    Caption = 'Trip Part';
    PageType = ListPart;
    SourceTable = "HG Trip";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Route Schedule Line No."; Rec."Route Schedule Line No.")
                {
                    ToolTip = 'Specifies the value of the Route Schedule Line No. field.', Comment = '%';
                }
            }
        }
    }
}
