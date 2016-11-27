public class AccountProcessor {
    @future
    public static void countContacts (List <Id> AccountId ){
        List<Account> accounts = [SELECT number_of_contacts__c,Id FROM Account WHERE id in :AccountId];

        for(Account a : accounts){
            a.number_of_contacts__c = numContacts(a.Id);               
        }
        update accounts;        
    }
    
    public static Integer NumContacts (Id accountId){
            Integer NumberOfContacts = [Select count() from contact where AccountId = :AccountId];
        return NumberOfContacts;

    }
}