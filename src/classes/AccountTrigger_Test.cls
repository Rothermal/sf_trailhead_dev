@isTest
private class AccountTrigger_Test {
    @isTest static void TestcreateNewAccountInBulk(){
        //test setup data
        //create 200 new accounts
        List<Account> accts = new List<Account>();
        for(Integer i=0; i<200;i++){
            Account acct = new Account(Name ='Test Account' + i);
            accts.add(acct);
        }
        //perform test
        Test.startTest();
        insert accts;
        Test.stopTest();
        
        //verify accounts were inserted
        List<Account> verifyAccts = [SELECT Id FROM Account];
        System.AssertEquals(200, verifyAccts.size());
        
        // verify opps were also inserted
        List<Opportunity> verifyOpps = [SELECT Id FROM Opportunity];
        System.AssertEquals(200, verifyOpps.size());
        
        
    }
}