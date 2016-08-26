public with sharing class AccountHandlerRedux {
    public static void CreateNewOpportunity(List<Account> accts){
        
        List<Opportunity> opps = new List<Opportunity>();
        
        for(Account a : accts){
            Opportunity opp = new Opportunity();
            opp.Name = a.Name + 'Opportunity';
            opp.AccountId = a.id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = System.Today().addMonths(1);
            opps.add(opp);
        }
        if(opps.size() > 0){
            insert opps;
        }
    }

}