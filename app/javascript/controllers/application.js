import { Application } from "@hotwired/stimulus";
import "./controllers";
import "./channels/notifications_channel";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }
