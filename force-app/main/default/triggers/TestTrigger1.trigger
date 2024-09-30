trigger TestTrigger1 on Account (after update) {
    Set<Id> accIds = new Set<Id>();
    for(Account a : Trigger.new)
    {
        accIds.add(a.Id);       
    }
    Datetime earlDt=System.now()-30;
    List<Opportunity> ListToUpdate = new List<Opportunity>();
    List <Opportunity> oppList = new List<Opportunity>();
    oppList=[Select Id, AccountId, StageName, CreatedDate, CloseDate from Opportunity where AccountId in :accIds];
    if(oppList.size()>0)
    {
        for(Opportunity opp : oppList)
        {   System.debug('Inside Opp loop,opp.CreatedDate = '+opp.CreatedDate +'and opp.StageName = '+opp.StageName);
            if(opp.CreatedDate < earlDt && opp.StageName !='Closed Won')
            {
                opp.StageName = 'Closed Lost';
                opp.CloseDate = System.today();
                ListToUpdate.add(opp);
                System.debug('Inside if opp.CloseDate= '+ opp.CloseDate +'and opp.StageName = '+opp.StageName);
            }
        }
        if(ListToUpdate.size()>0)
        {
            update ListToUpdate;
        }
    }

}