table 50100 "HG Route Stop"
{
    Caption = 'Route Stop';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
        }
        field(2; Name; Code[20])
        {
            Caption = 'NAW';
            DataClassification = CustomerContent;
        }
        field(3; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = CustomerContent;
        }

        field(4; City; Text[30])
        {
            Caption = 'City';
            DataClassification = CustomerContent;
        }
        field(5; GPS; Code[50])
        {
            Caption = 'GPS';
            DataClassification = CustomerContent;
        }
        field(6; "No. Series"; Code[20])
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
            TravelSetup.TESTFIELD(TravelSetup."Stop Nos");
            if "No." = '' then begin
                "No. Series" := TravelSetup."Stop Nos";
                if NoSeries.AreRelated(TravelSetup."Stop Nos", xRec."No. Series") then
                    "No. Series" := xRec."No. Series";
                "No." := NoSeries.GetNextNo("No. Series");
            end;

        End;
    end;
}
