class Stage < Chingu::GameState

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
      push_game_state(Stage2)
    end

    # Check for enemies
    @player.check_enemies(@enemies, @attack_message)
    
    # Process the move
    @player.move

  end
end
