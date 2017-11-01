require 'spec_helper'

describe Store do
  describe '#initialize' do
    it 'should create a new store' do
      store = Store.new(wid: 5, hei: 3)

      expect(store.width).to eq 5
      expect(store.height).to eq 3
    end
  end
end
