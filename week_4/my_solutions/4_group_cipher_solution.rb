# U2.W4: Cipher Challenge


# I worked on this challenge with Sebastian Belmar.



# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.

def north_korean_cipher(coded_message) # Define a method called north_korean_cipher which accepts one parameter
  # Downcase coded_sentence and turn it into an array of each character
  input = coded_message.downcase.split("") # Check out this method in IRB to see how it works! Also refer to the ruby docs.
  decoded_sentence = [] # Initiate an empty array which will hold the decoded sentence.
  cipher = {"e" => "a",   # This is technically a shift of four letters...Can you think of a way to automate this? Is a hash
            "f" => "b",   # the best data structure for this problem? What are the pros and cons of hashes?
            "g" => "c",   # Hash of its keys being the code and values being the decoded alphabet
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z"}
  # Taking each element of input and applying block           
  input.each do |x| # What is #each doing here?
    found_match = false  # Why would this be assigned to false from the outset? What happens when it's true?
                         # Flag value to be assinged true when the character matches the one of cipher and false doesn't need translation.
    cipher.each_key do |y| # What is #each_key doing here?
                           # Iterating over keys of cipher
                          
      if x == y  # What is this comparing? Where is it getting x? Where is it getting y? What are those variables really?
                 # Take each key from cipher and compare with x
                 # x is from input array: decoded character
                 # y is from keys of cipher hash: these are rotated version of an array of alphabets
        puts "I am comparing x and y. X is #{x} and Y is #{y}." # If x == y puts this string. It interpolates x and y and prints them.
        decoded_sentence << cipher[y] # Pushes value of cipher[y] to decoded sentence.
        found_match = true # Change the flag value to true
        break  # Why is it breaking here?
               # Getting out of cipher.each iteration and going back to the beginning of input.each.
      elsif x == "@" || x == "#" || x == "$" || x == "%"|| x == "^" || x == "&"|| x =="*" #What the heck is this doing?
                                                                                          # Translating any of these characters into a space.
        decoded_sentence << " " # Puch the space into decoded_sentence.
        found_match = true # Change the flag value to true.
        break  # Getting out of cipher.each iteration and going back to the beginning of input.each.
      elsif (0..9).to_a.include?(x) # Try this out in IRB. What does   " (0..9).to_a "    do?
                                    # Takes the range of intergers from 0 to 9 and turn them into an array of those integers inorder to use .include.
                                    # .include checks to see if x is contained inside the array and return a boolean value.
        decoded_sentence << x # If true, pushes x into decoded_sentense
        found_match = true # Change the flag value to true
        break  # Getting out of cipher.each iteration and going back to the beginning of input.each.
      end 
    end
    if not found_match  # What is this looking for?
                        # If there is no match for x, found_match would still false
      decoded_sentence << x # Put x itself into decoded_sentence
    end
  end
  decoded_sentence = decoded_sentence.join("") # Turn decoded_sentence into a string.
 
  if decoded_sentence.match(/\d+/) #What is this matching? Look at Rubular for help. 
                                   # .match will find if there is any degit in decoded_sentence and returns true or false
    decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 } #He's been known to exaggerate...
                                                           # It replaces the found degit with itself divided by 100.
  end  
  return decoded_sentence # What is this returning?        
                          # Return decoded_sentence
end

# Your Refactored Solution

def north_korean_cipher(coded_message)
  input = coded_message.downcase.split("") 
  decoded_sentence = [] 
  cipher = {"e" => "a",   
            "f" => "b",  
            "g" => "c",   
            "h" => "d", 
            "i" => "e", 
            "j" => "f",
            "k" => "g",
            "l" => "h",
            "m" => "i",
            "n" => "j",
            "o" => "k",
            "p" => "l",
            "q" => "m",
            "r" => "n",
            "s" => "o",
            "t" => "p",
            "u" => "q",
            "v" => "r",
            "w" => "s",
            "x" => "t",
            "y" => "u",
            "z" => "v",
            "a" => "w",
            "b" => "x",
            "c" => "y",
            "d" => "z",
            "@" => " ",
            "#" => " ",
            "$" => " ",
            "%" => " ",
            "^" => " ",
            "&" => " ",
            "*" => " ",
            }
  input.each do |korean_chr| 
    
    found_match = false  
    
    cipher.each_key do |korean_index| 
      if korean_index == korean_chr
        puts "We translate the Korean Character #{korean_chr} into the English letter #{cipher[korean_index]}."  
        decoded_sentence << cipher[korean_index] 
        found_match = true 
        break 
      end 
    end
    
     decoded_sentence << korean_chr  unless found_match
      
  end
  
  decoded_sentence = decoded_sentence.join("") 
  
 
  if decoded_sentence.match(/\d+/) 
     decoded_sentence.gsub!(/\d+/) { |num| num.to_i / 100 }
  end 

  puts ""
  puts "All numbers where divided by 100 and any other character did not need transalation."
  puts ""
  puts "ORIGINAL MESSAGE:"
  puts coded_message
  puts ""
  puts "DECODED MESSAGE:"
  return decoded_sentence
  puts ""

end

# Driver Code:
p north_korean_cipher("m^aerx%e&gsoi!") == "i want a coke!" # Test a sentence.
p north_korean_cipher("efghi") == "abcde" # Test shift in alphabet.
p north_korean_cipher("100000") == "1000" # Test numbers.
p north_korean_cipher("xshec%mw@jvmhec.") == "today is friday." # Test spacer characters.

# Find out what Kim Jong Un is saying below and turn it into driver code as well. Driver Code statements should always return "true"
p north_korean_cipher("syv@tistpi$iex#xli*qswx*hipmgmsyw*erh*ryxvmxmsyw%jsshw^jvsq^syv#1000000#tvsjmxefpi$jevqw.")
p north_korean_cipher("syv%ryoiw#evi#liph^xskixliv@fc^kveti-jpezsvih@xsjjii.*hsr'x%xipp&xli#yw!")
p north_korean_cipher("mj^csy&qeoi^sri*qmwxeoi,%kir.*vm@csrk-kmp,&csy^ampp*fi&vitpegih*fc@hirrmw&vshqer.")
p north_korean_cipher("ribx^wxst:$wsyxl%osvie,$xlir$neter,#xlir%xli%asvph!")
p north_korean_cipher("ger^wsqifshc*nywx^kix^qi&10000*fekw@sj$gssp%vergl@hsvmxsw?")

# Reflection

# What parts of your strategy worked? What problems did you face?
# => In the beginning, I had no idea what's going on with the code. With time and Sebastian's
#    help, I understood it.
#    We just took our time and figured out the details of the code line by line. 
# What questions did you have while coding? What resources did you find to help you answer them?
# => We couldn't reacall the terminology of few functions even though we new how to use them 
#    so we looked up on internet. 
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => At first, what exactly this method is doing took us some time to figure out.
# Did you learn any new skills or tricks?
# => I leared some new methods like .gsub, .match.
# How confident are you with each of the learning objectives?
# => Pretty confident with Sebastian's help.
# Which parts of the challenge did you enjoy?
# => Trying to figure out the code line by line.
# Which parts of the challenge did you find tedious?
# => Commenting.