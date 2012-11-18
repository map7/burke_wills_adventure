#
# Enemy - holds snakes, drop bears, spider
#
class Enemy
  attr_reader :x, :y, :type, :points
  
  def initialize(window, enemy)
    case enemy
    when 0
      @enemy = Gosu::Image.load_tiles($window,"media/images/spider_sprite_55.png",60,48,false)  
      @type = "Spider"
      @points = 10
    when 1
      @enemy = Gosu::Image.load_tiles($window, "media/images/snake_sprite_60.png",60, 48, false)
      @type = "Snake"
      @points = 30
    end

    @x = rand(WIDTH)
    @y = rand(HEIGHT)
  end

  def draw
    @enemy[0].draw(@x,@y,1)
  end
end
