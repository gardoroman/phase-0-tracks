#DESCRIPTION
#hashes.rb allows an interior designer to enter details of a given client.
#A series of prompts will assign values to keys in a hash table.
#Symbols will be used as keys.

#DATA SECTION
client_array = ["name", "age", "number of children", "decor theme", "budget", "home type"]


#METHOD DECLARATIONS
#get_client_data receives an array which is used to prompt designer for client
#details and populate a hash
def get_client_data(input_array)
      
  client_data = {}
    
  puts "Please enter the client's details:"
  for field in input_array
    print "#{field}:"
    client_data[field.to_sym] = gets.chomp
    puts ""
  end
  
  return client_data    
end

#print_client_data takes in a hash and outputs the key and values
def print_client_data(input_hash)
  input_hash.each do |key, val|
    puts "#{key} is #{val} "
  end  
end



#Application Section
client_hash =  get_client_data(client_array)