codeunit 50100 "MNB Bonus Card Tests"
{
    Subtype = Test;
    TestPermissions = Disabled;

    var
        LibraryRandom: Codeunit "Library - Random";
        LibraryUtility: Codeunit "Library - Utility";
        Assert: Codeunit Assert;

    [Test]
    procedure CheckIfNotPossibleToChangeStartingDateInReleasedStatus()
    var
        BonusHeader: Record "MNB Bonus Header";
        StatusCannotBeReleasedErr: Label 'Status cannot be Released';
    begin
        //[SCENARIO] Check if not possible to change Starting Date in Released status
        //[GIVEN] Bonus Header exists with status Released
        BonusHeader.Init();
        BonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        BonusHeader.Status := BonusHeader.Status::Released;
        BonusHeader.Insert();
        //[WHEN] Validate the Starting Date directly in the code
        asserterror BonusHeader.Validate("Starting Date", LibraryRandom.RandDate(10));
        //[THEN] Error is shown that you cannot change Starting Date in Released status
        Assert.ExpectedError(StatusCannotBeReleasedErr);
    end;

    [Test]
    procedure TestIfCustomerNoHasValueBeforeRelease()
    var
        BonusHeader: Record "MNB Bonus Header";
        CustomerNoIsEmptyErr: Label 'Customer No. must have a value in Bonus: No.';
    begin
        // [SCENARIO] Test if Customer No. has value before release
        // [GIVEN] Bonus Header exists with status Open
        BonusHeader.Init();
        BonusHeader."No." := LibraryUtility.GetGlobalNoSeriesCode();
        BonusHeader.Status := BonusHeader.Status::Open;
        // [WHEN] Change status to released
        asserterror BonusHeader.Validate(Status, BonusHeader.Status::Released);
        // [THEN] Error is shown that Customer No. has no value
        Assert.ExpectedError(CustomerNoIsEmptyErr);
    end;
}