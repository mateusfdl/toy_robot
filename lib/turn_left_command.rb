# frozen_string_literal: true

# TurnLeftCommand class is responsible 
# to turn -90 degress robot facing
class TurnLeftCommand
    def initialize(robot)
        @robot = robot
    end

    def turn_left
        return if @robot.unplaced?
    
        @robot.position.turn_left
    end
end