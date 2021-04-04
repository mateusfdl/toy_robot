# frozen_string_literal: true

require_relative '../lib/report_command'
require_relative './spec_helper'

RSpec.describe ReportCommand do
  let(:robot) { double 'Robot' }

  context '#run' do
    let(:report_command) { ReportCommand.new(robot) }

    context 'when robot unplaced' do
      it 'must return' do
        allow(robot).to receive(:unplaced?).and_return true

        expect(report_command.run).to eq nil
      end
    end

    context 'when robot placed' do
      it 'must return report message' do
        allow(robot).to receive(:unplaced?).and_return false
        allow(robot).to receive(:report).and_return '0 0 WEST'

        expect(report_command.run).to eq '0 0 WEST'
      end
    end
  end
end
