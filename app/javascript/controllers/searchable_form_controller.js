import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="searchable-form"
export default class extends Controller {
  static outlets = [ 'search' ]
  static targets = [ 'formValue' ]

  initialize() {
  }

  searchOutletConnected(_, element) {
    element.addEventListener('keyup', () => {
      this.processSearch();
    })
  }

  processSearch() {
    if (!this.element.action.includes('/search_form')) {
      this.element.action = this.element.action + '/search_form'
    }
    this.formValueTarget.value = this.searchOutletElement.value
    this.element.requestSubmit();
  }
}
