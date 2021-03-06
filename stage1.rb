class Stage1 < Stage
  def initialize
    super
    @current_stage = 1
    @bg_image = Image["media/images/desert_tile.png"]    # Set background image

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self, @current_stage)
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 0)}    # Create enemy's

    @message.text = "Oh no! I've lost Wills! I need to find him if we're evergoing to make it back to camp in time!"
  end
end
