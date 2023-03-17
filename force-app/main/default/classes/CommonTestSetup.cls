@isTest
private class CommonTestSetup {
    
    @testSetup
    static void setup(){
        //Create common test accounts
        List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<200;i++)
        {
            testAccts.add(new Account(Name='TestAcct' +i, Industry = 'Education', Rating='Hot', Phone = '999-1111'+i));
        }
        
        insert testAccts;
    }
    
    @isTest
    static void testMethod1(){
        // Get the first test account by using a soql query
        Account acct = [select id,phone from account where name='TestAcct0' LIMIT 1];
        //Modify first account
        acct.Phone = '555-1212';
        update acct;
        
        //Delete second account
        Account acct2 = [SELECT Id FROM Account WHERE Name = 'TestAcct1' LIMIT 1];
        //This deletion is local to this test method only
        delete acct2;
        
    }
    
    @isTest 
    static void testMethod2() {
        /* The Changes made by testMethod1() are rolled back and are not visible to this test method.
         * Get the first Account by using a soql query
         */
         Account acct = [select id,Phone from account where name='TestAcct0' LIMIT 1];
        // verify that test account created by test method is not changed.
        system.assertEquals('999-1111', acct.Phone);
        
        
    }
}