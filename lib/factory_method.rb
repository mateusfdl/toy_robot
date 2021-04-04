# frozen_string_literal: true

require_relative './move_command'
require_relative './place_command'
require_relative './position'
require_relative './turn_right_command'
require_relative './turn_left_command'
require_relative './report_command'

# FactoryMethod class implements a match patterns to call commands
class FactoryMethod
  PLACE_PATTERN_MATCH = /PLACE (\d) (\d) (NORTH|WEST|SOUTH|EAST)/.freeze

  def initialize(map, robot)
    @robot = robot
    @map = map
  end

  # rubocop:disable Metrics/MethodLength
  def parse(input)
    case input
    when PLACE_PATTERN_MATCH
      _, x, y, facing = input.match(PLACE_PATTERN_MATCH).to_a

      PlaceCommand.new(
        @map,
        @robot,
        Position.new(
          x_pos: x.to_i,
          y_pos: y.to_i,
          facing: facing
        )
      )
    when 'RIGHT'
      TurnRightCommand.new(@robot)
    when 'LEFT'
      TurnLeftCommand.new(@robot)
    when 'MOVE'
      MoveCommand.new(@map, @robot)
    when 'REPORT'
      ReportCommand.new(@robot)
    end
  end
  # rubocop:enable Metrics/MethodLength
end
