# frozen_string_literal: true

require_relative '../lib/robot'
require_relative '../lib/robot_command_error'
require_relative './spec_helper'

RSpec.describe Robot do
  context '#report' do
    context 'and position is nil' do
      let(:robot) { Robot.new }

      it 'must raise error' do
        expect { robot.report }.to raise_error RobotCommandError
      end
    end

    context 'and position' do
      let(:position) { double 'Position' }
      let(:attr_hash) do
        {
          x: 1,
          y: 1,
          facing: 'NORTH'
        }
      end

      let(:robot) { Robot.new(position) }

      it 'must return positions' do
        allow(position).to receive(:attr_hash).and_return(attr_hash)

        expect(robot.report).to eq(attr_hash.values.join(' '))
      end
    end
  end
end
