table 50102 "HG Route Line"
{
    Caption = 'Route Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Route No."; Code[20])
        {
            Caption = 'Route No.';
            DataClassification = CustomerContent;
            TableRelation = "HG Route"."No.";
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(4; "Stop No."; Code[20])
        {
            Caption = 'Stop No.';
            TableRelation = "HG Route Stop"."No.";
            ValidateTableRelation = false;
        }
        field(5; Boarding; Boolean)
        {
            Caption = 'Boarding';
        }
        field(6; Unboarding; Boolean)
        {
            Caption = 'Unboarding';
        }
        field(7; "Wait Time (Planned)"; Duration)
        {
            Caption = 'Wait Time (Planned)';
        }
        field(8; "Travel Time (Planned)"; Duration)
        {
            Caption = 'Travel Time (Planned)';
        }
    }
    keys
    {
        key(PK; "Route No.", "Variant Code", "Line No.")
        {
            Clustered = true;
        }
    }
}
