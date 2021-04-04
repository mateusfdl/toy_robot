# frozen_string_literal: true

require_relative '../lib/place_command'
require_relative '../lib/position'
require_relative '../lib/map'
require_relative '../lib/robot'
require_relative '../lib/turn_left_command'
require_relative './spec_helper'

RSpec.describe TurnLeftCommand do
  let(:robot) { Robot.new }
  let(:map) { Map.new(10, 10) }

  context 'run' do
    it 'turn WEST when facing NORTH' do
      PlaceCommand.new(map, robot, Position.new(facing: 'NORTH')).run

      TurnLeftCommand.new(robot).run
      expect(robot.report).to eq('0 0 WEST')
    end

    it 'turn SOUTH when facing WEST' do
      PlaceCommand.new(map, robot, Position.new(facing: 'WEST')).run

      TurnLeftCommand.new(robot).run
      expect(robot.report).to eq('0 0 SOUTH')
    end

    it 'turn EAST when facing SOUTH' do
      PlaceCommand.new(map, robot, Position.new(facing: 'SOUTH')).run

      TurnLeftCommand.new(robot).run
      expect(robot.report).to eq('0 0 EAST')
    end

    it 'turn NORTH when facing EAST' do
      PlaceCommand.new(map, robot, Position.new(facing: 'EAST')).run

      TurnLeftCommand.new(robot).run
      expect(robot.report).to eq('0 0 NORTH')
    end
  end
end
