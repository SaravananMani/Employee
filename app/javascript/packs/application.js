// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
// import * as ActiveStorage from "@rails/activestorage"
// import "channels"
// import 'bootstrap';
// import '../stylesheets/application'

// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")
// require('datatables.net-bs4')

// // import the bootstrap javascript module
// import "bootstrap"

// // import the application.scss we created for the bootstrap CSS (if you are not using assets stylesheet)
// // import "../stylesheets/application"

// import dt from "datatables.net";

// document.addEventListener("turbolinks:load", () => {
//     dt(window, $);
// });


// Rails.start()
// Turbolinks.start()
// ActiveStorage.start()

// import 'bootstrap';
// import './bootstrap_custom.js'

// require("@rails/ujs").start()
// require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")
// import "jquery";
// import "popper.js";
// import "bootstrap";
// import '../stylesheets/application'
// // import 'datatables.net-dt/css/jquery.dataTables.css'
// // import 'datatables.net-select-dt/css/select.dataTables.css'
// import 'bootstrap/dist/js/bootstrap'

// require('datatables.net-bs4')

// import $ from 'jquery';

// global.$ = jQuery;

// window.Rails = Rails

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "jquery"
import "bootstrap"
import 'bootstrap/dist/css/bootstrap.min.css';
import "parsleyjs"
// import "../stylesheets/application"
import "datatables.net"
import "datatables.net-bs4"
import $ from 'jquery';
global.$ = jQuery;

// Add DataTables jQuery plugin
// require('imports-loader?define=>false!datatables.net')(window, $)
// require('imports-loader?define=>false!datatables.net-select')(window, $)

// Load datatables styles
import 'datatables.net-dt/css/jquery.dataTables.css'
import 'datatables.net-select-dt/css/select.dataTables.css'
import "chartkick/chart.js"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
