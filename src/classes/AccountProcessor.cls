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
// that above is probably not best practice.. here is a solution from the forum that is similar
/*  
  
  @future
  public static void countContacts(Set<id> setId) 
  {
      List<Account> lstAccount = [select id,Number_of_Contacts__c , (select id from contacts ) from account where id in :setId ];
      for( Account acc : lstAccount )
      {
          List<Contact> lstCont = acc.contacts ;
          
          acc.Number_of_Contacts__c = lstCont.size();
      }
      update lstAccount;
  }
*/