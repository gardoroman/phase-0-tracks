# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# "iNvEsTiGaTiOn".<???>
# => “InVeStIgAtIoN”
"iNvEsTiGaTiOn".swapcase

# "zom".<???>
# => “zoom”
"zom".insert(2,"o")

# "enhance".<???>
# => "    enhance    "
"enhance".center(15)

# "Stop! You’re under arrest!".<???>
# => "STOP! YOU’RE UNDER ARREST!"
"Stop! Youre under arrest!".upcase

# "the usual".<???>
#=> "the usual suspects"
"the usual" + " suspects"
"the usual".insert(9, " suspects")
"the usual".concat(" suspects")

# " suspects".<???>
# => "the usual suspects"
" suspects".insert(0, "the usual")

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# answer: 122 is the integer that represents the character "z"
"z".ord

# "How many times does the letter 'a' appear in this string?".<???>
# => 4