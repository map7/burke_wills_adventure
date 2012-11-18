#!/usr/bin/env ruby
#
# Burke & Wills
#

require 'chingu'
include Gosu
require './stage1'

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
  def initialize
    super WIDTH,HEIGHT, false
    self.caption = "Burke & Wills Bogus Adventure Aaron rules"
    push_game_state(Stage1)
    transitional_game_state(Chingu::GameStates::FadeTo, {speed: 5})
  end
end

$window = Game.new
$window.show
