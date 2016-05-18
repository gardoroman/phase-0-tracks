#Module Declaration

# the should module is a mixin module that is applied
# to any class that can shout
module Shout

  #-----------------------------------------------
  #Commenting out standalone code per requirements
  #-----------------------------------------------

  #def self.yell_angrily(words)
  #  words + "!!!" + " :("
  #end

  #def self.yell_happily(words)
  #  words + " !!" + " happy happy :) :) :)"
  #end

  def yell_angrily(words)
    words + " !!!" + " :("
  end

  def yell_happily(words)
    words + " !!" + " happy happy :) :) :)"
  end

end

class SubstituteTeacher
  include Shout
end

class TaxiDriver
  include Shout
end

#Driver Code
#example 1
sub_teacher = SubstituteTeacher.new
puts ""
puts ""
puts "Example of Substitute Teacher object using Shout module"
puts ""
puts "Angry Example"
puts sub_teacher.yell_angrily("Sit down and shut up")
puts "Happy Example"
puts sub_teacher.yell_happily("Whew! I am glad the day is over")

#example 2
puts ""
puts ""
puts "Example of Taxi Driver object using Shout module"
puts ""
cabby = TaxiDriver.new
puts "Angry Example"
puts cabby.yell_angrily("Move it, Move it. Outta my way")
puts "Happy Example"
puts cabby.yell_happily("Yippy, I'm going home")
