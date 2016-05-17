#the Santa class is builds an Santa instance that speaks and 
#gives compliments on cookies received.
class Santa

  #Initializes the Santa instance
  def initialize(gender, ethnicity)
    puts "Initializing Santa instance"
    puts ""
    @gender = gender
    @ethnicity = ethnicity
    @age = 0

  end

  #Prints a greeting from Santa instance
  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
    puts ""
  end
  
  #Takes in a string with the name of a cookie and
  #prints a message
  def eat_milk_and_cookies(cookie)
    puts "That was a good #{cookie}"
    puts ""
  end

  #increments age by 1 year
  def celebrate_birthday
    @age += 1
  end

  #looks up reindeer argument and moves it to the end of the list
  def get_mad_at(bad_deer)
    reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    puts "Original Ranking of Reindeer"
    puts reindeer_ranking

    if reindeer_ranking.include?(bad_deer)
      last_deer = reindeer_ranking.delete(bad_deer)
      reindeer_ranking << last_deer
      puts "New Ranking of Reindeer"
      puts reindeer_ranking
    end

  end
  
  #getter methods
  def age
    @age    
  end

  def gender
    @gender    
  end

  #setter methods
  def gender=(new_gender)
    @gender = new_gender
  end

end #end of class


#DRIVER CODE
kris_kringle = Santa.new('male', 'Inuit')

kris_kringle.speak

kris_kringle.eat_milk_and_cookies("Chocalate Chip")



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

kris = Santa.new('male','irish')


kris.celebrate_birthday
puts kris.age
kris.get_mad_at("Dasher")
puts kris.gender= 'female'
