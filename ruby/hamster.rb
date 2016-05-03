puts "What is the hamster's name?"
name=gets.chomp
puts "What is the volume level of the hamster? (1-10)"
volume=gets.chomp
volume=volume.to_i
puts "What is the fur color of the hamster?"
fur_color=gets.chomp
puts "Is the hamster a good candidate for adoption? (YES, Y or No, N)"
good_candidate=gets.chomp.upcase
puts "What is the estimated age?"
estimated_age=gets.chomp
if estimated_age.empty?
  estimated_age=nil
else
  estimated_age=estimated_age.to_i
end

if (good_candidate=="YES" || good_candidate=="Y")
  good_candidate=true
elsif (good_candidate=="NO" || good_candidate=="N")
  good_candidate=false
else
  good_candidate="unknown"
end

puts "Hamster is called #{name}"
puts "Hamsters volume level is #{volume}"
puts "Hamsters fur color is #{fur_color}"
puts "Good candidate #{good_candidate}" 
puts "Hamsters estimated age is #{estimated_age}" 