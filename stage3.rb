class Stage3 < Stage
  def initialize
    super
    @current_stage = 3
    
    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self, @current_stage)

    # Create enemy's
    @enemies = []
    
    @player = $window.player
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.
    @hut = Image["media/images/aborig_hut.png"]

    @aborig_man = Image["media/images/aborig_man.png"]

    @message.text = "Here's someone I could ask about the those berries"
  end

  def draw
    super
    @font.draw("STAGE3", 10,30, 1)
    @hut.draw(WIDTH/2-170, HEIGHT/2-200, 1)
    @aborig_man.draw(WIDTH/2-50, HEIGHT/2+20, 1)
  end
end
