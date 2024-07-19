# This class handles the state of game and win conditions
class GameLogic
  attr_accessor :game_over

  def initialize
    self.game_over = false
  end

  def update_game(); end
end
