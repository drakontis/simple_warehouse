require 'spec_helper'

describe Store::Crate do
  describe '#initialize' do
    let(:position) { Store::Position.new(x: 5, y: 4) }
    let(:slot) { Store::Slot.new(starts_at: Store::Position.new(x: 5, y: 3), ends_at: Store::Position.new(x: 7, y: 5)) }

    it 'should create a new crate' do
      crate = Store::Crate.new(product_code: 'P', slot: slot)

      expect(crate).to be_a Store::Crate
      expect(crate.product_code).to eq 'P'

      expect(crate.slot).to be_a Store::Slot
      expect(crate.slot.starts_at).to be_a Store::Position
      expect(crate.slot.starts_at.x).to eq 5
      expect(crate.slot.starts_at.y).to eq 3
      expect(crate.slot.ends_at).to be_a Store::Position
      expect(crate.slot.ends_at.x).to eq 7
      expect(crate.slot.ends_at.y).to eq 5
    end
  end
end
