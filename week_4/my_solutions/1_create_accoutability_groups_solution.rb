# U2.W4: Create Sccountability Group


# I worked on this challenge myself.

# 2. Pseudocode

# Input:   array, number member in new group
# Output:  array of group number => [array, of, member_name]
# Steps:   1. DEFINE a method called create_groups which takes one argument (array called member, number called n)
#          ----- Inside create_groups method ----
#          2. CREATE an empty array called groups 
#          3. SHUFFLE the array and CALL it groups
#          5. UNTIL the length of the array is less than n, TAKE n elements from array
#             and PUSH the new array into group. 
#          4. SET i to 1   
#          7. ADD each remaining element from the array to groups[i] UNTIL the length of the array 
#             equals to 0
#          8. RETURN groups

# 3. Initial Solution

def create_groups(members, n)
	groups = []
	shuffled = members.shuffle
	groups << shuffled.pop(4) until shuffled.length < 4
	i = 0
	until shuffled.length <= 0
		groups[i] << shuffled.pop
		i += 1
	end
	groups
end

# 4. Refactored Solution

def create_groups(members, n)
	groups = []
	shuffled = members.shuffle
	groups << shuffled.pop(4) until shuffled.length < 4
	i = 0
	shuffled.each { |name| groups[shuffled.index(name)] << name }
	groups
end


# 1. DRIVER TESTS GO BELOW THIS LINE 
members = ["Adam Dziuk", "Adam Ryssdal", "Aki Suzuki", "Allison Wong", "Andra Lally",
 "Andrew McDonald", "Anup Pradhan", "CJ Jameson", "Christopher Aubuchon",
 "Clark Hinchcliff", "Devin A Johnson","Dominick Oddo", "Dong Kevin Kang",
 "Eiko Seino", "Eoin McMillan", "Eric Wehrli","Hunter T. Chapman", "Jacob Persing", "Jon Pabico", "Mary Huerster",
  "Parjam Davoody","Samuel Davis", "Sebastian Belmar", "Shawn Seibert",
   "William Butler Bushyhead", "Yuzu Saijo","christiane kammerl"]

if defined?(create_groups) == "method"
	 puts "true1"
else
	"create_groups is not defined"
end

if create_groups(members, 4).is_a?(Array)
	puts "true2"
else
	puts "create_groups is not returning an array"
end

if create_groups(members, 4).all? { |group| group.length.between?(4,5) }
	puts "true3"
else
	puts "There is one or more group whose number of the member does not eaual either 4 or 5"
end
if create_groups(members, 4).flatten.length === members.length
	puts "true4"
else
	puts "Number of member of original array does not match the one of new"
end

if create_groups(members, 4).flatten.uniq.length === members.length
	puts "true5"
else
	puts "Duplicated name(s) found"
end



# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => Lots and lots of research and testing on irb! That worked.  
# What questions did you have while coding? What resources did you find to help you answer them?
# => How do you create driver code from scratch?? That's the biggest question I had. I sort of had
#    an idea of what the driver codes should be but I think I was overwhelmed with the idea of 
#    creating everthing on my own. Eventually I fgiured it out little by little though.
# Did you learn any new skills or tricks?
# => Creating my own driver code was definitely something I learned for the first time.
#    I learned a whole lot of new methods including .shuffle, .flatten, .uniq, .between?
#    .index()...
# How confident are you with each of the learning objectives?
# => Now I feel pretty comfortatble. I think it takes practice to get used to this routine, 
#    just like it took me a little bit of time to write pseudo code everytime.
# Which parts of the challenge did you enjoy?
# => Using new methods and getting the code to work.
# Which parts of the challenge did you find tedious?
# => Testing on irb. (Lots of copying and pasting)



