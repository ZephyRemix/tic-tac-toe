# This board object will handle markers placement
class Board
  ROW_NUM = 3
  COL_NUM = 3
  attr_accessor :content

  def initialize
    self.content = Array.new(ROW_NUM) { Array.new(COL_NUM, ' ') }
  end

  def display_board(board)
    puts "\n"
    puts " #{content[0][0]} | #{content[0][1]} | #{content[0][2]} "
    puts '-----------'
    puts " #{content[1][0]} | #{content[1][1]} | #{content[1][2]} "
    puts '-----------'
    puts " #{content[2][0]} | #{content[2][1]} | #{content[2][2]} "
  end
end
