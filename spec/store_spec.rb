require 'spec_helper'

describe Store do
  describe '#initialize' do
    it 'should create a new store' do
      store = Store.new(width: 5, height: 3)

      expect(store).to be_a Store
      expect(store.width).to eq 5
      expect(store.height).to eq 3
    end
  end

  describe 'Add crate to store' do
    let(:position) { Position.new(x: 5, y: 4) }
    let(:slot) { Slot.new(width: 10, height: 3) }
    let(:crate) { Crate.new(product_code: 'P', position: position, slot: slot) }

    it 'should add crate to store' do
      store = Store.new(width: 50, height: 30)
      expect(store.crates.count).to be_zero

      store.crates << crate

      expect(store.crates.count).to eq 1
      expect(store.crates.first).to eq crate
    end
  end
end
