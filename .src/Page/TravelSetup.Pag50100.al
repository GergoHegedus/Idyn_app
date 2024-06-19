page 50100 "HG Travel Setup"
{
    ApplicationArea = All;
    Caption = 'Travel Setup';
    PageType = Card;
    SourceTable = "HG Travel Setup";
    UsageCategory = Administration;
    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Stop No. Series"; Rec."Stop Nos")
                {
                    ToolTip = 'Specifies the value of the Stop No. Series field.', Comment = '%';
                }
                field("Route No. Series"; Rec."Route Nos")
                {
                    ToolTip = 'Specifies the value of the Route No. Series field.', Comment = '%';
                }
                field("Trip No. Series"; Rec."Trip Nos")
                {
                    ToolTip = 'Specifies the value of the Trip No. Series field.', Comment = '%';
                }
                field("Slot No. Series"; Rec."Slot Nos")
                {
                    ToolTip = 'Specifies the value of the Slot No. Series field.', Comment = '%';
                }
            }
        }
    }
}
