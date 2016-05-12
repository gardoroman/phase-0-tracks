#DESCRIPTION
#alias_manager takes an agent's name and creates an alias
#by swapping the first and last name and shifting the
#vowels to the next vowel and consonants to the next consonant.

#DATA SECTION

vowels = 'aeiou'
consonants = 'bcdfghjklmnpqrstvwxyz'
vowels_arr = ["a", "e", "i", "o", "u"]
consonants_arr = ["b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"]


#METHOD DECLARATIONS

def shift_char(current_char, comp_string)
  char_index = (comp_string.index(current_char) + 1) % comp_string.length
  return comp_string[char_index]
end


#DRIVER CODE

puts  shift_char('u',vowels)