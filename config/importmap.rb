# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "bootstrap", to: "bootstrap.min.js", preload: true
pin "@popperjs/core", to: "popper.js", preload: true


pin "three", to: "https://cdn.jsdelivr.net/npm/three@0.149.0/build/three.module.js"
pin "three/addons/OrbitControls", to: "https://cdn.jsdelivr.net/npm/three@0.149.0/examples/jsm/controls/OrbitControls.js"
pin "@rails/actioncable", to: "@rails--actioncable.js" # @7.1.3
pin "application", preload: true
pin "three", to: "https://ga.jspm.io/npm:three@0.155.0/build/three.module.js"
pin "three/examples/jsm/loaders/GLTFLoader.js", to: "https://ga.jspm.io/npm:three@0.155.0/examples/jsm/loaders/GLTFLoader.js"
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
