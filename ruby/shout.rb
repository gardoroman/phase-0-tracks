#Module Declaration
module Shout

  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

  def self.yell_happily(words)
    words + " !!" + " happy happy :) :) :)"
  end

end

#Driver Code

puts Shout.yell_angrily("arghhhh")
puts Shout.yell_happily("yippy")