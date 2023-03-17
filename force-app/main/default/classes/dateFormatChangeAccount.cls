public with sharing class dateFormatChangeAccount {
    public enum Month {Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec}
    public static void correctDateFormat(List<Account> newAccountList){
    Map<String,Integer> monthNameNumberMap = new Map<String,Integer>();
    for(Month mon : Month.values()){
        monthNameNumberMap.put(mon.name().toUpperCase(),mon.ordinal()+1);  
    }
    List<Account> lstAccount = new List<Account>();
    for(Account act : newAccountList){
        if(act.SLASerialNumber__c!=null && act.SLASerialNumber__c.contains('-')){
            List<string> dayAndMonth = act.SLASerialNumber__c.split('-');

            if(dayAndMonth.size()==2 && monthNameNumberMap.containsKey(dayAndMonth[1].toUpperCase())){
                act.SLASerialNumber__c = monthNameNumberMap.get(dayAndMonth[1].toUpperCase())+'/'+dayAndMonth[0];
                
            }
        }
    }
    
}
}