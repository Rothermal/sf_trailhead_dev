@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 10 accounts
        for (Integer i=0;i<10;i++) {
            leads.add(new Lead(LastName='Lead '+i,LeadSource='Web',Company='Test Lead '+i, Status ='Open - Not Contacted'));
        }
        insert leads;
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(10, [select count() from lead where LeadSource = 'Dreamforce']);
    }
    
}