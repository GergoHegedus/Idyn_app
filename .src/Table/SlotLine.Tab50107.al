table 50107 "HG Slot Line"
{
    Caption = 'Slot Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Slot No."; Code[20])
        {
            Caption = 'Slot No.';
            DataClassification = CustomerContent;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Stop No."; Code[20])
        {
            Caption = 'Stop No.';
            DataClassification = CustomerContent;
        }
        field(4; Boarding; Boolean)
        {
            Caption = 'Boarding';
            DataClassification = CustomerContent;
        }
        field(5; Unboarding; Boolean)
        {
            Caption = 'Unboarding';
            DataClassification = CustomerContent;
        }
        field(6; "Start Time"; DateTime)
        {
            Caption = 'Start Time';
            DataClassification = CustomerContent;
        }
        field(7; "Duration"; Duration)
        {
            Caption = 'Duration';
            DataClassification = CustomerContent;
        }
        field(8; "End Time"; DateTime)
        {
            Caption = 'End Time';
            DataClassification = CustomerContent;
        }
        field(9; "Wait Time"; Duration)
        {
            Caption = 'Wait Time';
            DataClassification = CustomerContent;
        }
        field(10; "Travel Time"; Duration)
        {
            Caption = 'Travel Time';
            DataClassification = CustomerContent;
        }
        field(11; "Arrival (Actual)"; DateTime)
        {
            Caption = 'Arrival (Actual)';
            DataClassification = CustomerContent;
        }
        field(12; "Wait Time (Actual)"; Duration)
        {
            Caption = 'Wait Time (Actual)';
            DataClassification = CustomerContent;
        }
        field(13; "Departure (Actual)"; DateTime)
        {
            Caption = 'Departure (Actual)';
            DataClassification = CustomerContent;
        }
        field(14; "Travel Time (Actual)"; Duration)
        {
            Caption = 'Travel Time (Actual)';
            DataClassification = CustomerContent;
        }
        field(15; "Gross Travel Time (Actual)"; Duration)
        {
            Caption = 'Gross Travel Time (Actual)';
            DataClassification = CustomerContent;
        }
        field(16; "Trip Line No."; Integer)
        {
            Caption = 'Trip Line No.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Slot No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
