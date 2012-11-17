#
# player.rb
#
#  Player movement is controlled by this class
#

class Player
  attr_reader :score, :health, :message
  
  def initialize(window)
    @images = Gosu::Image.load_tiles(window, "media/images/burke_sprite1.png", 30, 48, false)
    @attack_font = Gosu::Font.new(window, Gosu::default_font_name, 100)
    
    # Set default variables for player
    @image = @images[0]
    @x = @y = @walk_cnt = @hit_cnt = 0.0
    @score = 0
    @health = 100
  end

  # Jump to a point
  def warp(x,y)
    @x, @y = x, y
  end

  def storage_coordinates
    @last_x = @x
    @last_y = @y
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

  def check_enemies(enemies,attack_message)
    enemies.each do |enemy|
      if Gosu::distance(@x, @y, enemy.x, enemy.y) < 50 then
        @x = @last_x
        @y = @last_y
        @health -= 30
        attack_message.text = "Oh My!"
        attack_message.show = true
        sleep 0.3
      end
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
