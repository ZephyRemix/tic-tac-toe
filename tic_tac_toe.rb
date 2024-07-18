require_relative 'game_controller'
require_relative 'game_logic'
require_relative 'board'
require 'rubocop'
require 'colorize'
require 'pry-byebug'

game_controller = GameController.new
# game_logic = GameLogic.new()

# String.color_samples
# initialize players
players = []
puts "\nSetting up player one".colorize(color: :black, background: :white)
p1 = game_controller.init_player
players << p1
puts "\nSetting up player two".colorize(color: :black, background: :white)
p2 = game_controller.init_player
players << p2

# set up board
board = Board.new
board.display_board(board)
