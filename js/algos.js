//################ F U N C T I O N   D E C L A R A T I O N S #################

//Release 0 Function

/* 
Create a function that takes an array of words and
finds the longest word.
The array will be passed into a for loop where every
item will be checked for length.
The item will be compared to the length of a place-holder
variable that initially will be set to "" and will store
the longest word as the for loop executes. 
*/
function findLongestWord (input_arr){
  var longestWord = "";

  for (var i=0; i < input_arr.length; i++){
    if (input_arr[i].length > longestWord.length) {
      longestWord = input_arr[i];
    }
  }

  return longestWord;
}

//-------------------

//Release 1 Function

/*
Create a function that compares key, value pairs of two
objects to determine if any of the values are equal.
The function will be passed two objects and their key-value
pairs will be compared to determine if they equal.
*/
function compareObjectValues(object1, object2){
  if (object1.name === object2.name) || (object1.instrument == object2.instrument){
    return true;
  } else {
    return false;
  }
}

//-------------------

//Release 2 Function

//##################### D R I V E R   C O D E ################################

//Release 0 driver code
var wordArr1 = ["long phrase","longest phrase","longer phrase"];
console.log('Example 1')
console.log('Finding the longest phrase in the array: ' + wordArr1)
console.log(findLongestWord(wordArr1));
console.log('\n')

var wordArr2 = ['Jimmy Page', 'Robert Plant', 'John Paul Jones','John Bonham'];
console.log('Example 2')
console.log('Finding the longest phrase in the array: ' + wordArr2)
console.log(findLongestWord(wordArr2));
console.log('\n')

//Release 1 driver code


//Release 2 driver code