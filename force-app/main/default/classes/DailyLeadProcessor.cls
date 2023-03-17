public without sharing class DailyLeadProcessor implements Schedulable {
    
    public void execute(SchedulableContext ctx ){
        //system.debug('context ' +ctx.getTriggerId()); // Returns the ID of the cronTrigger scheduler
        
        //Get 200 lead records and modify the leadsource field
        List<Lead> leads = [select id, LeadSource FROM Lead WHERE LeadSource = null LIMIT 200];
        for(Lead l : leads){
            l.LeadSource = 'DreamForce';
        }
    	
        // update the modified records
        update leads;
    }
}