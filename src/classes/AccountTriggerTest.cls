@isTest
private class AccountTriggerTest {
    @isTest  static void testBillingStateEqualsShippingState(){
     	//test setup data
        //create 200 new accounts
            List<Account> accts = new List<Account>();
        for(Integer i=0; i<200; i++){
            Account acct = new Account();
            acct.Name ='Test Account' + i; 
            acct.BillingState = 'CA';
            accts.add(acct);
        }
        //perform test
        Test.startTest();
        insert accts;
        Test.stopTest();    
        
        //verify accounts were inserted
       	//	List<Account> verifyBill = [SELECT Id FROM Account WHERE BillingState = 'CA'];
        //	System.AssertEquals(200, verifyBill.size());
        
        // verify shipping state 
        	List<Account> verifyShip = [SELECT Id FROM Account WHERE ShippingState = 'CA'];
        	System.AssertEquals(200, verifyShip.size());
        //	 for (Account a:accts){
                
         //       System.assertEquals('CA', a.ShippingState, 'ERROR');
          //  }
        
    }
}