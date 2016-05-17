#CLASS DECLARATIONS

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
    puts "Original Ranking of #{bad_deer}"
    p reindeer_ranking

    if reindeer_ranking.include?(bad_deer)
      last_deer = reindeer_ranking.delete(bad_deer)
      reindeer_ranking << last_deer
      puts "New Ranking of #{bad_deer}"
      p reindeer_ranking
    end

  end
  
end #end of Santa class

#-------------------------------------------------------------------------------

#EXTERNAL METHOD DECLARATION

#automatically generates the amount of santa instances specified by num_instances.
#instances will randomly select from the gender and ethnicity arrays
def santa_simulator(num_instances)
  #arrays to generate Santa instances
  santa = []
  example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A", "trans", "don't know"]
  example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", 
    "Mystical Creature (unicorn)", "N/A", "Scottish", "Pinoy", "Nigerian"]
  
  #get length of arrays to determine the max random number per array
  gender_num = example_genders.length
  ethnic_num = example_ethnicities.length

  #assign random variables to Santa instance from ethnicity and gender arrays
  num_instances.times do   
    santa << Santa.new(example_genders[rand(gender_num)], example_ethnicities[rand(ethnic_num)])
  end

  #assign Santa instance a random age from 0 to 140
  santa.each {|santa_instance|  santa_instance.age = rand(140) }

  puts ""
  
  #Printing out the attributes of every Santa instance
  santa.each do |instance| 
    puts "This Santa's gender is #{instance.gender.capitalize}, ethnicity is #{instance.ethnicity.capitalize}, age is #{instance.age} years old "
    puts ""
  end
end

#-------------------------------------------------------------------------------

#DRIVER CODE

puts "RELEASE 1"
puts "Initial test of Santa Claus"
kris_kringle = Santa.new('male', 'Inuit')
kris_kringle.speak
kris_kringle.eat_milk_and_cookies("Chocalate Chip")
puts ""  

puts "RELEASE 2 and 3"
puts "Testing attributes and instance methods"
mari_ijima = Santa.new('male','Japanese')
puts "Santa's current age"
puts mari_ijima.age
mari_ijima.celebrate_birthday
puts "Santa's new age"
puts mari_ijima.age
puts "Santa's ethnicity is #{mari_ijima.ethnicity}"
puts "Santa is mad at Dasher"
mari_ijima.get_mad_at("Dasher")
puts "Santa's current gender"
puts mari_ijima.gender
puts "Santa's updated gender"
puts mari_ijima.gender= 'female'


puts ""


puts "RELEASE 4"

puts "Testing Santa Simulator"
santa_simulator(20)