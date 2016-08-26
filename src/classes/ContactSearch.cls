public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName,String zipcode){
     return 
         [SELECT Name 
          FROM Contact 
          WHERE (lastName = :lastName 
                 AND mailingPostalCode = :zipcode)
         ];        
    }
}