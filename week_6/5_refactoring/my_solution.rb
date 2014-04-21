# U2.W6: Refactoring for Code Readability


# I worked on this challenge Sebastian Belmar.


# Original Solution

# class CreditCard # def class
#   def initialize(num) # initialize method with one parameter, an integer 
#     @num = num   # Def instance variable @num = to paramter 
#     @arr_num = num.to_s.split(//) #REFACTOR! Convert number to an array of digits in strings REFACTOR!
#     if @arr_num.length != 16 #REFACTOR! Raise error if @arr_num is not 16 
#       raise ArgumentError.new("Number must be 16 digits long")
#     end
#     @doubled = double_idx_even #REFACTOR! Defining an instance variable using method created later when initalizing
#     @sum = sum # Defing an instance variable using method created later
#   end

#   def double_idx_even # Turns @arr_num into an array of integers and double all even index positions
#     cal = Array.new # holds the new array
#     @arr_num.each_with_index {|x|, index|
#       if index.even? # if its index is even
#         cal.push(x.to_i * 2) # Double the number and push it into cal
#       else
#         cal.push(x.to_i)
#       end
#     }

#     return cal #arr with 16 elements (integers that can be double digits) 
#     # [8   5  12   3  18   6   0   1   4   2   0   0   2   9  18   9]
#   end

#   def sum
#     cal = Array.new
#     @doubled = @doubled.map {|x| x.to_s.split('')} #arr with 16 subarr whose elem are strings
#     # [1,2,3,14,5,16].map {|x| x.to_s.split('')}
#     #@doubled =  [["1"], ["2"], ["3"], ["1", "4"], ["5"], ["1", "6"]]
#     #each
#     # [["1"], ["2"], ["3"], ["1", "4"], ["5"], ["1" ,"6"]]
#     # cal = [1,2,3,5,5,7]
    
#     @doubled = @doubled.each {|x| # Pushes into cal single digit integer (add doble digits from @double)
#       if x.length == 2            # or pushes single digit straight to cal. Cal = single digits integer array
#         cal.push(x[0].to_i + x[1].to_i)
#       else
#         cal.push(x[0].to_i)
#       end
#     }

#     result = cal.inject {|sum, x| sum += x} #cal = arr of 16 integers #REFACTOR!
#     return result #70
#   end

#   def check_card
#     if @sum % 10 #REFACTOR! Here there is not a conditional so it will retun true all time wont hit else ever.
#       return true
#     else
#       return false
#     end
#   end
# end


# Refactored Solution

class CreditCard
  def initialize(num)
    raise ArgumentError, "Number must be 16 digits long" if num.to_s.length != 16
    @num = num
    @sum = sum
  end

  def sum
    sum = 0
		i = 1
		@num.to_s.reverse.each_char do |c|
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
		return sum
  end

  def sum
    integer_number = @num.to_s.scan(/./).map(&:to_i)
    integer_number.each_index { |index| integer_number[index] *= 2 if index.even? }.join.scan(/./).map(&:to_i).inject(:+)
  end

  def check_card
    @sum % 10 == 0
  end
end



# Example given 4563 9601 2200 1999
# Origin: "4"   "5"   "6"   3   9   6   0   1   2   2   0   0   1   9   9   9
# Step 1: 8   5  12   3  18   6   0   1   4   2   0   0   2   9  18   9
# Step 2: 8 + 5 + 1 + 2 + 3 + 1 + 8 + 6 + 0 + 1 + 4 + 2 + 0 + 0 + 2+ 9 + 1 + 8 + 9
# Step 3: 70 (total above) % 10 == 0
# Step 4: Profit



# p test.double.class == Array
# p test.sum.class == Fixnum
# p CreditCard.new(4563960122001999).check_card == true


# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assert Faild" unless yield
end

cc_1 = CreditCard.new(4408041234567893)
assert{cc_1.instance_of?(CreditCard)} #testing if cc_1 is an instance of the class Credit Crad
assert{cc_1.check_card == true} #test Check Card method

cc_2 = CreditCard.new(4408041234567892)
assert{cc_2.instance_of?(CreditCard)} #testing if cc_1 is an instance of the class Credit Crad
assert{cc_2.check_card == false} #test Check Card method

# Reflection 

# What parts of your strategy worked? What problems did you face?
# => It really took up a ling time to refactor the code! We kept getting bugs.
# What questions did you have while coding? What resources did you find to help you answer them?
# => We looked up online doc to refresh our knowledge of dome methods.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => Juat getting some methods to work properly.
# Did you learn any new skills or tricks?
# => By workign with Sebastian, I learned lot of new methods and how to use them.
# 	 For example, #scan(/./), #map(&:to_i), #inject(:+)
# How confident are you with each of the learning objectives?
# => Not too confident. Especially with my skill on using methods efficiently.  
# Which parts of the challenge did you enjoy?
# => Figuring out what the original code was doign step by step. Also learing new methods.
# Which parts of the challenge did you find tedious?
# => Bug fixing!