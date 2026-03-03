public with sharing class lwc_AC_HW11_searchCont 
{
    @AuraEnabled(cacheable=true)
    public Static List<Contact> findContacts(String searchKey)
    {
        String key = '%' + searchKey +'%';
        Return [select id,FirstName, LastName, Phone, Email from Contact where FirstName like: key];
    }
}