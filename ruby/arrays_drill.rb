#list of items
grocery_list = []
grocery_list << "Milk"
grocery_list << "Eggs"
grocery_list << "Bacon"
grocery_list << "Spinach"
grocery_list << "Ice Cream"

p grocery_list

#deleting item at index 2
p grocery_list.delete_at(2)

p grocery_list

p grocery_list.insert(2,"Turkey Bacon")

p grocery_list.shift

p grocery_list.include?("Radishes")

more_items = ["Cereal", "Pizza", "Orange Juice"]

complete_list =  grocery_list + more_items

p complete_list