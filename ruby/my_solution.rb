# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative allows you to include files relative to the current directory of the current file.
# Whereas require uses the load path to locate the required files.

require_relative 'state_data'

class VirusPredictor

  attr_reader :state, :population_density, :population

  def initialize(foo, population_density, population)
    @state = foo
    @population = population
    @population_density = population_density
  end

  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  def predicted_deaths
    # predicted deaths is solely based on population density
    if population_density >= 200
      factor = 0.4
    elsif population_density >= 150
      factor = 0.3
    elsif population_density >= 100
      factor = 0.2
    elsif population_density >= 50
      factor = 0.1
    else
      factor = 0.05
    end

    print "#{state} will lose #{(population * factor).floor} people in this outbreak"

  end

  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if population_density >= 200
      speed += 0.5
    elsif population_density >= 150
      speed += 1
    elsif population_density >= 100
      speed += 1.5
    elsif population_density >= 50
      speed += 2
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

=begin
alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
alabama.virus_effects

jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
jersey.virus_effects

california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
california.virus_effects

alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
alaska.virus_effects
=end

STATE_DATA.each do |key, value|
  state = VirusPredictor.new(key, value[:population_density], value[:population])
  state.virus_effects
end

# states.each { |state| state.virus_effects }



#=======================================================================
# Reflection Section
# 
#What are the differences between the two different hash syntaxes shown in the state_data file?
# The state names used the hash rocket, while the population keys used the symbolic short cut.
#
#What does require_relative do? How is it different from require?
# require_relative allows you to include files relative to the current directory of the current file.
# Whereas require uses the load path to locate the required files.
#
#What are some ways to iterate through a hash?
# some ways to iterate through a hash include each, map, each_key
#
#When refactoring virus_effects, what stood out to you about the variables, if anything?
# The parameters where all instance variables. By using attr_reader it was unnecessary to
# send variables to the method. They could instead be accessed as instance variables
#
#What concept did you most solidify in this challenge?
# I was able to appreciate how instance variables make coding much easier.