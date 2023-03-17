({
    createModal : function(component, event, helper) {
        component.find('overLayLib').showCustomModal({
            header: "Application Confirmation",
            body: 'this is test',
            footer : 'Footer',
            showCloseButton: true,
            cssClass: "mymodal",
            closeCallback: function() {
                alert('You closed the alert!');
            }
        });  
        },
   navigateURL : function(component, event, helper) { 
       var pageReference = component.find("navigation");
       var pageReferenceNav = {
           type: 'standard__objectPage',
           attributes: {
               objectApiName: 'Account',
               actionName: 'list'
           },
           state : {
               filterName: "MyAccounts"
           }
       };
       pageReference.navigate(pageReferenceNav);
   },
    navigateToBeer : function(component, event, helper){
        var pageReference = component.find("navigationToBeerExplorer");
        var pageReferenceNav = {
            "type" : "standard__component",
            "attributes" : {
                "componentName": "c__BeerExplorer"
            },
            "state":{
                "myAttr": "attrValue"
            }
        };
        pageReference.navigate(pageReferenceNav);
    },
    handleLoad : function(component, event, helper){
        
    },
    handleSubmit : function(component, event, helper){
        alert('Submit Handled');
    },
    createButton : function(component, event, helper){
        $A.createComponent('lightning:button',
                           {
                               label:"create new",
                               value:"create new",
                               onclick : component.getReference("c.handleSubmit")
                           }, function(newbutton, status, errorMessage){
                               
                               if(status === 'SUCCESS'){
                                   alert('button created');
                                   var body = component.get('v.body');
                                   body.push(newbutton);
                                   component.set('v.body', body);
                               }
                               
                               
                           });
    },   
})