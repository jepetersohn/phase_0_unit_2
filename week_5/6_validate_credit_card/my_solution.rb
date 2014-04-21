# U2.W5: Class Warfare, Validate a Credit Card Number


# I worked on this challenge myself.

# 2. Pseudocode

# Input:   16 degit integer
# Output:  Boolean value
# Steps:   1.  DEFINE a method called CreditCard
#		   2.  DEIFNE  initialize method which takes one argument(16 degit integer called number)
# 		   3.  Inside initialize, RAISE an argument if number is not an integer or not 16 degit.
# 		   4.  SET @numbers to numbers
# 		   5.  DEINFE a method called check_card
# 		   6.  Make @numbers into an array of 16 elements 
# 		   7.  INITIALIZE an iterator .each on @numbers
#  		   8.  IF each number's index + 1 modulus 2.0 is 0, THEN  double the number
# 		   9.  IF the doubled number is greater than 9,
# 		   10. THEN convert these number to string and then to an array and add each element as intergers
# 		   11. Keep adding each number and call it sum
# 		   12. IF sum modulus 10 is 0, return true otherwise return false.

# 3. Initial Solution

# Don't forget to check on intialization for a card length
# of exactly 16 digits
class CreditCard

	def initialize(numbers)
		raise ArgumentError, 'please provide 16 degit integer.' unless numbers.to_s.length === 16
		@numbers = numbers	
	end

	def check_card
		sum = 0
		i = 1
		@numbers.to_s.reverse.split('').each do |n|
			n = n.to_i
			if i % 2.0 == 0
				n *= 2
				if n > 9
					array = n.to_s.split('')
					n = array[0].to_i + array[1].to_i
				end
			end
			i += 1
			sum += n
		end
		return sum % 10 == 0 ? true : false 
	end

end



# 4. Refactored Solution

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
		puts sum
		return sum % 10 == 0 ? true : false 
	end

end

# 1. DRIVER TESTS GO BELOW THIS LINE

p CreditCard.new(4408041234567893).check_card === true
p CreditCard.new(4408041234567893).check_card
p CreditCard.new(4408041234567892).check_card === false

      
# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => I just had to follow the algorithm carefully. Ohter than that it was actually
#    easier than I thought.
# What questions did you have while coding? What resources did you find to help you answer them?
# => How can I refactor this code? Is there a better way to do this? Especially converting 
#    integers to a string and string to an array. To me, it seems necessary in order to apply
#    each algorithm successfully but I wonder if there is better or more efficient way
#    to this.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => The concept was fairly easy to understand.
# Did you learn any new skills or tricks?
# => By converting integers to strings and arrays, I was able to get a deeper understanding
#    of how each object(Integer, String, Array) and its method works.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Coding was fun especially when it ran successfully.
# Which parts of the challenge did you find tedious?
# => As usual, pseudocode.