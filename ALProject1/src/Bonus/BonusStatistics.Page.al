page 65404 "MNB Bonus Statistics"
{
    Caption = 'Statistics';
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "MNB Bonus Header";
    Editable = false;

    layout
    {
        area(Content)
        {
            field("No."; Rec."No.")
            {
                ToolTip = 'Specifies the bonus number.';
                ApplicationArea = All;
            }
            field("Bonus Amount"; Rec."Bonus Amount")
            {
                ToolTip = 'Specifies the total bonus amount.';
                ApplicationArea = All;
            }
        }
    }
}