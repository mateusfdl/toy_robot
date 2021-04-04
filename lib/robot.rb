# frozen_string_literal: true

require_relative 'robot_command_error'

# Robot class implements a robot
class Robot
  def initialize(position = nil)
    @position = position
  end

  def report
    raise RobotCommandError if unplaced?

    @position.attr_hash.values.join(' ')
  end

  def unplaced?
    @position.nil?
  end

  attr_accessor :position
end
