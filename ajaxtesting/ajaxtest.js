
$(document).ready(function(){
  
  $("button").click(function(){
    var exp=$("#txt").val();
    var ans=0;
    try{
      ans=eval(exp);
      $("p").html(ans);
    }
    catch(e){
      $("p").html("Invalid expression");  
    }    
});
});


/*
function evaluate(){
  var exp=document.getElementById("txt");
  
}
*/
