#
# Terrain - Mainly shrubs right now, some will have berries
#

class Terrain

  def initialize(window)
    @shrub = Gosu::Image.new(window, "media/images/shrub.png",true)
  end

  def draw(x,y)
    @shrub.draw(x, y, 1)
  end
end
