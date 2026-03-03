@RestResource(urlMapping = '/Employees/*')
global class EmployeeRestService 
{
    @HttpGet
    global static list<Employee__c> getEmployeeRecord()
    {
        RestRequest request = RestContext.request;
        //String EmployeeName = request.requestURI.substring(request.requestURI.lastindexof('/')+1);
        //System.debug('EmployeeName' + EmployeeName);
        List<Employee__C> records = [Select Name,Department__C, Salary__C from Employee__C ];
        If(records.size()>0)
        {
            return records;
        }
        return null;
    }
    
    @HttpPost
    global static String Saverecords()
    {
        RestRequest request = RestContext.request;
        Blob jsonEmployeeString = request.requestBody;
        System.debug('jsonEmployeeString' + jsonEmployeeString.toString());
        Employee__C Emp = (Employee__C)Json.deserialize(jsonEmployeeString.toString(),Employee__C.class);
        System.debug('Emp'+Emp);
        
        try
        {
            insert Emp;
        }
        
        Catch(Exception ex)
        {
            return ex.getMessage();
        }
        
        return Emp.id;
    }

}