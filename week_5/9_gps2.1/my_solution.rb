# U2.W5: Bakery Challenge GPS

# I worked on this challenge with: David Kerr





# Our Refactored Solution

def bakery_num(num_of_people, fav_food)
  # Hash to show the serving zise of each food item 
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  # Raise an error if fav_food is not one of my_list
  raise ArgumentError.new("You can't make that food") if my_list[fav_food].nil?
  # Initialize each quantity at zero
  supplies = { "pie" => 0,
  			   "cake" => 0,
  			   "cookie" => 0 }
  
  left_over = num_of_people % my_list[fav_food]
  supplies[fav_food] = num_of_people/my_list[fav_food]
  if left_over == 0
    "You need to make #{supplies[fav_food]} #{fav_food}(s)."
  else 
    my_list.each do |k, v|
      if left_over >= v 
        supplies[k] = left_over / v
        left_over = left_over % v
      end
    end
    return "You need to make #{supplies['pie']} pie(s), #{supplies['cake']} cake(s), and #{supplies['cookie']} cookie(s)."
  end
end

#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!




#  Reflection 

# What parts of your strategy worked? What problems did you face?
# => JUst working line by line and refactoring where needed worked. 
# What questions did you have while coding? What resources did you find to help you answer them?
# => There difference between p and puts. The instructor(Justin) explained it for us.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => How to refactor the big conditional statement. David and I both knew it needed refactoring
#    but I took us some time to come up with a solid solution. David suggested to use .each iterator 
#    and I think that got us going. 
# Did you learn any new skills or tricks?
# => Not so much of new things but it was a good excercise to think about efficient coding and refactoring.
# How confident are you with each of the learning objectives?
# => Pretty confident now that we're done!
# Which parts of the challenge did you enjoy?
# => I like working with people who put their effort into solving a challenge and open for new ideas.
# Which parts of the challenge did you find tedious?
# => No part was really redious for me but this challenge did make me think a lot!


