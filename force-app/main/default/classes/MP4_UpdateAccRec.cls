public class MP4_UpdateAccRec 
{
    Public static void updaterec()
    {
        List<Account> Lacc = [Select id,name,phone from Account where name='Test2'];
        If(!Lacc.isempty())
        {
            for(Account acc : Lacc )
            {
            acc.Phone = '9988776655';
            }
           update Lacc; 
        }    
           
    }

}