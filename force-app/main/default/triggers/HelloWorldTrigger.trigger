trigger HelloWorldTrigger on Book__c (before insert) {
    
    Book__c[] books = trigger.new;
    MyHelloWorld.applyDiscount(books);

}