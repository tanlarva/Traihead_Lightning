import { LightningElement, wire, api } from 'lwc';

import queryAccountsByRevenue from '@salesforce/apex/AccountListControllerLwc.queryAccountsByRevenue';
export default class AccountInfo extends LightningElement {
    @api annualrevenue;
    @wire(queryAccountsByRevenue, { annualRevenue: '$annualRevenue' })
    accounts;
}