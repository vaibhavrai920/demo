import { LightningElement, api, wire } from 'lwc';
import PROFILE_NAME_FIELD from '@salesforce/schema/User.Profile.Name';
import { getRecord } from 'lightning/uiRecordApi';
const FIELDS = [
    'Master_Label__mdt.MasterLabel',
    'Master_Label__mdt.DeveloperName',
    'Master_Label__mdt.Label__c',
];
export default class ListViewButton extends LightningElement {
    @api listViewIds;
    recordId='m007F000000MknV';

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    metadatarecord;
    get label() {
        return this.metadatarecord.data.fields.MasterLabel.value;
        
    }
    
    get developername() {
        return this.metadatarecord.data.fields.DeveloperName.value;
    }

    get active() {
        return this.metadatarecord.data.fields.Label__c.value;
    }

    close(){
        setTimeout(
            function(){
                window.history.back();
            },
            1000
        )
    }
}