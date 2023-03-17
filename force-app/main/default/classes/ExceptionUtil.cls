public class ExceptionUtil {
    
    public class MyException extends Exception{}
        @InvocableMethod(label='Invoke ExceptionUtil')
        public static void throwcustomException(List<String> excmessage){
            
            throw new MyException('An Internal exception happened during current operation.'+
                                 'PLease contact system administrator with this exception details:'+excmessage[0]);
        }
    
    
    public static void logException(String objName, String processName, String recordId, String exceptionDetails){
        
        Exception__c exc = new Exception__c();
        exc.Object__c = objName;
        exc.Operation__c = processName;
        exc.Record_ID__c = recordId;
        exc.Exception_Details__c = exceptionDetails;
        insert exc;
    }
    
    //Publish Event
    public static void publishException(String objName, String processName, String recordID, String exceptiondetails){
        Exception_Log__e pe = new Exception_Log__e();
        pe.Object__c = objName;
        pe.Operation__c = processName;
        pe.Record_ID__c = recordID;
        pe.Exception_Details__c = exceptiondetails;
        eventBus.publish(pe);
    }
    

}