public with sharing class opportunityAccountUpdate {
    public opportunityAccountUpdate() {

    }

    public static void updateAccount(List<Opportunity> lstOpportunity) {
        
        Set<Id> acntSet = new Set<Id>();
        for(Opportunity oPP : lstOpportunity){
            if(oPP.AccountId!=Null){
                acntSet.add(oPP.AccountId);
            }
            }
            
       For(Account acnt : [Select id,Name,Opportunity_Average_Score__c from Account where id =:acntSet]) {  
            AggregateResult[] groupedResults= [SELECT AccountId, AVG(Score__c)
                                                FROM Opportunity where AccountId =:acnt.id
                                                GROUP BY AccountId];
                for(AggregateResult ar : groupedResults){
                    acnt.Opportunity_Average_Score__c=(Decimal)ar.get('expr0');
                    update acnt;
                }
     
     } 
    }
}