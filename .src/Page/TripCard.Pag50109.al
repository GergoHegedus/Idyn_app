page 50109 "HG Trip Card"
{
    ApplicationArea = All;
    Caption = 'Trip Card';
    PageType = Document;
    SourceTable = "HG Trip";

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
                field("Route No."; Rec."Route No.")
                {
                    ToolTip = 'Specifies the value of the Route No. field.', Comment = '%';
                }
                field("Route Variant Code"; Rec."Route Variant Code")
                {
                    ToolTip = 'Specifies the value of the Route Variant Code field.', Comment = '%';
                }
                field("Route Schedule Line No."; Rec."Route Schedule Line No.")
                {
                    ToolTip = 'Specifies the value of the Route Schedule Line No. field.', Comment = '%';
                }
            }

            part(TripLines; "HG Trip Line Part")
            {
                ApplicationArea = All;
                Caption = 'Trip Lines';
                SubPageLink = "Trip No." = field("No.");
            }
        }



    }
    actions
    {
        area(Processing)
        {
            action(CreateSlot)
            {
                Caption = 'Create Slot';
                Image = StepOut;
                RunObject = Page "HG Slot Card";
                RunPageLink = "Trip No." = FIELD("No.");
            }


        }
        area(Promoted)
        {
            actionref(CreateSlot_Promoted; "CreateSlot")
            {
            }

        }
    }
}
