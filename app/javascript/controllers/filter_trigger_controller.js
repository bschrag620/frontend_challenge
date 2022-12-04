import { Controller } from "@hotwired/stimulus"
import debounce from 'lodash/debounce'

// Connects to data-controller="form--filterable--trigger"
export default class extends Controller {
  static values = {
    'handler': String,
    'filterName': String
  }
  initialize() {
    this.registeredForm;
    this.registered = false;
    this.handleDebouncedInput = debounce(this.handleDebouncedInput, 500);
  }

  connect() {
  }

  register(form) {
    this.registeredForm = form;
    if (this.registered) return;
    this.registered = true;
    this.setupHandlers();
  }

  handleDebouncedInput() {
    this.handleTrigger();
  }

  handleTrigger() {
    this.registeredForm.trigger();
  }

  beforeFilter() {
    let inputEle = document.createElement('input');
    inputEle.type = 'hidden';
    inputEle.name = this.filterNameValue;
    switch (this.handlerValue) {
      case 'text':
        inputEle.value = this.element.value;
        this.insertElement(inputEle);
        break;
      case 'single-select':
        inputEle.value = this.element.value;
        this.insertElement(inputEle);
        break;
      default:
        console.log(`unrecognized type value: '${this.handlerValue}'`);
    }

  }

  insertElement(element) {
    const existingElement = this.registeredForm.element.querySelector(`input[name='${this.filterNameValue}']`);
    if (!!existingElement) {
      existingElement.remove();
    }
    this.registeredForm.element.appendChild(element);

  }

  setupHandlers() {
    switch (this.handlerValue) {
      case 'text':
        this.element.addEventListener('keyup', () => {
          this.handleDebouncedInput();
        })
        break;
      case 'single-select':
        this.element.addEventListener('change', () => {
          this.handleTrigger();
        })
        break;
      default:
        console.log(`unrecognized type value: '${this.handlerValue}'`);
    }
  }
}
