public with sharing class AccountUtils {
    public AccountUtils() {

    }

    public static List<Account> accountsByState(String st) {
        try {
            List<Account> listAcc = [SELECT Id, Name FROM Account WHERE BillingState =:st];
            return listAcc;
        } catch(Exception e) {
            System.debug(e.getMessage());
            return null;
        }
    }
}
