({
  packItem:function(component, event, helper){
  var a=component.get(v.item);
      a.Packed__c=true;
      component.set("v.item", a);
      
      var butn1 = event.getsource();
      document.getElementById(butn1.id).disabled=true;
 }
})