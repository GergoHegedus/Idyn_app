table 50108 "HG Travel Setup"
{
    Caption = 'Travel Setup';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(2; "Stop Nos"; Code[20])
        {
            Caption = 'Stop No. Series';

            TableRelation = "No. Series";
        }
        field(3; "Route Nos"; Code[20])
        {
            Caption = 'Route No. Series';

            TableRelation = "No. Series";
        }
        field(4; "Trip Nos"; Code[20])
        {
            Caption = 'Trip No. Series';

            TableRelation = "No. Series";
        }
        field(5; "Slot Nos"; Code[20])
        {
            Caption = 'Slot No. Series';

            TableRelation = "No. Series";
        }
    }
    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }
}
