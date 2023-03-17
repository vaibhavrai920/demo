({
	clickCreateItem : function(component, event, helper) {
        var isFormValid = component.find("campingItemForm").reduce(function(isValid, inputCmp){
        	inputCmp.showHelpMessageIfInvalid();    	
            return isValid && inputCmp.get("v.validity").valid;
        });
        
        if (isFormValid) {
            
            var newCampingItem = component.get("v.newItem");
            helper.createItem(component,newCampingItem);
           
        }
	},
    
    doInit : function (component, event, helper) {
        var action = component.get("c.getItems");
        action.setCallback(this,function (response) { 
        	var campingItems = response.getReturnValue();
            component.set("v.items",campingItems);
        });
        $A.enqueueAction(action);
    },
    
    handleAddItem : function (component, event, helper){
        var item = event.getParam("item");
        
        var action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        
        action.setCallback(this, function(response){
             var state = response.getState();
        if(component.isValid() && state === "SUCCESS"){
            var items = component.get("v.items");
            items.push(item);
            component.set("v.items", items);
        }
        });
        $A.enqueueAction(action);
    }
})