page 50110 "HG Trip Line Part"
{
    ApplicationArea = All;
    Caption = 'Trip Lines Part';
    PageType = ListPart;
    SourceTable = "HG Trip Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Trip No."; Rec."Trip No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Stop No."; Rec."Stop No.")
                {
                    ToolTip = 'Specifies the value of the Stop No. field.', Comment = '%';
                }
                field(Boarding; Rec.Boarding)
                {
                    ToolTip = 'Specifies the value of the Boarding field.', Comment = '%';
                }
                field(Unboarding; Rec.Unboarding)
                {
                    ToolTip = 'Specifies the value of the Unboarding field.', Comment = '%';
                }
                field("Wait Time"; Rec."Wait Time")
                {
                    ToolTip = 'Specifies the value of the Wait Time field.', Comment = '%';
                }
                field("Travel Time"; Rec."Travel Time")
                {
                    ToolTip = 'Specifies the value of the Travel Time field.', Comment = '%';
                }
                field("Gross Travel Time"; Rec."Gross Travel Time")
                {
                    ToolTip = 'Specifies the value of the Gross Travel Time field.', Comment = '%';
                }
                field("Route Line No."; Rec."Route Line No.")
                {
                    ToolTip = 'Specifies the value of the Route Line No. field.', Comment = '%';
                }
            }
        }
    }


}
