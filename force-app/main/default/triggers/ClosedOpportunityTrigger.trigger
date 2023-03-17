trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    
    List<Task> tskToInsert = new List<Task>();
    
    For(Opportunity opp : trigger.new)
    {
        if(opp.StageName=='Closed Won')
        {
            Task tsk = new Task();
            tsk.Subject = 'Follow Up Test Task';
            tsk.WhatId = opp.id;
            tskToInsert.add(tsk);
        }
    }
     insert tskToInsert;  

}