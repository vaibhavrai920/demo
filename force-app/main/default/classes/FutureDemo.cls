public class FutureDemo {
    
    public void invokeFutureCall(){
        
        String primitiveValue = 'Input to future method';
        //List<String> listofPrimitiveValue = new List<String>{primitiveValue};
        //
        //Account accountRec = [select id,name from account limit 1][0];
        //system.debug('accountList: ' +accountRec);
        
        futureMethod1(primitiveValue);
        
        futureMethod2();
        futureMethod3();
    }
    
    @future
    public static void futureMethod1(String acc){
        system.debug('inside futureMethod1');
        system.debug('inputParam: ' +acc);
        futureMethod2();
    }
    
    @future(callout = true)
    public static void futureMethod2(){
        system.debug('inside futureMethod2');
        //system.debug('inputParam: ' +inputParam);
    }
    
    @future
    public static void futureMethod3(){
        system.debug('inside futureMethod3');
        //system.debug('inputParam: ' +inputParam);
    }
    

}