/**
* @author Gopinath Perumal. CloudSynApps Inc.
* @date 03-September-2019
*
* @group UniversalLogEvent__e
* @group-content ../../ApexDocContent/UniversalLogEvent.htm
*
* @description This trigger is used to create a record in System_Logger__c object whenever
a UniversalLogEvent platform event is published.
*/
trigger UniversalLogEventTrigger on UniversalLogEvent__e (after insert) {
	List<System_Logger__c> logs = new List<System_Logger__c>();
    for(UniversalLogEvent__e l : trigger.new)
    {
        logs.add(new System_Logger__c(Stack_Trace__c = l.Stack_Trace__c, Type__c = l.Type__c, Message__c = l.Message__c));
    }
    Database.insert(logs); 
}