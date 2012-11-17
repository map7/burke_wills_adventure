#!/usr/bin/env ruby
#
# Burke & Wills
#

require 'gosu'
require './player'

WIDTH=1024
HEIGHT=768
BG_SIZE=23

class GameWindow < Gosu::Window
  def initialize
    super WIDTH,HEIGHT, false
    self.caption = "Burke & Wills Bogus Adventure"

    @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    @beep = Gosu::Sample.new(self, "media/sounds/Pickup-coin.wav")
    @beep.play
    
    # Main game logic
    # 60 times p/sec
    # window, image, tileable
    @bg_image = Gosu::Image.new(self, "media/images/desert_tile.png", true)

    @player = Player.new(self)
    @player.warp(WIDTH/2, HEIGHT-60) # Position starting point of player.
  end
  
  def update
    # Keyboard Events
    if button_down? Gosu::KbLeft or button_down? Gosu::GpLeft then
      @player.left
    elsif button_down? Gosu::KbRight or button_down? Gosu::GpRight then
      @player.right
    elsif button_down? Gosu::KbUp or button_down? Gosu::GpButton0 then
      @player.up
    elsif button_down? Gosu::KbDown then
      @player.down
    elsif button_down? Gosu::KbEscape
      exit
    end

    # Process the move
    @player.move
  end
  
  def draw
    @font.draw("Burke & Wills Bogus Adventure", 10,10, 1)
    @font.draw("Score", WIDTH - 120,10, 1)    

    @player.draw

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
