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
function compareKeyValuePair(object1, object2){
  for (objectKey in object1){
    if (typeof object1[objectKey] !== 'function'){
      if (typeof object2[objectKey] != 'undefined'){
        if (object1[objectKey] == object2[objectKey]){
          return true;
        }
      }
    }
  }
  return false;  
}

//-------------------

//Release 2 Function
/*
Create a function that creates an array whose length is
determined by an integer passed in as a parameter.
Every array element will contain a randomly generated word of varying
length from 1 to 10 characters.
A separate function (randomRange) will be create to generate the length of the word
and the seed value for the random letters.
The word will be generated from a string containing the characters of the
alphabet.
A nested loop will be created. The outer loop value will be equal to the array length
passed in and inner loop value will be whatever length is randomly generated.
*/
function createWordArrays(array_length){
  
  var wordArray = [];
  var alphaString = 'abcdefghijklmnopqrstuvwxyz';


  if (array_length != 0) {
    for(var i = 0; i < array_length; i++) {
      randomWord = "";
      for (var j = 0; j < randomRange(1,10); j++) {
        randomWord += alphaString[randomRange(0,26)];
      }
        wordArray.push(randomWord);
    }
  }

  return wordArray;
}

/*
This function generates a random number between a minimum and maximum value
passed in as parameters.
*/

function randomRange(min_num, max_num){
  return Math.floor(Math.random() * (max_num) + min_num);
}



//##################### D R I V E R   C O D E ################################

//Release 0 driver code
var wordArr1 = ["long phrase","longest phrase","longer phrase"];
console.log('Release 0: Example 1');
console.log('Finding the longest phrase in the array [' + wordArr1 + '] is');
console.log(findLongestWord(wordArr1));
console.log('\n');

var wordArr2 = ['Jimmy Page', 'Robert Plant', 'John Paul Jones','John Bonham'];
console.log('Release 0: Example 2');
console.log('Finding the longest phrase in the array [' + wordArr2 + '] is');
console.log(findLongestWord(wordArr2));
console.log('\n');

//Release 1 driver code
var artBlakey = {name: "Art Blakey", instrument: "Drums"};
var johnBonham = {name: "John Bonham", instrument: "Drums"};
var jimmyPage = {name: "Jimmy Page", instrument: "Guitar"};
var thirtyRock = {title: "Thirty Rock", category: "sitcom", creator: "Tina Fey", network: "NBC"};

console.log('Release 1: Example 1');
console.log('Checking if objects')
console.log(artBlakey);
console.log('and');
console.log(johnBonham)
console.log('share any key value pairs');
console.log('The answer is ' + compareKeyValuePair(artBlakey,johnBonham));
console.log('\n');
console.log('Release 1: Example 2');
console.log('Checking if objects')
console.log(thirtyRock);
console.log('and');
console.log(jimmyPage)
console.log('share any key value pairs');
console.log('The answer is ' + compareKeyValuePair(thirtyRock,jimmyPage));
console.log('\n');


//Release 2 driver code
for (inc = 1; inc <= 10; inc++){
  var randomWordArray = createWordArrays(5);
  console.log('Release 2: Example ' + inc);
  console.log('Finding the longest phrase in the array [' + randomWordArray + '] is:');
  console.log(findLongestWord(randomWordArray));
  console.log('\n');
}