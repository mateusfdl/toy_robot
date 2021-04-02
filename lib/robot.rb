# frozen_string_literal: true

require_relative 'report_command'
require_relative 'robot_command_error'

class Robot
  def initialize(position = nil)
    @position = position
  end

  def unplaced?
    @position.nil?
  end

  def report
    raise RobotCommandError if unplaced?

    ReportCommand.new(@position)
  end

  attr_accessor :position
end

