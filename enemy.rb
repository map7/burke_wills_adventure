#
# Enemy - holds snakes, drop bears, spider
#

class Enemy
  attr_reader :x, :y
  
  def initialize(window)
    @snake = Gosu::Image.load_tiles(window, "media/images/snake_sprite_60.png", 60, 48, false)
    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end

  def draw
    @snake[0].draw(@x,@y,1)
  end
end
