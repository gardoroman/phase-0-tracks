$(function() {

  $('#para-hide').hide(2000);

  $('#para-slide-up').slideUp(2000);
      
  $('#para-slide-down').slideDown(2000);

  $('#para-hover').hover(function(){
    $(this).fadeOut(1000);
    $(this).fadeIn(500);
  })
});