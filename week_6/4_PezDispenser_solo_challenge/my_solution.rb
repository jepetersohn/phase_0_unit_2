# U2.W6: PezDispenser Class from User Stories


# I worked on this challenge [by myself, with: ].

# 1. Review the following user stories:
# - As a pez user, I'd like to be able to "create" a new pez dispenser with a group of flavors that 
#      represent pez so it's easy to start with a full pez dispenser.
# - As a pez user, I'd like to be able to easily count the number of pez remaining in a dispenser 
#      so I can know how many are left.
# - As a pez user, I'd like to be able to take a pez from the dispenser so I can eat it.
# - As a pez user, I'd like to be able to add a pez to the dispenser so I can save a flavor for later.
# - As a pez user, I'd like to be able to see all the flavors inside the dispenser so I know the order 
#      of the flavors coming up.


# 2. Pseudocode

#### Instance variables
# => @flavors (attr_reader)
# => @pez_count (attr_reader)

#### Instance methods 
# => #initalize which accepts one parameter(array called flavors) 
# => #add_pez which takes accepts one patameter(string called flavor)
# => #get_pez wich returns the first flavor from flavors

# 3. Initial Solution

class PezDispenser
 	
	attr_reader :flavors, :pez_count

	def initialize(flavors)
		@flavors = flavors
		@pez_count = @flavors.length
	end

	def add_pez(flavor) 
		@flavors.unshift(flavor)
		@pez_count = @flavors.length
	end

	def get_pez
		@pez_count -= 1
		@flavors.shift
	end

end
 


# 4. Refactored Solution

class PezDispenser
 	
	attr_reader :flavors

	def initialize(flavors)
		@flavors = flavors
	end

	def add_pez(flavor)
		@flavors.unshift(flavor)
	end

	def get_pez
		@flavors.shift
	end

	def pez_count
		@flavors.length
	end

end

# 1. DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

flavors = %w(cherry chocolate cola grape lemon orange peppermint raspberry strawberry).shuffle
assert {flavors.instance_of?(Array)}
super_mario = PezDispenser.new(flavors)
assert { super_mario.instance_of?(PezDispenser) }
assert { super_mario.method(:initialize).arity == 1 }
assert { super_mario.method(:add_pez).arity == 1 }
assert { super_mario.method(:get_pez).arity == 0 }
puts "A new pez dispenser has been created. You have #{super_mario.pez_count} pez!"  
puts "Here's a look inside the dispenser:"  
puts super_mario.flavors
assert {super_mario.flavors == flavors}
puts "Adding a purple pez."
super_mario.add_pez("purple")   # mmmmm, purple flavor
puts "Now you have #{super_mario.pez_count} pez!"
assert { super_mario.pez_count == 10 }
puts "Oh, you want one do you?"
puts "The pez flavor you got is: #{super_mario.get_pez}"
puts "Now you have #{super_mario.pez_count} pez!"
assert { super_mario.pez_count == 9 }

# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => This was a lot easier than I thought in the biginning. I just sollowed the direction
#    privided and also th eoriginal test code helped me figure out what exaclty I
#    needed to do.
# What questions did you have while coding? What resources did you find to help you answer them?
# => I din't have many questions but I forgot the syntax for #method so I looked up online.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => This was pretty easy challenge.
# Did you learn any new skills or tricks?
# => Not this time.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => I pretty much enjoyed the whole process.
# Which parts of the challenge did you find tedious?
# => None.