public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount() {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WITH SECURITY_ENFORCED
            LIMIT 1
        ];
    }
    
    //created on 24th July 2022.
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts(){
        //return [ SELECT Name, AnnualRevenue, Industry FROM Account WITH SECURITY_ENFORCED ORDER BY Name];
        throw new AuraHandledException('Forced error');
    }
}