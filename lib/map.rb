# frozen_string_literal: true

class Map
  def initialize(height, width)
    @height = height
    @width = width
  end

  def valid_placement?(position)
    return false if position.nil?

    (position.x >= 0 && position.x < width) && (position.y >= 0 && position.y < height)
  end

  attr_reader :width, :height
end
