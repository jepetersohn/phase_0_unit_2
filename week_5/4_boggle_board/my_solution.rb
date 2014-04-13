# U2.W5: A Nested Array to Model a Boggle Board

# I worked on this challenge by myself.

boggle_board = [["b", "r", "a", "e"],
                ["i", "o", "d", "t"],
                ["e", "c", "l", "r"],
                ["t", "a", "k", "e"]]


# Part 1: Access multiple elements of a nested array


# Pseudocode
# 1. DEFINE a method called create_word whoch takes two or more parameters.
#    One is a nested array called board.
#    The rest are coordinates of the array.
# 2. Inside create_word, collect each value of the coordinates and put them together to a string.
# 3. RETURN the string.

# Initial Solution
def create_word(board, *coords)
	coords.map { |coord| board[coord.first][coord.last] }.join
end

# Refactored Solution

# I didn't refactor this code since it has only one line and could not think of a way to
# change it.

# DRIVER TESTS GO BELOW THIS LINE
 p create_word(boggle_board, [2,1], [1,1], [1,2], [0,3]) === 'code'  
 p create_word(boggle_board, [0,1], [0,2], [1,2]) === 'rad'

# Reflection 

# What parts of your strategy worked? What problems did you face?
# => This code is from the direction given and I just tested the code and see it works, so
#    there were no problems.
# What questions did you have while coding? What resources did you find to help you answer them?
# => No question.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => This was a veru easy challenge. (If I'm doing this right.)
# Did you learn any new skills or tricks?
# => Not really.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Testing the code.
# Which parts of the challenge did you find tedious?
# => Psudocode.

#-------------------------------------------------------------------------------

# Part 2: Write a method that takes a row number and returns all the elements in the row.  

# Pseudocode
# 1. DEFINE a method called get_row which takes one patameter 'row'.
# 2. Inside get_row, return boggle_board[row]

# Initial Solution

def get_row(board, row)
	board[row]
end

# Refactored Solution

# I didn't refactor this code since it has only one line and could not think of a way to
# change it.

# DRIVER TESTS GO BELOW THIS LINE

p get_row(boggle_board, 0) === ["b", "r", "a", "e"]
p get_row(boggle_board, 1) === ["i", "o", "d", "t"]
p get_row(boggle_board, 2) === ["e", "c", "l", "r"]
p get_row(boggle_board, 3) === ["t", "a", "k", "e"]

# Reflection 

# What parts of your strategy worked? What problems did you face?
# => Just simply returning what the mothod is supposed to return.
# What questions did you have while coding? What resources did you find to help you answer them?
# => No question.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => This was a veru easy challenge. (If I'm doing this right.)
# Did you learn any new skills or tricks?
# => Not really.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Writing and testing the code.
# Which parts of the challenge did you find tedious?
# => Psudocode.

#-------------------------------------------------------------------------------

# Part 3: Now write a method that takes a column number and returns all the elements in the column.

# Pseudocode
# 1. DEFINE a method called get_column which accepts two perameters
# 2. CREATE a new array witch includes all of the values of that paticular column
# 3. JOIN the values togetger and make it into a string
# 4. RETURN the string

# Initial Solution

def get_column(board, column)
	[ board[0][column], board[1][column], board[2][column], board[3][column] ].join
end

# Refactored Solution

def get_column(board, column)
	i = 0
	word = []
	until i >= board.length 
		word << board[i][column]
		i += 1
	end
	word.join
end

# DRIVER TESTS GO BELOW THIS LINE
p get_column(boggle_board, 0) ===  "biet"
p get_column(boggle_board, 1) === "roca"
p get_column(boggle_board, 2) === "adlk"
p get_column(boggle_board, 3) === "etre"

# Reflection 

# What parts of your strategy worked? What problems did you face?
# => Not so much of problem but I wasn't really sure if I was supposed to define a mthod that 
#    worls specifically with boggle_board array or just any nested arrays so I refactored my first
#    code and defined a general method .
# What questions did you have while coding? What resources did you find to help you answer them?
# => No question.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# => This was a veru easy challenge. (If I'm doing this right.)
# Did you learn any new skills or tricks?
# => Not really.
# How confident are you with each of the learning objectives?
# => Pretty confident.
# Which parts of the challenge did you enjoy?
# => Writing and testing the code.
# Which parts of the challenge did you find tedious?
# => Psudocode.