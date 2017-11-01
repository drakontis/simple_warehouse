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
    let(:slot) { Slot.new(starts_at: Position.new(x: 5, y: 3), ends_at: Position.new(x: 7, y: 5)) }
    let(:crate) { Crate.new(product_code: 'P', slot: slot) }

    it 'should add crate to store' do
      store = Store.new(width: 50, height: 30)
      expect(store.crates.count).to be_zero

      store.crates << crate

      expect(store.crates.count).to eq 1
      expect(store.crates.first).to eq crate
    end
  end
end
