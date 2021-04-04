# frozen_string_literal: true

# TurnRightCommand class is responsible
# to turn 90 degress robot facing
class TurnRightCommand
  def initialize(robot)
    @robot = robot
  end

  def run
    return if @robot.unplaced?

    @robot.position.turn_right
  end
end
