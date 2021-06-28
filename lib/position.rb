# frozen_string_literal: true

# Position wraps robot face
class Position
  
  def initialize(x: 0, y: 0, facing: :north)
    @x = x
    @y= y 
    @facing = facing
  end

  attr_accessor :x, :y, :facing

  private

  def attr_hash
    {
      x: @x,
      y: @y,
      facing: @facing
    }
  end

  def face_to
    case @facing.downcase.to_sym
    when :north then
      face_north
    when :south then
      face_south
    when :west then
      face_west
    when :east
      face_east
    end
  end

  def face_north
    Direction.new(@x, @y, :north)
  end

  def face_east
    Direction.new(@x, @y, :east)
  end

  def face_west
    Direction.new(@x, @y, :west)
  end

  def face_south
    Direction.new(x, y, :south)
  end
end
