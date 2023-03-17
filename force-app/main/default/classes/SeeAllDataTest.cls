@isTest
public class SeeAllDataTest {
    
    @isTest(seeAllData = true)
    static void accountTest(){
        List<Account> accountList = [select id,Name,Phone,Fax,Rating from Account LIMIT 15];
        system.assertEquals(15, accountList.size(), 'Expected Accounts are not matching!');
    }
    
    @isTest
    static void contactTest(){
        Account acc = new Account(Name='TestAcct', Industry='Education', Rating='Hot', Phone = '999-1112');
        insert acc;
        
       /* Contact con = new Contact(FirstName = 'Vaibhav' , lastName = 'Rai', Email = 'vaibhav.rai@harman.com', Phone = '999-1234',
        							AccountId = acc.id );
		insert con;*/
        
        List<Contact> contactList = [Select id,Name,email, phone from contact limit 1];
        system.assertEquals(1,contactList.size(), 'There are no contacts available in database!!');
    }

}