public class BeerSearchAuraService {
    @AuraEnabled
    public static List<Beer__c> searchBeer(String searchParam){
        String likeParam = '%' +searchParam+ '%';
        String Query = '';
        if(searchParam !=null){
            Query = 'Select id,Name from Beer__c where Name Like :likeParam Limit 50';
        }else{
            Query = 'Select id,Name,Alcohol__c,Brewery_Id__c,Brewery_Name__c,Id__c,Price__c,Remaining_Quantity__c,Tags__c,Total_Quantity__c '+
                	'from Beer__c Limit 50';
                }
        List<Sobject> sObjectList = Database.query(Query);
        return sObjectList;
    }
    
}