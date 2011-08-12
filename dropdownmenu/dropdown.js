
$(document).ready(function(){
  
  $(".dropdown").mouseover(function(){
    $(".sublink").hide(); 
    var item=$(this).parent().next();
    item.slideDown(500);
    item.mouseleave(function(){
      $(this).slideUp(500);
    });
    item.parent().mouseleave(function(){
      item.slideUp(500);
    });
  });
});
