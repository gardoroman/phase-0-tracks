# DESCRIPTION
# alias_manager takes an agent's name and creates an alias
# by swapping the first and last name and shifting the
# vowels to the next vowel and consonants to the next consonant.

#-------------------------------------------------------------------------

# METHOD DECLARATIONS
# shift_char takes a character and shifts it up by one vowel or consonant
# The method returns a shifted character
def shift_char(current_char)
  vowels = 'aeiou'
  consonants = 'bcdfghjklmnpqrstvwxyz'
  comp_string = vowels.index(current_char) ? vowels : consonants
  char_index = (comp_string.index(current_char) + 1) % comp_string.length
  return comp_string[char_index]
end

# process_names takes in an array with the first and last name of the 
# agent, reverses the order and sends it to the shift_char.
# The method returns an encoded agent name
def process_names(agent_name)
  agent_name.reverse!
  coded_name = []
  for
    name in agent_name
      coded_name << (name.chars.map {|letter| shift_char(letter)}).join("")
  end
  coded_name.map! {|name| name.capitalize}
  return coded_name
end

# prompt_user gets the first and last name of the agent and sends
# to the process_names method for conversion. 
# The method returns an array of coded agent names
def prompt_user()
  coded_list = []
  stop_input = ""
  until stop_input == "quit"
    name_array = ['first', 'last']
    agent_name = []
    for name in name_array
      puts "Please type in #{name} name"
      input_name = gets.chomp.downcase
      while (input_name =~ /[^abcdefghijklmnopqrstuvwxyz]/)
        puts "Please enter alphabetic characters only"
        input_name = gets.chomp.downcase
      end
      agent_name << input_name
    end
    code_name = process_names(agent_name)
    agent_name.map! {|name| name.capitalize}
    coded_list << [agent_name.reverse, code_name]
    puts "Hit any key to continue, otherwise type 'quit'"  
    stop_input = gets.chomp
    puts ""
  end
  return coded_list
end

# print_agents prints the name of an agent and along with their code name
# The method does not return anything.
def print_agents(master_list)
  for agent_info in master_list
    puts "The code name of agent #{agent_info[0].join(' ')} is #{agent_info[1].join(' ')}"
  end
end  

#-------------------------------------------------------------------------

# DRIVER CODE
agent_list = prompt_user()
p agent_list
print_agents(agent_list)






  
