console.log("The JS is linked.")
$(document).ready(function(){
  $("#p2").click(function(){
    $(this).hide();
  });
  $("#button1").click(function(){
    $("#p1").fadeToggle("slow", function(){
      alert("If you click on the button the first line will come back. But so will this alert.")
    });
  });
  $("#button2").click(function(){
    $("#p2").show("slow")
  });
});
