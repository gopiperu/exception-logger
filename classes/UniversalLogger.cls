/**
* @author Gopinath Perumal. CloudSynApps Inc.
* @date 03-September-2019
*
* @group UniversalLogEvent__e
* @group-content ../../ApexDocContent/UniversalLogEvent.htm
*
* @description This class contains method to publish an exception platform event.
*/
global class UniversalLogger
{
    global static void log(Exception e)
    {
        if(isLoggingEnabled())
        {
            UniversalLogEvent__e logevent = new UniversalLogEvent__e();
            logevent.Stack_Trace__c = e.getStackTraceString();
            logevent.Message__c = e.getMessage();
            logevent.Type__c = e.getTypeName();
            // Call method to publish events
            Database.SaveResult sr = EventBus.publish(logevent);
            // Inspect publishing result 
            if (sr.isSuccess()) {
                System.debug('Successfully published logger event.');
            } else {
                for(Database.Error err : sr.getErrors()) {
                    System.debug('System logger Error returned: ' +
                                 err.getStatusCode() +
                                 ' - ' +
                                 err.getMessage());
                }
            }
        }
    }
    

    
    //Check if logging is enabled for this user and with the appropriate debug level
    private static Boolean isLoggingEnabled()
    {
        UniversalLogger_Setting__c loggerSetting = UniversalLogger_Setting__c.getInstance();
        Boolean loggingEnabled = loggerSetting.Logging_Enabled__c;
        return loggingEnabled;
    }

}