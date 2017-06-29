({
	doInit : function(component, event, helper) {
		//Fetch the expense list from the apex controller
		helper.getAccountList(component);
	},
    showDetails: function(component, event, helper){
        // get data vua "data-data" attribute from the button(button itself or icons parent Node)
          var id = event.target.getAttribute("data-data") || 
              event.target.parentNode.getAttribute("data-data");
          alert(id + "was passed" );
    }
})