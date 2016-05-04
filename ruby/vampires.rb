puts "What is your name?"
name = gets.chomp.downcase
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
when (age < 110) && needs_insurance
  puts "Probably not a vampire"
when (age >= 110) && !likes_garlic_bread
  puts "Probably a vampire"
when (age >= 110) && !likes_garlic_bread && !needs_insurance
  puts "Almost certainly a vampire"
when (name == "drake cula") || (name == "Tu Fang")
  puts "Definitely a vampire"
else
  puts "Results Inconclusive"
end