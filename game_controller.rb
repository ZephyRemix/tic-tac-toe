# This gamecontroller object controls and handle interactions with user
class GameController
  def initialize; end

  # To do:
  # 1) Add colorize into prompts
  # 2) Current query does not handle error in user query
  def init_player
    puts 'Enter your name:'.colorize(:light_cyan)
    player_init_name = gets.chomp
    puts 'Pick your marker: X or O'.colorize(:light_cyan)
    player_init_marker = gets.chomp
  end
end
