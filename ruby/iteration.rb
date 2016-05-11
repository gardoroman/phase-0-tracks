# RELEASE 0
puts " "
puts "RELEASE 0"
puts " "

def add_numbers
  number01 = 5
  number02 = 3
  puts "This method takes a block to determine how to process two numbers."
  yield(number01, number02)
  puts "That is the result of taking the block."
end

add_numbers { |number01, number02| puts "#{number01} plus #{number02} is equal to #{number01 + number02}."}

# RELEASE 1
puts " "
puts "RELEASE 1"
puts " "

cities = ["Chicago", "New York", "Denver", "Detroit"]

mascots = {michigan: "wolverines", wisonsin: "badgers", colorado: "buffalos"}

# array using .each
puts "Using .each on an array"
p cities
cities.each { |city| puts city }
p cities

# array using .map!
puts "Using .map on an array"
p cities
cities.map! do |city| 
  city.upcase
end
p cities

# hash using .each
puts "Using .each on a hash"
p mascots
mascots.each { |school, team| puts school, team }
p mascots


mascots.delete_if {|school, team| team[0] == "b" }

#RELEASE 2

#Run hashes through four requirements
puts " "
puts "RELEASE 2: HASH SECTION"
puts " "

hash_01 = {k1: 0, k2: 2, k3: 5}
puts hash_01

puts ""
puts "Using delete_if"
hash_01 = {k1: 0, k2: 2, k3: 5}
hash_01.delete_if {|k,v| v < 1}
puts hash_01

puts ""
puts "Using reject!"
hash_01 = {k1: 0, k2: 2, k3: 5}
hash_01.reject! {|k,v| v < 1}
puts hash_01

puts ""
puts "Using select!"
hash_01 = {k1: 0, k2: 2, k3: 5}
hash_01.select! {|k,v| v > 1}
puts hash_01

puts ""
puts "Using keep_if"
hash_01 = {k1: 0, k2: 2, k3: 5}
hash_01.keep_if {|k,v| v < 5}
puts hash_01

#Run arrays through four requirements
puts " "
puts "RELEASE 2: ARRAY SECTION"

puts " "
puts "Using .delete_if"
cities = ["Chicago", "New York", "Denver", "Detroit"]
cities.delete_if {|city| city[0] == "D" }
puts cities

puts " "
puts "Using .reject!"
cities = ["Chicago", "New York", "Denver", "Detroit"]
cities.reject! {|city| city.length > 6}
puts cities

puts " "
puts "Using .select!"
cities = ["Chicago", "New York", "Denver", "Detroit"]
cities.select! {|city| city.length > 6}
puts cities

puts " "
puts "Using .keep_if"
cities = ["Chicago", "New York", "Denver", "Detroit"]
cities.keep_if {|city| city.length < 7}
puts cities

   
 





