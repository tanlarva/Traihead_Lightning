public class AccountTriggerHandler {
    public static void CreateAccounts (List<Account> listAcc) {
        for (Account a : listAcc) {
            if (a.BillingState != a.ShippingState) {
                a.ShippingState = a.BillingState;
            }
        }
    }
}