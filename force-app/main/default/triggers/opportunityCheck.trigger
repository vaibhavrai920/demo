trigger opportunityCheck on Opportunity (before insert, before update, after insert,after update) {

    /*if(trigger.isInsert||trigger.isUpdate){
        opportunityAccountUpdate.updateAccount(trigger.new);
    }*/
    if(trigger.isInsert && trigger.isAfter){
        OpportunityTriggerUtil.populateOpportunityTeam(Trigger.new);
    }
}