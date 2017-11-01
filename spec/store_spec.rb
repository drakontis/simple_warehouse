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
end
