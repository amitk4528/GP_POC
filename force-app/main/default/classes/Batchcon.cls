Global class Batchcon implements database.Batchable<Sobject>
{

    Global database.QueryLocator start (database.BatchableContext bcontext)
    {
        String accquery = 'select id, name, phone, website from contact';
        return database.getQueryLocator(accquery);
    }
    
   
    Global void execute (database.BatchableContext bcontext, List<Contact> recordstoprocess)
    {
        
            List<contact> contoupdate = new list<Contact>([select id, name, phone from contact]);
            
            
           if(!contoupdate.isempty())
                update contoupdate;
            
        }
        
    
    Global void finish (Database.BatchableContext bcontext)
    {
       System.debug('Batch job id is...'+ bcontext.getJobId());
             
        Asyncapexjob jobdetails = [select id, status, totaljobitems, jobitemsprocessed, numberoferrors 
                                   from Asyncapexjob where id=:bcontext.getJobId()];
        Messaging.SingleEmailMessage email = new messaging.SingleEmailMessage();
        String[] toaddress = new string[]{jobdetails.createdby.Email ,'amitk4528@gmail.com'};
            email.setToAddresses(toaddress);
        string emailsub = 'batchjob:'+ bcontext.getJobId() +'Execution stataus Notification';
        email.setsubject(emailsub);     
        
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