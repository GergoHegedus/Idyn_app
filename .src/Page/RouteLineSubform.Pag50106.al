page 50106 "HG Route Line Subform"
{
    ApplicationArea = All;
    Caption = 'Route Line Subform';
    PageType = CardPart;
    SourceTable = "HG Route Line";
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';


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
                field("Wait Time (Planned)"; Rec."Wait Time (Planned)")
                {
                    ToolTip = 'Specifies the value of the Wait Time (Planned) field.', Comment = '%';
                }
                field("Travel Time (Planned)"; Rec."Travel Time (Planned)")
                {
                    ToolTip = 'Specifies the value of the Travel Time (Planned) field.', Comment = '%';
                }
            }
        }
    }
}
