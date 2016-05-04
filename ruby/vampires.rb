loop_count = 0
puts "How many employees?"
total_number = gets.chomp.to_i
puts "What is your name?"
name = gets.chomp
puts "How old are you?"
age = gets.chomp.to_i
puts "Should we order garlic bread for you? (y,n)"
likes_garlic_bread = gets.chomp.downcase
until (likes_garlic_bread  == 'n') or (likes_garlic_bread == 'y')
  puts "please enter y or n"
  likes_garlic_bread = gets.chomp
end
puts "Would you like to enroll in our company insurance plan? (y,n)"
needs_insurance = gets.chomp.downcase
until (needs_insurance  == 'n') or (needs_insurance == 'y')
  puts "please enter y or n"
  needs_insurance = gets.chomp
end
puts "Please list your allergies. Write 'done' when finished"
allergies = gets.chomp.downcase
until (allergies  == 'done') or (allergies == 'sunshine')
  puts "Any more allergies?"
  allergies = gets.chomp
end

if likes_garlic_bread == 'y'
  likes_garlic_bread = true
else
  likes_garlic_bread = false
end


if needs_insurance == 'y'
  needs_insurance = true
else
  needs_insurance = false
end

case true
when (age < 110) && (needs_insurance || likes_garlic_bread)
  message = "Probably not a vampire"
when (age >= 110) && (!likes_garlic_bread || !needs_insurance || allergies == 'sunshine')
  message = "Probably a vampire"
when (age >= 110) && !likes_garlic_bread && !needs_insurance
  message = "Almost certainly a vampire"
else
  message = "Results Inconclusive"
end

# Had to separate name check from case statement 
if (name == "Drake Cula") || (name == "Tu Fang") || (name == "Dr. Acula") 
  message = "Definitely a vampire"
end

puts message