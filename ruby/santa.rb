#the Santa class is builds an Santa instance that speaks and 
#gives compliments on cookies received.
class Santa

  attr_reader  :ethnicity
  attr_accessor :gender, :age

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


  #def gender
  #  @gender    


  #setter methods
  #def gender=(new_gender)
  #  @gender = new_gender
  #@end

end #end of class


#DRIVER CODE
kris_kringle = Santa.new('male', 'Inuit')

kris_kringle.speak

kris_kringle.eat_milk_and_cookies("Chocalate Chip")


#automatically generates santa instances by randomly selecting from gender and ethnic arrays.
def santa_simulator
  santa = []
  example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A", "trans", "don't know"]
  example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", 
    "Mystical Creature (unicorn)", "N/A", "Scottish", "Pinoy", "Nigerian"]
  
  gender_num = example_genders.length
  ethnic_num = example_ethnicities.length
  max_num = gender_num > ethnic_num ? gender_num : ethnic_num

  
  max_num.times do   
    santa << Santa.new(example_genders[rand(gender_num)], example_ethnicities[rand(ethnic_num)])
  end

  puts ""
  #puts "santa before"
  p santa
  santa.each {|santa_instance|  santa_instance.age = rand(140) }
#santa[santa_instance].age(rand(140))

  puts ""
  puts ""
  #puts "santa after"
  p santa
  
  santa.each do |instance| 
    puts "This Santa's gender is #{instance.gender} and ethnicity is #{instance.ethnicity} is #{instance.age} years old "
  end
end
  


kris = Santa.new('male','irish')

puts kris.age

kris.celebrate_birthday
puts kris.age
puts kris.ethnicity 
#kris.get_mad_at("Dasher")
puts kris.gender
puts kris.gender= 'female'

santa_simulator