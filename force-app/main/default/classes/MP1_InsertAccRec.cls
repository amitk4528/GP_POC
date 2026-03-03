Public class MP1_InsertAccRec 
{
    Public Static void AccRec()
    {
        Account acc = New Account();
        acc.name = 'Master_Program_1';
        acc.Active__c = 'Yes';
             
        Insert acc;
        
        If(acc.Id!=null)
        {
            System.debug('Account record inserted, Record ID is:' + acc.Id);
    
        contact con = New Contact();
        con.FirstName = 'Associated Record';
        con.LastName = 'For_MP1';
        con.Phone = '9988776655'; 
        con.AccountId = acc.Id;
        
        Insert con;
        
        If(con!=null)
        {
            System.debug('Contact record inserted, Record ID is:' + con.Id);         
        }
    }
    }

}