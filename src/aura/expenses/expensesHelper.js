({
    
    saveExpense: function(component, expense, callback) {
        var action = component.get("c.saveExpense");
        action.setParams({
            "expense": expense
        });
        if (callback) {
            action.setCallback(this, callback);
        }
        $A.enqueueAction(action);
    },
    createExpense: function(component, expense) {
        this.saveExpense(component, expense, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {
                var expenses = component.get("v.expenses");
                expenses.push(response.getReturnValue());
                component.set("v.expenses", expenses);
                component.set("v.newExpense",{
                    'sobjectType': 'Expense__c',
                    'Name': '',
                    'Amount__c': 0,
                    'Client__c': '',
                    'Date__c': '',
                    'Reimbursed__c': false 
                });
            }
        });
    },    
    updateExpense: function(component, expense) {
        this.saveExpense(component, expense);
    }
    
})