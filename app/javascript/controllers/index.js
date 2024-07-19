// Import and register all your controllers from the importmap under controllers/*

import { application } from "./application"


// Eager load all controllers defined in the import map under controllers/**/*_controller
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// import GlobeController from "./globe_controller";
// application.register("globe", GlobeController);
