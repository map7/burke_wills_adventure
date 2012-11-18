class Stage1 < Stage
  def initialize
    super
    @current_stage = 1
    @bg_image = Image["media/images/desert_tile.png"]    # Set background image
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 0)}    # Create enemy's
  end
end
