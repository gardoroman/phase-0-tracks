var paras = document.getElementsByTagName("p");
var firstPara = paras[0];
firstPara.style.backgroundColor = "gray";
firstPara.style.color = "white";
firstPara.style.margin = "25px";
firstPara.style.padding = "25px";
firstPara.style.height = "300px";
firstPara.style.width = "300px";


function changeColor(event) {
  var redVal = document.getElementById("redVal").value;
  var blueVal = document.getElementById("blueVal").value;
  var greenVal = document.getElementById("greenVal").value;
  firstPara.style.backgroundColor = "rgb(" + redVal + ", " + blueVal + ", " + greenVal + ")";
}

var colorButton = document.getElementById("changeColor");
colorButton.addEventListener("click", changeColor);
