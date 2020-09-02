/**
* @author Gopinath Perumal. CloudSynApps Inc.
* @date 03-September-2019
*
* @group UniversalLogEvent__e
* @group-content ../../ApexDocContent/UniversalLogEvent.htm
*
* @description This class is used to test UniversalLogger class
*/
@isTest
public class UniversalLoggerTest {
    static testmethod void testLog()
    {
        //Custom Setting
        UniversalLogger_Setting__c cs = new UniversalLogger_Setting__c(Log_Object_Purge_Days__c = 90,Logging_Enabled__c = true);
        insert cs;
        Test.startTest();
            try
            {
                Integer i = 12/0;
            }
            catch(Exception e)
            {
                UniversalLogger.log(e);
            }
        Test.stopTest();
    }
}