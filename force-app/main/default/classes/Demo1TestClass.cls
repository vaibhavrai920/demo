@isTest
private class Demo1TestClass {
    
    /* Create an account with all the required field*/
    @isTest
    static void accountTest(){
        
        Account acc = new Account(Name='TestAcc',Industry='Education');
        insert acc;
       
        
    }
    
    /* Create an account with all the required field
     * Create a contact with all the required field and associate with the recently created account*/
    
    @isTest
    static void contactTest(){
        Account acc = new Account(Name='TestAcct', Industry='Education');
        insert acc;
        
        Contact con = new Contact(FirstName='Peter', LastName = 'Parker', email = 'peterparker@marvel.com', AccountId = acc.id);
        insert con;
    }
    
     /* Create an account with all the required field
     * Create an Opportunity with all the required field and associate with the recently created account*/
    
    @isTest
    static void opportunityTest(){
        Account acc = new Account(Name='Test Opportunity Account', Industry = 'Education');
        insert acc;
        
        Opportunity opp = new Opportunity(Name='Test Opportunity', AccountId = acc.id, Amount = 1000, StageName = 'Closed Won',
                                         CloseDate = System.today().addMonths(7));
        insert opp;
    }
    
    @isTest
    static void demo1Test(){
        Demo1.printOutput('stringToDisplay');
        
    }
    

}