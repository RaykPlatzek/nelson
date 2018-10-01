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
//= require moment
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

var dateRangePicker = function() {
  // W need to wrangle the dates, if there is a date present
  var fromDate = $('#date-range').data('from');
  var toDate = $('#date-range').data('to');
  var minDate = $('#date-range').data('min');
  var maxDate = $('#date-range').data('max');
  if (fromDate.length > 0 && toDate.length > 0) {
    var start = moment(new Date(fromDate));
    var end = moment(new Date(toDate));
  }

  if (typeof mindDate != 'undefined') { 
    var min = moment(new Date(minDate));
  }
  if (typeof maxDate != 'undefined') { 
    var max = moment(new Date(maxDate));
  }
  function cb(start, end) {
    $('#search_date_range').val(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
  }

  $('#search_date_range').daterangepicker({
    autoUpdateInput: false,
    locale: {
      format: 'DD/MM/YYYY'
    },
    startDate: start,
    endDate: end,
    minDate: min,
    maxDate: max,
    opens: 'left',
    ranges: {
      '10 Years': [moment().subtract(10, 'year'), moment()],
      '7 Years': [moment().subtract(7, 'year'), moment()],
      '5 Years': [moment().subtract(5, 'year'), moment()],
      '3 Years': [moment().subtract(3, 'year'), moment()],
      '1 Year': [moment().subtract(1, 'year'), moment()],
      'Calendar YTD': [moment().startOf('year'), moment()],
      //'Today': [moment(), moment()],
      //'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
      'Last 7 Days': [moment().subtract(6, 'days'), moment()],
      'Last 30 Days': [moment().subtract(29, 'days'), moment()],
      'This Month': [moment().startOf('month'), moment().endOf('month')],
      'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
      'Last Quarter': [moment().subtract(1, 'quarter').startOf('quarter'), moment().subtract(1, 'quarter').endOf('quarter')]
    }
  }, cb);

  // If there is a fromDate && toDate we need to call the callback function as we have set 'autoUpdateInput: false'
  if (fromDate.length > 0 && toDate.length > 0) {
    cb(start, end);
  }
};

