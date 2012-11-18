#
# Terrain - Mainly shrubs right now, some will have berries
#

class Terrain

  def initialize(window, shrub)
    @locations = []
    rand(20).times do
      @locations << {x: rand(1024), y: rand(768)}
    end
    @shrubs = Gosu::Image.load_tiles($window, "media/images/shrub_sprite_50.png", 50, 48, false)
    @shrub = @shrubs[0]
    
    case shrub
    when 0
      @shrub = @shrubs[0]
    when 1
      @shrub = @shrubs[1]
      @color = "red"
    when 2
      @shrub = @shrubs[2]
      @color = "purple"
    when 3
    end
  end

  def draw
    @locations.each do |loc|
      @shrub.draw(loc[:x], loc[:y], 1)      
    end

  end
end
