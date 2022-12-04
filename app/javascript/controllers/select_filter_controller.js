import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form-filter"
export default class extends Controller {
  connect() {
    console.log( 'select filter controller connected')
  }
}
