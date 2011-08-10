
$(document).ready(function(){

var e1=false;
var e2=false;
    $("#clicktologin").click(function(){
        $("#clicktologin").hide();
        $(".login").css("visibility","visible");
    });
    
    
   $("#uname").change(function(){
         $("#erruname").html(" ");
         e1=false;
        var pat=/^\w+$/;
        if(!(pat.test($(this).val()))){
            $("#erruname").html("Username can contain a-z,A-Z,0-9 or _");
            e1=true;
        }      
    }); 
    
   $("#pass").change(function(){
        $("#erruname").html(" ");
        e2=false;
        var pat=/^\w{8,12}$/
        if(!(pat.test($(this).val()))){
            $("#erruname").html("Password should be between 8-12 char long");
            e2=true;
        }
       
   }); 
   
   $("#signin").click(function(){
        if((($("#uname").val().length)==0) || (($("#pass").val().length)==0)){
            alert("Username and password cannot be empty.");
            $("#loginform").reset();
            $("#erruname").html(" ");
        } 
        else if(e1){
            $("#erruname").html("Username can contain a-z,A-Z,0-9 or _");
            $("#uname").attr('value', '');
        }
        else if(e2){
            $("#erruname").html("Password should be between 8-12 char long");
            $("#pass").attr('value', '');
        }
        else{
            $("#loginform").submit();
        }
   });
});
