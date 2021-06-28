# frozen_string_literal: true
require_relative 'report_command'
require_relative 'move_command'
require_relative 'turn_right_command'
require_relative 'turn_left_command'
require_relative 'place_command'

class Parser
  PLACE_PATTERN_MATCH = /PLACE (\d{0,5}) (\d{0,5}) (NORTH|WEST|SOUTH|EAST)/.freeze

  def self.parse(input)
    case input 
    when PLACE_PATTERN_MATCH 
      return [
        PlaceCommand, 
       _, x, y, facing = input.match(PLACE_PATTERN_MATCH).to_a
      ]
    when 'RIGHT'
      return TurnRightCommand
    when 'LEFT'
      return TurnLeftCommand
    when 'MOVE'
      return MoveCommand
    when 'REPORT' 
      return ReportCommand
    end
  end
end
