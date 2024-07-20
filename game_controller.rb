require_relative 'player'

# This gamecontroller object controls and handle interactions with user
class GameController
  def initialize; end

  # To do:
  # 1) Current query does not handle error in user query
  def init_player
    puts 'Enter your name:'.colorize(:light_cyan)
    player_init_name = gets.chomp
    puts 'Pick your marker: X or O'.colorize(:light_cyan)
    player_init_marker = gets.chomp

    Player.new(player_init_name, player_init_marker)
  end

  def get_player_move # rubocop:disable Naming/AccessorMethodName
    move = Array.new(2)

    puts 'State your next move:'
    puts 'Row #: (1-3)'
    move[0] = gets.chomp.to_i
    puts 'Column #: (1-3)'
    move[1] = gets.chomp.to_i

    move
  end

  def announce_winner(player)
    puts "Congratulations #{player.name}, you owned!".colorize(:green)
  end
end
