def initialize  
end

#To do: 
#1) Add colorize into prompts
#2) Current query does not handle error in user query
def init_player
  puts "Do you want to change your default name?"
  player_init_name = gets.chomp()
  puts "Pick your marker: X or O"
  player_init_marker = gets.chomp()
end
