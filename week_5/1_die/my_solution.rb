# U2.W5: Die Class 1: Numeric


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:   Number of sides(6)
# Output:  Die#sides returns 6, Die#roll returns a random number between 1 to 6 
# Steps:   1. CREATE a class called Die
#		       2. DEFINE initialize which takes one sides as a patameter
#     	   3. Inside initialize, RAISE ArgumentError if given argument is less than 1. 
# 			      And SET  an instance variable @sides to sides
# 		     4. DEFINE an instance method called sides which simply returns the 
# 			      value of @sides
# 		     5. DEFINE an instance method called roll
# 		     6. Inside roll method, pick a random number between 1 to sides
#             and return it. 


# 3. Initial Solution

class Die
  def initialize(sides)
  	raise ArgumentError, 'Argument has to be an integer greater than 0' unless sides > 0
    @sides = sides
  end
  
  def sides
  	@sides
  end
  
  def roll
    rand(1..@sides)
  end
end



# 4. Refactored Solution

class Die
	attr_reader :sides 
	def initialize(sides)
  	raise ArgumentError, 'Argument has to be an integer greater than 0' unless sides > 0
    @sides = sides
  end
  
  def roll
    rand(1..@sides)
  end
end




# 1. DRIVER TESTS GO BELOW THIS LINE

puts "Die is not defined" unless defined? Die  
puts "Die is not a class" unless  Die.is_a? Class 
puts "Die#initialize should accept one parameter" unless Die.instance_method(:initialize).arity === 1 
die = Die.new(6)
puts "Die#sides is not returning the right number of sides" unless die.sides === 6  
puts "Die#roll is not returing the number between 1 and 6" unless die.roll.between?(1, 6) 

# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => Just following the direction worked for me.
# What questions did you have while coding? What resources did you find to help you answer them?
# => I didn't have any questions this time.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => This challenge was fairly easy for me.
# Did you learn any new skills or tricks?
# => Not really new tricks but I did my driving tests differently this time using unless.
#    Also I got to refresh my knowledge of .is_a?, .arity, .between?.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Creating Die class was fun since it wasn't so hard and also I enjoyed writing
#    the driving tests because I did it differently this time.
# Which parts of the challenge did you find tedious?
# => Nothing was tedious. Even the Pseudocode!