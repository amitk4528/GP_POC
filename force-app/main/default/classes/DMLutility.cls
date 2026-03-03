public class DMLutility 
{
    public static void UpdateAccph()
    {
       List<Account> Lacc = [Select id, Name, Phone from Account where Name = 'Test'];
           if(!Lacc.isEmpty())
       {
           for(Account acc:LAcc)
           {
               acc.phone = '9876543210';
           }
           If(!Lacc.isEmpty())
           {
               Update Lacc;
           }
       }
    }

}