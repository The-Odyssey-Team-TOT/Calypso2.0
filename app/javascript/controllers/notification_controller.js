import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification"
export default class extends Controller {
  static targets = ["notif"]
  static values = {user: Number}
  connect() {
    const notifElement = this.notifTarget
    const userId = this.userValue

    this.subscription = createConsumer().subscriptions.create({channel: "NotificationsChannel", id: userId}, {
      received(data) {
        console.log(data)
        console.log(notifElement)
        notifElement.insertAdjacentHTML("afterbegin", data)
      }
    });
  }
}
