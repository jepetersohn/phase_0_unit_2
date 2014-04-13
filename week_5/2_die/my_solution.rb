# U2.W5: Die Class 2: Arbitrary Symbols


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:   An array of strings  
# Output:  Die#sides returns the number of sides ans Die#roll returns a random 
#          element from the array 
# Steps:   1. CREATE a class called Die
#		   2. DEFINE initialize which takes one array as a patameter
#     	   3. Inside initialize, RAISE ArgumentError if given argument is empty. 
# 			  And SET  an instance variable @sides to the number of elelemts of 
#  			  the array.
# 		   4. SET @labels to the array.
# 		   5. DEFINE an instance method called sides which simply returns the 
# 			  value of @sides
# 		   6. DEFINE an instance method called roll
# 		   7. Inside roll method, pick a random number between 1 to sides-1
#             and ruturn the element from the array whose index id that random
#  		      number.


# 3. Initial Solution

class Die
  def initialize(labels)
  	raise ArgumentError, 'Argument has to be a non-empty array.' unless !labels.empty?
  	@sides = labels.length
  	@labels = labels
  end

  def sides
  	@sides
  end

  def roll
  	@labels[rand(0..(@sides-1))]
  end
end



# 4. Refactored Solution

class Die
  attr_reader :sides
  def initialize(labels)
  	raise ArgumentError, 'Argument has to be a non-empty array.' unless !labels.empty?
  	@sides = labels.length
  	@labels = labels
  end

  def roll
  	@labels[rand(0...@sides)]
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE

puts "Die is not defined" unless defined? Die  
puts "Die is not a class" unless  Die.is_a? Class 
puts "Die#initialize should accept one parameter" unless Die.instance_method(:initialize).arity === 1 
fruits = ['apple', 'orange', 'banana', 'grape', 'kiwi']
die = Die.new(fruits)
puts "Die#sides is not returning the right number of sides" unless die.sides === 5  
puts "Die#roll is not returing a element of fruits" unless fruits.include?(die.roll) 



# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => The challenge was very similar to the previous one so I just did pretty much the same
#    thing except for a few modifications.
# What questions did you have while coding? What resources did you find to help you answer them?
# => I didn't have any questions this time.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => This challenge was fairly easy for me.
# Did you learn any new skills or tricks?
# => Not really.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you find tedious?
# => Bug fixing. I kept misspelling the word labels and took me some time to figure
#    pass the rspec.