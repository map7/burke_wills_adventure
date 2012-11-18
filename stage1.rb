class Stage1 < Stage
  def initialize
    super
    @current_stage = 1
    
     # Load default font and play little sound to start game
    @font = Font[default_font_name, 20]

    # Set background image
    @bg_image = Image["media/images/desert_tile.png"]

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self)

    # Create enemy's
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, 0)}

    @attack_message = AttackMessage.new(self)
    
    # Create a new player
    @player = Player.new(self)
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.
    
    # Put in opening message
    @message = Message.new(self)

  end
  
  def draw
    @font.draw("Burke & Wills Bogus Adventure", 10,10, 1)
    # @font.draw("Health #{@player.health}", WIDTH - 120,10, 1)        

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
    
  end
end
