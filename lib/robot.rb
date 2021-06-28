# frozen_string_literal: true

require_relative 'report_command'
require_relative 'robot_command_error'

class Robot
  def initialize(places = nil)
    @positions = positions
  end

  def unplaced?
    positions.nil?
  end

  def report
    raise RobotCommandError if unplaced?

    ReportCommand.new(@positions)
  end

  attr_accessor :places
end

