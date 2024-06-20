table 50105 "HG Trip Line"
{
    Caption = 'Trip Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Trip No."; Code[20])
        {
            Caption = 'No.';
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
            TableRelation = "HG Route Stop"."No.";
            ValidateTableRelation = false;
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

        field(6; "Wait Time"; Duration)
        {
            Caption = 'Wait Time';
            DataClassification = CustomerContent;
        }

        field(7; "Travel Time"; Duration)
        {
            Caption = 'Travel Time';
            DataClassification = CustomerContent;
        }

        field(8; "Gross Travel Time"; Duration)
        {
            Caption = 'Gross Travel Time';
            DataClassification = CustomerContent;
        }

        field(9; "Route Line No."; Integer)
        {
            Caption = 'Route Line No.';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Trip No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
