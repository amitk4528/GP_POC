public class MP7_Future 
{
    Public static void DeactivateUser()
    {
        User UpdateUser = [select UserName, email, IsActive from User where UserName = 'testinguseramit@gmail.com'];
        
        If(UpdateUser!=null)
        {
            UpdateUser.IsActive = false;
            update UpdateUser;
            AccRec();
        }
        
    }
    
    @Future()
    
    Public Static void AccRec()
    {
        Account acc = [Select name, Active__C from Account where name = 'Test2'];
        
        If(acc!=null)
        {
            acc.Active__c = 'YES';
            update acc;
        }
        
    }
}