Global class updateaccbatch implements database.Batchable<Sobject>
{
       Global database.QueryLocator start (database.BatchableContext bcontext)
    {
        String accquery = 'select id, name, phone, website from Account';
        return database.getQueryLocator(accquery);
    }
    Global void execute (database.BatchableContext bcontext, List<Sobject> recordstoprocess)
    {
        if(!recordstoprocess.isempty())
        {
            List<Account> acctoupdate = new list<Account>();
            for(Sobject sobjectrecord : recordstoprocess)
            {
                Account accrecord = (Account) Sobjectrecord;
                accrecord.website = 'www.tashan.biz';
                accrecord.Phone = '99999999999';
                acctoupdate.add(accrecord);
            }
            
            if(!acctoupdate.isempty())
            {
                update acctoupdate;
            }
        }
    }

    Global void finish (Database.BatchableContext bcontext)
    {
        System.debug('Batch job id is...'+ bcontext.getJobId());
        Asyncapexjob jobdetails = [select id, status, totaljobitems, Jobitemsprocessed, numberoferrors, createdby.Email from Asyncapexjob
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