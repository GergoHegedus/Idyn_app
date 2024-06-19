page 50103 "HG Route Schedule Line Part"
{
    ApplicationArea = All;
    Caption = 'Route Schedule Line Part';
    AutoSplitKey = true;
    InsertAllowed = true;
    ModifyAllowed = true;
    DeleteAllowed = true;
    PageType = ListPart;
    SourceTable = "HG Route Schedule Line";
    RefreshOnActivate = true;

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
        area(processing)
        {
            action(RouteScheduleLines)
            {
                Caption = 'Route Schedule Lines';
                Image = Map;
                RunObject = Page "HG Route Schedule Lines";
                RunPageLink = "Route No." = FIELD("Route No.");
            }
        }


    }
}
