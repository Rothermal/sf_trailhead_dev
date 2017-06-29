({
    clickReimbursed: function(component, event, helper) {
        console.log("inside click reimbursed");
        var expense = component.get("v.expense");
        var updateEvent = component.getEvent("updateExpense");        
        console.log(expense, "expense in click reimbursed");        
        updateEvent.setParams({ "expense": expense });
        updateEvent.fire();
    }
})