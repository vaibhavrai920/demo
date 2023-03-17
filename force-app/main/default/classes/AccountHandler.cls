public class AccountHandler {
    
    public static Account insertNewAccount(String name){
        
        Account act = new Account();
        act.Name = name;
        try{
            Insert act;
        }catch(Exception e){
            return null; 
        }
        return act;
    }
    
}