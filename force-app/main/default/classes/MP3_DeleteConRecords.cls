public class MP3_DeleteConRecords 
{
    public static void DelRec()
    {
        List<Contact> Lcon = [Select Lastname,id from contact where lastname like'Rec%'];
        
        if(!Lcon.isEmpty())
        {
            Database.DeleteResult[] result = Database.delete(Lcon, false);
        }
    }

}