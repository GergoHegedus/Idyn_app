table 50106 "HG Slot"
{
    Caption = 'Slot';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; "Trip No."; Code[20])
        {
            Caption = 'Trip No.';
            DataClassification = CustomerContent;
            TableRelation = "HG Trip"."No.";
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            DataClassification = CustomerContent;
        }
        field(4; "Start (Date)Time"; DateTime)
        {
            Caption = 'Start (Date)Time';
            DataClassification = CustomerContent;
        }
        field(5; "Duration"; Duration)
        {
            Caption = 'Duration';
            DataClassification = CustomerContent;
        }
        field(6; "End (Date)Time"; DateTime)
        {
            Caption = 'End (Date)Time';
            DataClassification = CustomerContent;
        }
        field(7; "No. Series"; Code[20])
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
            TravelSetup.TESTFIELD(TravelSetup."Slot Nos");
            if "No." = '' then begin
                "No. Series" := TravelSetup."Slot Nos";
                if NoSeries.AreRelated(TravelSetup."Slot Nos", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeries.GetNextNo("No. Series");
            end;

        End;
    end;
}
