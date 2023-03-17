@isTest
private class AccountProcessorTest {
    
    @isTest
    private static void countContactsTest(){
        
        //Load Test Data
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<300; i++){
            accounts.add(new Account(Name='Test Account' +i));
        }
        insert accounts;
        
        List<Contact> contacts = new List<Contact>();
        List<id> accountIds = new List<id>();
        For(Account acc : accounts){
            contacts.add(new Contact(FirstName=acc.Name, LastName='TestContact', AccountId=acc.Id));
            accountIds.add(acc.id);
        }
        insert contacts;
        
        // Do the test
        Test.startTest();
        AccountProcessor.countContacts(accountIds);
        Test.stopTest();
        
        // Check result
        List<Account> accs = [select id,Number_Of_Contacts__c from Account];
        for(Account acc : accs){
            system.assertEquals(1,acc.Number_Of_Contacts__c,'Error: At least 1 account record with incorrect');
        }
    }
    
}