({
	doChange : function(component, event, helper) {
        alert('value Changed');
		
	},
    Changedvalue : function(component, event, helper){
        component.set('v.test', 'value Changed');
        var aeEvent = $A.get('e.c:aeEvent');
        aeEvent.fire();
    },
    doInit : function(component, event, helper){
        component.set('v.test', 'On Init');
    }
})