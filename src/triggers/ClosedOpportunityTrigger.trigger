trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
List<task> carry=New List<task>();
    
    for(opportunity opp:trigger.new){
        if(opp.stagename=='Closed Won'){
            task t=new task(
                WhatId=opp.Id,
                Status = 'Active',
                Subject = 'Follow Up Test Task',
            	ActivityDate = system.today()
            );
            carry.add(t);
        }
    }
	insert carry;
}