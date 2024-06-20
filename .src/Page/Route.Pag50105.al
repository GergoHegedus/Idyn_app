page 50105 "HG Route"
{
    ApplicationArea = All;
    Caption = 'Route';
    PageType = Document;
    SourceTable = "HG Route";
    RefreshOnActivate = true;
    DataCaptionFields = "No.", Name;
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
                field("Variant Code"; Rec."Variant Code")
                {
                    ToolTip = 'Specifies the value of the Variant Code field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
            }

            part(RouteLineSubform; "HG Route Line Subform")
            {
                ApplicationArea = All;
                Caption = 'Route Line';
                SubPageLink = "Route No." = field("No.");
                ShowFilter = false;
            }
        }

        area(FactBoxes)
        {

            part("Route Schedule Line Part"; "HG Route Schedule Line Part")
            {
                ApplicationArea = All;
                Caption = 'Route Schedule';
                SubPageLink = "Route No." = field("No.");
            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(RouteScheduleLines)
            {
                Caption = 'Route Schedule';
                Image = StepOut;
                RunObject = Page "HG Route Schedule Lines";
                RunPageLink = "Route No." = FIELD("No.");

            }
        }

        area(Promoted)
        {
            actionref(RouteScheduleLines_promoted; RouteScheduleLines)
            {

            }
        }
    }

}
