public class AccountTriggerHandler {
    public static void CreateAccounts(List<Account> accts){
        
      //  List<Account> acct = new List<Account>();
        
        for(Account a :accts){
            a.ShippingState = a.BillingState;
      //      acct.add(a);
        }
    //        if(acct.size()>0){
      //      insert acct;
  //      }
    }
}