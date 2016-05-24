//data structures

var colorArr = ["Lizard Blue", "Arizona Tan", "Corn Silk", "Tame Watermelon"];
var horseArr = ["Abaccus", "Madison Avenue", "Rain Drops on Roses", "Where's Waldo"];

colorArr.push("Papaya Whip");
horseArr.push("Zander");


/*
Declare new object whose key will be a horse's name and value will be a color.
Iterate through two arrays of equal length contain horse names and colors.
*/
var horseObj = {}
for (var i=0; i < colorArr.length; i++){
  horseObj[colorArr[i]] = horseArr[i];
}

function Car(model, make, color, year){
  
  this.model=model;
  this.make=make;
  this.color=color;
  this.year=year;
  
  // determine if the car is an antique
  // an antique is any car that is older than 25 years
  this.isAntique = function(){
    var currentYear = new Date().getFullYear();
    if(currentYear-this.year >=25){
      return true;
    }
  }
  
}


// DRIVER CODE for Release 0 .. 1
// console.log(horseObj);
 
// DRIVER CODE for Release 2
var toyotaCorolla = new Car("Corolla","Toyota","Papaya Whip",1973);
console.log("Is antique:" + toyotaCorolla.isAntique());