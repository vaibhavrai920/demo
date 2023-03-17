public class AddRelatedRecord {
    
    public static void createOpportunity(List<Account> newAccountList){
        List<Opportunity> oppList = new List<Opportunity>();
        
        // Get the related opportunities for the accounts in this trigger
        Map<id,Account> acctsWithOpps = new Map<Id,Account>([Select id,(select id from Opportunities) from Account where id IN : newAccountList]);
        
        // Add an opportunity for each account if it doesn't already have one.
        // Iterate through each account.
        For(Account a : newAccountList){
            System.debug('acctsWithOpps.get(a.Id).Opportunities.size()=' + acctsWithOpps.get(a.Id).Opportunities.size());
            // Check if the account already has a related opportunity.
            if (acctsWithOpps.get(a.Id).Opportunities.size() == 0) {
                // If it doesn't, add a default opportunity
                oppList.add(new Opportunity(Name=a.Name + ' Opportunity',
                                            StageName='Prospecting',
                                            CloseDate=System.today().addMonths(1),
                                            AccountId=a.Id));
            }           
        }
        if (oppList.size() > 0) {
            insert oppList;
        }
        
    }
    
}