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
for (i=0; i < colorArr.length; i++){
  horseObj[colorArr[i]] = horseArr[i];
}


// DRIVER CODE


console.log(horseObj);