Global class Caltotrevenue implements Database.Batchable<Sobject>, Database.stateful
{
    Global decimal Totannrev = 0.0;
    Global Database.QueryLocator Start (Database.BatchableContext bcontext)
    {
        String SelectAcc = 'Select id, name, annualrevenue from Account where Annual revenue !=null';
        return database.getQueryLocator(SelectAcc);
    }

    Global void Execute (Database.BatchableContext bcontext, List<Sobject> RecordsToProcess)
    {
        If(!RecordsToProcess.isEmpty())
        {
            For(Sobject Obj:RecordsToProcess)
            {
                Account acc =(Account) obj;
                TotAnnRev += Acc.AnnualRevenue;
            }
        }
    }
    
    Global void finish (Database.BatchableContext bcontext)
    {
        system.debug('Batch job id is----' + bcontext.getJobId());
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