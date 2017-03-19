// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
// = require jquery.turbolinks
// = require jquery_ujs
// = require turbolinks
// = require tether
// = require bootstrap-sprockets
// = require_tree .

// function changeProgress (amount) {
//  $(".progress-bar")
//    .attr("aria-valuenow", amount)
//    .width(amount * 100  / 1000 + "%")
//    .text(amount * 100  / 1000 + "%");
// }

// $(document).ready(function() {
//
//    function changeProgress (amount) {
//    	$(".progress-bar")
//    		.attr("aria-valuenow", amount)
//    		.width(amount + "%")
//    		.text(amount + "%");
//   }
//
//   $(".Transfer-button").on("click", function (event) {
//     event.preventDefault();
//     changeProgress($("#exampleInputAmount").val());
//
//     $.ajax({
//         url: "/home",
//         type: "POST",
//         data: {payment: {
//                  amount: changeProgress($("#exampleInputAmount").val());
//                  project_id: val, }},
//         success: function(resp){
//           console.log("ok");
//           resp.data.name
//           $(".project-owner-name").text(resp.data.name)
//         }
//     });
//   });
// })

// $.ajax({
//     url: "/home",
//     type: "POST",
//     data: {payment: {
//              amount: $("#exampleInputAmount").val():
//              project_id: val, }},
//     success: function(resp){
//       resp.data.name
//       $(".project-owner-name").text(resp.data.name)
//     }
// });

$(document).ready(function() {

   function changeProgress (amount) {
   	$(".progress-bar")
   		.attr("aria-valuenow", amount)
   	// 	.width(amount + "%")
   	// 	.text(amount + "%");
  }

  $(".Transfer-button").on("click", function (event) {
    event.preventDefault();
    changeProgress($("#exampleInputAmount").val());

    var jj = { send_java: $("#exampleInputAmount").val(),}

    $.ajax({
        url: "/home",
        type: "POST",
        data: jj,
        success: function(resp){
          var rr = $("#exampleInputAmount").val()
          changeProgress(rr)
          // $('#pp').html(rr);
        }
    });
  });
})
