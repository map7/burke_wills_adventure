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
    @image = @images[5]    
  end

  def right
    @x += 5
    @image = @images[4]
  end

  def up
    @y -= 5
    walk_up
  end

  def down
    @y += 5
    walk_down 
  end

  # Change between the two images to walk down
  def walk(&block)
    if @walk_cnt > 10
      yield
      @walk_cnt = 0
    else
      @walk_cnt += 1
    end
  end

  # Change between the two images to walk down
  def walk_down
    @walk_cnt = 11 if @image == @images[2] or @image == @images[3] # Turn straight away
    walk { @image = (@image == @images[0])? @images[1] : @images[0] }
  end
  
  # Change between the two images to walk up
  def walk_up
    @walk_cnt = 11 if @image == @images[0] or @image == @images[1] # Turn straight away
    walk { @image = (@image == @images[2])? @images[3] : @images[2] }
  end
  
  def move
    @x %= 1024
    @y %= 768
  end  
  
  def draw
    @image.draw(@x, @y, 1)
  end
end
