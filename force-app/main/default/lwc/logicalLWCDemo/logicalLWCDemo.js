import { LightningElement, track, wire } from 'lwc';
import mapDemo from '@salesforce/apex/UtilityClass.mapDemo';
import testName from '@salesforce/apex/UtilityClass.testName';

export default class LogicalLWCDemo extends LightningElement {
    @track greeting = "Welcome Vaibhav !";
    @track message = 'LWC Methods';
    @track records;
    @track error;
    @track contacts = [
        {
            Id : '003456',
            Name : 'Vaibhav Rai'
        },
        {
            Id : '003457',
            Name : 'Saurabh Rai'
        },
        {
            Id : '003458',
            Name : 'Swati Rai'
        }
    ];

    @wire(testName)
    wiredData({error, data}){
        if(data){
            this.records=data;
            /* eslint-disable no-console */
            console.log('Data '+data);
        }
        if(error){
            this.error=error;
            /* eslint-disable no-console */
            console.log('Error '+error);
        }
    }
    
   // console.log(this.records);
   handleclick(){
        mapDemo().then(result=>{
            console.log(result);
        })
        .catch(error =>{
            this.error= error
        })
   }
}