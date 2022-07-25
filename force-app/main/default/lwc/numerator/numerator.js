import { LightningElement, api } from 'lwc';

export default class Numerator extends LightningElement {
    //@api counter = 0;
    @api
    maximizeCounter() {
      this.counter += 1000000;
    }
    _currentCount = 0;
    priorCount = 0;
    @api
    get counter() {
      return this._currentCount;
    }
    set counter(value) {
      this.priorCount = this._currentCount;
      this._currentCount = value;
    }
    handleIncrement() {
        this.counter++;
    }
    handleDecrement() {
        this.counter--;
    }
    handleMultiply(event) {
        const factor = event.detail;
        console.log('factor:', parseInt(factor));
        console.log('this.count:', parseInt(this.counter));
        this.counter = this.counter*parseInt(factor);
    }
}