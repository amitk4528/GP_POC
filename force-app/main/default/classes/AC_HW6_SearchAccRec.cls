public class AC_HW6_SearchAccRec {
    
    @AuraEnabled
    public Static List<Account> getAccRec(String SearchText){
        String SS = '%'+SearchText+'%';
       List<Account> lacc =[select Name, Industry, Rating, phone from Account where Name like :SS ];
        return lacc;
    }

}