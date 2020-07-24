class Directions
  attr_reader :distance, :time

  def initialize(direction_info)
    @distance = direction_info[:distance]
    @time = direction_info[:time]
    @legs = direction_info[:legs]
  end

  def narrative
    narrative = ""
    @legs.first[:maneuvers].each do |maneuver|
      narrative + maneuver[:narrative] + " "
    end 
  end
end
