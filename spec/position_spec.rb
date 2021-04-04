# frozen_string_literal: true

require_relative '../lib/position'
require_relative './spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Position do
  let(:position) { Position.new(x_pos: 2, y_pos: 2, facing: facing) }

  context '#move' do
    context 'when NORTH' do
      let(:facing) { 'NORTH' }

      it 'must increase Y position' do
        position.move

        expect(position.y).to eq 3
      end
    end

    context 'when SOUTH' do
      let(:facing) { 'SOUTH' }

      it 'must decrease Y position' do
        position.move

        expect(position.y).to eq 1
      end
    end

    context 'when EAST' do
      let(:facing) { 'EAST' }

      it 'must increase X position' do
        position.move

        expect(position.x).to eq 3
      end
    end

    context 'when WEST' do
      let(:facing) { 'WEST' }

      it 'must decrease X position' do
        position.move

        expect(position.x).to eq 1
      end
    end
  end

  context '#turn_left' do
    let(:facing) { 'NORTH' }

    it 'must turn facing -90 degress' do
      position.turn_left

      expect(position.facing).to eq 'WEST'
    end
  end

  context '#turn_right' do
    let(:facing) { 'NORTH' }

    it 'must turn facing 90 degress' do
      position.turn_right

      expect(position.facing).to eq 'EAST'
    end
  end

  context '#attr_hash' do
    let(:facing) { 'SOUTH' }
    let(:attr_hash) do
      {
        x: position.x,
        y: position.y,
        facing: position.facing
      }
    end

    it 'must be a hash' do
      expect(position.attr_hash).to be_a_kind_of Hash
    end

    it { expect(position.attr_hash).to eq attr_hash }
  end
end
# rubocop:enable Metrics/BlockLength
