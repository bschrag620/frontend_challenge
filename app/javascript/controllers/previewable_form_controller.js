import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="previewable-form"
export default class extends Controller {
  connect() {
    this.element.addEventListener('change', () => {
      this.fetchPreview();
    })
  }

  fetchPreview() {
    if (!this.element.action.includes('/preview_form')) {
      this.element.action = this.element.action + '/preview_form'
    }
    this.element.requestSubmit();
    this.element.action = this.element.action.replace('/preview_form', '')
  }
}
