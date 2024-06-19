page 50114 "HG Slot Line Part"
{
    ApplicationArea = All;
    Caption = 'Slot Line Part';
    PageType = ListPart;
    SourceTable = "HG Slot Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

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
                field("Start Time"; Rec."Start Time")
                {
                    ToolTip = 'Specifies the value of the Start Time field.', Comment = '%';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("End Time"; Rec."End Time")
                {
                    ToolTip = 'Specifies the value of the End Time field.', Comment = '%';
                }
                field("Wait Time"; Rec."Wait Time")
                {
                    ToolTip = 'Specifies the value of the Wait Time field.', Comment = '%';
                }
                field("Travel Time"; Rec."Travel Time")
                {
                    ToolTip = 'Specifies the value of the Travel Time field.', Comment = '%';
                }
                field("Arrival (Actual)"; Rec."Arrival (Actual)")
                {
                    ToolTip = 'Specifies the value of the Arrival (Actual) field.', Comment = '%';
                }
                field("Wait Time (Actual)"; Rec."Wait Time (Actual)")
                {
                    ToolTip = 'Specifies the value of the Wait Time (Actual) field.', Comment = '%';
                }
                field("Departure (Actual)"; Rec."Departure (Actual)")
                {
                    ToolTip = 'Specifies the value of the Departure (Actual) field.', Comment = '%';
                }
                field("Travel Time (Actual)"; Rec."Travel Time (Actual)")
                {
                    ToolTip = 'Specifies the value of the Travel Time (Actual) field.', Comment = '%';
                }
                field("Gross Travel Time (Actual)"; Rec."Gross Travel Time (Actual)")
                {
                    ToolTip = 'Specifies the value of the Gross Travel Time (Actual) field.', Comment = '%';
                }
                field("Trip Line No."; Rec."Trip Line No.")
                {
                    ToolTip = 'Specifies the value of the Trip Line No. field.', Comment = '%';
                }
            }
        }
    }
}
