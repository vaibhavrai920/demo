public class StringArrayTest {
	// method details
    public static list<string> generateStringArray(Integer n){
        list<string> tempLst = new list<string>();
        For(integer i=0;i<n;i++){
           tempLst.add('Test '+i);
        }
        system.debug('tempLst' +tempLst);
        return tempLst;
        
    }
}