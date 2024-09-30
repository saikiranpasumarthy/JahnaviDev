({
    subscribe : function(component, event, helper) {
        component.set('v.notifications',[]);
        const empApi=component.find('empApi');
        const channel='/event/Account_Creation_Event__e';
        const replayId = -1;
        empApi.subscribe(channel, replayId, $A.getCallback(eventReceived =>{
            console.log('Received Event ',JSON.stringify(eventReceived));
            console.log('Received event ', eventReceived.data.payload.Account_Name__c);
            const notifications = component.get('v.notifications');
            notifications.push(eventReceived.data.payload.Account_Name__c);
            component.set('v.notifications',notifications);
            component.set('v.evntReceived',true);
            alert(component.get('v.evntReceived'));
        } )).then(subscription => {
            console.log('subscribed to channel',subscription.channel);
        });
        }
        })