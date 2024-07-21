// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application";
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading";
eagerLoadControllersFrom("controllers", application);
import { Controller } from "@hotwired/stimulus"
import SubmitOnEnterController from "./submit_on_enter_controller"
application.register("submit-on-enter", SubmitOnEnterController)

// Import GlobeController if necessary
// import GlobeController from "./globe_controller";
// application.register("globe", GlobeController);

document.addEventListener('turbo:load', () => {
  const messageForm = document.getElementById('new_message');
  const messageContent = document.getElementById('message_content');

  if (messageForm && messageContent) {
    messageContent.addEventListener('keydown', (event) => {
      if (event.key === 'Enter' && !event.shiftKey) {
        event.preventDefault();
        messageForm.requestSubmit();  // Use requestSubmit() to trigger the form submission
      }
    });
  }
});
