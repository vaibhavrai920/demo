import { LightningElement, wire, track } from 'lwc';
import getContactList from '@salesforce/apex/ContactAuraService.getContactList';
import getAccountList from '@salesforce/apex/ContactAuraService.getAccountList';
export default class ContactListDemo extends LightningElement {
@track searchKey;
@track searchKeyAccount;
@track contacts;
@track error;

@track accounts;
@track errorAccounts;

    @wire(getContactList, {
        name : '$searchKey'
    })
    wiredContact({error, data}){
        if(data){
            this.contacts = data;
        }
        if(error){
            this.error = error;
            /* eslint-disable no-console */
           // console.log('Error ' +error);
        }
    }

    handleChange(event){
        event.preventDefault();
        /* eslint-disable no-console */
        //console.log('Value '+event.target.value)
        this.searchKey = event.target.value;
    }

    handleChangeAccount(event){
        event.preventDefault();
        /* eslint-disable no-console */
        //console.log('Value '+event.target.value)
        this.searchKeyAccount = event.target.value;
    }

    findAccounts(){
        getAccountList({
            name : this.searchKeyAccount
        })
        .then(result=>{
            this.accounts = result;
        })
        .catch(error=>{
            this.errorAccounts=error;
        });
    }

    handleSelectRec(event){
        const recordId = event.detail;
        /* eslint-disable no-console */
        console.log('recordId', recordId);
    }

}