#!/usr/bin/env ruby
#
# Burke & Wills
#

require 'chingu'
include Gosu
require './stage'
require './stage1'
require './stage2'
require './stage3'
require './stage4'

require './player'
require './terrain'
require './enemy'
require './message'
require './attack_message'

WIDTH=1024
HEIGHT=768
BG_SIZE=23
MAX_ENEMIES=5

class Game < Chingu::Window

  attr_reader :player
  
  def initialize
    # Set window size and caption
    super WIDTH,HEIGHT, false
    self.caption = "Burke & Wills Bogus Adventure Aaron rules"

    # Define transition of states and push to stage1
    transitional_game_state(Chingu::GameStates::FadeTo, {speed: 5})
    push_game_state(Stage1)

    # Play little bling sound
    Sample["media/sounds/Pickup-coin.wav"].play
    
    # Load song
    Song["media/sounds/06\ Just\ To\ Feel\ Anything.ogg"].play(true)

  end

  def player
    puts 'create player' if @player.nil?
    @player ||= Player.new(self)
  end
  
end

$window = Game.new
$window.show
