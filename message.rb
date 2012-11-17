#
# Message - Bottom message popping up
#

class Message

  attr_accessor :text, :hide

  def initialize(window)
    @message = Gosu::Image.new(window, "media/images/bottom_screen_dialog.png",true)
    @font = Gosu::Font.new(window, Gosu::default_font_name, 20)
  end
  
  def draw
    
    unless self.hide == true
      @font.draw("Oh no! I've lost Wills! I need to find him if we're ever",
                 350, HEIGHT-120, 2, 1, 1, 0xff000000)
      @font.draw("going to make it back to camp in time!", 350, HEIGHT-90, 2, 1, 1, 0xff000000)
      @message.draw(0, HEIGHT-180, 1)
    end
  end

end
