public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads(String searchword){
        String searchQuery = 'FIND \''+searchword +'\' IN ALL FIELDS RETURNING Lead(Name, FirstName, LastName), Contact(FirstName, LastName)';
        List<List< SObject>> searchConLead = search.query(searchQuery);
        return searchConLead;
    }

}