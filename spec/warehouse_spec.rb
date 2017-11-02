require 'spec_helper'

describe Warehouse do
  describe '#initialize' do
    let(:store) { Store::Store.new(width: 5, height: 3) }

    it 'should create a new warehouse' do
      warehouse = Warehouse.new(live: true, store: store)

      expect(warehouse).to be_a Warehouse
      expect(warehouse.live).to be_truthy
      expect(warehouse.store).to be_a Store::Store
      expect(warehouse.store.width).to eq 5
      expect(warehouse.store.height).to eq 3
      expect(warehouse.store.crates).to eq []
    end
  end

  describe '#show_unrecognized_message' do
    it 'should print a message' do
      expect{subject.send(:show_unrecognized_message)}.to output("Command not found. Type `help` for instructions on usage\n").to_stdout
    end
  end
end
