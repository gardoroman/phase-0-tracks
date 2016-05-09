# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "Method 1: swapcase"
p "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

puts " "

puts "Method 2: insert"
p "zom".insert(2,"o")
# => “zoom”
puts " "

puts "Method 3: center"
p "enhance".center(15)
# => "    enhance    "
puts " "

puts "Method 4: upcase"
puts "\"Stop! You’re under arrest!\"".upcase
# => "STOP! YOU’RE UNDER ARREST!"
puts " "

puts "Method 5: insert and concat"
p "the usual" + " suspects"
p "the usual".insert(9, " suspects")
p "the usual".concat(" suspects")
#=> "the usual suspects"
puts " "

puts "Method 6: insert and prepend"
p " suspects".insert(0, "the usual")
p " suspects".prepend("the usual")
# => "the usual suspects"
puts " "

puts "Method 7: slice and chop"
p "The case of the disappearing last letter"[0..38]
p "The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"
puts " "

puts "Method 8: slice and delete"
p "The mystery of the missing first letter"[1..-1]
p "The mystery of the missing first letter".delete("T")
# => "he mystery of the missing first letter"
puts " "

puts "Method 9: squeeze"
p "Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"
puts " "

puts "Method 10: ord"
p "z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
# answer: 122 is the integer that represents the character "z"
puts " "

puts "Method 11: count"
p "How many times does the letter 'a' appear in this string?".count("a")
# => 4
