public with sharing class ListViewController {

    /**This is the list which will be passed to Visualforce Page and in turn passed to Flow from Visualforce**/
    public String LstSelectedTask {get;set;}
    public ListViewController(ApexPages.StandardSetController listcontroller) {
      
        List<Id> taskSelectedIds = new List < Id > ();
        //LstSelectedTask = new List<Task>();
            
        for (Task c: (List<Task>) listcontroller.getSelected()) {
            taskSelectedIds.add(c.id);
        }
        system.debug('selected task list' +LstSelectedTask);
        LstSelectedTask= JSON.serialize(taskSelectedIds);
        system.debug('LstSelectedTask' +LstSelectedTask);
        /**Querying on the Selected records and fetching fields which are required in Flow **/
        //LstSelectedTask = [SELECT Id, WhoId, WhatId, Subject FROM Task where id in: taskSelectedIds];
        
    }
}