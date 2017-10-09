// Adding Delay and fadeOut to Flash Messages
$(document).on('turbolinks:load', function(){
  $('.alert').delay(1000).fadeOut(4000);
});