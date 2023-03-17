trigger AccountAddressTrigger on Account (before insert, before update) {
    
    For(Account a : trigger.new){
        if(a.Match_Billing_Address__c == True)
        {
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }

}