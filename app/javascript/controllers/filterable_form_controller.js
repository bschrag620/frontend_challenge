import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="filterable-form"
export default class extends Controller {
  static outlets = [ 'control' ];
  connect() {

    console.log('filter-form controller connect')
    debugger;
  }

  controlOutletConnected() {
    console.log('---                 filter control outlet connected                     ---')
  }
}
