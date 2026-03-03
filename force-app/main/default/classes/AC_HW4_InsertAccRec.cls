public class AC_HW4_InsertAccRec {
    @AuraEnabled
    Public Static String insertrec (String Nam, String Inds, String rat, String phn)
    {
        String Result;
        Try{
           Account acc = new Account();
        	acc.Name =  Nam;
            acc.Industry = Inds;
            acc.Rating = rat;
            acc.Phone = phn; 
            insert acc;
            Result = 'Account record created ';
        	}        
        
        catch(exception e){
            Result = 'Error occured' + e.getMessage();
       		 }
        return Result;
    }

}