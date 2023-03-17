public class SendEmailHandler {
    
    //Method to send emails
    @AuraEnabled
    public static string processEmail(String email, String Subject, String Message){
        String sMessage='';
        system.debug('this is email string' +email);
        list<string> emailString = email.split(',');
        system.debug('emailString' +emailString);
        try{
            List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
            For(String eml : emailString){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
               		List<String> toAddresses = new List<String>();
                toAddresses.add(eml);
                //List<String> toAddresses = new List<String>{'\''+ eml + '\''};
                    mail.setToAddresses(toAddresses);
            		mail.setSubject(Subject);
            		mail.setHtmlBody(Message);
                mails.add(mail);
            }
            system.debug('mails are' +mails);
            //Messaging.SendEmailResult [] results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {mail});
            Messaging.SendEmailResult [] results = Messaging.sendEmail(mails);
            system.debug('results' +results);
            sMessage='Success';
        }
        catch(Exception ex){
            sMessage=ex.getLineNumber()+'\n'+ex.getCause()+'\n'+ex.getMessage()+'\n'+ex.getStackTraceString();
        }system.debug('sMessage');
        return sMessage;
    }
    //Method to get emails from selected task records 
     @AuraEnabled
    public static List<String> fetchEmails(List<String> customListStr){
        system.debug('customListStr' +customListStr);
        List<String> emailString = new List<String>();
     List<Task> selectTask = [select id,Custom_Email__c from Task where Id in :customListStr ];
        
        For(Task tsk : selectTask){
            emailString.add(tsk.Custom_Email__c);
        }
        system.debug('emailString' +emailString);
        return emailString;
    }
 }