// FUNCTION DECLARATIONS
/*
 create a function that takes an array of words and
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



// DRIVER CODE

//Release 1
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