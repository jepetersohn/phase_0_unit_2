# U2.W6: Create a BoggleBoard Class


# I worked on this challenge by myself.


# 2. Pseudocode
# => DEIFNE #initialize which takes a 2D array called board and assigns that to
#    @borad.
# => DEFINE #create_word which takes undifined number of coordinates as arguments and
#    returns the word created by combining the corrdinates.
# => DEFINE #get_row which takes one row number as an argument and returns the entire
#    elemts on that row.
# => DEFINE #get_column which takes one column number as an argument and returns the entire
#    elemts on that column. 
# => DEFINE #get_diagonal which takes two positions(coordinates) from board and
#    return an array of elements positioned diagonaly.


# 3. Initial Solution
class BoggleBoard

	def initialize(board)
		@board = board
	end
 
 	def create_word(*coords)
		coords.map { |coord| @board[coord.first][coord.last] }.join
	end

	def get_row(row)
		@board[row].join
	end

	def get_column(column)
		@board[0][column] + @board[1][column] + @board[2][column] + @board[3][column] 
	end

	def get_diagonal(coord1, coord2)
		diagonal_1 = [[0, 0], [1, 1], [2, 2], [3, 3]]
		diagonal_2 = [[0, 3], [1, 2], [2, 1], [3, 0]]
		if diagonal_1.include?(coord1)
			return diagonal_1.include?(coord2) ? self.create_word(diagonal_1) : false
		elsif diagonal_2.include?(coord1)
			return diagonal.include?(coord2) ? self.create_word(diagonal_2): false
		else
			return false
		end
	end
end
 
 
dice_grid = [["b", "r", "a", "e"],
             ["i", "o", "d", "t"],
             ["e", "c", "l", "r"],
             ["t", "a", "k", "e"]]
 
boggle_board = BoggleBoard.new(dice_grid)
 


# 4. Refactored Solution






# 1. DRIVER TESTS GO BELOW THIS LINE
# create driver test code to retrieve a value at a coordinate here:
# implement tests for each of the methods here:

def assert 
	raise "Assertion failed!" unless yield
end

assert { boggle_board.create_word([2,1], [1,1], [1,2], [0,3]) == 'code' }
assert { boggle_board.create_word([0,1], [0,2], [1,2]) == 'rad' }

assert { boggle_board.get_row(0) == 'brae'}
assert { boggle_board.get_row(1) == 'iodt'}
assert { boggle_board.get_row(2) == 'eclr'}
assert { boggle_board.get_row(3) == 'take'}

assert { boggle_board.get_column(0) == 'biet'}
assert { boggle_board.get_column(1) == 'roca'}
assert { boggle_board.get_column(2) == 'adlk'}
assert { boggle_board.get_column(3) == 'etre'}

p boggle_board.get_diagonal([0,0], [2,2])
assert { boggle_board.get_diagonal([0,0], [2,2]) == 'bole'}

# 5. Reflection 