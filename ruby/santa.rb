#the Santa class is builds an Santa instance that speaks and 
#gives compliments on cookies received.
class Santa

  #Initializes the Santa instance
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance"
    @gender = gender
    @ethnicity = ethnicity
    @age = 0

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
kris_kringle = Santa.new('male', 'Inuit')

kris_kringle.speak

kris_kringle.eat_milk_and_cookies("Chocalate Chip")

reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]

diverse_list = [
  ["female", "Inuit"],
  ["male","Scottish"],
  ["agender","Canadian"],
  ["bigender","Black-Korean"],
  ["trans","European"],
  ["don't ask","Latino"],
  ["m","Nigerian"],
  ["f","Egyptian"]
]

santa = []

diverse_list.each do |gender, ethnicity|
  santa << Santa.new(gender, ethnicity)
end

puts santa