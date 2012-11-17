require 'gosu'
#
# Burke & Wills
#
# Aaron 10.0.1.125
# Mick 10.0.1.126

class GameWindow < Gosu::Window
  def initialize
    super 1024,768, false
    self.caption = "Burke & Wills Bogus Adventure"
  end
  
  def update
    # Main game logic
    # 60 times p/sec
    # window, image, tileable
    @background_image = Gosu::Image.new(self, "background.png", true)
  end
  
  def draw
    @background_image.draw(0,0,0)
  end
end

window = GameWindow.new
window.show
