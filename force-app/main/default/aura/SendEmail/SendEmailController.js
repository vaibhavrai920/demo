({
    init : function(component, event, helper) {
    var titles = component.get("v.customListStr");
        console.log('titles in int-->'+titles);
        console.log('Init event is being triggered');
        var action = component.get("c.fetchEmails");
        console.log('Init event is being triggered 1');
        action.setParams({
            customListStr : titles
        })
        console.log('Init event is being triggered 2');
        action.setCallback(this,function(e){
            console.log('e.getState' +e.getState());
           if(e.getState()=='SUCCESS'){
            var result=e.getReturnValue();
              component.set('v.taskEmails' ,result);  
                    
                
           }
    });
     $A.enqueueAction(action);
        
},
        //if(titles==''){
            //alert('Recipient is required')
        //}else{
            //helper.fetchEmails(component);
       // }
        //alert(titles);
    //console.log('titles in int-->'+titles);
    Send : function(component, event, helper) {
        var email=helper._e('txtEmail').value;
        var Subject=helper._e('txtSubject').value;
        var Message=component.get("v.myMessage");        
        //var regExpEmailformat = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/; 
        
        if(email==''){
            alert('Recipient is required');
        }
        else if(Subject==''){
            alert('Subject is required');
        }
        else if(Message==''){
         alert('Message is required');
        }
        else{
            helper.SendEmail(component);
            /*if(!email.match(regExpEmailformat)){
                alert("Invalid Email Id");
            }
            else{
                helper.SendEmail(component);
            }*/
        }
    },
    
    showSpinner: function(component, event, helper) {        
        component.set("v.Spinner", true); 
    },
    
    hideSpinner : function(component,event,helper){        
        component.set("v.Spinner", false);
    },
 })