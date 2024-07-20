# This class handles the state of game and win conditions
class GameLogic
  attr_accessor :game_over

  # handles terminating game in tictactoe class
  def initialize
    self.game_over = false
  end

  def update_game(players, game_controller)
    winner = nil

    players.each do |player|
      winner = win?(player)
      break if winner
    end
    # end the game if winner found
    return if winner.nil?

    binding.pry
    self.game_over = true
    game_controller.announce_winner(winner)
  end

  private

  def win?(player)
    win_combination_hash = Hash.new(0)

    player.markers.each do |marker|
      case marker.move
      when [1, 1]
        win_combination_hash[:r1] += 1
        win_combination_hash[:c1] += 1
        win_combination_hash[:dr] += 1
      when [2, 1]
        win_combination_hash[:r2] += 1
        win_combination_hash[:c1] += 1
      when [3, 1]
        win_combination_hash[:r3] += 1
        win_combination_hash[:c1] += 1
        win_combination_hash[:dl] += 1
      when [1, 2]
        win_combination_hash[:r1] += 1
        win_combination_hash[:c2] += 1
      when [2, 2]
        win_combination_hash[:r2] += 1
        win_combination_hash[:c2] += 1
        win_combination_hash[:dr] += 1
        win_combination_hash[:dl] += 1
      when [3, 2]
        win_combination_hash[:r3] += 1
        win_combination_hash[:c2] += 1
      when [1, 3]
        win_combination_hash[:r1] += 1
        win_combination_hash[:c3] += 1
        win_combination_hash[:dl] += 1
      when [2, 3]
        win_combination_hash[:r2] += 1
        win_combination_hash[:c3] += 1
      when [3, 3]
        win_combination_hash[:r3] += 1
        win_combination_hash[:c3] += 1
        win_combination_hash[:dr] += 1
      end
    end

    win_combination_hash.value?(3) ? player : nil
  end
end
