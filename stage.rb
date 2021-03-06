#
# Handles common elements across stages
#

class Stage < Chingu::GameState

  attr_accessor :current_stage
  
  def initialize
    super
    
     # Load default font and play little sound to start game    
    @font = Font["media/fonts/pixelated.ttf", 20]

    @attack_message = AttackMessage.new(self)

    # Put in opening message
    @message = Message.new(self)

    # Create a new player
    @player = $window.player
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
    elsif $window.button_down? Gosu::KbSpace
      puts 'pew pew'
      sleep 0.3
    elsif $window.button_down? Gosu::KbEscape
      change_stages
    end

    # Only allow up
    @player.x = 0 if @player.x < 0
    @player.x = (WIDTH - BORDER) if @player.x >= (WIDTH - BORDER)
    @player.y = (HEIGHT - BORDER - 30) if @player.y >= (HEIGHT - BORDER - 30)
    change_stages if @player.y < 0
    
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
        @bg_image.draw(BG_SIZE*x,BG_SIZE*y,0,1,1)        # x, y, z-order
      end
    end
  end
end
