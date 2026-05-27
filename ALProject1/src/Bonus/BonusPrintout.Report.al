report 65401 "MNB Bonus Printout"
{
    Caption = 'Bonus Printout';
    UsageCategory = None;
    DefaultLayout = Word;
    WordLayout = './src/Bonus/BonusPrintout.docx';

    dataset
    {
        dataitem("MNB Bonus Header"; "MNB Bonus Header")
        {
            RequestFilterFields = "Customer No.", "No.";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Customer_No_; "Customer No.")
            {
                IncludeCaption = true;
            }
            column(Starting_Date; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(Ending_Date; "Ending Date")
            {
                IncludeCaption = true;
            }
            dataitem("MNB Bonus Line"; "MNB Bonus Line Type")
            {
                DataItemLink = "Document No." = field("No.");
                column(Type; Type)
                {
                    IncludeCaption = true;
                }
                column(Item_No_; "Item No.")
                {
                    IncludeCaption = true;
                }
                column(Bonus_Perc_; "Bonus Perc.")
                {
                    IncludeCaption = true;
                }
            }
        }
    }
}