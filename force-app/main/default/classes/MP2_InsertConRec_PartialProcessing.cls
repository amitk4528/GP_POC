public class MP2_InsertConRec_PartialProcessing 
{
    Public static void conrec(Integer NoOfRec)
    {
        List<Contact> Lcon = New List<Contact>();
        If(NoOfRec>0)
        {
            For(Integer i = 0 ; i<NoOfRec; i++)
            {
                Contact Con = New Contact();
                Con.FirstName = 'MP2';
                Con.LastName = 'Rec' + i;
                Lcon.Add(Con);
            }
        }
        
        If(!Lcon.isempty())
        {
            Database.SaveResult[] result = Database.insert(Lcon, false);
            
            For(Database.SaveResult res : result)
            {
                if(res.isSuccess())
                {
                    System.debug('Record inserted successfully');
                }
                   
                   else
                   {
                   for(database.Error err : res.geterrors())
                   {
                       system.debug('Record insertion failed');
                       system.debug(err.getMessage());
                   }
                   }
            }
        }
        
    }

}