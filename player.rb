class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "media/images/burke_sprite1.png", false)
    @x = @y = 0.0
    @score = 0
  end

  def warp(x,y)
    @x, @y = x, y
  end

  def left
    @x -= 5
  end

  def right
    @x += 5
  end

  def up
    @y -= 5
  end

  def down
    @y += 5
  end

  def move
    @x %= 1024
    @y %= 768
  end  
  
  def draw
    @image.draw(@x, @y, 1)
  end
end
