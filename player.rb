require_relative 'marker'

# Player class handles moves and plays turn
class Player
  attr_accessor :name, :marker_representation, :markers

  def initialize(name, marker)
    self.name = name
    self.marker_representation = marker
    self.markers = []
  end

  def play_turn(move, board)
    new_marker = Marker.new(move, marker_representation)
    board.place_marker(new_marker)
    markers << new_marker
  end
end
