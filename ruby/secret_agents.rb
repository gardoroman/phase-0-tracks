
=begin
- Ask for input
- Get input
  - Loop through each letter of input until end of string
   - If not a space
     - Shift each letter to the next sequential letter
  - Else leave space unchanged
=end

=begin
# - Get input
# - Loop through each letter of input until end of string
#   - If not a space
#     - Convert letter to ASCII value
#     - Subtract 1 from that value
#     - Convert ASCII value to character
#   - Else leave space unchanged
=end

# Method declarations

# takes string and shifts to the next sequential letter
def encrypt(input_str)
  i = 0
  while i < input_str.length
    case true
      when input_str[i] == "z"
        input_str[i] = "a"
      when input_str[i] != " "
        input_str[i] = input_str[i].next
    end
    i += 1
  end
  return input_str
end

# takes string and shift to the previous sequential letter
def decrypt(input_str)
  i = 0
  while i < input_str.length
    case true
      when input_str[i] == "a"
        input_str[i] = "z"
      when input_str[i] != " "
        ascii_num = input_str[i].ord - 1
        input_str[i] = ascii_num.chr
    end
    i += 1
  end
  return input_str
end

#puts "Please input a message."
#message = gets.chomp.downcase
#puts decrypt(message)

# Bellow is an example of a nested call. What happens first is encrypt 
# method is called and swordfish is encoded. The encoded value is then
# returned to decrypt which then unscrambles the message. The unscrambled
# method is then returned.

# Driver code
puts "Nested method call"
puts decrypt(encrypt("swordfish"))
puts ""

choice = ""
until (choice == "e") || (choice == "d")
  puts "Type 'e' to encrypt or 'd' to decrypt a password."
  choice = gets.chomp.downcase
end
puts ""

puts "Please enter password"
password = gets.chomp.downcase


if choice == "e"
  output_msg = encrypt(password)
else choice == "d"
  output_msg = decrypt(password)
end

puts "Your code is #{output_msg}"

# Worked on by Ben Van Sickle and Edgardo Roman  