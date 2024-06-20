table 50103 "HG Route Schedule Line"
{
    Caption = 'Route Schedule Line';
    DataClassification = ToBeClassified;
    LookupPageId = "HG Route Schedule Lines";

    fields
    {
        field(1; "Route No."; Code[20])
        {
            Caption = 'Route No.';
            DataClassification = CustomerContent;
            TableRelation = "HG Route"."No.";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(4; "Period Type"; enum "HG Period Type")
        {
            Caption = 'Period Type';
            DataClassification = CustomerContent;
        }
        field(5; "Departure Time"; Time)
        {
            Caption = 'Departure Time';
            DataClassification = CustomerContent;
        }
        field(6; Frequency; Duration)
        {
            Caption = 'Frequency';
            DataClassification = CustomerContent;
        }
        field(7; "Last Departure Time"; Time)
        {
            Caption = 'Last Departure Time';
            DataClassification = CustomerContent;
        }

    }
    keys
    {
        key(PK; "Route No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
