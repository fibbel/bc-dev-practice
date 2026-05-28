page 65401 "MNB Bonus Card"
{
    Caption = 'Bonus Card';
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = None;
    Editable = true;
    SourceTable = "MNB Bonus Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer name.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting date.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ending date.';
                }
                field("Status"; Rec."Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus status.';
                }
                field("Last Released Date"; Rec."Last Released Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the last date and time this bonus was released.';
                }
            }

            part(Lines; "MNB Bonus Subform")
            {
                ApplicationArea = All;
                Caption = 'Lines';
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            systempart(Links; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = Notes;
            }
            part(Statistics; "MNB Bonus Statistics")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                ToolTip = 'Open customer card for the bonus.';
                Image = Customer;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
            }
        }
        area(Navigation)
        {
            action(BonusEntries)
            {
                ApplicationArea = All;
                Caption = 'Bonus Entries';
                ToolTip = 'Opens bonus entries page.';
                Image = Entry;
                RunObject = page "MNB Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
            }
        }
        area(Reporting)
        {
            action(Print)
            {
                ApplicationArea = All;
                Caption = 'Print';
                Image = Print;
                RunObject = report "MNB Bonus Printout";
                ToolTip = 'Prints bonus card.';
            }
        }
    }
}