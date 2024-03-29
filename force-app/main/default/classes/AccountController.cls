public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getRelatedContacts(Id accountId) {
        return [
            SELECT Name, Title, Email, Phone
            FROM Contact
            WHERE AccountId = :accountId
            WITH SECURITY_ENFORCED
       ];
    }
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        try{
            return [
            SELECT Name, AnnualRevenue, Industry
            FROM Account
            WITH SECURITY_ENFORCED
            ORDER BY Name ];
        } catch(Exception e){
            throw new AuraHandledException('Forced error');
        }
        
        
    }
}