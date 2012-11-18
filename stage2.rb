class Stage2 < Stage
  def initialize
    super
    @current_stage = 2
    @bg_image = Image["media/images/desert_tile.png"]    # Set background image
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 1)}    # Create enemy's
    @message.text = "Stage2"
  end

  def draw
    super
    @font.draw("STAGE2 WOOOO HOOO!", 10,30, 1)
  end
end
