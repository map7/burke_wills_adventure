#
# player.rb
#
#  Player movement is controlled by this class
#
class Player
  def initialize(window)
    @images = Gosu::Image.load_tiles(window, "media/images/burke_sprite1.png", 30, 48, false)
    @image = @images[0]
    @x = @y = @walk_cnt = 0.0
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
    walk_up_down
  end

  def down
    @y += 5
    walk_up_down 
  end

  def walk_up_down
    if @walk_cnt > 10
      if @image == @images[0]
        @image = @images[1]
      else
        @image = @images[0]
      end
      @walk_cnt = 0
    else
      @walk_cnt += 1
    end
  end

  def move
    @x %= 1024
    @y %= 768
  end  
  
  def draw
    @image.draw(@x, @y, 1)
  end
end
