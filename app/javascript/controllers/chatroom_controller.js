import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { chatroomId: Number, currentUserId: Number }
  static targets = ["messages"]

  connect() {
    this.subscription = createConsumer().subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
<<<<<<< HEAD:app/javascript/controllers/chatroom_controller.js
      { received: data =>
        this.#insertMessageAndScrollDown(data)
      }
=======
      { received: data => this.#insertMessageAndScrollDown(data) }
>>>>>>> c67b277e63e64d9c25568b671d48a8ab3c440372:app/javascript/controllers/chatroom_subscription_controller.js
    )
    console.log(`Subscribed to the chatroom with the id ${this.chatroomIdValue}.`)
  }

  resetForm(event) {
    event.target.reset()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.subscription.unsubscribe()
  }

  #insertMessageAndScrollDown(data) {
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
    const currentUserIsSender = this.currentUserIdValue === data.sender_id
  }
}
