# frozen_string_literal: true

# Position wraps robot facing and movement
class Position
  DIRECTIONS = %w[
    NORTH
    EAST 
    SOUTH
    EAST
].freeze
  
  def initialize(x: 0, y: 0, facing: :north)
    @x = x
    @y= y 
    @facing = facing
  end

  def turn_right
    @facing = turn_direction(:right)
  end

  def turn_left
    @facing = turn_direction(:left)
  end

  def move
    directions[@facing.to_sym]
  end

  def attr_hash
    {
      x: @x,
      y: @y,
      facing: @facing
    }
  end

  attr_accessor :x, :y, :facing
  
  private

  def turn_direction
    DIRECTIONS.rotate(rotate_modifier)[DIRECTIONS.index(@facing)]
  end

  def directions
    {
      :NORTH => face_north,
      :EAST => face_east,
      :SOUTH => face_south,
      :WEST => face_west
    }
  end

  def rotate_modifier(side)
    return -1 if side == :left
    1
  end

  def face_north
    @y += 1
  end

  def face_south
    @y -= 1
  end

  def face_east
    @x += 1
  end

  def face_west
    @x -= 1
  end
end
