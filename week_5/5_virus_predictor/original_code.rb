# U2.W5: Virus Predictor

# I worked on this challenge with Jake Persing

# EXPLANATION OF require_relative
# Declaring a separate file to be used in this program.
# Relative means that this file to be included is in the same relative location as the original file.
require_relative 'state_data'

# Hash with a nested hash in it.
# Nested hash is using symbols instead of strings.

class VirusPredictor
# Initialize method gives values to each instance of the class
  def initialize(state_of_origin, population_density, population, region, regional_spread)
    @state = state_of_origin
    @population = population
    @population_density = population_density
    @region = region
    @next_region = regional_spread
  end

# Instance variables can be used by any method as long as they are within the class or inherited class
# Calls other methods that are in the class. (predicted_deaths and speed_of_spread) 
  def virus_effects  #HINT: What is the SCOPE of instance variables?
    # We removed unnecessary parameters from both predicted_deaths and speed_of_spread
    predicted_deaths
    speed_of_spread
  end

# Private is declaring all the method defined below it cannot be accessed outside of the class.
# It would make virus_effects also a private method and we would not be able to access it outside of the class. (Driver code)
  private  #what is this?  what happens if it were cut and pasted above the virus_effects method

# Takes population_density and population, and state as parameters.
# returns the number_of_deaths based on its population_density.
  def predicted_deaths
    case @population_density
      when @population_density >= 200 
        number_of_deaths = (@population * 0.4).floor
      when 150..199
        number_of_deaths = (@population * 0.3).floor
      when 100..149
        number_of_deaths = (@population * 0.2).floor
      when 50..99
        number_of_deaths = (@population * 0.1).floor
      else
        number_of_deaths = (@population * 0.05).floor
    end

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

# Takes populatoin_density and state as parameters.
# Returns the number of months it will take the virus to spread.
  def speed_of_spread #in months
    speed = 0.0
    case @population_density
      when @population_density >= 200
        speed += 0.5
      when 150..199
        speed += 1
      when 100..149
        speed += 1.5
      when 50..99
        speed += 2
      else 
        speed += 2.5
      end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state

STATE_DATA.each do |x,y|
  VirusPredictor.new(x, y[:population_density],y[:population],y[:region],y[:regional_spread]).virus_effects
end



