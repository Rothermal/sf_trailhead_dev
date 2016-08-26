trigger ExampleTrigger on Contact (after insert, after delete) {
    if(Trigger.isInsert){
        Integer recordCount = Trigger.New.size();
        // call a utility method from another class
        EmailManager.sendMail('rothermal2@comcast.net','Trailhead Trigger Tutorial',
                             recordCount + ' contact(s) were inserted.'); 
    }
    else if (Trigger.isDelete){
        //process after delete
    }
		
}