class Stage2 < Chingu::GameState
  def initialize
    super
    @font = Font[default_font_name, 20]
    
    @player = $window.player
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.

  end

  def draw
    @font.draw("STAGE2 WOOOO HOOO!", 10,10, 1)
    @player.draw
  end
end
