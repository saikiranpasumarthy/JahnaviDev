import { LightningElement, track} from 'lwc';

export default class TrackExample extends LightningElement {
    firstnumber=0;
    secondnumber=0;
    @track result=0;
    handleChanges(event)
    {
        if(event.target.name === 'fnumber')
        {
            this.firstnumber = event.target.value;
        }
        if(event.target.name === 'snumber')
        {
            this.secondnumber = event.target.value;
        }
        this.result=parseInt(this.firstnumber)+parseInt(this.secondnumber);
    }
}