#
# Handles common elements across stages
#

class Stage < Chingu::GameState

  attr_accessor :current_stage
  
  def initialize
    super
    
     # Load default font and play little sound to start game    
    @font = Font[default_font_name, 20]

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self)

    @attack_message = AttackMessage.new(self)

    # Put in opening message
    @message = Message.new(self)

    # Create a new player
    @player = Player.new(self)
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.
  end
  
  def update
    @player.storage_coordinates

    # Keyboard Events
    if $window.button_down? Gosu::KbLeft or $window.button_down? Gosu::GpLeft then
      @player.left
      @attack_message.show, @message.show = false
    elsif $window.button_down? Gosu::KbRight or $window.button_down? Gosu::GpRight then
      @player.right
      @attack_message.show, @message.show = false
    elsif $window.button_down? Gosu::KbUp or $window.button_down? Gosu::GpButton0 then
      @player.up
      @attack_message.show, @message.show = false
    elsif $window.button_down? Gosu::KbDown then
      @player.down
      @attack_message.show, @message.show = false

    elsif $window.button_down? Gosu::KbEscape
      change_stages
    end

    # Check for enemies
    @player.check_enemies(@enemies, @attack_message)
    
    # Process the move
    @player.move

    if @player.health < 0
      @attack_message.text = "GAME OVER!"
      @attack_message.show = true
    end
    
  end

  def change_stages
    case @current_stage
    when 1
      push_game_state(Stage2)
    when 2
      push_game_state(Stage3)
    when 3
      push_game_state(Stage4)
    when 4
      exit
    end
  end

  def draw
    @font.draw("Burke & Wills Bogus Adventure", 10,10, 1)
    @font.draw("Health #{@player.health}", WIDTH - 120,10, 1)        

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
