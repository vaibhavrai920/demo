public with sharing class UtilityClass {
    public UtilityClass() {

    }

    @AuraEnabled
    public static map<string,Integer>  mapDemo(){
        try {
            Map<String, Integer> testMap   = new Map<String, Integer>();
            testMap.put('Vaibhav Rai',1);
            testMap.put('Saurabh Rai',2);
            testMap.put('Swati Rai',3);
            return testMap;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled    
    public static string testName(){
        try {
            return 'Test String';
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}