class AttackMessage
  attr_accessor :text, :show

  def initialize(window)
    @font = Font["media/fonts/pixelated.ttf", 70]
  end
  
  def draw
    if self.show
      @font.draw(@text, WIDTH/2 - 120,HEIGHT/2, 2)
    end
  end
end
