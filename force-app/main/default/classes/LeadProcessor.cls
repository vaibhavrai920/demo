public class LeadProcessor implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([select id,Name,Company,Status,LeadSource from Lead]);
    }
    public void execute(Database.BatchableContext bc, List<Lead> scope){
       For(Lead ld : scope){
            ld.LeadSource = 'DreamForce';
        }
        update scope;
    }
    public void finish(Database.BatchableContext bc){
        
    }

}