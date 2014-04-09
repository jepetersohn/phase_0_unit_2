# U2.W5: The Bakery Challenge (GPS 2.1)

# Your Names
# 1) David Kerr
# 2) Eiko Seino

 # This is the file you should end up editing. 

# Defining a method bakery_num with two arguments, one is number of people
# cooking for and the second one is name if foof item
def bakery_num(num_of_people, fav_food)
  # Hash to show the serving zise of each food item 
  my_list = {"pie" => 8, "cake" => 6, "cookie" => 1}
  # Raise an error if fav_food is not one of my_list
  raise ArgumentError.new("You can't make that food") if my_list[fav_food].nil?
  # Initialize each quantity at zero
  supplies = { "pie" => 0,
  "cake" => 0,
  "cookie" => 0}
  
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
 

#-----------------------------------------------------------------------------------------------------
#DRIVER CODE-- DO NOT MODIFY ANYTHING BELOW THIS LINE (except in the section at the bottom)
# These are the tests to ensure it's working. 
# These should all print true if the method is working properly.
# When given two argumetns it should return the correct number of food items
p bakery_num(24, "cake") == "You need to make 4 cake(s)."
puts bakery_num(24, "cake")
p bakery_num(41, "pie") == "You need to make 5 pie(s), 0 cake(s), and 1 cookie(s)."
p bakery_num(24, "cookie") == "You need to make 24 cookie(s)."
p bakery_num(4, "pie") == "You need to make 0 pie(s), 0 cake(s), and 4 cookie(s)."
p bakery_num(130, "pie") == "You need to make 16 pie(s), 0 cake(s), and 2 cookie(s)."
# p bakery_num(3, "apples") # this will raise an ArgumentError

# You SHOULD change this driver code. Why? Because it doesn't make sense.
p bakery_num(41, "cake") == "You need to make 0 pie(s), 6 cake(s), and 5 cookie(s)." # WHAAAAAT? I thought I said I wanted cake!
puts bakery_num(41, "cake")