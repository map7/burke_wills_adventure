#
# Message - Bottom message popping up
#

class Message

  def initialize(window)
    @message = Gosu::Image.new(window, "media/images/bottom_screen_dialog.png",true)
  end

  def draw
    @message.draw(0, HEIGHT-180, 1)
  end

end
