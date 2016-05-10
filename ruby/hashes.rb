#DESCRIPTION
#hashes.rb allows an interior designer to enter details of a given client.
#A series of prompts will assign values to keys in a hash table.
#Symbols will be used as keys.

#-----------------------------------------

#DATA SECTION
client_array = ["name", "age", "number of children", "decor theme", "budget", "home type"]

#-----------------------------------------

#METHOD DECLARATIONS
#get_client_data receives an array which is used to prompt designer for client
#details and populate a hash
def get_client_data(input_array)
      
  client_data = {}
    
  puts "Please enter the client's details:"
  for field in input_array
    print "#{field}: "
    client_data[field.to_sym] = gets.chomp
    puts ""
  end
  
  return client_data    
end

#print_client_data takes in a hash and outputs the key and values
def print_client_data(input_hash)
  input_hash.each do |key, val|
    puts "#{key}: is #{val} "
  end  
end

#convert_client_data converts string input into the appropriate data type
def convert_client_data(input_hash)
  input_hash[:age] = input_hash[:age].to_i
  input_hash[:"number of children"] = input_hash[:"number of children"].to_i
  input_hash[:budget] = input_hash[:budget].to_i
  return input_hash
end

#asks designer if changes are needed and then corrects the entries
def update_client_data(input_hash)
  puts "Type what item you want to change, otherwise type 'none'"
  response = gets.chomp.downcase
  if response != "none"
    update_key = response.chomp.to_sym
    puts "What is the new value?"
    input_hash[update_key] = gets.chomp
  end
  puts ""
  return input_hash
end

#-----------------------------------------

#Application Section
client_hash =  get_client_data(client_array)
client_hash.default = "Item Not Found"
client_hash = convert_client_data(client_hash)
#print_client_data(client_hash)

puts "Printing Client Record"
puts client_hash
puts ""

update_client_data(client_hash)
client_hash = convert_client_data(client_hash)
puts "Printing Updated Record"
puts client_hash