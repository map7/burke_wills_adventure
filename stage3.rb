class Stage3 < Stage
  def initialize
    super
    @current_stage = 3
    
    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create enemy's
    @enemies = []
  end

  def draw
    super
    @font.draw("STAGE3", 10,30, 1)
  end
end
