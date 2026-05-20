permissionset 65400 "MNB Bonus Reg."
{
    Caption = 'Bonus Registration';
    Assignable = true;
    Permissions =
        tabledata "MNB Bonus Header" = RMID,
        tabledata "MNB Bonus Line Type" = RMID;
}