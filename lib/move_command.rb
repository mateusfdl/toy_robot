# frozen_string_literal: true

# class PlaceCommand wraps logic to put robot at the map on current places
class PlaceCommand

  def initialize(position, map, robot)
    @position = position
    @map = map
    @robot = robot
  end

  def run
    @robot.places = places if @map.valid_position? @position
  end

  attr_accessor :position, :robot, :map
end
