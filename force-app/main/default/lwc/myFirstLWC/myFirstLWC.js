import { LightningElement, api, track } from 'lwc';

export default class MyFirstLWC extends LightningElement {
    @api name = 'Vaibhav Rai';
    @track title = 'CRM Consultant';
    phone = '9740562677';
    email = 'abc@xyz.com';

    handleclick(){
        /* eslint-disable no-console */

        console.log('I am inside JS File');
        this.name='Anuj Singh';
        this.title='Salesforce Developer';
    }

     
}