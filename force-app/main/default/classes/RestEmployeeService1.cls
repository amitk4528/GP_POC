@RestResource(urlMapping='/v1/Employees/*')

global with sharing class RestEmployeeService1 
{
    @HttpGet
    global static Employeewrapper fetchEmployee(){
        RestRequest req = RestContext.request;
        RestResponse res = Restcontext.response;
        List<Employee__c> listEmployee =[Select Name,Department__c, Salary__c from Employee__c ];
        
        Employeewrapper empWrap = new Employeewrapper();
        if(listEmployee!= null){
            empWrap.lstEmployee = listEmployee;
        }
        return empWrap;
    }
    
    global class Employeewrapper {
        public List<Employee__c> lstEmployee{get;set;}
        public EmployeeWrapper(){
            lstEmployee = new List<Employee__c>();
        }
    } 
    
    
    @HttpPost
    global static Employeewrapper doPost() {
        
        try{
            Employeewrapper response = (Employeewrapper)JSON.deserialize(RestContext.request.requestBody.tostring(), Employeewrapper.class);
            system.debug(response);
            List<Employee__c> ampList = response.lstEmployee;
            upsert ampList;
            List<Employee__c> listEmployee =[Select Name,Department__c, Salary__C from Employee__c ];
            response.lstEmployee =listEmployee;
            system.debug('test-'+ listEmployee);
            system.debug('response-'+ response);
            return response;
        }
        catch (Exception e) {
            system.debug('Exception Occured' + e.getMessage());
            return null;
        }
        
    }
    
    @HttpDelete
    global static void doDelete() { 
        system.debug('in amit2609');
        // Initializing the response map
        Map<String, String> responseMap = new Map<String, String>();
        // Initializing the request parameter with the incoming request
        RestRequest empRequest = RestContext.request;
        // Getting the request URI
        String empRequestURI = empRequest.requestURI;
        system.debug('Req URI: ' + empRequestURI);
        system.debug('Amit Req  ' + empRequest);
        // Getting the Employee id from the request URI
        Id EmpId = Id.valueOf(empRequestURI.substring(empRequestURI.lastIndexOf('/') + 1));
        system.debug('Employee ID: ' + EmpId);
        
        // Deleting Record
        try {
            Employee__c Employee = new Employee__c(Id=EmpId);
            System.debug('Amit emp id' + Employee.Id);
            delete Employee;
            responseMap.put('success', '1');
            responseMap.put('message', 'Record Deleted Successfully');
        } catch(DmlException ex) {
            responseMap.put('success', '0');
            responseMap.put('message', ex.getMessage());
        } 
        
    }  
}