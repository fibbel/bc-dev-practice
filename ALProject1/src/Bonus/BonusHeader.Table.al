table 65400 "MNB Bonus Header"
{
    Caption = 'Bonus';
    DataClassification = CustomerContent;
    DrillDownPageId = "MNB Bonus List";
    LookupPageId = "MNB Bonus List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

            trigger OnValidate()
            begin
                TestNoSeries();
            end;
        }

        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Customer No.';
            TableRelation = Customer;

            trigger OnValidate()
            begin
                TestStatus();
                CalcFields("Customer Name");
            end;
        }
        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                TestStatus();
                if "Starting Date" > "Ending Date" then
                    "Ending Date" := "Starting Date";
            end;
        }
        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';

            trigger OnValidate()
            begin
                TestStatus();
                if "Starting Date" > "Ending Date" then
                    "Starting Date" := "Ending Date";
            end;
        }
        field(5; "Status"; Enum "MNB Bonus Header Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';

            trigger OnValidate()
            begin
                TestOnRelease();
            end;
        }
        field(6; "Last Released Date"; DateTime)
        {
            Caption = 'Last Released Date';
            Editable = false;
            DataClassification = SystemMetadata;
        }
        field(7; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            Editable = false;
        }
        field(8; "Bonus Amount"; Decimal)
        {
            Caption = 'Bonus Amount';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = sum("MNB Bonus Entry"."Bonus Amount" where("Bonus No." = field("No.")));
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnDelete()
    begin
        TestStatus();
        DeleteLines();
    end;

    trigger OnInsert()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if "No." = '' then begin
            SalesSetup.Get();
            SalesSetup.TestField("MNB Bonus Nos.");
            "No." := NoSeries.GetNextNo(SalesSetup."MNB Bonus Nos.", WorkDate(), true)
        end;

    end;

    var
        StatusCannotBeReleasedErr: Label 'Status cannot be %1', Comment = '%1 - status';

    local procedure TestStatus()
    begin
        if Status = Status::Released then
            Error(StatusCannotBeReleasedErr, Status);
    end;

    local procedure DeleteLines()
    var
        BonusLine: Record "MNB Bonus Line Type";
    begin
        BonusLine.SetRange("Document No.", Rec."No.");
        BonusLine.DeleteAll();
    end;

    local procedure TestOnRelease()
    begin
        if Status <> Status::Released then
            exit;
        TestField("Customer No.");
        "Last Released Date" := CurrentDateTime;
    end;

    local procedure TestNoSeries()
    var
        SalesSetup: Record "Sales & Receivables Setup";
        NoSeries: Codeunit "No. Series";
    begin
        if Rec."No." <> xRec."No." then begin
            SalesSetup.Get();
            NoSeries.TestManual(SalesSetup."MNB Bonus Nos.");
        end;
    end;
}