require 'gosu'
#
# Burke & Wills
#
# Aaron 10.0.1.125
# Mick  10.0.1.126
#

WIDTH=1024
HEIGHT=768

class GameWindow < Gosu::Window
  def initialize
    super WIDTH,HEIGHT, false
    self.caption = "Burke & Wills Bogus Adventure"
  end
  
  def update
    # Main game logic
    # 60 times p/sec
    # window, image, tileable
    @background_image = Gosu::Image.new(self, "background.png", true)
  end
  
  def draw
    0..3.times do |x|
      0..3.times do |y|
        @background_image.draw(500*y,500*x,0)
      end
    end

  end
end

window = GameWindow.new
window.show
