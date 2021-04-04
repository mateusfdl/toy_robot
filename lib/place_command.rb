# frozen_string_literal: true

# PlaceCommand is responsible to place robot at current position
class PlaceCommand
  def initialize(map, robot, position)
    @map = map
    @position = position
    @robot = robot
  end

  def run
    @robot.position = @position if @map.valid_placement? @position
  end
end
