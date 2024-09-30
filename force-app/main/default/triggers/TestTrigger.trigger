trigger TestTrigger on Account (before insert, before update) {
    for(Account acc : Trigger.new )
    {
        System.debug('Inside if cond'+acc.Rating);
        
        if( acc.Industry!=null && (acc.Industry=='Technology' || acc.Industry == 'Finance'))
        {
            acc.Rating = 'Hot';
            System.debug('Inside if cond'+acc.Rating);
        }
    }
}