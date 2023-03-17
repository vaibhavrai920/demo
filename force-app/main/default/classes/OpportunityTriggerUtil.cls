public class OpportunityTriggerUtil {
    
    public static void populateOpportunityTeam(List<Opportunity> oppList){
        //Variable Declaration
        Map<id,List<id>> accidtoOppIdsMap = new Map<id,List<id>>();
        Set<Id> teammemberids = new Set<id>();
        List<OpportunityTeamMember> otmToInsert = new List<OpportunityTeamMember>();
        Savepoint savep = Database.setSavepoint();//Savepoint
        try{
        For(Opportunity opp : oppList){
            if(opp.AccountId != Null){
                if(accidtoOppIdsMap.get(opp.AccountId)!=Null){
                    accidtoOppIdsMap.get(opp.AccountId).add(opp.id);
                }
                else{
                    accidtoOppIdsMap.put(opp.AccountId, new List<Id>{opp.id});
                }// Else End
            }// First If End
        } //For End
        
        Map<id,id> accidTouserIDmap = new Map<id,id>();
        if(accidtoOppIdsMap.size()>0){
            For(AccountTeamMember atm : [select AccountId, TeamMemberRole, UserId From AccountTeamMember
                                         where AccountId IN :accidtoOppIdsMap.keyset() AND TeamMemberRole = 'Sales Manager']){
                                             accidTouserIDmap.put(atm.AccountId,atm.UserId);                             
                                         }
            if(accidTouserIDmap.size()>0){
                Integer reccnt = 0;
                For(ID accid : accidTouserIDmap.keyset()){
                    for(ID oppID : accidtoOppIdsMap.get(accid) ){
                        OpportunityTeamMember otm = new OpportunityTeamMember(UserId = accidTouserIDmap.get(accid),
                                                                              
                                                                              TeamMemberRole = 'Sales Manager');//OpportunityId=oppID,
                        
                        otmToInsert.add(otm);
                    } //Second For End
                } // First For End
            } // If End
            if(otmToInsert.size()>0 && Limits.getDmlStatements() < Limits.getLimitDmlStatements()){
                insert otmToInsert;
            }
        }// If End
        } catch(Exception e){
            String exdetails = e.getCause()+' ; '+e.getLineNumber()+' ; '+e.getMessage()+' ; '+e.getStackTraceString()
                			   +' ; '+e.getTypeName() ;
            //ExceptionUtil.logException('Opportunity','Opp Team Addition',oppList[0].id,exdetails );
            ExceptionUtil.publishException('Opportunity','Opp Team Addition',oppList[0].id,exdetails );
            throw new ExceptionUtil.MyException('Exception happened during Opp Team Addition' +e.getMessage());
        }
    }//Method End
}