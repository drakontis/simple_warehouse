require 'spec_helper'

describe Position do
  describe '#initialize' do
    it 'should create a new position' do
      position = Position.new(x: 5, y: 3)

      expect(position.x).to eq 5
      expect(position.y).to eq 3
    end
  end
end