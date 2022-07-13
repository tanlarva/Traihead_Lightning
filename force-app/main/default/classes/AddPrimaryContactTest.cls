@isTest
public class AddPrimaryContactTest {
    @TestSetup
    static void setup(){
        List<Account> listOfAcc = new List<Account>();
        for(Integer i=1; i<=100; i++){
            if(i<=50){
                listOfAcc.add(new Account(name = 'AC'+i, BillingState ='NY'));
            }else{
                listOfAcc.add(new Account(name = 'AC'+1, BillingState ='CA'));
            }
        }
        insert listOfAcc;
    }

    static testmethod void testAddPrimaryContact() {
        // Test data setup
        Contact con = new Contact(LastName ='TestCon');
        AddPrimaryContact addPC = new AddPrimaryContact(con, 'CA');
        // Actual test
        Test.startTest();
        System.enqueueJob(addPC);
        Test.stopTest();
    
        // Asserts
        System.assertEquals(50, [SELECT count() FROM Contact]);
    }
}
