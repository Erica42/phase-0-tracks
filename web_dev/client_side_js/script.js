console.log("The script is running, or so we hope!");
var text = document.getElementsByTagName('P')[0];
text.style.border = "solid black";

// function myOtherFunction(){
//   text.style.border = "solid red";
// }

function myOtherFunction(){
  //text.hidden = true;
  //var  = document.getElementById("header");
  const img = "<img src = 'celebration.gif'>"
  text.innerHTML = img;

}

function myFunction() {
    var list = document.getElementsByTagName("UL")[0];
    list.getElementsByTagName("LI")[0].innerHTML = "Milk";
}

var list = document.getElementsByTagName("UL")[0];
list.addEventListener('click', myFunction);

text.addEventListener('click', myOtherFunction);



