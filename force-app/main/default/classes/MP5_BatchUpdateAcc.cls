Global class MP5_BatchUpdateAcc implements database.Batchable<Sobject>
{
    Global database.QueryLocator start(Database.BatchableContext bcontext)
    {
        String AccRec = 'Select id, name, phone from Account';
        return database.getQueryLocator(AccRec);
    }
    
    Global void Execute (Database.BatchableContext bcontext, List<Sobject> RecToProcess)
    {
        List<Account> updateRec = New List<Account>();
        
        for(sobject sRec : RecToProcess)
        {
            Account Rec = (Account)sRec;
            Rec.Phone = '9988776655';
            updateRec.add(Rec);
        }
        
        update updateRec;
    }
    
    Global void finish(Database.BatchableContext bcontext)
    {
        System.debug('Batch job id is...'+ bcontext.getJobId());
        Asyncapexjob jobdetails = [select id, status, totaljobitems, Jobitemsprocessed, numberoferrors from Asyncapexjob
                                   where id=:bcontext.getJobId()];
             Messaging.SingleEmailMessage email = new messaging.SingleEmailMessage();
        String[] toaddress = new string[]{jobdetails.createdby.Email ,'amitk4528@gmail.com'};
            email.setToAddresses(toaddress);
        string emailsub = 'batchjob:'+ bcontext.getJobId() +'Execution stataus Notification';
        email.setsubject(emailsub);
        email.setreplyto('amitk4528@gmail.com');
        
        String emailcontent = 'Dear customer.<br/><br/>'+ 
            'Here is status notification of batch job:<br/><br/>batch Batch job id is'+ jobdetails.Id +
            '<br/><br/>batch job status is  = '+ jobdetails.Status +
            '<br/><br/>Total no. of batches = '+ jobdetails.totaljobitems +
            '<br/><br/>No of batches proccessed = '+ jobdetails.jobitemsprocessed +
            '<br/><br/>No of failed batches = '+ jobdetails.numberoferrors +
            '<br/><br/>Thanks and regard <br/>Support team';
        email.sethtmlbody(emailcontent);
        messaging.sendEmail(new messaging.SingleEmailMessage[] {email}); 
    }

}