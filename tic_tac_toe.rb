# frozen_string_literal: true

require_relative 'game_controller'
require_relative 'game_logic'
require_relative 'board'
require 'rubocop'
require 'colorize'
require 'pry-byebug'

# initialize players
game_controller = GameController.new

players = []
puts "\nSetting up player one".colorize(color: :black, background: :white)
p1 = game_controller.init_player
players << p1
puts "\nSetting up player two".colorize(color: :black, background: :white)
p2 = game_controller.init_player
players << p2

# set up board
board = Board.new
board.display_board

# play game
game_logic = GameLogic.new
starting_player_turn = true

def start_turn(player, board, game_controller)
  puts "#{player.name}'s turn!"
  next_move = game_controller.get_player_move
  player.play_turn(next_move, board)
end

until game_logic.game_over
  if starting_player_turn
    start_turn(p1, board, game_controller)
    starting_player_turn = false
  else
    start_turn(p2, board, game_controller)
    starting_player_turn = true
  end
  board.display_board
  game_logic.update_game(players, game_controller)
end
