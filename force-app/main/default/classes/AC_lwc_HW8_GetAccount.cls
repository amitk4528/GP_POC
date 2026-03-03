public with sharing class AC_lwc_HW8_GetAccount 
{
    @AuraEnabled (cacheable=true)
    Public Static List<Contact> getContactList()
    {
        List<Contact> CL = [Select Id,FirstName,LastName,Phone,Email from Contact];
        return CL;
    }
}