public class ContactHandler 
{
    Public static void InserBulkCont(Integer NoOfCont)
    {
        List<Contact> LCont = New List<Contact>();
        
        If (NoOfCont > 0)
        {
            for(Integer i = 0; i <NoOfCont;i++)
            {
                Contact Con = New Contact();
                Con.FirstName = 'Apex';
                Con.LastName = 'Conact '+ i;
                LCont.Add(Con);
            }
            If (!LCont.isEmpty())
            {
                Insert LCont;
            }
        }
    }

}