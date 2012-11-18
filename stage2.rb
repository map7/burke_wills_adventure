class Stage2 < Stage
  def initialize
    super
    @current_stage = 2
    
    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create enemy's
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 1)}
    
    @player = $window.player
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.
  end

  def draw
    super
    @font.draw("STAGE2 WOOOO HOOO!", 10,30, 1)
  end
end
