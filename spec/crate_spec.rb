require 'spec_helper'

describe Crate do
  describe '#initialize' do
    let(:position) { Position.new(x: 5, y: 4) }
    let(:slot) { Slot.new(width: 10, height: 3) }

    it 'should create a new crate' do
      position = Position.new(x: 5, y: 4)
      crate = Crate.new(product_code: 'P', position: position, slot: slot)

      expect(crate).to be_a Crate
      expect(crate.product_code).to eq 'P'

      expect(crate.position).to be_a Position
      expect(crate.position.x).to eq 5
      expect(crate.position.y).to eq 4

      expect(crate.slot).to be_a Slot
      expect(crate.slot.width).to eq 10
      expect(crate.slot.height).to eq 3
    end
  end
end
