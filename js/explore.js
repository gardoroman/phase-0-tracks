//FUNCTION DECLARATIONS

/*
The function reverse_string will take a string as a parameter and reverse 
the order of the characters.
The method will run in a loop with a value of string length - 1. The
loop value will be used as an index to search for the string character
starting at the end of the string and decrementing the loop/index value
until it hits the beginning of the string. 
For each value, the character at that index will be concatenated to a 
string whose initial value is equal to "". 
*/
function reverseString(originalString){
  var revString = "";

  for (var i = originalString.length -1; i >= 0; i--){
    revString += originalString[i];
  }

  return revString;
}

function stringConditions(inputString){
  console.log("The original string is " + inputString)
  newString = reverseString(inputString)
  if (newString != inputString) {
    console.log("The reversed string is " + newString)
  }
  else {
    console.log("The string is a palindrome")
  }
}

//--------------------------------------------------------------------------

//DRIVER CODE
console.log('Test 1')
stringConditions('rewind')

console.log('Test 2')
stringConditions('pool loop')


