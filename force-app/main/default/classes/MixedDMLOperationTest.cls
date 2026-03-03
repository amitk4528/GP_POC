public class MixedDMLOperationTest
{
    Public static void DoDMLOperation()
    {
        User UserToDeactivate = [Select Id, UserName, IsActive from User where UserName = 'testinguseramit@gmail.com' Limit 1];
        If(UserToDeactivate != null)
        {
            UserTodeactivate.IsActive = false;
            Update UserToDeactivate;
            UpdateAccountRecord();
        }
    }

    @Future()
    Public Static void UpdateAccountRecord ()
    {
        Account acc = [Select id, Name, Annualrevenue from account where name = 'Test1' Limit 1];
        If(acc!=null)
        {
            acc.AnnualRevenue = 500000;
            update acc;
        }
        
    }
}