#
# Terrain - Mainly shrubs right now, some will have berries
#

class Terrain

  def initialize(window)
    @shrub = Image["media/images/shrub.png"]
    @locations = []
    rand(20).times do
      @locations << {x: rand(1024), y: rand(768)}
    end
  end

  def draw
    @locations.each do |loc|
      @shrub.draw(loc[:x], loc[:y], 1)      
    end

  end
end
