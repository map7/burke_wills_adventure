class Stage2 < Stage
  def initialize
    super
    @current_stage = 2
    @bg_image = Image["media/images/desert_tile.png"]    # Set background image

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self, @current_stage)
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 1)}    # Create enemy's

    @message.text = "According to my British training I should only eat the red berries"
  end

  def draw
    super
  end
end
