#Create a new list
#Add an item with a quantity to the list
#Remove an item from the list
#Update quantities for items in your list
#Print the list (Consider how to make it look nice!)

#method to create list
#process string
#defaults to 1
#print list
def create_list(item_string)
  list_hash = {}
  item_arr = item_string.split(" ")
  item_arr.each {|item| list_hash[item] = 1} 
  return list_hash
end


def add_item(master_list, new_item, amount)
  master_list[new_item]=amount
  return master_list
end

def remove_item(master_list, item)
  master_list.delete(item)
  return master_list
end

def update_item(master_list, update_item, amount)
  if master_list.include?(update_item)
    master_list[update_item] = amount
  else
    puts "Item not found"
  end
  return master_list
end

def print_items(master_list)
   master_list.each do |item_name, quantity| 
     puts " There are #{quantity} #{item_name} in the list"
   end
end

# Release 3

# original list
puts "creating new list "
master_list = create_list("apples oranges pears")
p master_list
puts ""

puts "adding new items"
new_items = [["lemonade", 2], ["tomatoes", 3], ["Onions", 1], ["Ice Cream", 4]]
new_items.each { | item, quantity| add_item(master_list, item, quantity)}
p master_list
puts ""

puts "removing lemonade"
remove_item(master_list, "lemonade")
p master_list
puts ""
puts "updating quantity of ice cream"
update_item(master_list, "Ice Cream", 1)
puts master_list
puts ""
puts "printing list"
print_items(master_list)

#REFLECT
=begin
What did you learn about pseudocode from working on this challenge?
pseudocode helps us focus on making simple code and anticipating problems

What are the tradeoffs of using arrays and hashes for this challenge?
hashes can be difficult to manipulate

What does a method return?
a method implicit returns the last executed line otherwise it returns whatever
is explicitly specified

What kind of things can you pass into methods as arguments?
many things can be passed: strings, numbers, methods. Basically almost any object can passed

How can you pass information between methods?
By sharing parameters

What concepts were solidified in this challenge, and what concepts are still confusing?
hashes were both challenging and solidified
learning of pseudocoding was helpful

=end

