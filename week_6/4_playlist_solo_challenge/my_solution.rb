# U2.W6: Create a Playlist from Driver Code


# I worked on this challenge by myself.


# Pseudocode
# => CONSTRUCT a class called Song
# => DEFINE #initialize which takes two parameters(two strings, title and artist name)
# => CONSTRUCT a class called Playlist
# => DEFINE #initialize which takes undifined nummber of arguments which are 
#	 all instances of Song and create an array called playlist which includes those
#    Song objects.
# => DEFINE #add which also takes undefined number of Song objects as arguments and 
#    add that to the playlist. 
# => DEFINE #num_of_tracks which returns the current number of elements in playlist.
# => DEINFE #play which is supposed to play the first songs in playlist but for now, we will
#    just reuturs the song.
# => DEINFE #remove which removes a particular Song Object from playlist.
# => DEFINE #includes? which takes one Song object as an argument and returns a 
#    boolean value depending on if the song is currently included in playlist or not.
# => DEFINE #play_all which returns the whole playlist array.
# => DEINFE #display displays the songs and artist that are included in playlist.

# Initial Solution

class Song 

	attr_reader :title, :artist

	def initialize(title, artist)
		@title = title
		@artist = artist
	end

	def play
		puts "Playing #{@title} by #{@artist}"
	end

end

class Playlist

	attr_reader :playlist

	def initialize(*songs)
		@playlist = songs
	end

	def add(*songs)
		songs.each { |song| @playlist << song }
	end

	def num_of_tracks
		@playlist.length
	end

	def remove(song)
		@playlist.delete(song)
	end

	def includes?(song)
		@playlist.include?(song)
	end

	def play_all
		@playlist
	end

	def display
		puts 'Playlist'
		@playlist.each do |song|
			puts "#{song.title} by #{song.artist}"
		end
	end
end


# Refactored Solution

# Each class has methods that they need in order for the code to pass.
# Most methods only have one line of code and I don't see repetition.
# variables and methods have name that is easy to understand and simple.
# Therefore, I could not refactor the code but I'll be checking other students'
# codes to see if I missed anything to make the code more efficient.

# DRIVER TESTS GO BELOW THIS LINE
one_by_one = Song.new("One by One", "Sirenia")
world_so_cold = Song.new("World So Cold", "Three Days Grace") 
going_under = Song.new("Going Under", "Evanescence")
puts "#{one_by_one.title} was created successfully." if one_by_one.instance_of?(Song)
puts "#{world_so_cold.title} was created successfully." if world_so_cold.instance_of?(Song)
puts "#{going_under.title} was created successfully." if going_under.instance_of?(Song)
puts'' 

my_playlist = Playlist.new(one_by_one, world_so_cold, going_under)
puts "Playlist was created successfully." if my_playlist.instance_of?(Song)

lying_from_you = Song.new("Lying From You", "Linkin Park")
angels = Song.new("Angels", "Within Temptation")

my_playlist.add(lying_from_you, angels)
if my_playlist.includes?(lying_from_you) && my_playlist.includes?(angels)
puts "'lying from you' and 'angels' were added to the playlist." 
end
puts ''
puts "There are currently 5 tracks on the playlist" if my_playlist.num_of_tracks == 5
puts ''
going_under.play
puts ''
puts "'angels' was deleted from the playlist" if my_playlist.remove(angels) == angels
puts ''
if my_playlist.playlist == my_playlist.play_all 
	puts "Here's the list of songs we're going to play..."
	my_playlist.play_all.each do |song|
		puts song.title
	end
end
puts ''
my_playlist.display

# Reflection 

# What parts of your strategy worked? What problems did you face?
# => This was fairly easy one too. Surprisingly, driver tests took me the most time.
#    And this time I didn't user assert because I already did that in the previous
#    challenge. Instead, I displayed more lines of strings as I tested each method so 
#    it is clear what is happening. 
# What questions did you have while coding? What resources did you find to help you answer them?
# => No questions.
# What concepts are you having trouble with, or did you just figure something out? If so, what?
# Did you learn any new skills or tricks?
# => Having objects of other class as instance varibles and accessing their information 
#    in a class.
# How confident are you with each of the learning objectives?
# => Pretty confident unless I'm missing something.
# Which parts of the challenge did you enjoy?
# Which parts of the challenge did you find tedious?