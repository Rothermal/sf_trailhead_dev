@IsTest
private class AccountProcessorTest {
    @IsTest
    private static void testFieldCount(){
        Account a = new Account();
        a.Name = 'Test Account';
        Insert a;
        
        Contact c = new Contact();
        c.FirstName = 'test';
        c.LastName ='testPerson';
        c.AccountId=a.Id;
        insert c;
        
        List<Id> setAccountId=new List<id>();
        setAccountId.add(a.id);
        Test.startTest();
        AccountProcessor.countContacts(setAccountId);
        Test.stopTest();
        Account account =[Select Number_of_Contacts__c from Account where id = :a.id Limit 1];
        System.assertEquals(Integer.valueOf(account.Number_of_Contacts__c), 1);
        
        
    } 
    
}