# frozen_string_literal: true

require_relative './spec_helper'
require_relative '../lib/move_command'
require_relative '../lib/map'
require_relative '../lib/robot'
require_relative '../lib/position'
require_relative '../lib/place_command'
require_relative '../lib/robot_command_error'

RSpec.describe PlaceCommand do
  let(:map) { Map.new(5, 5) }
  let(:robot) { Robot.new }

  context 'valid position' do
    let(:position) { Position.new(x_pos: 1, y_pos: 1, facing: 'NORTH') }
    let(:place_command) { PlaceCommand.new(map, robot, position) }

    it 'must be reported' do
      place_command.run

      expect(robot.report).to eq('1 1 NORTH')
    end
  end

  context 'invalid position' do
    let(:position) { Position.new(x_pos: -5, y_pos: -5, facing: 'NORTH') }
    let(:place_command) { PlaceCommand.new(map, robot, position) }

    it 'must raise error' do
      place_command.run

      expect { robot.report }.to raise_error RobotCommandError
    end
  end
end
