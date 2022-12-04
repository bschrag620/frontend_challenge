import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filterable"
export default class extends Controller {
  static outlets = ['filter-trigger']

  connect() {
    console.log(`n oulets: ${this.filterTriggerOutlets.length}`)
  }

  filterTriggerOutletConnected(outlet, ele) {
    outlet.register(this);
  }

  trigger() {
    this.filterTriggerOutlets.forEach( outlet => outlet.beforeFilter() )
    if (!this.element.action.includes('/filter_form')) {
      this.element.action = this.element.action + '/filter_form'
    }
    this.element.requestSubmit();
  }
}