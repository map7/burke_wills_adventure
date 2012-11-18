#
# Message - Bottom message popping up
#

class Message

  attr_accessor :text, :show

  def initialize(window)
    @message = Gosu::Image.new($window, "media/images/bottom_screen_dialog.png",true)
    @font = Font["media/fonts/pixelated.ttf", 20]
    @show = true
  end
  
  def draw
    if self.show
      @font.draw("Oh no! I've lost Wills! I need to find him",
                 350, HEIGHT-120, 2, 1, 1, 0xff000000)
      @font.draw("if we're evergoing to make it back", 350, HEIGHT-90, 2, 1, 1, 0xff000000)
      @font.draw("to camp in time!", 350, HEIGHT-60, 2, 1, 1, 0xff000000)
      @message.draw(0, HEIGHT-180, 1)
    end
  end

end
