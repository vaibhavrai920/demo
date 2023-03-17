({
	doSave : function(component, event, helper) {
		var action = component.get('c.createContact');
        action.setParams({
            con : component.get('v.CreateContact'),
            AccountId : component.get('v.accountId')
        });
        action.setCallback(this, function(response){
            var state = response.getState();
           
            if(state==='SUCCESS' || state==='DRAFT'){
                var responseValue = response.getReturnValue();
                var componentEvent = component.getEvent('quickContact');
                componentEvent.setParams({
                    ContactRecord : responseValue
                });
                componentEvent.fire();
            } else if(state==='INCOMPLETE'){
                
            } else if(state==='ERROR'){
               var errors = response.getError(); //Array of Errors 
                console.log('Error', errors)
                if(errors|| errors[0].message){}
            }            
        },'ALL');
        $A.enqueueAction(action);
	}
})