class Stage2 < Chingu::GameState
  def initialize
    super
    @font = Font[default_font_name, 20]

    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self)
    
    @player = $window.player
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.

  end

  def draw
    @font.draw("STAGE2 WOOOO HOOO!", 10,10, 1)

    # Tile the background
    (WIDTH/BG_SIZE + 1).times do |x|
      (HEIGHT/BG_SIZE + 1).times do |y|
        #
        # x, y, z-order
        @bg_image.draw(BG_SIZE*x,BG_SIZE*y,0,1,1)
      end
    end
    @player.draw
  end
end
