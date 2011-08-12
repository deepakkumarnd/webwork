
$(document).ready(function(){
  $("#txt").focus();
  $("#txt").click(function(){
    $(this).attr('value','');
  }); 
  $(".key").click(function(){
    $("#txt").attr('value',$("#txt").val()+$(this).val());
  });
  $("#del").click(function(){
    var temp=$("#txt").val();
    temp=temp.slice(0,temp.length-1);
    $("#txt").attr('value',temp);
  });
  $("#ans").click(function(){
    var exp=$("#txt").val();
    var ans=0;
    try{
      ans=eval(exp);
      $("#txt").html(ans);
    }
    catch(e){
      $(".message").html("Invalid expression");  
    }    
  });
});

/* 
$(document).ready(function(){
  $("#txt").focus();
  $("#txt").click(function(){
    $(this).attr('value','');
  }); 
  $(".key").click(function(){
    $("#txt").attr('value',$("#txt").val()+$(this).val());
  });
  $("#del").click(function(){
    var temp=$("#txt").val();
    temp=temp.slice(0,temp.length-1);
    $("#txt").attr('value',temp);
  });
  $("#decpnt").click(function(){
    if(($("#txt").val().indexOf("."))<0){
      $("#txt").attr('value',$("#txt").val()+$(this).val());
    }
  });
  
  var v1=0;
  var v2=0;
  var ans=0;
  var k=-1;
  $(".op").click(function{
    if( k==-1){
      v1=($("#txt").val())*1;
      k=0;
      $("#txt").attr('value','');
    }else if(k==0){
      v2=($("#txt").val())*1;
      $("#txt").attr('value','');
      k=1;
      ans=result(v1,v2,$(this));
      v1=ans;      
    }else{
      v2=($("#txt").val())*1;
      $("#txt").attr('value','');
      k=1;
      ans=result(v1,v2,$(this));
      v1=ans;
    }   
  });
  
  function result(var1,var2,var3){
    return(0);
  }
  
  $("#ans").click(function(){
    var expr=$("#txt").val();
   /* var stack=new Array();
    var postfix=new Array();
    var tnum='';
    stack.push("(");
    var count br=1;
    for(i in expr){
      if(((expr.charCodeAt(i)>=48) && (expr.charCodeAt(i)>=48)) || ){
        br++;
      }
    } */
    
   /* if(expr.indexOf('+')>0){
      var list=expr.split('+');
      var sum=new Number((list[0].valueOf()*1)+(list[1].valueOf()*1));
      $("#txt").attr('value',sum.toString());
    } */
    
    /*
    var sum=new Number(ans);
     $("#txt").attr('value',sum.toString());
  });
});


*/
