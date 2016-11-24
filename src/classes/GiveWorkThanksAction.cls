global without sharing class GiveWorkThanksAction {
	
    @InvocableMethod(label='Give a Thanks Badge')
    // go through list of give work thanks requests and call the method to send out thanks.
    global static void giveWorkBadgeActionsBatch(List<GiveWorkThanksRequest> requests){
        // note, no logic within the for loop. use the loop to call other methods... I wonder if this is best practice. 
        // the method has a query in it... hrmmm. Cant see any other way to do this right now.
        for(GiveWorkThanksRequest request: requests){
            giveWorkBadgeAction(request);
        }
    }
    public static void giveWorkBadgeAction(GiveWorkThanksRequest request ){
        // create a new work thanks object
        WorkThanks newWorkThanks = new WorkThanks();
        // set some values on the new object
        		newWorkThanks.GiverId = request.giverId;
                newWorkThanks.Message = request.thanksMessage;
        		newWorkThanks.OwnerId = request.giverId;
        
        insert newWorkThanks;
        
        // create a new work badge object
        WorkBadge newWorkBadge = new WorkBadge();
		// newWorkBadge.DefinitionId should be set to the ID for the Competitor Badge within this ORg
		WorkBadgeDefinition workBadgeDef = [SELECT Id,Name FROM WorkBAdgeDefinition WHERE Name = :request.badgeName Limit 1];
        	
        	newWorkBadge.DefinitionId = workBadgeDef.Id;
            newWorkBadge.RecipientId = request.receiverId;
        	newWorkBadge.SourceId = newWorkThanks.Id;
            //newWorkBadge.GiverId = request.giverId;
		
        insert newWorkBadge;
        
        WorkThanksShare newWorkThanksShare = new WorkThanksShare();
        
        	newWorkThanksShare.ParentId = newWorkThanks.Id;
        	newWorkThanksShare.UserOrGroupId = request.receiverId;
        
        	newWorkThanksShare.AccessLevel = 'Edit';
        
        	insert newWorkThanksShare;
        
        FeedItem post = new FeedItem();
        
        	post.ParentId = request.receiverId;
        	post.CreatedById = request.giverId;
        	post.Body = request.thanksMessage;
        	post.RelatedRecordId = newWorkThanks.Id;
        	post.Type = 'RypplePost';
        
        insert post;
       
    }
    
    global class GiveWorkThanksRequest {
        @InvocableVariable(label='Giver Id' required = true)
        global Id giverId;
        
         @InvocableVariable(label='Receiver Id' required = true)
        global Id receiverId;
        
         @InvocableVariable(label='Thanks Message' required = true)
        global String thanksMessage;
        
         @InvocableVariable(label='Badge Name' required = true)
        global String badgeName;
    }
    
}