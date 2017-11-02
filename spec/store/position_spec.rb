require 'spec_helper'

describe Store::Position do
  describe '#initialize' do
    it 'should create a new position' do
      position = Store::Position.new(x: 5, y: 3)

      expect(position).to be_a Store::Position
      expect(position.x).to eq 5
      expect(position.y).to eq 3
    end
  end
end
