Global class MP6_BatchInsertAcc implements Database.Batchable<sobject>
{
    Global Database.QueryLocator start (Database.BatchableContext bcontext)
    {
        String AccRec = 'Select Name, phone from Account';
        return database.getQueryLocator(AccRec);
    }
    
    Global void Execute (Database.BatchableContext bcontext, List<sobject>RecToProcess)
    {
        System.debug('In Execute methode');
        
        List<Account> Lacc = New List<Account>();
        for(sobject sobjectrec : RecToProcess)
        {
            Account Rec = (Account)sobjectrec;
            Rec.name = 'MP5_Test';
            Rec.Phone = '0123456789';
            Lacc.add(Rec);            
        }
        
        If(!Lacc.isEmpty())
        {
            insert Lacc;
        }
    }
    
    Global void finish (Database.BatchableContext bcontext)
    {
        System.debug('Account Record inserted successfully, Recore ID is:' + bcontext.getJobId());
    }

}