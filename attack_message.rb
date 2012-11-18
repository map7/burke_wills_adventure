class AttackMessage
  attr_accessor :text, :show

  def initialize(window)
    @font = Gosu::Font.new($window, Gosu::default_font_name, 70)
  end
  
  def draw
    if self.show
      @font.draw(@text, WIDTH/2 - 120,HEIGHT/2, 2)
    end
  end
end
