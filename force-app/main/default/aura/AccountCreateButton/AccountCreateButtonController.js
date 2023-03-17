({
	createAccount : function(component, event, helper) {
        var recordEvent=$A.get("e.force.createRecord");
        recordEvent.setParams(
            {
                "entityApiName":"Account",
                "defaultFieldValues":{
                    "Industry":"Apparel"
                }
            }
        );
		recordEvent.fire();
	}
})