import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  received(data) {
    const notificationsElement = document.getElementById('notifications')
    notificationsElement.innerHTML += data.html
  }
});
