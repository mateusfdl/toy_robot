# frozen_string_literal: true

require_relative '../lib/map'
require_relative './spec_helper'

RSpec.describe Map do
  context '#valid_placement?' do
    let(:width) { 5 }
    let(:height) { 5 }

    let(:map) { Map.new(height, width) }

    context 'when valid position' do
      let(:position) { double 'Position', x: width, y: height }

      it 'must return true' do
        expect(map.valid_placement?(position)).to eq true
      end
    end

    context 'when position is invalid' do
      let(:position) { double 'Position', x: width + 1, y: height + 1 }

      it 'must return false' do
        expect(map.valid_placement?(position)).to eq false
      end
    end

    context 'when position is nil' do
      let(:position) { nil }

      it 'must return false' do
        expect(map.valid_placement?(position)).to eq false
      end
    end
  end
end
