public class AddPrimaryContact implements Queueable {
    
    private Contact con;
    private string state;
    
    public AddPrimaryContact(Contact inputContact, String inputState){
        this.con = inputContact;
        this.state = inputState;
    }
    public void execute(QueueableContext context){
        
        //Retrieve 200 Account records
        List<Account> accounts = [select id,Name,BillingState From Account where BillingState =:state limit 200];
        
        //Create empty list of contact records
    	List<Contact> contacts = new List<Contact>();
        
        //iterate through the account records
        for(Account acc: accounts){
            
            //clone the contact record, make the clone a child of the specific account record and add to the list of contacts
            Contact contactClone = con.clone();
            contactClone.AccountId = acc.id;
            contacts.add(contactClone);
        }
        insert contacts;
    }
}