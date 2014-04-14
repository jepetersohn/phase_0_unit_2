# U2.W5: Implement a Reverse Polish Notation Calculator


# I worked on this challenge by myself.

# 2. Pseudocode

# Input:   string of valid RPN expression
# Output:  integer
# Steps:   
# 1.  CREATE a class called RPNCalculator
# 2.  DEFINE a method called evaluate which takes one patameter(string RPN expression)
# 3.  CONVERT the string to an array separated by whitespace
# 4.  SEARCH for the first operator in the array
# 5.  IF there is no operator found
#    	 THEN CONVERT the each element in the array into an interger and add them up
#        RETURN the result
# 6.  ELSE
#     	 DETERMINE what type of operator
#  		 IF '+'
#			ADD the two elements that are positoned right before the operator in the array.
#        IF '-
#			SUBTRACT the two elements that are positoned right before the operator in the array.
#        IF '*'
#			MULTIPLY the two elements that are positoned right before the operator in the array.
#        SET CHANGE the value of the element two positons before the operator to the reasult of the calculation.
#        DELETE the operator and the element right before it from the array.
#        CONVERT the array into a string by joining all of its elements
# 7.  CALL evaluate method itself with the new string as the argument. 


# 3. Initial Solution

class RPNCalculator

	def evaluate(string)
		array = string.split(' ')
		index = array.index { |x| x == "+" || x == "-" || x == "*"}
		if index.nil?
			result = 0
			array.each { |x| result += x.to_i }
			return result
		else
			case array[index]
			when '+'
				result = array[index-2].to_i + array[index-1].to_i
			when '-'
				result = array[index-2].to_i - array[index-1].to_i
			when '*'
				result = array[index-2].to_i * array[index-1].to_i
			end
			array[index-2] = result
			array.delete_at(index)
			array.delete_at(index-1)
			string = array.join(' ')
		end
		self.evaluate(string)
	end

end


# 4. Refactored Solution

class RPNCalculator

	def evaluate(string)
		array = string.split(' ')
		index = array.index { |x| x =~ /^[+*-]$/ }
		if index.nil?
			result = 0
			array.each { |x| result += x.to_i }
			return result
		else
			case array[index]
			when '+'
				result = array[index-2].to_i + array[index-1].to_i
			when '-'
				result = array[index-2].to_i - array[index-1].to_i
			when '*'
				result = array[index-2].to_i * array[index-1].to_i
			end
			array[index-2] = result
			array.delete_at(index)
			array.delete_at(index-1)
			string = array.join(' ')
		end
		self.evaluate(string)
	end

end



# 1. DRIVER TESTS GO BELOW THIS LINE

rpn = RPNCalculator.new
p rpn.evaluate('1 1 +')
p rpn.evaluate('-1')






# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => Lots of researching worked. And also following the rules of RPN step by step
#    worked and try to do the same in the code worked.
# What questions did you have while coding? What resources did you find to help you answer them?
# => My main quastion was 'how do I check if a string is one of the mathematical operators?'.
#    I was able to answer that question by researching online.
#    Another question I has was how to convert a string into a math operator(Fixnum).
#    For example, how do I convert '*' into * so I can directly use that to multiply
#    two numbers. I could not find an answer to this question but seems like it is implossible
#    to do this. 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => Stated above.
# Did you learn any new skills or tricks?
# => Matching a string and a regex. 
# How confident are you with each of the learning objectives?
# => Pretty confident with the concept but not sure if was able to refactor my code
#    successfully. I feel like there is a lot moe efficient way to do this.
# Which parts of the challenge did you enjoy?
# => I enjoyed the fact that I was able to come up with the original code fairly
#    quickly. I thought that it would take me a lot longer to come up with a functional
#    code.
# Which parts of the challenge did you find tedious?
# Bug fixing was a little tedious. Also pseudocode!