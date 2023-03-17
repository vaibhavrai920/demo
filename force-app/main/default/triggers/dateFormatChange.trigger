trigger dateFormatChange on Account (before insert,before update, after insert, after update) {
    
    if (trigger.isBefore && (trigger.isInsert || trigger.isupdate)) {
        dateFormatChangeAccount.correctDateFormat(trigger.new);
    }
    if(trigger.isAfter && (trigger.isInsert || trigger.isUpdate)){
        AddRelatedRecord.createOpportunity(trigger.new);
    }
        
}