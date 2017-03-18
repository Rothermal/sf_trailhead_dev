trigger UpdateTeam on Player__c (before insert,before update) {
    Set<String> teamName = new Set<String>();
    
    Map<string, id> nameMap = new Map<string, id>();
    for(Player__c p :trigger.new){
        teamName.add(p.Team_Board__c);
    }
        
	List<Waste_Whisperers__c > team = [SELECT id,
                                       Name
                                       FROM  Waste_Whisperers__c 
                                       WHERE Name in :teamName];
    for(Waste_Whisperers__c t : team){
        nameMap.put(t.Name, t.id);
        
    }
    
    for(Player__c player :trigger.new){
       id teamId = nameMap.get(player.Team_Board__c);
        player.Team__c = teamId;
    }
}