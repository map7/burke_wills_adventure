class Stage2 < Chingu::GameState
  def initialize
    super
    @font = Font[default_font_name, 20]
  end

  def draw
    @font.draw("STAGE2 WOOOO HOOO!", 10,10, 1)
  end
end
