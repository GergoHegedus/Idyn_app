page 50107 "HG Route Schedule Lines"
{
    ApplicationArea = All;
    Caption = 'Route Schedule Lines';
    PageType = List;
    SourceTable = "HG Route Schedule Line";
    UsageCategory = Lists;
    AutoSplitKey = true;
    CardPageId = "HG Route Schedule Line Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {


                field("Period Type"; Rec."Period Type")
                {
                    ToolTip = 'Specifies the value of the Period Type field.', Comment = '%';
                }
                field("Departure Time"; Rec."Departure Time")
                {
                    ToolTip = 'Specifies the value of the Departure Time field.', Comment = '%';
                }
                field(Frequency; Rec.Frequency)
                {
                    ToolTip = 'Specifies the value of the Frequency field.', Comment = '%';
                }
                field("Last Departure Time"; Rec."Last Departure Time")
                {
                    ToolTip = 'Specifies the value of the Last Departure Time field.', Comment = '%';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CreateTrip)
            {
                ApplicationArea = All;
                Caption = 'Create Trip';

                Image = Add;
                trigger OnAction()
                begin
                    Message('In progress');
                end;
            }

            action(ShowTrips)
            {
                ApplicationArea = All;
                Caption = 'Show Trips';
                Image = GetLines;
                trigger OnAction()
                begin
                    Message('In progress');
                end;
            }
        }

        area(Promoted)
        {
            actionref(ShowTrips_Promoted; "ShowTrips")
            {
            }
            actionref(CreateTrip_Promoted; "CreateTrip")
            {
            }
        }
    }
}
