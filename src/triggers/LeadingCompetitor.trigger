trigger LeadingCompetitor on Opportunity (before insert, before update) {

    for (Opportunity opp :Trigger.new){

        List<Decimal> competitorPrices = new List<Decimal>();
        competitorPrices.add(opp.Competitor_1_Price__c);
        competitorPrices.add(opp.Competitor_2_Price__c);
        competitorPrices.add(opp.Competitor_3_Price__c);

        List<String> competitors = new List<String>();
        competitors.add(opp.Competitor_1__c);
        competitors.add(opp.Competitor_2__c);
        competitors.add(opp.Competitor_3__c);

        Decimal lowestPrice;
        Integer lowestPricePosition;
        for(integer i = 0; i < competitorPrices.size(); i++ ){
        Decimal currentPrice = competitorPrices.get(i); // same as [i]
        if(lowestPrice == null || currentPrice < lowestPrice){
            lowestPrice = currentPrice;
            lowestPricePosition = i;  
            }
        }

       opp.Leading_Competitor__c = competitors.get(lowestPricePosition); 
    }
}