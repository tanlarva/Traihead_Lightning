global class DailyLeadProcessor implements Schedulable{
    global void execute(SchedulableContext ctx){
        List<Lead> leads = [SELECT Id, LeadSource FROM Lead WHERE LeadSource = ''];

        if(leads.size() > 0){
            List<Lead> newLeads = new List<Lead>();
            for(Lead a : leads){
                a.LeadSource = 'DreamForce';
                newLeads.add(a);
            }

            update newLeads;
        }
    }
}