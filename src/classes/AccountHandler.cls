public class AccountHandler {
    public static Account insertNewAccount(String name){
        Account acct = new Account(Name=name);
       try {
            insert acct;
        } catch (System.DmlException e) {
            return null;
        }

    return acct;
    }
	
}