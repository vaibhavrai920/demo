public class QueueableDemo implements Queueable {
    
    public void execute(system.QueueableContext context){
        system.debug('Inside the execute method of queueable job');
        
        List<Account> listOfAccounts = new List<Account>([Select Id,Name From Account Limit 50]);
        System.debug('listOfAccounts: ' +listOfAccounts);
        
        //QueueableDemo qd = new QueueableDemo();
        //Id jobId = System.enqueueJob(qd);
        //system.debug('job id: ' +jobId);
    }

}