public class AC_HW7_AccCreateDisplay {
    @AuraEnabled
    public static string insertacc(Account ac)
    {
        String Result;
        Try
        {
            insert ac;
            Result='SUC';
        }
        Catch(Exception e)
        {
            Result='FAILED';
        }
        Return Result;
    }
    
    @AuraEnabled
    public static List<Account> getaccdata()
    {
        List<Account> acclist =[select Id, Name, Phone, Rating from Account];
        return acclist;
    }

}