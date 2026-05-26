tableextension 65400 "MNB Customer" extends Customer
{
    fields
    {
        field(65400; "MNB Bonuses"; Integer)
        {
            Caption = 'Bonuses';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = count("MNB Bonus Header" where("Customer No." = field("No.")));
        }
    }
}