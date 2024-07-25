import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="room-search"
export default class extends Controller {
  static targets = ["form", "input", "list"]

  connect () {
    console.log(this.element)
  }

  update (event) {
    event.preventDefault
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`
    fetch(url, {headers: {"Accept": "text/plain"}})
      .then(response => response.text())
      .then((data) => {
        this.listTarget.outerHTML = data
      })
  }
}
