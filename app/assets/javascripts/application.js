// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function() {

  $(".slide-box").slideUp(0);
  
  $(".new-idea-button").onClick( function(e) { e.preventDefault();  $(".slide-box").slideDown();  });
  $(".close-slider").onClick( function(e) {  $(".slide-box").slideUp(0);  });
  $(".cancel-slider").onClick( function(e) {  $(".slide-box").slideUp(0);  });
  
  // Example Javascript below...
  //$(".disabled.cant-up")  .on('click', function(e) {alert('You have already voted up.'  ); e.preventDefault();});
  //$(".disabled.cant-down").on('click', function(e) {alert('You have already voted down.'); e.preventDefault();});
});