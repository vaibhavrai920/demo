@isTest
private class MyTestClass 
{
    static testmethod void myUnitTest() 
    {
        Lead leadObj = TestDataFactory.createLead(true);
        Account accObj = TestDataFactory.createAccount(true);
        Contact contObj = TestDataFactory.createContact(true,accObj.id);
        Opportunity oppObj = TestDataFactory.createOpportunity(true,accObj.id);
        Case caseObj = TestDataFactory.createCase(true);
    }
    // If you want to edit data according to apex class then try like below
    static testmethod void myUnitTest1() 
    {
        Lead leadObj = TestDataFactory.createLead(false); // pass false
        leadObj.LastName ='MyName';
        insert leadObj ;
        
        Account accObj = TestDataFactory.createAccount(false);
        accObj.Name ='MyName';
        insert accObj;
        
    }
    
}