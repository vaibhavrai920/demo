({
	doCLick : function(component, event, helper) {
        var childComp = component.find('childComp');
        childComp.child1('I am from Parent COmpoent');
		
	},
    doHandle : function(component){
    alert('this is aura action');
}
})