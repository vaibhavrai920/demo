trigger email on Contact (before delete) {
    //Map to store account id and respective contact
    map<id,list<contact>> actConMap = new Map<id,list<contact>>();
    if(trigger.isbefore && trigger.isdelete){
        For(Contact c : trigger.old){
            if(actConMap.containsKey(c.AccountId)){
                actConMap.get(c.AccountId).add(c);
            }
            else{
                Id actId =c.AccountId;
                actConMap.put(actId, new List<Contact>{c});
            }
        }
        For( Account a : [Select Id,Name,(select id from contacts)  from Account where id =: actConMap.keySet()]){
            if(a.contacts.size()==actConMap.get(a.id).size()){
                For(Contact con : actConMap.get(a.id)){
                    con.addError('Atleast one contact should be present for the Account');
                }
            }
        }
    }
}

    /*if(trigger.isAfter && trigger.isinsert||trigger.isupdate){
        //get account ids
        For(Contact c : Trigger.new){
            act.add(c.accountid);
        }
        For( Account a : [Select Id,Name,Total_Salary__c,Contact_Emails__c,(select id,Salary__c,Email from contacts)  from Account where id =: act]){
            a.Total_Salary__c=0;
            //a.Contact_Emails__c = '';
            For(Contact c : a.contacts){
                if(c.Email!=Null){
                    a.Contact_Emails__c = a.Contact_Emails__c + ',' +c.Email; 
                }
            }
            actList.add(a);
        }
        system.debug('tisi actList' +actList);
        
    }upsert actList; */

/*        
    }upsert actList;*/