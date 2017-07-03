trigger UpdateTeam on Player__c (before insert,before update) {
   //*
    Set<String> teamName = new Set<String>();
    List<Team__c > teamUpdate = new List<Team__c >();
    Map<string,Team__c  > nameMap = new Map<string, Team__c >();
    Set<Team__c > teamToDeDupe = new Set<Team__c >();
    for(Player__c p :trigger.new){
        teamName.add(p.Team_Board__c);
    }
        
    List<Team__c  > team = [SELECT id,
                                       Name
                                       FROM  Team__c  
                                       WHERE Name in :teamName];
    for(Team__c  t : team){
        nameMap.put(t.Name, t);    
    }
    // update player team to player board position
    for(Player__c player :trigger.new){
       Team__c  teamId = nameMap.get(player.Team_Board__c);
        player.Team__c = teamId.id;
     if(player.Salary__c == null){
            player.Salary__c = 0;
        }
    }
    //*/
}