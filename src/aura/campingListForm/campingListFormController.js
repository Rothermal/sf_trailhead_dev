({
	submitForm : function(component, event, helper) {       
       if(helper.validateItemForm(component)){
            // Create the new item
			console.log('made it this far pre helper post validate');
           // this is why we pass the event to the helper, grab the new Item component from the view, and pass it into the helper function
            var newItem = component.get("v.newItem");
            helper.createItem(component, newItem);
        }	
	}
})