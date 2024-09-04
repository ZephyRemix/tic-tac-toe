# frozen_string_literal: true

require_relative 'player'

# This gamecontroller object controls and handle interactions with user
class GameController
  def initialize; end

  def init_player
    player_init_name = set_name
    player_init_marker = set_marker

    Player.new(player_init_name, player_init_marker)
  end

  def get_player_move # rubocop:disable Naming/AccessorMethodName
    move = Array.new(2)

    loop do
      puts 'State your next move:'
      puts 'Row #: (1-3)'
      move[0] = gets.chomp.to_i
      puts 'Column #: (1-3)'
      move[1] = gets.chomp.to_i

      return move if move.all? { |move| move >= 1 && move <= 3 }

      'Please enter a valid range from 1 to 3 for both row and column values'
    end

    move
  end

  def announce_winner(player)
    puts "Congratulations #{player.name}, you owned!".colorize(:green)
  end

  private

  def set_name
    puts 'Enter your name:' # .colorize(:light_cyan) => can't stub this on rspec
    gets.chomp
  end

  def set_marker
    loop do
      puts 'Pick your marker: X or O' # .colorize(:light_cyan)
      marker = gets.chomp
      return marker if %w[X O].include?(marker)
    end
  end
end
