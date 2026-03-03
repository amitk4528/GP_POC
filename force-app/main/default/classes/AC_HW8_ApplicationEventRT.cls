public class AC_HW8_ApplicationEventRT 
{
    @AuraEnabled
    Public Static String search(string accname, string accind)
    {
        String accid;
        List<Account> accs = [Select Id, Name from Account where name =: accname and Industry =: accind ];
            If(accs.size()==0)
        {
                accid = 'NoData';
        }
        else
        {
            accid = accs[0].Id;
        }
        
        Return accid;
    }
    
    @AuraEnabled
    Public Static List<Contact> getcon(String accid)
    {
        List<Contact> con = [Select FirstName, LastName, Email from Contact where AccountId =: accid];
        Return con;
    }
    
    @AuraEnabled
    Public Static List<Opportunity> getopp(String accid)
    {
        List<Opportunity> opp = [Select Name, StageName, Amount from Opportunity where AccountId =: accid];
        Return opp;
    }
    

}