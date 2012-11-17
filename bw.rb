require 'gosu'
require './player'
#
# Burke & Wills
#
# Aaron 10.0.1.125
# Mick  10.0.1.126
#

WIDTH=1024
HEIGHT=768
BG_SIZE=23

class GameWindow < Gosu::Window
  def initialize
    super WIDTH,HEIGHT, false
    self.caption = "Burke & Wills Bogus Adventure"

    # Main game logic
    # 60 times p/sec
    # window, image, tileable
    @bg_image = Gosu::Image.new(self, "media/images/desert_tile.png", true)

    @player = Player.new(self)
    @player.warp(WIDTH/2, HEIGHT-20) # Position starting point of player.
  end
  
  def update
  end
  
  def draw
    @player.draw
    (WIDTH/BG_SIZE + 1).times do |x|
      (HEIGHT/BG_SIZE + 1).times do |y|
        #
        # x, y, z-order
        @bg_image.draw(BG_SIZE*x,BG_SIZE*y,0,1,1)
      end
    end
  end


end



window = GameWindow.new
window.show
