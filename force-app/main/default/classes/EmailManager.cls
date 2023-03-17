public class EmailManager {
    // public method
    public void sendMail(String address, String Subject, String Body){
        //Create a email message object
       Messaging.SingleEmailMessage mail = new  Messaging.SingleEmailMessage();
       String[] toAddress = new String[]{address};
       mail.setToAddresses(toAddress);
       mail.setSubject(Subject);
       mail.setPlainTextBody(Body);
       // pass this email message to the built-in sendEmail method of the Messaging Class
       Messaging.SendEmailResult[] results = Messaging.sendEmail( new Messaging.SingleEmailMessage[]{mail});

       //Call the helper method to inspect the returned results
       inspectResults(results);
    }
    // Helper Method
    private static Boolean inspectResults(Messaging.SendEmailResult[] results){
        Boolean sendResult = true;

        //sendEmail returns an array of result objects.
        //Iterate through the list to inspect the results.
        //In this class, the methods send only one email,
        //so we should have only one result.
        For(Messaging.SendEmailResult res : results){
            if(res.isSuccess()){
                system.debug('Email sent successfully');
            }
            else{
                sendResult = false;
                system.debug('The following error occured: ' +res.getErrors());
            }
        }
        return sendResult;
    }

}