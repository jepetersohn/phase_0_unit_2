# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:   An integer
# Output:  GuessingGame#guess returns a symbol when an integer is given as an argument.
#          GuessingGame#solved? returns instance variable @solved. 
# Steps:   1. DEFINE a class called GuessingGame
#          2. DEFINE a initialize which takesone parameter(integer).
#          3. Inside initialize, set @answer to the argument given. And @solved to false.
#          4. DEFINE a instance method called guess which takes pne parameter(integer)
#          5. Inside guess, 
#          6. IF guess is greater than @answer, THEN @solved is set to false and :low is returned
#          7. ELSIF  guess is less than @answer, THEN @solved is set to false and :high is returned.
#          8. ELSE @solved is set to true and :correct is returned.
#          9. DEFINE a method called solved? which returns @solved


# 3. Initial Solution
class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end
  
  def guess(guess)
  	if guess > @answer
  		@solved = false
  		return :high
  	elsif guess < @answer
  		@solved = false
  		return :low
  	else
  		@solved = true
  		return :correct
  	end
  end

  def solved?
  	@solved
  end
end




# 4. Refactored Solution

class GuessingGame
  def initialize(answer)
    @answer = answer
    @solved = false
  end
  
  def guess(guess)
  	if guess != @answer
  		@solved = false
  		return guess > @answer ? :high : :low
  	else
  		@solved = true
  		return :correct
  	end
  end

  def solved?
  	@solved
  end
end

# 1. DRIVER TESTS GO BELOW THIS LINE
game =  GuessingGame.new(10)
p GuessingGame.instance_method(:initialize).arity === 1 
p GuessingGame.method_defined?(:guess) === true 
p GuessingGame.instance_method(:guess).arity === 1 
GuessingGame.method_defined?(:solved?) === true
GuessingGame.instance_method(:solved?).arity === 0
p game.guess(100) === :high 
p game.solved? === false
p game.guess(0) === :low
p game.solved? === false
p game.guess(10) === :correct
p game.solved? === true

# 5. Reflection 
# What parts of your strategy worked? What problems did you face?
# => No problem. I just followed the direction as usual.
# What questions did you have while coding? What resources did you find to help you answer them?
# => How do I return a symbol? That was my biggest quetion. I went online and found answer which was
#    just return a symbol!
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => Wat are symbols? That is my biggest question. I did do some reserch on them but still not clear.
# Did you learn any new skills or tricks?
# => Returning symbols.
# How confident are you with each of the learning objectives?
# => Pretty confident with everything but the concept of symbols.
# Which parts of the challenge did you enjoy?
# => Actually writing the code, and refactoring.
# Which parts of the challenge did you find tedious?
# Pseudocode