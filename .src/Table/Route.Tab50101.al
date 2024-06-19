table 50101 "HG Route"
{
    Caption = 'Route';
    DataClassification = ToBeClassified;
    LookupPageId = "HG Route";

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Variant Code"; Code[10])
        {
            Caption = 'Variant Code';
            DataClassification = CustomerContent;
        }
        field(3; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = CustomerContent;
        }
        field(4; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "No.", "Variant Code")
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
            TravelSetup.TESTFIELD(TravelSetup."Route Nos");
            if "No." = '' then begin
                "No. Series" := TravelSetup."Route Nos";
                if NoSeries.AreRelated(TravelSetup."Route Nos", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeries.GetNextNo("No. Series");
            end;

        End;

    end;
}
