public class AccountProcessor {
    @future
    public static void countContacts(Set<Id> accId){
        List<Account> updateAccounts = [SELECT Id, Number_of_Contacts__c, (Select Id from Contacts) FROM Account WHERE Id =: accId];

        if(updateAccounts != null && !updateAccounts.isEmpty()){
            for(Account a : updateAccounts){
                a.Number_of_Contacts__c = a.Contacts.size();
            }
            update updateAccounts;
        }
    }
}
