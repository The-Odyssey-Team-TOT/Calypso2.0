import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="notification"
export default class extends Controller {
  connect() {
    consumer.subscriptions.create("NotificationsChannel", {
      received(data) {
        console.log(data)
        const notificationsElement = document.getElementById('notifications')
        notificationsElement.innerHTML += data.html
      }
    });
  }
}
