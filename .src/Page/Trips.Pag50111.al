page 50111 "HG Trips"
{
    ApplicationArea = All;
    Caption = 'Trips';
    PageType = List;
    SourceTable = "HG Trip";
    UsageCategory = Lists;
    CardPageId = "HG Trip Card";

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
                field("Route No."; Rec."Route No.")
                {
                    ToolTip = 'Specifies the value of the Route No. field.', Comment = '%';
                }


            }
        }
    }
}
