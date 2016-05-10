def build_array(item1, item2, item3)
  main_array = []
  main_array << item1
  main_array << item2
  main_array << item3
  return main_array
end

def add_to_array(array1, add_item)
  array1 << add_item
  return array1
end


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

p build_array(5,6,0)

p add_to_array([],"something")

p add_to_array(complete_list, "Coffee")