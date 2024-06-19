page 50104 "HG Route Stop Card"
{
    ApplicationArea = All;
    Caption = 'Route Stop Card';
    PageType = Card;
    SourceTable = "HG Route Stop";
    DataCaptionFields = "No.";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';


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
