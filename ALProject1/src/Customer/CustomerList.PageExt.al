pageextension 65401 "MNB Customer List" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field("MNB No. of Bonuses"; Rec."MNB Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the number of assigned bonuses to the customer.';
            }
        }
    }

    actions
    {
        addlast(navigation)
        {
            action(MNBBonuses)
            {
                ApplicationArea = All;
                Caption = 'Bonuses';
                ToolTip = 'Open list of bonuses assigned to this customer';
                Image = Discount;
                RunObject = page "MNB Bonus List";
                RunPageLink = "Customer No." = field("No.");
            }
        }
    }
}