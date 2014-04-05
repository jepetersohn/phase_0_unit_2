# U2.W4: Refactor Cipher Solution


# I worked on this challenge by myself.


# 1. Solution
# Write your comments on what each thing is doing. 
# If you have difficulty, go into IRB and play with the methods.
# Also make sure each step is necessary. If you don't think it's necessary
# Try implementing the code without it. 

def translate_to_cipher(sentence)
    # convert the range of alphabets into an array
    alphabet = ('a'..'z').to_a
    # alphabet.rotate(4) shifts the elements of the array by four to the left.
    # => So now fifth element 'e' becomes the first pushing all the elemnts before 'e'
    # => to the end of the array.
    # .zip merges each element of self(alphabet array) with that of rotated version.
    # => This will make an array of two element arrays. 
    # Finally, Hash convers the resulted array into a hash by taking each two element 
    # => array as key and value pair.
    cipher = Hash[alphabet.zip(alphabet.rotate(4))]
    # Array of various symbols called spaces.
    spaces = ["@", "#", "$", "%", "^", "&", "*"]
    
    # Downcasing the content of sentence which was supplied as an argument
    # => and calling it original sentence.
    original_sentence = sentence.downcase
    # Initializing a new array called encoded_sentence.
    encoded_sentence = []
    # Passing each character of original_sentence (calling it element) to a block
    original_sentence.each_char do |element|
      # If element is included in cipher array
      if cipher.include?(element)
        # Push cipher[element] into encoded_sentence
        encoded_sentence << cipher[element]
      # If element is a white space
      elsif element == ' '
        # Pick a random element from spaces array and push it into encoded_sentence.
        encoded_sentence << spaces.sample
      # Otherwise put element itself into encoded_sentence
      else 
        encoded_sentence << element
      end
     end
    # Convert each element of encoded_sentence to an array and return it.
    return encoded_sentence.join
end


# Questions:
# 1. What is the .to_a method doing?
# => Taking a range of alphabet(from a to z) and converting it to an array.
# 2. How does the rotate method work? What does it work on?
# => It works on an array. Takes an integer as an argument and rotates, or shifts the
#    entire elements to the left by the given number. If negative integer is given, 
#    it shifts to the opposite direction.
# 3. What is `each_char` doing?
# => Taking each character of original_sentence string and apply it to the given block.
# 4. What does `sample` do?
# => Takes an array and picks a random element from it and return it.
# 5. Are there any other methods you want to understand better?
# => Not really. After doing some research, I understand each method clearly.(I think...)
# 6. Does this code look better or worse than your refactored solution 
#    of the original cipher code? What's better? What's worse?
# => I like this code much better. It is cleaner because there is eliminates the big hash 
#    definition and also no .each inside another .each. Every chahracter is being tested 
#    inside one iterator. It's very easy to follow what is going on too.
# 7. Is this good code? What makes it good? What makes it bad?
# => It's a good code because as I explained above, it's efficient, clean and easy to follow.


# 1. DRIVER TESTS GO BELOW THIS LINE
# Does this return the same thing every time?
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")
p translate_to_cipher("I want cookies")





# 5. Reflection 

# What parts of your strategy worked? What problems did you face?
# => Just figuring out the code line by line always works.
# What questions did you have while coding? What resources did you find to help you answer them?
# => No questions since this was very similar to the previous challenge.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => The concept wasn't very hard to understand. Some lines of the code took me some research to 
#    understand though.
# Did you learn any new skills or tricks?
# => .zip, Hash[], .rotate and .sample. Those were new methods I learned.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Understanding the code line by line.
# Which parts of the challenge did you find tedious?
# => Commenting. It wasn't so bad though.