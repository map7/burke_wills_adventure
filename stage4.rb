class Stage4 < Stage
  def initialize
    super
    @current_stage = 4
    
    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create enemy's
    @terrain = Terrain.new(self, @current_stage)
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 1)}

    @message.text = "Someone told me Australia was full of drop bears, but I don't believe them."
  end

  def draw
    super
  end
end
