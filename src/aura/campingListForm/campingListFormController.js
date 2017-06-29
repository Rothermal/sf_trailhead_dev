({
	submitForm : function(component, event, helper) {       
       if(helper.validateItemForm(component)){
            // Create the new item
			console.log('made it this far pre helper post validate');
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }	
	}
})