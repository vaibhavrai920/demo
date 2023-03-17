public with sharing class clscontroller {
public List<Contact> contact{get;set;}

public clscontroller(){
contact = [Select id,name,accountId, email from Contact limit 10];
}
public void save(){
update contact;

}}