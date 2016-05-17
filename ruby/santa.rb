#the Santa class is builds an Santa instance that speaks and 
#gives compliments on cookies received.
class Santa

  #Initializes the Santa instance
  def initialize
    puts "Initializing Santa instance"
  end

  #Prints a greeting from Santa instance
  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end
  
  #Takes in a string with the name of a cookie and
  #prints a message
  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
  end
end


#DRIVER CODE
kris_kringle = Santa.new

kris_kringle.speak

kris_kringle.eat_milk_and_cookies("Chocalate Chip")