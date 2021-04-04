# frozen_string_literal: true

# ReportCommand class
class ReportCommand
  def initialize(robot)
    @robot = robot
  end

  def run
    return if @robot.unplaced?

    pp @robot.report
  end

  attr_reader :robot
end
