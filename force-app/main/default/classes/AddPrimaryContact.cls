public class AddPrimaryContact implements Queueable {
    private Contact con;
    private String state;

    public AddPrimaryContact(Contact con, String state){
        this.con = con;
        this.state = state;
    }
    public void execute(QueueableContext context){
        List<Account> listOfAcc = [SELECT Id FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> listOfCon = new List<Contact>();
        for(Account x : listOfAcc){
            Contact conn = con.clone(false,false,false,false);
            conn.AccountId = x.Id;

            listOfCon.add(conn);
        }
        insert listOfCon;
    }
}
