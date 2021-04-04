# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../lib/move_command'
require_relative '../lib/map'
require_relative '../lib/robot'
require_relative '../lib/position'
require_relative '../lib/place_command'

# rubocop:disable Metrics/BlockLength:
RSpec.describe MoveCommand do
  let(:map) { Map.new(5, 5) }
  let(:robot) { Robot.new }

  context 'valid movements' do
    let(:move_command) { MoveCommand.new(map, robot) }

    it 'increase Y position when move NORTH' do
      robot.position = Position.new(y_pos: 2, facing: 'NORTH')

      move_command.run

      expect(robot.report).to eq('0 3 NORTH')
    end

    it 'decrease Y position when move SOUTH' do
      robot.position = Position.new(y_pos: 2, facing: 'SOUTH')

      move_command.run

      expect(robot.report).to eq('0 1 SOUTH')
    end

    it 'increase X position when move EAST' do
      robot.position = Position.new(x_pos: 2, facing: 'EAST')

      move_command.run

      expect(robot.report).to eq('3 0 EAST')
    end

    it 'decrease X position when move WEST' do
      robot.position = Position.new(x_pos: 2, facing: 'WEST')

      move_command.run

      expect(robot.report).to eq('1 0 WEST')
    end
  end

  context 'invalid movements' do
    let(:move_command) { MoveCommand.new(map, robot) }

    it 'Y position must be same when move NORTH edge' do
      robot.position = Position.new(y_pos: 5, facing: 'NORTH')

      move_command.run

      expect(robot.report).to eq('0 5 NORTH')
    end

    it 'Y position must be when move SOUTH edge' do
      robot.position = Position.new(y_pos: 0, facing: 'SOUTH')

      move_command.run

      expect(robot.report).to eq('0 0 SOUTH')
    end

    it 'X position must be same when move EAST edge' do
      robot.position = Position.new(x_pos: 5, facing: 'EAST')

      move_command.run

      expect(robot.report).to eq('5 0 EAST')
    end

    it 'X position must be same when move WEST edge' do
      robot.position = Position.new(x_pos: 0, facing: 'WEST')

      move_command.run

      expect(robot.report).to eq('0 0 WEST')
    end
  end
end
# rubocop:enable Metrics/BlockLength:
