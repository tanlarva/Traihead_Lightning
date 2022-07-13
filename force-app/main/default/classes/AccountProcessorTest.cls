@isTest
public class AccountProcessorTest{
    public static testmethod void TestAccountProcessorTest(){
        Account a = new Account();
        a.Name = 'Test Account';
        insert a;

        Contact c = new Contact();
        c.FirstName ='Smith';
        c.LastName = 'John';
        c.Email = 'info@theblogreders.com';
        c.AccountId = a.Id;
        insert c;

        Set<Id> accIds = new Set<Id>();
        accIds.add(a.Id);

        Test.startTest();
            AccountProcessor.countContacts(accIds);
        Test.stopTest();

        Account acc = [SELECT Number_of_Contacts__c from Account WHERE Id =:a.Id Limit 1];
        System.assertEquals(Integer.valueOf(acc.Number_of_Contacts__c), 1);
    }
}