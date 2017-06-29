({
    
    // Load items from Salesforce
    doInit: function(component, event, helper) {
        
        // Create the action
        var action = component.get("c.getItems");
        
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                component.set("v.items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    clickCreateItem: function(component, event, helper) {
  
        
       if(helper.validateItemForm(component)){
            // Create the new item
			console.log('made it this far pre helper post validate');
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }
    },
    handleAddtem: function(component, event, helper){
        
    }    
})