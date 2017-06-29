trigger UpdateTeam on Player__c (before insert,before update) {
    Set<String> teamName = new Set<String>();
    List<Waste_Whisperers__c> teamUpdate = new List<Waste_Whisperers__c>();
    Map<string,Waste_Whisperers__c > nameMap = new Map<string, Waste_Whisperers__c>();
    Set<Waste_Whisperers__c> teamToDeDupe = new Set<Waste_Whisperers__c>();
    for(Player__c p :trigger.new){
        teamName.add(p.Team_Board__c);
    }
        
    List<Waste_Whisperers__c > team = [SELECT id,
                                       Name
                                       FROM  Waste_Whisperers__c 
                                       WHERE Name in :teamName];
    for(Waste_Whisperers__c t : team){
        nameMap.put(t.Name, t);    
    }
    // update player team to player board position
    for(Player__c player :trigger.new){
       Waste_Whisperers__c teamId = nameMap.get(player.Team_Board__c);
        player.Team__c = teamId.id;
     if(player.Salary__c == null){
            player.Salary__c = 0;
        }
    }
}