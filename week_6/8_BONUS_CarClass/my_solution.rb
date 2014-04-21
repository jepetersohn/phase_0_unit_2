# U2.W6: Create a Car Class from User Stories


# I worked on this challenge [by myself, with: ].


# 2. Pseudocode
# => DEINFE a class called Car
# => DEFINE attr_accessor (speed, distance)
# => DEFINE #initialize wich takes two parameter(model, type)
# => DEINFE #straight which takes two parameters(distance, speed which is optional)
# => DEFINE #left witch which assigns @last_action to left.
# => DEINFE #right which assigns @last_action to right.
# => DEFINE #accelerate(speed)
# => DEFINE #decelerate(speed)
# => DEFINE #stop
# => DEFINE #display


# 3. Initial Solution

class Car

	attr_accessor :speed, :total_distance
	attr_reader :model, :type, :last_action

	def initialize(model, type)
		@model = model
		@type = type
		@speed = 0
		@total_distance = 0
	end

	def straight(distance, speed=@speed)
		@total_distance += distance
		@speed = speed
		@last_action = 'going straight'
	end

	def left(speed)
		@speed = speed
		@last_action = 'turned left'
	end

	def right(speed)
		@speed = speed
		@last_action = 'turned right'
	end

	def accelerate(speed)
		if speed <= @speed
			raise "Can't accelerate to lower speed!"
		end
		@last_action = 'accelerated'
		@speed = speed
	end

	def decelerate(speed)
		if speed >= @speed
			raise "Can't decelerate to higher speed!"
		end
		@last_action = 'decelerated'
		@speed = speed
	end

	def stop
		@speed = 0
		@last_action = 'stopped'
	end

	def display
		puts "The car has #{@last_action}." 
		puts "The current speed is #{@speed}mph and the total distance it's traveled so far is #{total_distance} mile(s)."
	end

end



# 4. Refactored Solution

class Car
 
	attr_reader :model, :type, :speed, :total_distance, :last_action, :pizza, :destination

	def initialize(model, type, pizza=nil)
		@model = model
		@type = type
		@speed = 0
		@total_distance = 0
		@last_action = 'stopped'
		@pizza = pizza
	end

	def straight(distance, speed=@speed)
		@total_distance += distance
		@speed = speed
		@last_action = 'going straight'
	end

	def left(speed)
		@speed = speed
		@last_action = 'turned left'
	end

	def right(speed)
		@speed = speed
		@last_action = 'turned right'
	end

	def accelerate(speed)
		if speed <= @speed
			raise "Can't accelerate to lower speed!"
		end
		@last_action = 'accelerated'
		@speed = speed
	end

	def decelerate(speed)
		if speed >= @speed
			raise "Can't decelerate to higher speed!"
		end
		@last_action = 'decelerated'
		@speed = speed
	end

	def stop
		@speed = 0
		@last_action = 'stopped'
	end

	def display
		puts @last_action == 'going straight' ? "The car is going straight" : "The car has #{@last_action}."  
		puts "The current speed is #{@speed}mph and the total distance it's traveled so far is #{total_distance} mile(s)."
	end

	def drop_off
		@pizza.shift
	end

end

class Pizza 

	attr_accessor :size, :crust, :address
	attr_reader :name, :toppings

	def initialize(name, size='large', crust='regular')
		@name = name
		@size = size
		@crust = crust
		@toppings = []
		@adress = {}
	end

	def add_toppings(*toppings)
		@toppings.concat(toppings)
	end

	def remove_toppings(*toppings)
		toppings.each do |topping|
			@toppings.delete_if { |t| t == topping }
		end
	end

	def change_crust(crust)
		self.crust=(crust)
	end

	def change_size(size)
		self.size=(size)
	end

	def deliver_to(street, zip)
		@address = {street: street, zip: zip}
	end
end


# 1. DRIVER TESTS GO BELOW THIS LINE

def assert
	raise "assert failed!" unless yield
end

pepperroni_pizza = Pizza.new('pepperroni')
pepperroni_pizza.add_toppings('pepperroni', 'cheese')
p pepperroni_pizza.toppings
pepperroni_pizza.change_crust('thin')
p pepperroni_pizza.crust
pepperroni_pizza.remove_toppings('cheese')
p pepperroni_pizza.toppings
pepperroni_pizza.deliver_to('1085 S Redondo Blvd', 90019)
p pepperroni_pizza.address

vegi_pizza = Pizza.new('vegitable', 'small', 'cheese')
vegi_pizza.add_toppings('mushroom', 'pepper', 'basil')

pizza_list = [pepperroni_pizza, vegi_pizza]
my_nissan = Car.new('nissan', 'alitma', pizza_list )

assert { 
	if my_nissan.instance_of?(Car)
		puts "#{my_nissan.model} '#{my_nissan.type}' was created!" 
		true 
	end
}
puts ''

my_nissan.straight(0.25, 25)
assert {  my_nissan.total_distance == 0.25 && my_nissan.speed == 25 }
my_nissan.display
puts ''

my_nissan.stop
assert { my_nissan.speed == 0 }
my_nissan.display
puts ''

my_nissan.right(10)
assert { my_nissan.last_action == 'turned right' }
my_nissan.display
puts ''

my_nissan.straight(1.5, 35)
assert { my_nissan.total_distance == 1.75 && my_nissan.speed == 35 }
my_nissan.display
puts ''

my_nissan.decelerate(15)
assert { my_nissan.speed == 15 }
my_nissan.display

my_nissan.straight(0.25)
assert { my_nissan.total_distance == 2.0 && my_nissan.speed == 15 }
my_nissan.display
puts ''

my_nissan.left(10)
assert {  my_nissan.last_action == 'turned left' }
my_nissan.display
puts ''

my_nissan.straight(1.4, 35)
assert {  my_nissan.total_distance == 3.4 && my_nissan.speed == 35 }
my_nissan.display
puts ''

# my_nissan.accelerate(15)
my_nissan.accelerate(45)
assert { my_nissan.speed == 45 }
my_nissan.display
puts ''

# my_nissan.decelerate(55)
my_nissan.decelerate(25)
assert { my_nissan.speed == 25 }
my_nissan.display
puts ''

my_nissan.stop
assert { my_nissan.speed == 0 }
my_nissan.display

puts my_nissan.drop_off.name + ' pizza was dropped off!'
puts "Next one to drop off is #{my_nissan.pizza.first.name} pizza."

# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => Just following the user story as a guide. 
# What questions did you have while coding? What resources did you find to help you answer them?
# => Once I fugured out the user story, there were no question.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => No troubles.
# Did you learn any new skills or tricks?
# => Not really. It felt like I got to practice what I leeared this week.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Creating the classes.
# Which parts of the challenge did you find tedious?
# => Testing the code.