public class AccountUtils {
    public static List<Account> accountsByState(String state){
        List<account> results = [SELECT Name 
                                FROM account
                                WHERE BillingState = :state];
        return results;
    }
}