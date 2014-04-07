# U2.W4: Homework Cheater!


# I worked on this challenge with Samuel Davis.

# 2. Pseudocode

# Input: title, topic, date, thesis_statment, pronoun in array form to the method
# Output: I need to do several things in this problem. I need to correctly pass all of the arguments into the method and utilize them to make up a nice paragraph. I also need to make sure to create an object and follow simple English rules when writing the paragraph.
# Steps: I need to bring in all of the arguments and use the title give to write it out. Then I can use the "topic" to create the object. Then write out the thesis while ensuring that I follow correct rules of English. Return the essay as a string.

# 3. Initial Solution

def essay_writer(title, topic, date, thesis_statement, pronoun)
  if pronoun == "male"
    who = "He" 
    whose = "His"
    whom = "Him"
  
  elsif pronoun == "female"
    who = "She"
    whose = "Her"
    whom = "Her"
  
  else
    who = "It"
    whose = "Its"
    whom = "Its"
  end
  
  return who + " was an important person in " + date.to_s + ". " + who + " did a lot. I want to learn more about him. " + thesis_statement + " " +  topic.to_s + "'s contribution is important."
  
end



# 4. Refactored Solution

# Eiko's solution
class Pronoun
	attr_reader :pronoun, :who, :whose, :whom, :type, :last_name
	
	def initialize(pronoun)
    	@pronoun = pronoun
    	if @pronoun == "male"
    		@who = "He" 
    		@whose = "His"
    		@whom = "Him"
    		@type = 'person'
  		elsif @pronoun == "female"
    		@who = "She"
    		@whose = "Her"
    		@whom = "Her"
    		@type = "person"
 		else
    		@who = "It"
    		@whose = "Its"
    		@whom = "It"
    		@type = "thing"
  		end
  	end
end

def essay_writer(title, topic, date, thesis_statement, pronoun)
  pnoun = Pronoun.new(pronoun)
  last_name = (pnoun.type == 'person') ? topic.split[0] : topic
  "#{topic} was an important #{pnoun.type} in #{date.to_s}. #{pnoun.who} did a lot. I want to learn more about #{pnoun.whom.downcase}. #{thesis_statement} #{last_name}'s contribution is important." 
end



# 1. DRIVER TESTS GO BELOW THIS LINE

puts essay_writer("The First Shogun", "Tokugawa Ieyasu", 1603, "His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years.", 'male') === "Tokugawa Ieyasu was an important person in 1603. He did a lot. I want to learn more about him. His most important contribution to history is that he founded the Tokugawa period, a peaceful time that lasted over 200 years. Tokugawa's contribution is important." 
puts essay_writer("A Great Scientist", "Curie Marie", 1903, "She was the first women to receive the Nobel Prize and the first person to win it for 2 separate categories.", 'female') === "Curie Marie was an important person in 1903. She did a lot. I want to learn more about her. She was the first women to receive the Nobel Prize and the first person to win it for 2 separate categories. Curie's contribution is important."
puts essay_writer("Crown of Palaces", "Taj Mahal", 1640, "The Taj Mahal is widely recognized as 'the jewel of Muslim art in India and one of the universally admired masterpieces of the world's heritage'.", 'place') === "Taj Mahal was an important thing in 1640. It did a lot. I want to learn more about it. The Taj Mahal is widely recognized as 'the jewel of Muslim art in India and one of the universally admired masterpieces of the world's heritage'. Taj Mahal's contribution is important."

# 5. Reflection

# What parts of your strategy worked? What problems did you face?
# => Workin with my peer pairing partner Samluel and getting his opinions and helped because I wasn't really
# 	 what to do with this problem initially.
# What questions did you have while coding? What resources did you find to help you answer them?
# => How do I impliment an object to generate an appropriate pronoun? Sam had his idea of creating an object
#    for pronoun and although we had to modify a bit to complete it, it helpled me visualize how to 
#    do it. 
# Did you learn any new skills or tricks?
# => Creating my first class! Especially attr_readers were very exciting.
# How confident are you with each of the learning objectives?
# => Thanks to Sam, pretty confident.
# Which parts of the challenge did you enjoy?
# => As always, creating a code and passing the test is always nice. Also building a class was fun.
# Which parts of the challenge did you find tedious?
# => Fixing bugs to pass the test was a little time consuming.

