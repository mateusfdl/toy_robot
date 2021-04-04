# frozen_string_literal: true

# frozen_string_literal

require_relative './spec_helper'
require_relative '../lib/factory_method'
require_relative '../lib/place_command'
require_relative '../lib/position'
require_relative '../lib/move_command'
require_relative '../lib/turn_left_command'
require_relative '../lib/turn_right_command'

# rubocop:disable Metrics/BlockLength
RSpec.describe FactoryMethod do
  let(:robot) { double 'Robot' }
  let(:map) { double 'Map' }
  let(:factory_method) { FactoryMethod.new(map, robot) }

  context '#parse' do
    context 'PLACE command' do
      let(:input) { 'PLACE 0 0 SOUTH' }

      it 'must return PlaceCommand instance' do
        expect(factory_method.parse(input)).to be_an_instance_of(PlaceCommand)
      end
    end
    context 'RIGHT command' do
      let(:input) { 'RIGHT' }

      it 'must return RightCommand instance' do
        expect(factory_method.parse(input)).to be_an_instance_of(TurnRightCommand)
      end
    end
    context 'LEFT command' do
      let(:input) { 'LEFT' }

      it 'must return TurnLeftCommand instance' do
        expect(factory_method.parse(input)).to be_an_instance_of(TurnLeftCommand)
      end
    end
    context 'MOVE command' do
      let(:input) { 'MOVE' }

      it 'must return MoveCommand instance' do
        expect(factory_method.parse(input)).to be_an_instance_of(MoveCommand)
      end
    end

    context 'REPORT command' do
      let(:input) { 'REPORT' }

      it 'must return ReportCommand instance' do
        expect(factory_method.parse(input)).to be_an_instance_of(ReportCommand)
      end
    end

    context 'invalid command' do
      let(:input) { '' }

      it 'must return nil' do
        expect(factory_method.parse(input)).to eq nil
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
