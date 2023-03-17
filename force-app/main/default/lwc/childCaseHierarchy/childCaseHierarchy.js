import { LightningElement, api } from 'lwc';
import getCases from '@salesforce/apex/CaseHierarchyController.getCases';
import { NavigationMixin } from 'lightning/navigation';
import CASE_ID_FIELD from '@salesforce/schema/Case.Id';
import CASE_NAME_FIELD from '@salesforce/schema/Case.CaseNumber';

const gridColumns = [
    {
        type: 'navigateToRecord',
        fieldName: 'Id',
        label: 'Case Number',
        typeAttributes: {
            label: { fieldName: 'CaseNumber' }
        }
    },
    {
        type: 'text',
        fieldName: 'Subject',
        label: 'Subject',
    },
    {
        type: 'text',
        fieldName: 'Origin',
        label: 'Origin',
    }
];
export default class ChildCaseHierarchy extends NavigationMixin(LightningElement) {
    @api recordId;
    cases = [];
    columns = gridColumns;

    connectedCallback() {
        this.loadCases();
      }
    
      loadCases(){
        getCases({
            strRecordId : this.recordId
        })
        .then(result =>{
            this.cases = result;
        })
        .catch(error => {
            console.log(error);
        });
      }
    
}