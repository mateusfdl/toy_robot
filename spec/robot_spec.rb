# frozen_string_literal: true

require_relative '../lib/robot'
require_relative  '../lib/report_command'
require_relative './spec_helper'

RSpec.describe Robot do

  context 'when initialized' do
    context 'and position is nil' do
      let(:robot) { described_class.new }

      it 'must return unplaced' do
        expect(robot.unplaced?).to eq true
      end

      it 'must raise report error' do
        expect { robot.report }.to raise_error ArgumentError
      end
    end

    context 'and position is past' do
      let(:places_hash) { { x: 5, y: 5, facing: 'WEST'} }
      let(:robot) { described_class.new(places_hash) }

      let(:double_report_instance) { double('Report') }

      it 'must not return unplaced' do
        expect(robot.unplaced?).to eq false
      end

      it 'must return Report instance' do
        allow(ReportCommand).to receive(:new).with(places_hash).and_return(double_report_instance)
        
        expect(robot.report).to be double_report_instance
      end
    end
  end
end
