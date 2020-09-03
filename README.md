# exception-logger
Exception logging framework for Salesforce

Example:
--------
try
{
	// code
}
Catch(Exception ex)
{
	//Exception logger
	UniversalLogger.log(ex);
}