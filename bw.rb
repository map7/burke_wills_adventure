#!/usr/bin/env ruby
#
# Burke & Wills
#

require 'gosu'
require 'chingu'
require './player'
require './terrain'
require './enemy'
require './message'
require './attack_message'

WIDTH=1024
HEIGHT=768
BG_SIZE=23
MAX_ENEMIES=5

class GameWindow < Chingu::Window
  def initialize
    super WIDTH,HEIGHT, false
    self.caption = "Burke & Wills Bogus Adventure Aaron rules"

    # Load default font and play little sound to start game
    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @beep = Gosu::Sample.new(self, "media/sounds/Pickup-coin.wav")
    @beep.play
    
    # Load song
    @song = Gosu::Song.new(self, "media/sounds/06\ Just\ To\ Feel\ Anything.ogg")
     
    # Main game logic
    # 60 times p/sec
    # window, image, tileable
    @bg_image = Gosu::Image.new(self, "media/images/desert_tile.png", true)

    # Create terrain object for shrubs mostly, not too big, not too small
    @terrain = Terrain.new(self)

    # Create enemy's
    @enemies = (rand(MAX_ENEMIES)).times.map{|i| Enemy.new(self, rand(2))}

    @attack_message = AttackMessage.new(self)
    
    # Create a new player
    @player = Player.new(self)
    @player.warp(WIDTH/2, HEIGHT-200) # Position starting point of player.
    
    # Put in opening message
    @message = Message.new(self)
    @message.text = "test"
  end
  
  def update
    # Store previous coordinates incase of an attack
    @player.storage_coordinates
    
    # Keyboard Events
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.left
      @attack_message.show, @message.show = false
    elsif button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.right
      @attack_message.show, @message.show = false
    elsif button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.up
      @attack_message.show, @message.show = false
    elsif button_down? Gosu::KbDown then
      @player.down
      @attack_message.show, @message.show = false
    elsif button_down? Gosu::KbEscape
      exit
    end

    # Check for enemies
    @player.check_enemies(@enemies, @attack_message)
    
    # Process the move
    @player.move

  end
  
  def draw
    @font.draw("Burke & Wills Bogus Adventure", 10,10, 1)
    @font.draw("Health #{@player.health}", WIDTH - 120,10, 1)        

    @terrain.draw
    @enemies.each {|enemy| enemy.draw }
    @player.draw
    @song.play(true) #Loop is on
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

window = GameWindow.new
window.show
