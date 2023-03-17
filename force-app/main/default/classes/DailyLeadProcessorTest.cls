@isTest
public class DailyLeadProcessorTest {
    
    private static String CRON_EXP = '0 0 0 ? * * *'; // Midnight every day
	
    @isTest
    private static void testSchedulableClass(){
        
        //Load test data
        List<Lead> leads = new List<Lead>();
        for(Integer i=0; i<500; i++){
            if(i<250){
                leads.add(new Lead(LastName='Connock', Company = 'Salesforce'));
            }else {
                leads.add(new Lead(LastName='Connock', Company = 'Salesforce', LeadSource= 'Other'));
            }
        }
        insert leads;
        
        //Perform the test
        Test.startTest();
        String jobId = system.schedule('jobName', CRON_EXP, new DailyLeadProcessor());
        Test.stopTest();
        
        //Check the result
        List<Lead> updatedLeads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource='DreamForce'];
        system.assertEquals(200, updatedLeads.size(), 'msg');
        
        //Check the scheduled time
        List<CronTrigger> cts = [SELECT id, TimesTriggered, NextFireTime FROM CronTrigger WHERE id = :jobId];
        system.debug('Next Fire Time' +cts[0].NextFireTime);
    }
}