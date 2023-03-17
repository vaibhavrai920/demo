public with sharing class CaseHierarchyController {
    public CaseHierarchyController() {

    }
    @AuraEnabled
    public static list<case>  getCases(String strRecordId){
        try {
            System.debug('strRecordId ' +strRecordId);
            List<Case> caseList = [Select Id,CaseNumber,Subject,Origin,AccountId from Case where AccountId =:strRecordId ];
            System.debug('caseList == ' +caseList);
            return caseList;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
     
}