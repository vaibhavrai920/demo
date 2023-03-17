public with sharing class ContactAuraService {
    public ContactAuraService() {

    }
    @AuraEnabled(cacheable=true)
    public static List<sObject> getContactList(String name){
        try {
           String key = '%'+name+'%';
           String Query = 'Select Id,Name,Email,Phone From Contact Where Name LIKE :key';
           return Database.query(query); 
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<sObject> getAccountList(string name){
        try {
            String key = '%'+name+'%';
            String query = 'Select Id,Name,Industry,Phone From Account Where Name LIKE :key';
            return Database.query(query);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}