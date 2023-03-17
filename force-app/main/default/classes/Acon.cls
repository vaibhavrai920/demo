public with sharing class Acon {

public String selectaccount{get;set;}
//public List<Contact> contact{get;set;}

public list<selectoption> getaccountname(){
    List<selectoption> accnt = new List<selectoption>();
    accnt.add(new selectoption('','-None-'));
    for(Account acc : [Select id,name,phone from Account order by Name]){
    accnt.add(new selectoption(acc.id,acc.name));

    }
        return accnt;
 }
public list<Contact> getContact(){
list<Contact> con = new list<Contact>();
for(Contact cn : [Select id,Name,firstname,lastname, phone,email from Contact where AccountId =: selectaccount]){

con.add(cn);
}
 return con;
}
}