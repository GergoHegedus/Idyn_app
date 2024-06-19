page 50108 "HG Route Stops"
{
    ApplicationArea = All;
    Caption = 'Route Stops';
    PageType = List;
    SourceTable = "HG Route Stop";
    UsageCategory = Lists;

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
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Address; Rec.Address)
                {
                    ToolTip = 'Specifies the value of the Address field.', Comment = '%';
                }

                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the value of the City field.', Comment = '%';
                }
                field(GPS; Rec.GPS)
                {
                    ToolTip = 'Specifies the value of the GPS field.', Comment = '%';
                }
            }
        }
    }
}
