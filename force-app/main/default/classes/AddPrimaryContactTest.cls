@isTest
public class AddPrimaryContactTest {
    
    @isTest
    private static void testQueueableClass(){
        
        //load test data.
        List<Account> accounts = new List<Account>();
        for(Integer i=0; i<500; i++){
            Account acc = new Account(Name='Test Account');
            if(i<250){
                acc.BillingState='NY';
            } else{
                acc.BillingState = 'CA';
            }
            accounts.add(acc);
        }
        insert accounts;
        
        Contact contact = new Contact(FirstName='simon', LastName='Connock');
        insert contact;
        
        //Perform the test
        test.startTest();
        Id jobId = system.enqueueJob(new AddPrimaryContact(contact,'CA'));
        test.stopTest();
        
        //Check the result
        List<Contact> contacts = [select id from contact where contact.Account.BillingState = 'CA'];
        system.assertEquals(200, contacts.size(), 'msg');
    }
}