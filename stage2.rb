class Stage2 < Stage
  def initialize
    super
    @font = Font[default_font_name, 20]

    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self)

    # Create enemy's
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 1)}
    
    @attack_message = AttackMessage.new(self)
    
    @player = $window.player
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.

    # Put in opening message
    @message = Message.new(self)
  end

  def draw
    @font.draw("STAGE2 WOOOO HOOO!", 10,10, 1)

    @terrain.draw
    @enemies.each {|enemy| enemy.draw }
    @player.draw
    @message.draw
    @attack_message.draw
    
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
