# frozen_string_literal: true

# class MoveCommand wraps logic to put robot at the map on current places
class MoveCommand

  def initialize(position, map, robot)
    @position = position
    @map = map
    @robot = robot
  end

  def run
    return if @robot.unplaced?

    current_position = @robot.position
    cloned_current_position = current_position.dup

    cloned_current_position.move

    @robot.position = cloned_current_position if @map.valid_placement?(cloned_current_position)
  end

  attr_accessor :position, :robot, :map
end
