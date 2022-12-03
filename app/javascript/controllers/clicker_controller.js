import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clicker"
export default class extends Controller {
  static values = [ 'selector' ]
  connect() {
    this.element.addEventListener('click', () => {
      this.process();
    })
  }

  process() {
    const targetElement = document.querySelector(this.element.dataset.clickerSelectorValue);
    targetElement.click();
  }
}
