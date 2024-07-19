# This board object will handle markers placement
class Board
  ROW_NUM = 3
  COL_NUM = 3
  attr_accessor :content

  def initialize
    self.content = Array.new(ROW_NUM) { Array.new(COL_NUM, ' ') }
  end

  def display_board(board) # rubocop:disable Metrics/AbcSize
    puts "\n"
    puts " #{content[0][0]} | #{content[0][1]} | #{content[0][2]} "
    puts '-----------'
    puts " #{content[1][0]} | #{content[1][1]} | #{content[1][2]} "
    puts '-----------'
    puts " #{content[2][0]} | #{content[2][1]} | #{content[2][2]} "
    puts "\n"
  end

  def place_marker(marker)
    row_position = marker.move[0] - 1
    col_position = marker.move[1] - 1
    content[row_position][col_position] = marker.representation
  end
end
