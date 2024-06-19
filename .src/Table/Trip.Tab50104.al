table 50104 "HG Trip"
{
    Caption = 'Trip';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Route No."; Code[20])
        {
            Caption = 'Route No.';
            DataClassification = CustomerContent;
            TableRelation = "HG Route"."No.";
        }
        field(3; "Route Variant Code"; Code[10])
        {
            Caption = 'Route Variant Code';
            DataClassification = CustomerContent;
            TableRelation = "HG Route"."Variant Code";
        }
        field(4; "Route Schedule Line No."; Integer)
        {
            Caption = 'Route Schedule Line No.';
            DataClassification = CustomerContent;
            TableRelation = "HG Route Schedule Line"."Line No." where("Route No." = field("Route No."), "Variant Code" = field("Route Variant Code"));
        }
        field(5; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        NoSeries: Codeunit "No. Series";
        TravelSetup: Record "HG Travel Setup";
    begin
        TravelSetup.Get();
        IF "No." = '' then begin
            TravelSetup.TESTFIELD(TravelSetup."Trip Nos");
            if "No." = '' then begin
                "No. Series" := TravelSetup."Trip Nos";
                if NoSeries.AreRelated(TravelSetup."Trip Nos", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeries.GetNextNo("No. Series");
            end;

        End;
    end;
}
