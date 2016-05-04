require 'date'
current_year = Date.today.strftime("%Y")
current_year = current_year.to_i
loop_count = 0
puts "How many employees?"
total_number = gets.chomp.to_i
while loop_count < total_number
  puts "What is your name?"
  name = gets.chomp
  puts "How old are you?"
  age = gets.chomp.to_i
  puts "In what year were born?"
  birth_year = gets.chomp.to_i
  if birth_year + age == current_year
    correct_age = true
  else
    correct_age = false
  end
  puts "Correct age is #{correct_age}"
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
  when (correct_age) && (needs_insurance || likes_garlic_bread)
    message = "Probably not a vampire"
  when (!correct_age) && (!likes_garlic_bread && needs_insurance) || (likes_garlic_bread && !needs_insurance)
    message = "Probably a vampire"
  when (!correct_age) && !likes_garlic_bread && !needs_insurance
    message = "Almost certainly a vampire"
  else
    message = "Results Inconclusive"
  end

  # Had to separate checks in order to force the proper messages for certain responses
  if (allergies == 'sunshine')
    message = "Probably a vampire"
  end

  if (name == "Drake Cula") || (name == "Tu Fang") || (name == "Dr. Acula") 
    message = "Definitely a vampire"
  end

  puts message
  puts ""
  loop_count += 1
end

#Final message
puts  "Actually, never mind! What do these questions have to do with anything? Let's all be friends."
