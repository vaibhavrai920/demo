public class ContactSearch {
    public static List<Contact> searchForContacts(String lastName, String mailPostCode){
        List<Contact> lstCon = [Select id,Name,LastName,MailingPostalCode 
                                from Contact where Lastname =:lastName AND MailingPostalCode =:mailPostCode];
        return lstCon;
    }
}