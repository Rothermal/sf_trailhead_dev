({
    validateItemForm: function(component) {
		 console.log('hitting it');     
        // Simplistic error checking
        var validItem = true;
        
        // Name must not be blank
        var nameField = component.find("itemname");
        var itemname = nameField.get("v.value");
        if ($A.util.isEmpty(itemname)){
            validItem = false;
            nameField.set("v.errors", [{message:"Item name can't be blank."}]);
        }
        else {
            nameField.set("v.errors", null);
        }
        
        // Quantity must not be blank
        var quantityField = component.find("quantity");
        var quantity = quantityField.get("v.value");
        if ($A.util.isEmpty(quantity)){
            validItem = false;
            quantityField.set("v.errors", [{message:"Quantity can't be blank."}]);
        }
        else {
            quantityField.set("v.errors", null);
        }
        
        var priceField = component.find("price");
        var price = priceField.get("v.value");
        if ($A.util.isEmpty(price)){
            validItem = false;
            priceField.set("v.errors", [{message:"Price can't be blank."}]);
        }
        else {
            priceField.set("v.errors", null);
        }
        return(validItem);
	},
    createItem: function(component, item) {
              console.log('made it this far');
      
        var action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        action.setCallback(this, function(response){
            console.log('made it this far');
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var items = component.get("v.items");
                items.push(response.getReturnValue());
                component.set("v.items", items);
                component.set("v.newItem",{
                     		 'sobjectType': 'Camping_Item__c',
                             'Name': '',
                             'Quantity__c': 0,
                             'Price__c': 0,
                             'Packed__c': false 
                })
            }
        });
        $A.enqueueAction(action);
        
    }    
})