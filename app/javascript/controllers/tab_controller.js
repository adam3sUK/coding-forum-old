import { Controller } from "@hotwired/stimulus"
import { Tab } from "bootstrap"

// Connects to data-controller="tab"
export default class extends Controller {
  connect() {
  }

  show() {
    var triggerTabList = [].slice.call(document.querySelectorAll('#pills-tab button'))
      triggerTabList.forEach(function (triggerEl) {
      var tabTrigger = new Tab(triggerEl)
    
      triggerEl.addEventListener('click', function (event) {
        event.preventDefault()
        tabTrigger.show()
      })
    })    
  }
}
