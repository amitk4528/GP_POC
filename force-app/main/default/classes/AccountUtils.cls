public class AccountUtils {
    public static list<Account> accountsByState(String st) {
        List<Account> acctlist = [SELECT Id, Name FROM Account WHERE BillingState = :st];
            return acctlist;
    }
}