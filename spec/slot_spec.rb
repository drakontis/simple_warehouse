require 'spec_helper'

describe Slot do
  describe '#initialize' do
    it 'should create a new slot' do
      slot = Slot.new(width: 5, height: 3)

      expect(slot.width).to eq 5
      expect(slot.height).to eq 3
    end
  end
end
