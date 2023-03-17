public class UpdateParentAccount{
 public static void updateoldaccount(){
 Account[] updateaccount = [Select id,name,description from Account ORDER BY CreatedDate ASC];
 for(Account accnt:updateaccount){
     accnt.description = 'Heritage';
     }
     update updateaccount ;
     
}
}