#
# Message - Bottom message popping up
#

class Message

  attr_accessor :text, :show

  def initialize(window)
    @message = Gosu::Image.new($window, "media/images/bottom_screen_dialog.png",true)
    @show = true
    @text = ""
  end
  
  def draw
    if self.show
      @message_text = Chingu::Text.new(self.text, x: 350, y: HEIGHT-120, zorder: 55, factor_x: 1.0, factor_y: 1.0, color: 0xff000000, max_width: 500, size: 20, font: "media/fonts/pixelated.ttf")
      @message_text.draw
      @message.draw(0, HEIGHT-180, 1)
    end
  end

end
