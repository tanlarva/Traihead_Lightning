global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful {
    global Integer recordsProcessed = 0;
    global Database.QueryLocator start(Database.BatchableContext bc){
        // collect the batches of records or objects to be passed to executea
        String Query = 'Select Id, LeadSource from Lead';
        return Database.getQueryLocator(Query);
    }
    global void execute(Database.BatchableContext bc, List<Lead> records){
        // process each batch of records
        for(Lead x : records){
            x.LeadSource = 'DreamForce';
            recordsProcessed = recordsProcessed + 1;
        }
        update records;
    }
    global void finish(Database.BatchableContext bc){
        // execute any post-processing operations
        System.debug(recordsProcessed + ' records processed. Shazam!');
    }
}

