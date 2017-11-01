require 'spec_helper'

describe Crate do
  describe '#initialize' do
    let(:position) { Position.new(x: 5, y: 4) }
    let(:slot) { Slot.new(starts_at: Position.new(x: 5, y: 3), ends_at: Position.new(x: 7, y: 5)) }

    it 'should create a new crate' do
      crate = Crate.new(product_code: 'P', slot: slot)

      expect(crate).to be_a Crate
      expect(crate.product_code).to eq 'P'

      expect(crate.slot).to be_a Slot
      expect(crate.slot.starts_at).to be_a Position
      expect(crate.slot.starts_at.x).to eq 5
      expect(crate.slot.starts_at.y).to eq 3
      expect(crate.slot.ends_at).to be_a Position
      expect(crate.slot.ends_at.x).to eq 7
      expect(crate.slot.ends_at.y).to eq 5
    end
  end
end
