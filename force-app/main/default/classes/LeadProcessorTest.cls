@isTest
private class LeadProcessorTest {
    
    @isTest
    private static void testBatchClass(){
        
        // load test data
        List<Lead> lstLead = new List<Lead>();
        For(integer i=0;i<200;i++){
            lstLead.add(new Lead(LastName='Lead', Company = 'SFDC', Status='Open - Not Contacted'));
        }
        insert lstLead;
    
        test.startTest();
        LeadProcessor bc = new LeadProcessor();
        id batchId = Database.executeBatch(bc, 200);
        test.stopTest();
        
        //Check the result
        List<Lead> updateLeads = [select id from Lead where LeadSource = 'Dreamforce'];
        system.assertEquals(200, updateLeads.size(), 'msg');
    }

}