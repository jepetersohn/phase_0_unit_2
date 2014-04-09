# U2.W5: Build a simple guessing game SOLO CHALLENGE


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:
# Output:
# Steps:


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






# 5. Reflection 
