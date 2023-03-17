({
	showinfo : function(component, event, helper) {
		var eventSource = event.getSource();
        var beerObj = eventSource.get('v.name');
        component.set('v.BeerId', beerObj);
	}
})