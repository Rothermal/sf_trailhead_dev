public class WWUtils {
    
    // use this method pre draft to update all players to new salary.
    public static void updateToNextYearSalary(){      
        List<Player__c> players = [SELECT id, 
                                   Team_Board__c,
                                   Salary__c,
                                   Name
                                   FROM player__c
                                   Where Salary__c != 0
                                   And Team_Board__c != 'Free Agent'];
        system.debug(players);
        for(Player__c p:players){
            p.Salary__c = p.Salary__c + 3;
        } 
        update players;
    }
    
    // use this method pre draft to update free agents to 0 salary.
    public static void updateFreeAgentsToZero(){
        List<Player__c> players = [SELECT id, 
                                   Team_Board__c,
                                   Salary__c,
                                   Name
                                   FROM player__c
                                   Where Salary__c != 0
                                   And Team_Board__c = 'Free Agent'];
        system.debug(players);
        for(Player__c p:players){
            p.Salary__c = 0;
        } 
        update players;
    }
    
    // create player team user rels. one time load.
    public static void createPTRbulk(){
        List<Player__c> players = [SELECT id, 
                                   Team_Board__c,
                                   Team__c,
                                   Salary__c,
                                   Name
                                   FROM player__c];
        
        List<Player_Team_Relationship__c> ptrs = new List<Player_Team_Relationship__c >();
        
        for(player__c p:players){
            Player_Team_Relationship__c ptr = new Player_Team_Relationship__c();
            ptr.player__c = p.Id;
            ptr.team__c = p.Team__c;
            ptr.season__c = '2017';
            ptr.Salary__c = p.Salary__c;
			ptr.Games_Played__c = 16;
            ptrs.add(ptr);
        }
        insert ptrs;
    }
    
}