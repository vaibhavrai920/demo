public class ContactListController {

    @AuraEnabled
    public static List<Contact> getContactList(String accountID){
        List<Contact> contactList = new List<Contact>([select id,firstname,lastname,name,email,
                                                       phone from contact where email != null and AccountId =:accountID]);
        return contactList;
    }
    
    @AuraEnabled
    public static Contact createContact(Contact con, Id AccountId){
        con.AccountId=AccountId;
        insert con;
        return con;
    }
}