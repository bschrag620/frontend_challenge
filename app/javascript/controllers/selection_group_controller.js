import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="selection-group"
export default class extends Controller {
  static targets = ['all', 'selectable']

  allTargetConnected(ele) {
    ele.addEventListener( 'click', () => {
      const checked = ele.checked;
      this.selectableTargets.forEach(selectable => selectable.checked = checked );
    })
  }

  selectableTargetConnected(ele) {
    ele.addEventListener('click', () => {
      this.checkAll();
    })
  }

  checkAll() {
    const notChecked = this.selectableTargets.filter( (ele) => !ele.checked )
    this.allTarget.checked = notChecked.length === 0;
  }
}
