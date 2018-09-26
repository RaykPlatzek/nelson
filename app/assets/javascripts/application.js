// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require jquery-ui
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require toastr
//= require Chart.min
//= require src/app
//= require turbolinks
//= require_tree .

$( document ).ready(function() {
   toastr.options = {
   'closeButton': true,
   'debug': false,
   'progressBar': true,
   'positionClass': 'toast-top-right',
   'onclick': null,
   'showDuration': '400',
   'hideDuration': '1000',
   'timeOut': '2000',
   'extendedTimeOut': '1000',
   'showEasing': 'swing',
   'hideEasing': 'linear',
   'showMethod': 'fadeIn',
   'hideMethod': 'fadeOut'
 }
})

