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

    case shrub
    when 1
      @shrub = @shrubs[0]
    when 2
      @shrub = @shrubs[1]
      @color = "red"
    when 3
      @shrub = @shrubs[2]
      @color = "purple"
    else
      @shrub = @shrubs[0]
    end
  end

  def draw
    @locations.each do |loc|
      @shrub.draw(loc[:x], loc[:y], 1)      
    end

  end
end
