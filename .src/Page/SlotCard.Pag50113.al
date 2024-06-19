page 50113 "HG Slot Card"
{
    ApplicationArea = All;
    Caption = 'Slot Card';
    PageType = Document;
    SourceTable = "HG Slot";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field("Trip No."; Rec."Trip No.")
                {
                    ToolTip = 'Specifies the value of the Trip No. field.', Comment = '%';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.', Comment = '%';
                }
                field("Start (Date)Time"; Rec."Start (Date)Time")
                {
                    ToolTip = 'Specifies the value of the Start (Date)Time field.', Comment = '%';
                }
                field("Duration"; Rec."Duration")
                {
                    ToolTip = 'Specifies the value of the Duration field.', Comment = '%';
                }
                field("End (Date)Time"; Rec."End (Date)Time")
                {
                    ToolTip = 'Specifies the value of the End (Date)Time field.', Comment = '%';
                }
            }

            part(SlotLinePart; "HG Slot Line Part")
            {
                ApplicationArea = All;
                Caption = 'Slot Line';
                SubPageLink = "Slot No." = field("No.");
            }
        }


    }
}
