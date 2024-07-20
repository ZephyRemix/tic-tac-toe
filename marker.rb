# frozen_string_literal: true

# This handles the marker objects
class Marker
  attr_accessor :move, :representation

  def initialize(move, representation)
    self.move = move
    self.representation = representation
  end
end
