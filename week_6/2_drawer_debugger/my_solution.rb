# U2.W6: Drawer Debugger


# I worked on this challenge by myself.


# 2. Original Code

class Drawer

	attr_reader :contents

	# Are there any more methods needed in this class?

	def initialize
		@contents = []
		@open = true
	end

	def open
		@open = true
	end

	def close
		@open = false
	end 

	def add_item(item)
		@contents << item
	end

	def remove_item(item = @contents.last) #what is `#pop` doing?
		@contents.delete(item)
	end

	def dump  # what should this method return?
		puts "Your drawer is empty."
	end

	def view_contents
		puts "The drawer contains:"
		@contents.each {|silverware| puts "- " + silverware.type }
	end
end

class Silverware
	attr_reader :type

	# Are there any more methods needed in this class?

	def initialize(type, clean = true)
		@type = type
		@clean = clean
	end

	def eat
		puts "eating with the #{type}"
		@clean = false
	end

	def clean_silverware
		@clean = true
	end

end

knife1 = Silverware.new("knife")

silverware_drawer = Drawer.new
silverware_drawer.add_item(knife1) 
silverware_drawer.add_item(Silverware.new("spoon"))
silverware_drawer.add_item(Silverware.new("fork")) 
silverware_drawer.view_contents

silverware_drawer.remove_item
silverware_drawer.view_contents
sharp_knife = Silverware.new("sharp_knife")


silverware_drawer.add_item(sharp_knife)

silverware_drawer.view_contents

removed_knife = silverware_drawer.remove_item(sharp_knife)
removed_knife.eat
removed_knife.clean_silverware 

silverware_drawer.view_contents
silverware_drawer.dump
silverware_drawer.view_contents #What should this return?

fork = Silverware.new("fork")
silverware_drawer.add_item(fork) 
removed_fork = silverware_drawer.remove_item(fork) #add some puts statements to help you trace through the code...
removed_fork.eat

#BONUS SECTION

puts removed_fork.clean_silverware

# DRIVER TESTS GO BELOW THIS LINE

def assert
  raise "Assertion failed!" unless yield
end

assert { silverware_drawer.close === false }
assert { silverware_drawer.open === true }
assert { sharp_knife.clean_silverware === true }
chopsticks = Silverware.new("chopsticks")
silverware_drawer.add_item(chopsticks)
assert { silverware_drawer.remove_item.type == 'chopsticks' }

# 5. Reflection

# What parts of your strategy worked? What problems did you face?
# => It was pretty straight forward.
# What questions did you have while coding? What resources did you find to help you answer them?
# => What exacty Ruby prints when you puts an object? Just tested on IRB and figure it out.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => At line 95 where I wa suppsed to fix the bug, it tool a little bit of playing 
# => around to figure it out.
# Did you learn any new skills or tricks?
# => I got a depper understanding os what methods return by testing with assert.
# How confident are you with each of the learning objectives?
# => I feel good that I'm getting better understanding things in general, but 
# => feel like it'll take time and practices to understand fully how everything works
# => in Ruby. 
# Which parts of the challenge did you enjoy?
# => Fixing bugs and getting the code to pass. And also playing with assert.
# Which parts of the challenge did you find tedious?
# => There were some times that I'd get stuck trying to use a certain method and
# => din't get the result I was expecting but it was a good opportunity to learn.