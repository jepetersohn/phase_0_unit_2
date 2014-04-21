# U2.W6: Testing Assert Statements


# I worked on this challenge by myself.


# 2. Review the simple assert statement

def assert
  raise "Assertion failed!" unless yield
end
 
name = "bettysue"
assert { name == "bettysue" }
#assert { name == "billybob" }

# 2. Pseudocode what happens when the code above runs

# => 1. First assert method called (name == "bettysue") returns nil.
# => 2. Second method call raises RuntimeError: Assertion failed! which was defined 
# =>    in side assert metod definition.
# => 3. The error code is indicating that it caught the error in the assert method 
# =>    definition but it actually caused by the second assert method call.  

# 3. Copy your selected challenge here

class CreditCard

	def initialize(numbers)
		raise ArgumentError, 'please provide 16 degit integer.' unless numbers.to_s.length === 16
		@numbers = numbers	
	end

	def check_card
		sum = 0
		i = 1
		@numbers.to_s.reverse.each_char do |c|
			n = c.to_i
			if i.even? 
				n *= 2
				if n > 9
					n_string = n.to_s
					n = n_string[0].to_i + n_string[1].to_i
				end
			end
			i += 1
			sum += n
		end
		return sum % 10 == 0 ? true : false 
	end

end

# 4. Convert your driver test code from that challenge into Assert Statements

assert { CreditCard.new(4408041234567893).check_card === true } 
assert { CreditCard.new(4408041234567892).check_card === false } 

# 5. Reflection

# What parts of your strategy worked? What problems did you face?
# => Just following the direction. This chllenge was pretty easy.
# What questions did you have while coding? What resources did you find to help you answer them?
# => I forgot what yield so I followed the link that was included to refresh my memory.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => Not so much trouble but using assert method effectively will take a bit more practice.
# Did you learn any new skills or tricks?
# =>  Not very new I guess but using assert method and also yield were refreching for me.
# How confident are you with each of the learning objectives?
# => SO far so good. I hope I won't get stuck down the road as I do more challengeing problems.
# Which parts of the challenge did you enjoy?
# => Learning new thigns is always good.
# Which parts of the challenge did you find tedious?
# => Nothing in this challenge was tedious to me.