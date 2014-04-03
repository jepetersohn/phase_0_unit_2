# U2.W4: 3_separate_comma_solution.rb

# I worked on this challenge by myself.

# 2. Pseudocode

# Input: 	integer
# Output: 	string of comma separated integer
# Steps: 	DEFINE a method called separate_comma which accepts one parameter(integer)
#           CONVERT the integer into a string and REVERSE it
# 			CALCULATE the length of the integer
# 			IF the modulus of the length divided by 3 is 0, 
#           	THEN SET n = length/3 - 1
# 				ELSE SET n = length/3
#  			PUT a comma after every 3rd element of the integer for n times
# 			REVERSE the integer back
# 			RETURN the interger


# 3. Initial Solution
def separate_comma(integer) 
	reversed = integer.to_s.reverse
	length = reversed.length
	if length%3 == 0
		n = length/3 - 1
	else 
		n = length/3
	end
	i = 0
	until n <= 0
		reversed.insert(((3*(i+1))+i), ',')
		i += 1
		n -= 1
	end
	reversed.reverse
end

# 4. Refactored Solution

def separate_comma(integer) 
	reversed = integer.to_s.reverse
	length = reversed.length
	n = (length%3 == 0) ? length/3 - 1 : n = length/3
	i = 0
	until i >= n
		reversed.insert(((3*(i+1))+i), ',')
		i += 1
	end
	reversed.reverse
end

# 1. DRIVER TESTS GO BELOW THIS LINE
if defined?(separate_comma) === 'method'
	puts true
else
	puts "separate_comma is not defined as a method"
end

if method(:separate_comma).arity === 1
	puts true
else
	puts "separate_comma should accept one parameter"
end

# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => Follow direction in order. Dont't jump into coding right away. 
# What questions did you have while coding? What resources did you find to help you answer them?
# => How to define the method so it knows where to put the comma. It was not as easy as I initially
#    thought.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => The concept wasn't hard to understand but the how to execute it took a little bit of thinking.
# Did you learn any new skills or tricks?
# => method(:method).arity to make sure a method takes the right number of parameters.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Once I wrote the pseudocode, actual code writng was fairly easy and fun. I didn't
#    even have to deal with too many bugs which is always a good thing :-)
# Which parts of the challenge did you find tedious?
# => None.