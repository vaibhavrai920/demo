global class StatefulDemo implements Database.Batchable<Sobject>, Database.stateful{

	private Integer magicNum = 0;

	global Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('in the start method');
		return Database.getQueryLocator('Select Id, Name From Account limit 50');
	}
	
	global void execute(Database.BatchableContext bc, List<Account> scope){
		System.debug('In the execute method');
        for(Integer i = 0; i < 5; i++){
        	magicNum++; 
        }
	}

	global void finish(Database.BatchableContext bc){
		System.debug('In the finish method');
		System.debug('magicNum ' + magicNum);
	}
}